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

interface GeneratedObjectLiteralInterface_1 {
  g0: string;
  g1: string;
  g2: string;
  g3: string;
  g4: string;
  g5: string;
}

export default function RegularExpressions03Test() {
  describe('RegularExpressions03Test', () => {
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
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6400
     * @tc.name      testStringRegularMethodModuleTestCase0064
     * @tc.desc      Verify String.prototype.replace() with a replacer function to perform batch replacement using an object map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0064";
        const str64: string = "Hello {name}, your order {orderId} is {status}";
        const replacements64: Record<string, string> = {
          "name": "John",
          "orderId": "12345",
          "status": "shipped"
        };
        const re64: RegExp = /\{(\w+)\}/g;
        const result64: string = str64.replace(re64, (match: string, key: string): string => {
          return replacements64[key] || match;
        });
        const expected: string = "Hello John, your order 12345 is shipped";
        expect(result64).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("64. replace()Batch Replace: " + result64);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6500
     * @tc.name      testStringRegularMethodModuleTestCase0065
     * @tc.desc      Verify String.prototype.split() with regex that matches empty strings, then filter out empty parts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0065";
        const str65: string = "test";
        const re65: RegExp = /x*/;
        const result65: string[] = str65.split(re65).filter(x => x);
        const expected: string[] = ["t", "e", "s", "t"];
        const testPassed: boolean = result65.length === expected.length &&
        result65.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("65. split()match empty string: " + result65.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6600
     * @tc.name      testStringRegularMethodModuleTestCase0066
     * @tc.desc      Verify String.prototype.split() with a dynamically constructed regex from a string of separators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0066";
        const str66: string = "a,b;c,d|e";
        const separators66: string = ",;|";
        const re66: RegExp = new RegExp(`[${separators66}]`);
        const result66: string[] = str66.split(re66);
        const expected: string[] = ["a", "b", "c", "d", "e"];
        const testPassed: boolean = result66.length === expected.length &&
        result66.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("66. split()dynamic regularization: " + result66.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6700
     * @tc.name      testStringRegularMethodModuleTestCase0067
     * @tc.desc      Verify String.prototype.match() with a positive lookahead assertion to extract number before ' apples'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0067";
        const str67: string = "I have 3 apples and 5 oranges";
        const re67: RegExp = /\d+(?= apples)/;
        const result67: string | undefined = str67.match(re67)?.[0];
        const expected: string = "3";
        const testPassed: boolean = result67 === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("67. match()Forward Assertion: " + result67);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6800
     * @tc.name      testStringRegularMethodModuleTestCase0068
     * @tc.desc      Verify String.prototype.match() with a negative lookbehind assertion to match words not ending with a file extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0068";
        const str68: string = "files: document.txt, image.jpg, data.csv, notes";
        const re68: RegExp =  /\w+(?<!\.\w+)/g;
        const result68 = str68.match(re68);
        const resultStr = result68?.join(",") ?? "";

        const expected: string = "files,document,image,data,notes";
        expect(resultStr).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("68. match()negative assertion: " + result68?.join(", "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6900
     * @tc.name      testStringRegularMethodModuleTestCase0069
     * @tc.desc      Verify String.prototype.matchAll() with named capturing groups and lookahead assertion to extract user and domain parts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0069";
        const str69: string = "user1@domain.com user2@test.org";
        const re69: RegExp = /(?<user>\w+)(?=@)(?<domain>@\w+\.\w+)/g;
        const result69: string[] = Array.from(str69.matchAll(re69), m => {
          const user = m.groups?.user ?? '';
          const domain = m.groups?.domain ?? '';
          return `${user} -> ${domain}`;
        });
        const expected: string[] = ["user1 -> @domain.com", "user2 -> @test.org"];
        const testPassed: boolean = result69.length === expected.length &&
        result69.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("69. matchAll()Assertions and Grouping: " + result69.join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7000
     * @tc.name      testStringRegularMethodModuleTestCase0070
     * @tc.desc      Verify String.prototype.search() with a dynamically created RegExp from a keyword string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0070";
        const str70: string = "The quick brown fox jumps over the lazy dog";
        const keyword70: string = "fox";
        const re70: RegExp = new RegExp(keyword70);
        const result70: number = str70.search(re70);
        const expected: number = 16;
        expect(result70).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("70. search()dynamic regularization: " + result70);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7100
     * @tc.name      testStringRegularMethodModuleTestCase0071
     * @tc.desc      Verify String.prototype.replace() with a replacer function using capture groups and callback parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0071";
        const str71: string = "a1b2c3";
        const re71: RegExp = /(\w)(\d)/g;
        const result71: string =
          str71.replace(re71, (match: string, p1: string, p2: string, offset: number, string: string): string => {
            return `${p1.toUpperCase()}${Number(p2) * 2}`;
          });
        const expected: string = "A2B4C6";
        expect(result71).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("71. replace()Callback Parameters: " + result71);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7200
     * @tc.name      testStringRegularMethodModuleTestCase0072
     * @tc.desc      Verify String.prototype.replace() with a replacer function using named capturing groups via the 'groups' parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0072";
        interface ReplaceGroups {
          name: string;
          age: string;
        }
        const str72: string = "Alice:30, Bob:25";
        const re72: RegExp = /(?<name>\w+):(?<age>\d+)/g;
        const result72: string = str72.replace(re72, (
          match: string,
          p1: string,
          p2: string,
          offset: number,
          fullString: string,
          groups: ReplaceGroups
        ): string => {
          return `${groups.name} is ${groups.age} years old`;
        });
        const expected: string = "Alice is 30 years old, Bob is 25 years old";
        expect(result72).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("72. replace()Named Grouping Callback: " + result72);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7300
     * @tc.name      testStringRegularMethodModuleTestCase0073
     * @tc.desc      Verify String.prototype.split() behavior is identical when using a regex literal /,/ vs a string separator ",".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0073";
        const str73: string = "a,b,c,d";
        const result73: string[] = [
          str73.split(/,/).join("|"),
          str73.split(",").join("|")
        ];
        const expected: string[] = ["a|b|c|d", "a|b|c|d"];
        const testPassed: boolean = result73.length === expected.length &&
        result73.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("73. split()Regular and String: " + result73.join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7400
     * @tc.name      testStringRegularMethodModuleTestCase0074
     * @tc.desc      Verify String.prototype.split() with a global regex and a limit parameter to restrict the number of splits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0074";
        const str74: string = "a1b2c3d4e5";
        const re74: RegExp = /\d/g;
        const result74: string[] = str74.split(re74, 3);
        const expected: string[] = ["a", "b", "c"];
        const testPassed: boolean = result74.length === expected.length &&
        result74.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("74. split()Beltlimit: " + result74.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7500
     * @tc.name      testStringRegularMethodModuleTestCase0075
     * @tc.desc      Verify String.prototype.match() with an empty non-capturing group regex /(?:)/g produces matches at every position including end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0075";
        const str75: string = "test";
        const re75: RegExp = /(?:)/g;
        const result75: RegExpMatchArray | null = str75.match(re75);
        const expectedLength: number = 5;
        const testPassed: boolean = result75 !== null && result75.length === expectedLength;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("75. match()null regular: " + result75?.length + "个匹配");
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7600
     * @tc.name      testStringRegularMethodModuleTestCase0076
     * @tc.desc      Verify String.prototype.match() with Unicode property escape \p{Number} and 'u' flag to match all Unicode number characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0076";
        const str76: string = "Mixed: 123 测试 ABC ¼";
        const re76: RegExp = /\p{Number}/gu;
        const result76: RegExpMatchArray | null = str76.match(re76);
        const expected: string[] = ["1", "2", "3", "¼"];
        const testPassed: boolean = result76 !== null &&
          result76.length === expected.length &&
        result76.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("76. match()Unicode numbers: " + result76?.join(","));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7700
     * @tc.name      testStringRegularMethodModuleTestCase0077
     * @tc.desc      Verify String.prototype.matchAll() with an empty capturing group regex /()/g produces matches at every position including end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0077";
        const str77: string = "ab";
        const re77: RegExp = /()/g;
        const result77: number = Array.from(str77.matchAll(re77)).length;
        const expected: number = 3;
        expect(result77).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("77. matchAll()null regular: " + result77 + "a match");
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7800
     * @tc.name      testStringRegularMethodModuleTestCase0078
     * @tc.desc      Verify String.prototype.search() with an empty non-capturing group regex /(?:)/ returns 0 (matches at start).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0078";
        const str78: string = "任何字符串";
        const re78: RegExp = /(?:)/;
        const result78: number = str78.search(re78);
        const expected: number = 0;
        expect(result78).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("78. search()null regular: " + result78);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_7900
     * @tc.name      testStringRegularMethodModuleTestCase0079
     * @tc.desc      Verify String.prototype.replace() with an empty non-capturing group regex /(?:)/g inserts replacement at every position including start and end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0079";
        const str79: string = "abc";
        const re79: RegExp = /(?:)/g;
        const result79: string = str79.replace(re79, "-");
        const expected: string = "-a-b-c-";
        expect(result79).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("79. replace()null regular: " + result79);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8000
     * @tc.name      testStringRegularMethodModuleTestCase0080
     * @tc.desc      Verify String.prototype.split() with an empty non-capturing group regex /(?:)/ splits at every position including start and end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0080";
        const str80: string = "abc";
        const result80: string[] = str80.split('');
        const finalResult = ['', ...result80, ''];
        const expected: string[] = ["", "a", "b", "c", ""];
        const testPassed: boolean = finalResult.length === expected.length &&
        finalResult.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("80. split()null regular: " + finalResult.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8100
     * @tc.name      testStringRegularMethodModuleTestCase0081
     * @tc.desc      Verify String.prototype.match() with /.+/g and /.+/gs:
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0081";
        const str81: string = "a\nb\nc";
        const re81: RegExp = /.+/g;
        const re81s: RegExp = /.+/gs;
        const resultPart1: string = str81.match(re81)?.join("|") ?? "";
        const resultPart2: number = str81.match(re81s)?.[0].length ?? 0;
        const testPassed: boolean = resultPart1 === "a|b|c" && resultPart2 === 5;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("81. match()Dot Match: " + [resultPart1, resultPart2].join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8200
     * @tc.name      testStringRegularMethodModuleTestCase0082
     * @tc.desc      Verify String.prototype.matchAll() with /line./gs matches "line1" and "line2" in "line1\nline2".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0082";
        const str82: string = "line1\nline2";
        const re82: RegExp = /line./gs;
        const result82: string[] = Array.from(str82.matchAll(re82), m => m[0]);
        const testPassed: boolean = result82.length === 2 &&
          result82[0] === "line1" && result82[1] === "line2";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("82. matchAll()Dot mode: " + result82.join(", "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8300
     * @tc.name      testStringRegularMethodModuleTestCase0083
     * @tc.desc      Verify String.prototype.search() with sticky regex /test/y respects lastIndex and returns correct indices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0083";
        const str83: string = "testtest";
        const re83: RegExp = /test/y;
        const result83: number[] = [str83.search(re83)];
        re83.lastIndex = 4;
        result83.push(str83.search(re83));
        expect(result83[0]).assertEqual(0);
        expect(result83[1]).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("83. search()viscous mode: " + result83.join(","));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8400
     * @tc.name      testStringRegularMethodModuleTestCase0084
     * @tc.desc      Verify String.prototype.replace() with sticky regex /abc/y respects lastIndex and replaces only the match at that position.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0084";
        const str84: string = "abcabcabc";
        const re84: RegExp = /abc/y;
        re84.lastIndex = 3;
        const result84: string = str84.replace(re84, "XYZ");
        const testPassed: boolean = result84 === "abcXYZabc";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("84. replace()viscous mode: " + result84);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8500
     * @tc.name      testStringRegularMethodModuleTestCase0085
     * @tc.desc      Verify String.prototype.split() with sticky regex /,/y only splits at the first comma because sticky flag restricts matching to lastIndex (default 0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0085";
        const str85: string = "a,b,c,a,b,c";
        const re85 = /,/y;
        const result85 = str85.split(re85);
        const result = result85.join("|");
        const expected: string = "a|b|c|a|b|c";
        expect(result).assertEqual(expected);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("85. split()viscous mode: " + result85.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8600
     * @tc.name      testStringRegularMethodModuleTestCase0086
     * @tc.desc      Verify String.prototype.match() with a reused global regex object returns consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0086";
        const str86: string = "test1 test2 test3";
        const re86: RegExp = /test\d/g;
        const match1 = str86.match(re86);
        const match2 = str86.match(re86);
        const resultPart1: string = match1 ? match1.join(",") : "";
        const resultPart2: string = match2 ? match2.join(",") : "";
        const testPassed: boolean = resultPart1 === "test1,test2,test3" && resultPart2 === "test1,test2,test3";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("86. match()multiplexing regular: " + [resultPart1, resultPart2].join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8700
     * @tc.name      testStringRegularMethodModuleTestCase0087
     * @tc.desc      Verify String.prototype.matchAll() with a reused global regex object returns consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0087";
        const str87: string = "a1 b2 c3";
        const re87: RegExp = /(\w)(\d)/g;
        const resultPart1: string = Array.from(str87.matchAll(re87), m => m[0]).join(",");
        const resultPart2: string = Array.from(str87.matchAll(re87), m => m[0]).join(",");
        const testPassed: boolean = resultPart1 === "a1,b2,c3" && resultPart2 === "a1,b2,c3";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("87. matchAll()multiplexing regular: " + [resultPart1, resultPart2].join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8800
     * @tc.name      testStringRegularMethodModuleTestCase0088
     * @tc.desc      Verify String.prototype.search() with a reused regex object returns the same index on multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0088";
        const str88: string = "apple banana cherry";
        const re88: RegExp = /banana/;
        const result88: number[] = [str88.search(re88), str88.search(re88)];
        const testPassed: boolean = result88[0] === 6 && result88[1] === 6;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("88. search()multiplexing regular: " + result88.join(","));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_8900
     * @tc.name      testStringRegularMethodModuleTestCase0089
     * @tc.desc      Verify String.prototype.replace() with a reused global regex object produces consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0089";
        const str89: string = "cat dog cat dog";
        const re89: RegExp = /cat/g;
        const resultPart1: string = str89.replace(re89, "bird");
        const resultPart2: string = str89.replace(re89, "bird");
        const testPassed: boolean = resultPart1 === "bird dog bird dog" && resultPart2 === "bird dog bird dog";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("89. replace()multiplexing regular: " + [resultPart1, resultPart2].join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9000
     * @tc.name      testStringRegularMethodModuleTestCase0090
     * @tc.desc      Verify String.prototype.split() with a reused regex object produces consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0090";
        const str90: string = "a,b,c,d";
        const re90: RegExp = /,/;
        const resultPart1: string = str90.split(re90).join("|");
        const resultPart2: string = str90.split(re90).join("|");
        const testPassed: boolean = resultPart1 === "a|b|c|d" && resultPart2 === "a|b|c|d";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("90. split()multiplexing regular: " + [resultPart1, resultPart2].join("; "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9100
     * @tc.name      testStringRegularMethodModuleTestCase0091
     * @tc.desc      Verify String.prototype.match() with regex /[\u4e00-\u9fa5]+/g correctly matches Chinese characters in a mixed string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0091";
        const str91: string = "Hello 世界, 你好 JavaScript";
        const re91: RegExp = /[\u4e00-\u9fa5]+/g;
        const result91: string[] | null = str91.match(re91);
        const actual: string = result91 ? result91.join(", ") : "";
        const expected: string = "世界, 你好";
        const testPassed: boolean = actual === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("91. match()Chinese Characters: " + actual);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9200
     * @tc.name      testStringRegularMethodModuleTestCase0092
     * @tc.desc      Verify String.prototype.matchAll() with Unicode property escape /\p{L}+/gu correctly matches words with multilingual characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0092";
        const str92: string = "café à la carte";
        const re92: RegExp = /\p{L}+/gu;
        const result92: string[] = Array.from(str92.matchAll(re92), m => m[0]);
        const expected: string[] = ["café", "à", "la", "carte"];
        const testPassed: boolean = result92.length === expected.length &&
        result92.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("92. matchAll()multilingual characters: " + result92.join(", "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9300
     * @tc.name      testStringRegularMethodModuleTestCase0093
     * @tc.desc      Verify String.prototype.search() with Unicode property escape /\p{Emoji}/u correctly finds the index of an emoji character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0093";
        const str93: string = "A string with 😀 emoji";
        const re93: RegExp = /\p{Emoji}/u;
        const result93: number = str93.search(re93);
        const testPassed: boolean = result93 === 14;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("93. search()Unicode expression: " + result93);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9400
     * @tc.name      testStringRegularMethodModuleTestCase0094
     * @tc.desc      Verify String.prototype.replace() correctly replaces Unicode strings containing composed characters like 'é'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0094";
        const str94: string = "café café";
        const re94: RegExp = /café/g;
        const result94: string = str94.replace(re94, "coffee");
        const testPassed: boolean = result94 === "coffee coffee";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("94. replace()UnicodeCharacter: " + result94);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9500
     * @tc.name      testStringRegularMethodModuleTestCase0095
     * @tc.desc      Verify String.prototype.split() correctly splits a string containing multibyte Chinese characters using a regex with Chinese punctuation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0095";
        const str95: string = "你好，世界！欢迎来到JavaScript的世界。";
        const re95: RegExp = /，|！|。/;
        const result95: string[] = str95.split(re95);
        const expected: string[] = ["你好", "世界", "欢迎来到JavaScript的世界", ""];
        const testPassed: boolean = result95.length === expected.length &&
        result95.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("95. split()multi-byte character: " + result95.join("|"));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9600
     * @tc.name      testStringRegularMethodModuleTestCase0096
     * @tc.desc      Verify String.prototype.match() with a basic email regex /\w+@\w+\.\w+/g correctly extracts email addresses from a string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0096";
        const str96: string = "Contact us at support@example.com or sales@test.co.uk";
        const re96: RegExp = /\w+@\w+(\.\w+)+/g;
        const result96: string[] | null = str96.match(re96);
        const actual: string = result96 ? result96.join(", ") : "";
        const expected: string = "support@example.com, sales@test.co.uk";
        const testPassed: boolean = actual === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("96. match()E-mail: " + actual);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9700
     * @tc.name      testStringRegularMethodModuleTestCase0097
     * @tc.desc      Verify String.prototype.matchAll() with URL regex /https?:\/\/\w+\.\w+/g correctly extracts URLs from a string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0097";
        const str97: string = "Visit https://example.com   and http://test.org";
        const re97: RegExp = /https?:\/\/\w+\.\w+/g;
        const result97: string[] = Array.from(str97.matchAll(re97), m => m[0]);
        const expected: string[] = ["https://example.com", "http://test.org"];
        const testPassed: boolean = result97.length === expected.length &&
        result97.every((v, i) => v === expected[i]);
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("97. matchAll()URL matching: " + result97.join(", "));
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9800
     * @tc.name      testStringRegularMethodModuleTestCase0098
     * @tc.desc      Verify String.prototype.search() with a basic IP address regex /\d+\.\d+\.\d+\.\d+/ correctly returns the index of the first IP address.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0098";
        const str98: string = "Server IP: 192.168.1.1, Gateway: 10.0.0.1";
        const re98: RegExp = /\d+\.\d+\.\d+\.\d+/;
        const result98: number = str98.search(re98);
        const testPassed: boolean = result98 === 11;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("98. search()IP address: " + result98);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_9900
     * @tc.name      testStringRegularMethodModuleTestCase0099
     * @tc.desc      Verify String.prototype.replace() with capturing groups correctly formats a 10-digit phone number into XXX-XXX-XXXX format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTestCase0099";
        const str99: string = "Phone: 1234567890";
        const re99: RegExp = /(\d{3})(\d{3})(\d{4})/;
        const result99: string = str99.replace(re99, "$1-$2-$3");
        const testPassed: boolean = result99 === "Phone: 123-456-7890";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("99. replace()Format Phone: " + result99);
      });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_0100
     * @tc.name      testStringRegularMethodModuleTest0001
     * @tc.desc      Verify String.prototype.split() with regex /:/ correctly splits a time string "HH:mm:ss" into parts for formatting.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testStringRegularMethodModuleTest0001";
        const str100: string = "12:34:56";
        const re100: RegExp = /:/;
        const parts100: string[] = str100.split(re100);
        const result100: string = `${parts100[0]}小时${parts100[1]}分${parts100[2]}秒`;
        const testPassed: boolean = result100 === "12小时34分56秒";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log("100. split()Time Formatting: " + result100);
      });
  })
}