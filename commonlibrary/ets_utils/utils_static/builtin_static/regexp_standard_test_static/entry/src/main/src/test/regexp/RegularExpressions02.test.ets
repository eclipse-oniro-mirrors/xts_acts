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

export default function RegularExpressions02Test() {
  describe('RegularExpressions02Test', () => {
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
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8400
     * @tc.name      testGroupingModuleCase0084
     * @tc.desc      Verify the flags property of a RegExp object that includes a named capturing group.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re84: RegExp = new RegExp('(?<name>\\d+)', 'gi');
      const result84: string = re84.flags;
      const expected: string = "gi";
      const testPassed: boolean = result84 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9000
     * @tc.name      testGroupingModuleCase0090
     * @tc.desc      Verify capturing group extraction without destructuring (ArkTS-compatible).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const execResult: RegExpExecArray | null = re90.exec("John Doe");
      const first: String = execResult?.[1] ?? "";
      const last: String = execResult?.[2] ?? "";
      const expectedFirst: string = "John";
      const expectedLast: string = "Doe";
      const testPassed: boolean = first === expectedFirst && last === expectedLast;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9200
     * @tc.name      testGroupingModuleCase0092
     * @tc.desc      Verify extracting URL path segments using capturing groups with matchAll.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92: RegExp = new RegExp('/([^/]+)', 'g');
      const input: string = "/path/to/file";
      const matches = input.matchAll(re92);
      const result92: string[] = [];
      for (const match of matches) {
        if (match[1] !== undefined) {
          result92.push(match?.[1] ?? "");
        }
      }
      const output: string = result92.join(",");
      const expected: string = "path,to,file";
      const testPassed: boolean = output === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9400
     * @tc.name      testGroupingModuleCase0094
     * @tc.desc      Verify parsing CSS style string using capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re94: RegExp = new RegExp('([a-zA-Z-]+):\\s*([^;]+)', 'g');
      const cssString: string = "color: red; font-size: 12px";
      const result94: Record<string, string> = {};
      const matches = cssString.matchAll(re94);
      for (const match of matches) {
        const property = match[1];
        const value = match[2];
        if (property !== undefined && value !== undefined) {
          result94[property] = value;
        }
      }
      const color: String = result94["color"] ?? "";
      const fontSize: String = result94["font-size"] ?? "";
      expect(color).assertEqual("red");
      expect(fontSize).assertEqual("12px");
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9600
     * @tc.name      testGroupingModuleCase0096
     * @tc.desc      Verify parsing credit card number with space-separated groups using capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re96: RegExp = new RegExp('(\\d{4})\\s(\\d{4})\\s(\\d{4})\\s(\\d{4})');
      const cardNumber: string = "1234 5678 9012 3456";
      const result96: RegExpExecArray | null = re96.exec(cardNumber);
      const g1: String = result96?.[1] ?? "";
      const g2: String = result96?.[2] ?? "";
      const g3: String = result96?.[3] ?? "";
      const g4: String = result96?.[4] ?? "";
      const formatted: string = `${g1}-${g2}-${g3}-${g4}`;
      const expected: string = "1234-5678-9012-3456";
      const testPassed: boolean = formatted === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9700
     * @tc.name      testGroupingModuleCase0097
     * @tc.desc      Verify matching IPv6 address using a capturing group.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re97: RegExp = new RegExp('([0-9a-fA-F:]+)');
      const ipv6Address: string = "2001:0db8:85a3:0000:0000:8a2e:0370:7334";
      const result97: RegExpExecArray | null = re97.exec(ipv6Address);
      const matchedAddress: String = result97?.[1] ?? "";
      const expected: string = "2001:0db8:85a3:0000:0000:8a2e:0370:7334";
      const testPassed: boolean = matchedAddress === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9800
     * @tc.name      testGroupingModuleCase0098
     * @tc.desc      Verify matching MAC address using a capturing group with colon-separated hex format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re98: RegExp = new RegExp('([0-9a-fA-F:]{17})');
      const macAddress: string = "00:1B:44:11:3A:B7";
      const result98: RegExpExecArray | null = re98.exec(macAddress);
      const matchedMAC: String = result98?.[1] ?? "";
      const expected: string = "00:1B:44:11:3A:B7";
      const testPassed: boolean = matchedMAC === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_0010
     * @tc.name      testGroupingModuleCase0100
     * @tc.desc      Verify complex nested capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re100: RegExp = new RegExp('((a(b))(c(d)))');
      const input: string = "abcde";
      const result100: RegExpExecArray | null = re100.exec(input);
      const g0: String = result100?.[0] ?? "";
      const g1: String = result100?.[1] ?? "";
      const g2: String = result100?.[2] ?? "";
      const g3: String = result100?.[3] ?? "";
      const g4: String = result100?.[4] ?? "";
      const g5: String = result100?.[5] ?? "";
      const testPassed: boolean =
        g0 === "abcd" &&
          g1 === "abcd" &&
          g2 === "ab" &&
          g3 === "b" &&
          g4 === "cd" &&
          g5 === "d";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0200
     * @tc.name      testStringRegularMethodModuleTestCase0002
     * @tc.desc      Verify String.prototype.match() returns null when no match is found.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str2: string = "Hello, World!";
      const re2: RegExp = new RegExp('Java');
      const result2: RegExpMatchArray | null = str2.match(re2);
      const testPassed: boolean = result2 === null;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0300
     * @tc.name      testStringRegularMethodModuleTestCase0003
     * @tc.desc      Verify String.prototype.match() with global flag returns all matches as an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str3: string = "cat bat sat";
      const re3: RegExp = new RegExp('at', 'g');
      const result3: RegExpMatchArray | null = str3.match(re3);
      const expected: string[] = ["at", "at", "at"];
      const testPassed: boolean = result3 !== null &&
        result3.length === expected.length &&
      result3.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0400
     * @tc.name      testStringRegularMethodModuleTestCase0004
     * @tc.desc      Verify String.prototype.match() with capturing groups returns full match and group contents.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str4: string = "Name: John, Age: 30";
      const re4: RegExp = new RegExp('Name: (\\w+), Age: (\\d+)');
      const result4: RegExpMatchArray | null = str4.match(re4);
      const fullMatch: String = result4?.[0] ?? "";
      const name: String = result4?.[1] ?? "";
      const age: String = result4?.[2] ?? "";
      const testPassed: boolean = fullMatch === "Name: John, Age: 30" &&
        name === "John" &&
        age === "30";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0600
     * @tc.name      testStringRegularMethodModuleTestCase0006
     * @tc.desc      Verify String.prototype.match() with multiline and global flags to match line starts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str6: string = "line1\nline2\nline3";
      const re6: RegExp = new RegExp('^line\\d', 'mg');
      const result6: RegExpMatchArray | null = str6.match(re6);
      const expected: string[] = ["line1", "line2", "line3"];
      const testPassed: boolean = result6 !== null &&
        result6.length === expected.length &&
      result6.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0700
     * @tc.name      testStringRegularMethodModuleTestCase0007
     * @tc.desc      Verify String.prototype.match() with Unicode property escapes in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str7: string = "Emojis: 😀👍😢";
      const re7: RegExp = new RegExp('\\p{Emoji}', 'gu');
      const result7: RegExpMatchArray | null = str7.match(re7);
      const expected: string[] = ["😀", "👍", "😢"];
      const testPassed: boolean = result7 !== null &&
        result7.length === expected.length &&
      result7.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8500
     * @tc.name      testGroupingModuleCase0085
     * @tc.desc      Verify the source property of a RegExp object containing multiple capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('(a)(b)');
      const result85: string = re85.source;
      const expected: string = "(a)(b)";
      const testPassed: boolean = result85 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8600
     * @tc.name      testGroupingModuleCase0086
     * @tc.desc      Verify dynamically created RegExp with capturing groups using the RegExp constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const groupPattern: string = "(\\w+)";
      const re86: RegExp = new RegExp(groupPattern);
      const result86: RegExpExecArray | null = re86.exec("test");
      const group1: String = result86?.[1] ?? "";
      const expected: string = "test";
      const testPassed: boolean = group1 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8700
     * @tc.name      testGroupingModuleCase0087
     * @tc.desc      Verify dynamically created RegExp with backreference using the RegExp constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const refPattern: string = "(\\w)\\1";
      const re87: RegExp = new RegExp(refPattern);
      const result87: boolean = re87.test("aa");
      const expected: boolean = true;
      const testPassed: boolean = result87 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9100
     * @tc.name      testGroupingModuleCase0091
     * @tc.desc      Verify named capturing group extraction without destructuring (ArkTS-compatible).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      const execResult: RegExpExecArray | null = re91.exec("John Doe");
      const first: String = execResult?.groups?.['first'] ?? "";
      const last: String = execResult?.groups?.['last'] ?? "";
      const expectedFirst: string = "John";
      const expectedLast: string = "Doe";
      const testPassed: boolean = first === expectedFirst && last === expectedLast;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9300
     * @tc.name      testGroupingModuleCase0093
     * @tc.desc      Verify parsing query string parameters using capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('([^?&=]+)=([^&]+)', 'g');
      const queryString: string = "name=test&age=30";
      const result93: Record<string, string> = {};
      const matches = queryString.matchAll(re93);
      for (const match of matches) {
        const key = match[1];
        const value = match[2];
        if (key !== undefined && value !== undefined) {
          result93[key] = value;
        }
      }
      const name: String = result93["name"] ?? "";
      const age: String = result93["age"] ?? "";
      const testPassed: boolean = name === "test" && age === "30";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9500
     * @tc.name      testGroupingModuleCase0095
     * @tc.desc      Verify parsing Markdown link syntax using capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re95: RegExp = new RegExp('\\[([^\\]]+)\\]\\(([^)]+)\\)');
      const markdownLink: string = "[MDN](https://developer.mozilla.org  )";
      const result95: RegExpExecArray | null = re95.exec(markdownLink);
      const text: String = result95?.[1] ?? "";
      const url: String = result95?.[2] ?? "";
      const expectedText: string = "MDN";
      const expectedUrl: string = "https://developer.mozilla.org  ";
      const testPassed: boolean = text === expectedText && url === expectedUrl;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_9900
     * @tc.name      testGroupingModuleCase0099
     * @tc.desc      Verify matching UUID using a capturing group with standard 8-4-4-4-12 hex format.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re99: RegExp = new RegExp('([0-9a-fA-F-]{36})');
      const uuid: string = "550e8400-e29b-41d4-a716-446655440000";
      const result99: RegExpExecArray | null = re99.exec(uuid);
      const matchedUUID: String = result99?.[1] ?? "";
      const expected: string = "550e8400-e29b-41d4-a716-446655440000";
      const testPassed: boolean = matchedUUID === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0100
     * @tc.name      testStringRegularMethodModuleTestCase0001
     * @tc.desc      Verify basic string matching using String.prototype.match() with a simple regular expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str1: string = "Hello, JavaScript!";
      const re1: RegExp = new RegExp('Java');
      const result1: String = str1.match(re1)?.[0] ?? "";
      const expected: string = "Java";
      const testPassed: boolean = result1 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0500
     * @tc.name      testStringRegularMethodModuleTestCase0005
     * @tc.desc      Verify String.prototype.match() with case-insensitive and global flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str5: string = "JavaScript is fun. javascript is powerful.";
      const re5: RegExp = new RegExp('javascript', 'gi');
      const result5: RegExpMatchArray | null = str5.match(re5);
      const expected: string[] = ["JavaScript", "javascript"];
      const testPassed: boolean = result5 !== null &&
        result5.length === expected.length &&
      result5.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0800
     * @tc.name      testStringRegularMethodModuleTestCase0008
     * @tc.desc      Verify basic usage of String.prototype.matchAll() with global regular expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str8: string = "apple, banana, cherry";
      const re8: RegExp = new RegExp('(\\w+)', 'g');
      const matches = str8.matchAll(re8);
      const result8: string[] = [];
      for (const match of matches) {
        result8.push(match?.[0] ?? "");
      }
      const expected: string[] = ["apple", "banana", "cherry"];
      const testPassed: boolean = result8.length === expected.length &&
      result8.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_0900
     * @tc.name      testStringRegularMethodModuleTestCase0009
     * @tc.desc      Verify String.prototype.matchAll() with capturing groups to extract and format date components.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str9: string = "2023-12-31 2024-01-01";
      const re9: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g');
      const matches = str9.matchAll(re9);
      const result9: string[] = [];
      for (const match of matches) {
        const year = match[1];
        const month = match[2];
        const day = match[3];
        result9.push(`${year}年${month}月${day}日`);
      }
      const expected: string[] = ["2023年12月31日", "2024年01月01日"];
      const testPassed: boolean = result9.length === expected.length &&
      result9.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1000
     * @tc.name      testStringRegularMethodModuleTestCase0010
     * @tc.desc      Verify String.prototype.matchAll() with named capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str10: string = "Alice:30 Bob:25";
      const re10: RegExp = new RegExp('(?<name>\\w+):(?<age>\\d+)', 'g');
      const matches = str10.matchAll(re10);
      const result10: string[] = [];
      for (const match of matches) {
        const name = match.groups?.['name'] ?? "";
        const age = match.groups?.['age'] ?? "";
        result10.push(`${name}(${age})`);
      }
      const expected: string[] = ["Alice(30)", "Bob(25)"];
      const testPassed: boolean = result10.length === expected.length &&
      result10.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1100
     * @tc.name      testStringRegularMethodModuleTestCase0011
     * @tc.desc      Verify that String.prototype.matchAll() throws an error when the RegExp lacks the global flag.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str11: string = "a b c";
      const re11: RegExp = new RegExp('\\w+');

      let errorMessage = "";
      try {
        Array.from(str11.matchAll(re11));
      } catch (e) {
        if (e instanceof Error) {
          errorMessage = e.message;
        } else {
          errorMessage = String(e);
        }
      }
      const testPassed = errorMessage.includes("global") || errorMessage.includes("flag");
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1200
     * @tc.name      testStringRegularMethodModuleTestCase0012
     * @tc.desc      Verify basic usage of String.prototype.search() to find the index of a pattern match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str12: string = "The quick brown fox";
      const re12: RegExp = new RegExp('brown');
      const result12: number = str12.search(re12);
      const expected: number = 10;
      const testPassed: boolean = result12 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1300
     * @tc.name      testStringRegularMethodModuleTestCase0013
     * @tc.desc      Verify String.prototype.search() returns -1 when no match is found.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str13: string = "The quick brown fox";
      const re13: RegExp = new RegExp('red');
      const result13: number = str13.search(re13);
      const expected: number = -1;
      const testPassed: boolean = result13 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1400
     * @tc.name      testStringRegularMethodModuleTestCase0014
     * @tc.desc      Verify String.prototype.search() behaves identically with RegExp literal and string pattern.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str14: string = "Hello World";
      const result14: number[] = [
        str14.search(new RegExp('World')),
        str14.search("World")
      ];
      const expected: number[] = [6, 6];
      const testPassed: boolean = result14[0] === expected[0] && result14[1] === expected[1];
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1500
     * @tc.name      testStringRegularMethodModuleTestCase0015
     * @tc.desc      Verify String.prototype.search() with case-insensitive flag.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str15: string = "Hello JavaScript";
      const re15: RegExp = new RegExp('javascript', 'i');
      const result15: number = str15.search(re15);
      const expected: number = 6;
      const testPassed: boolean = result15 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1600
     * @tc.name      testStringRegularMethodModuleTestCase0016
     * @tc.desc      Verify String.prototype.search() with multiline flag to match start of a line.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str16: string = "first line\nsecond line\nthird line";
      const re16: RegExp = new RegExp('^second', 'm');
      const result16: number = str16.search(re16);
      expect(result16).assertEqual(11);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1700
     * @tc.name      testStringRegularMethodModuleTestCase0017
     * @tc.desc      Verify basic string replacement using String.prototype.replace() with a regular expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str17: string = "I like apples";
      const re17: RegExp = new RegExp('apples');
      const result17: string = str17.replace(re17, "bananas");
      const expected: string = "I like bananas";
      const testPassed: boolean = result17 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1800
     * @tc.name      testStringRegularMethodModuleTestCase0018
     * @tc.desc      Verify global string replacement using String.prototype.replace() with a global regular expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str18: string = "cat bat sat";
      const re18: RegExp = new RegExp('at', 'g');
      const result18: string = str18.replace(re18, "og");
      const expected: string = "cog bog sog";
      const testPassed: boolean = result18 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_1900
     * @tc.name      testStringRegularMethodModuleTestCase0019
     * @tc.desc      Verify string replacement using backreferences to capturing groups in String.prototype.replace().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str19: string = "John Doe";
      const re19: RegExp = new RegExp('(\\w+) (\\w+)');
      const result19: string = str19.replace(re19, "$2, $1");
      const expected: string = "Doe, John";
      const testPassed: boolean = result19 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2000
     * @tc.name      testStringRegularMethodModuleTestCase0020
     * @tc.desc      Verify string replacement using named capturing group references in String.prototype.replace().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str20: string = "Alice Smith";
      const re20: RegExp = new RegExp('(?<first>\\w+) (?<last>\\w+)');
      const result20: string = str20.replace(re20, "$<last>, $<first>");
      const expected: string = "Smith, Alice";
      const testPassed: boolean = result20 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2100
     * @tc.name      testStringRegularMethodModuleTestCase0021
     * @tc.desc      Verify String.prototype.replace() with a replacer function that doubles each matched number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str21: string = "10 + 20 = 30";
      const re21: RegExp = new RegExp('\\d+', 'g');
      const result21: string = str21.replace(re21, (num) => (Number(num) * 2).toString());
      const expected: string = "20 + 40 = 60";
      const testPassed: boolean = result21 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2300
     * @tc.name      testStringRegularMethodModuleTestCase0023
     * @tc.desc      Verify String.prototype.replace() using the special replacement pattern $` (part of string before the match).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str23: string = "Hello world";
      const re23: RegExp = new RegExp('world');
      const result23: string = str23.replace(re23, "[$`]");
      const expected: string = "Hello [Hello ]";
      const testPassed: boolean = result23 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2400
     * @tc.name      testStringRegularMethodModuleTestCase0024
     * @tc.desc      Verify String.prototype.replace() using the special replacement pattern $' (part of string after the match).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str24: string = "Hello world";
      const re24: RegExp = new RegExp('Hello');
      const result24: string = str24.replace(re24, "[$']");
      const expected: string = "[ world] world";
      const testPassed: boolean = result24 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2500
     * @tc.name      testStringRegularMethodModuleTestCase0025
     * @tc.desc      Verify String.prototype.replace() with case-insensitive and global flags for consistent replacement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str25: string = "JavaScript is great. javascript is fun.";
      const re25: RegExp = new RegExp('javascript', 'gi');
      const result25: string = str25.replace(re25, "TypeScript");
      const expected: string = "TypeScript is great. TypeScript is fun.";
      const testPassed: boolean = result25 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2600
     * @tc.name      testStringRegularMethodModuleTestCase0026
     * @tc.desc      Verify basic usage of String.prototype.split() with a regular expression delimiter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str26: string = "apple,banana,cherry";
      const re26: RegExp = new RegExp(',');
      const result26: string[] = str26.split(re26);
      const expected: string[] = ["apple", "banana", "cherry"];
      const testPassed: boolean = result26.length === expected.length &&
      result26.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2700
     * @tc.name      testStringRegularMethodModuleTestCase0027
     * @tc.desc      Verify String.prototype.split() with a limit on the number of splits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str27: string = "a,b,c,d,e";
      const re27: RegExp = new RegExp(',');
      const result27: string[] = str27.split(re27, 3);
      const expected: string[] = ["a", "b", "c"];
      const testPassed: boolean = result27.length === expected.length &&
      result27.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2800
     * @tc.name      testStringRegularMethodModuleTestCase0028
     * @tc.desc      Verify String.prototype.split() using a regular expression to split on one or more whitespace characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str28: string = "a   b  c d";
      const re28: RegExp = new RegExp('\\s+');
      const result28: string[] = str28.split(re28);
      const expected: string[] = ["a", "b", "c", "d"];
      const testPassed: boolean = result28.length === expected.length &&
      result28.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_2900
     * @tc.name      testStringRegularMethodModuleTestCase0029
     * @tc.desc      Verify the effect of the global flag in RegExp when used with String.prototype.split().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str29: string = "a1b2c3d4";
      const re29: RegExp = new RegExp('\\d');
      const re29g: RegExp = new RegExp('\\d', 'g');
      const resultWithoutGlobal: string = str29.split(re29).join("|");
      const resultWithGlobal: string = str29.split(re29g).join("|");
      const expected: string = "a|b|c|d|";
      const testPassed: boolean =
        resultWithoutGlobal === expected &&
          resultWithGlobal === expected;
      expect(testPassed).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3000
     * @tc.name      testStringRegularMethodModuleTestCase0030
     * @tc.desc      Verify String.prototype.split() preserves captured groups in the result array when the delimiter RegExp contains capturing parentheses.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str30: string = "a1b2c3";
      const re30: RegExp = new RegExp('(\\d)');
      const result30: string[] = str30.split(re30);
      const expected: string[] = ["a", "1", "b", "2", "c", "3", ""];
      const testPassed: boolean = result30.length === expected.length &&
      result30.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3100
     * @tc.name      testStringRegularMethodModuleTestCase0031
     * @tc.desc      Verify non-greedy (lazy) quantifier in String.prototype.match() matches the shortest possible substring.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str31: string = "<div>content</div>";
      const re31: RegExp = new RegExp('<.*?>');
      const result31: string | undefined = str31.match(re31)?.[0];
      const expected: string = "<div>";
      const testPassed: boolean = result31 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3200
     * @tc.name      testStringRegularMethodModuleTestCase0032
     * @tc.desc      Verify greedy quantifier in String.prototype.match() matches the longest possible substring.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str32: string = "<div>content</div>";
      const re32: RegExp = new RegExp('<.*>');
      const result32: string | undefined = str32.match(re32)?.[0];
      const expected: string = "<div>content</div>";
      const testPassed: boolean = result32 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3300
     * @tc.name      testStringRegularMethodModuleTestCase0033
     * @tc.desc      Verify usage of String.prototype.matchAll() as an iterator to process multiple matches with capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str33: string = "1+2=3 4+5=9";
      const re33: RegExp = new RegExp('(\\d+)\\+(\\d+)=(\\d+)', 'g');
      const result33: string[] = [];
      for (const match of str33.matchAll(re33)) {
        const num1 = match[1];
        const num2 = match[2];
        const sum = match[3];
        result33.push(`${num1}加${num2}等于${sum}`);
      }
      const expected: string[] = ["1加2等于3", "4加5等于9"];
      const testPassed: boolean = result33.length === expected.length &&
      result33.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3400
     * @tc.name      testStringRegularMethodModuleTestCase0034
     * @tc.desc      Verify String.prototype.search() with a lookbehind assertion to find the position after '@'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str34: string = "user@example.com";
      const re34: RegExp = new RegExp('(?<=@)');
      const result34: number = str34.search(re34);
      const expected: number = 5;
      const testPassed: boolean = result34 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3500
     * @tc.name      testStringRegularMethodModuleTestCase0035
     * @tc.desc      Verify String.prototype.search() with a character class that matches uppercase letters; expect -1 when none exist.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str35: string = "abc123def456";
      const re35: RegExp = new RegExp('[A-Z]');
      const result35: number = str35.search(re35);
      const expected: number = -1;
      const testPassed: boolean = result35 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3600
     * @tc.name      testStringRegularMethodModuleTestCase0036
     * @tc.desc      Verify String.prototype.replace() with a negated character class to remove special characters except word characters, whitespace, and apostrophe.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str36: string = "Hello! How are you? I'm fine.";
      const re36: RegExp = new RegExp('[^\\w\\s\']', 'g');
      const result36: string = str36.replace(re36, "");
      const expected: string = "Hello How are you I'm fine";
      const testPassed: boolean = result36 === expected;
      expect(testPassed).assertTrue();
    });


    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3800
     * @tc.name      testStringRegularMethodModuleTestCase0038
     * @tc.desc      Verify converting camelCase to snake_case using String.prototype.replace() with lookaround assertions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str38: string = "camelCaseToSnakeCase";
      const re38: RegExp = new RegExp('(?<=[a-z])(?=[A-Z])', 'g');
      const result38: string = str38.replace(re38, "_").toLowerCase();
      const expected: string = "camel_case_to_snake_case";
      const testPassed: boolean = result38 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_3900
     * @tc.name      testStringRegularMethodModuleTestCase0039
     * @tc.desc      Verify String.prototype.split() using a complex regular expression to split on multiple delimiters with optional trailing whitespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str39: string = "apple, banana; cherry| date";
      const re39: RegExp = new RegExp('[,;|]\\s*');
      const result39: string[] = str39.split(re39);
      const expected: string[] = ["apple", "banana", "cherry", "date"];
      const testPassed: boolean = result39.length === expected.length &&
      result39.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4000
     * @tc.name      testStringRegularMethodModuleTestCase0040
     * @tc.desc      Verify String.prototype.split() with a zero-width negative lookahead assertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str40: string = "test";
      const re40: RegExp = new RegExp('(?!$)');
      const result40: string[] = str40.split(re40);
      const expected: string[] = ["t", "e", "s", "t"];
      const testPassed: boolean = result40.length === expected.length &&
      result40.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4100
     * @tc.name      testStringRegularMethodModuleTestCase0041
     * @tc.desc      Verify String.prototype.match() with word boundary assertions to match whole words only.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str41: string = "cat category concatenate";
      const re41: RegExp = new RegExp('\\bcat\\b', 'g');
      const result41: RegExpMatchArray | null = str41.match(re41);
      const expected: string[] = ["cat"];
      const testPassed: boolean = result41 !== null &&
        result41.length === expected.length &&
      result41.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4200
     * @tc.name      testStringRegularMethodModuleTestCase0042
     * @tc.desc      Verify String.prototype.match() with a regular expression to extract integers and decimal numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str42: string = "Order 123: 45 items, total 67.89";
      const re42: RegExp = new RegExp('\\d+\\.?\\d*', 'g');
      const result42: RegExpMatchArray | null = str42.match(re42);
      const expected: string[] = ["123", "45", "67.89"];
      const testPassed: boolean = result42 !== null &&
        result42.length === expected.length &&
      result42.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4300
     * @tc.name      testStringRegularMethodModuleTestCase0043
     * @tc.desc      Verify String.prototype.matchAll() with nested capturing groups to extract combined and inner group matches.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str43: string = "a1b2c3";
      const re43: RegExp = new RegExp('(\\w(\\d))', 'g');
      const matches = str43.matchAll(re43);
      const result43: string[] = [];
      for (const match of matches) {
        const fullGroup = match[1];
        const digitGroup = match[2];
        result43.push(`${fullGroup}(${digitGroup})`);
      }
      const expected: string[] = ["a1(1)", "b2(2)", "c3(3)"];
      const testPassed: boolean = result43.length === expected.length &&
      result43.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4400
     * @tc.name      testStringRegularMethodModuleTestCase0044
     * @tc.desc      Verify String.prototype.search() with word boundary and quantifier to find a 5-letter word.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str44: string = "abcde fghij klmno";
      const re44: RegExp = new RegExp('\\b\\w{5}\\b');
      const result44: number = str44.search(re44);
      const expected: number = 0;
      const testPassed: boolean = result44 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4500
     * @tc.name      testStringRegularMethodModuleTestCase0045
     * @tc.desc      Verify String.prototype.search() with alternation (|) to find the first occurrence of either 'green' or 'yellow'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str45: string = "red green blue yellow";
      const re45: RegExp = new RegExp('green|yellow');
      const result45: number = str45.search(re45);
      const expected: number = 4;
      const testPassed: boolean = result45 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4600
     * @tc.name      testStringRegularMethodModuleTestCase0046
     * @tc.desc      Verify String.prototype.replace() with capturing groups to reformat a date string from YYYY-MM-DD to MM/DD/YYYY.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str46: string = "2023-12-31";
      const re46: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})');
      const result46: string = str46.replace(re46, "$2/$3/$1");
      const expected: string = "12/31/2023";
      const testPassed: boolean = result46 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4800
     * @tc.name      testStringRegularMethodModuleTestCase0048
     * @tc.desc      Verify String.prototype.split() using a positive lookahead assertion to insert commas for thousands grouping.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str48: string = "1000000000";
      const result48 = str48.replace(new RegExp('\\B(?=(\\d{3})+(?!\\d))', 'g'), ",");
      const expected: string = "1,000,000,000";
      const testPassed: boolean = result48 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_4900
     * @tc.name      testStringRegularMethodModuleTestCase0049
     * @tc.desc      Verify String.prototype.split() with a non-capturing group in the delimiter RegExp; non-capturing groups are not included in the result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str49: string = "a,1;b,2;c,3";
      const re49: RegExp = new RegExp('(?:,|;)');
      const result49: string[] = str49.split(re49);
      const expected: string[] = ["a", "1", "b", "2", "c", "3"];
      const testPassed: boolean = result49.length === expected.length &&
      result49.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5000
     * @tc.name      testStringRegularMethodModuleTestCase0050
     * @tc.desc      Verify String.prototype.match() with a dynamically constructed RegExp using the RegExp constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str50: string = "test123 test456";
      const pattern50: string = "test\\d+";
      const re50: RegExp = new RegExp(pattern50, "g");
      const result50: RegExpMatchArray | null = str50.match(re50);
      const expected: string[] = ["test123", "test456"];
      const testPassed: boolean = result50 !== null &&
        result50.length === expected.length &&
      result50.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5100
     * @tc.name      testStringRegularMethodModuleTestCase0051
     * @tc.desc      Verify String.prototype.match() with backreference to match consecutive identical word characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str51: string = "aa bb cc dd ee ff";
      const re51: RegExp = new RegExp('(\\w)\\1', 'g');
      const result51: RegExpMatchArray | null = str51.match(re51);
      const expected: string[] = ["aa", "bb", "cc", "dd", "ee", "ff"];
      const testPassed: boolean = result51 !== null &&
        result51.length === expected.length &&
      result51.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });


    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5300
     * @tc.name      testStringRegularMethodModuleTestCase0053
     * @tc.desc      Verify String.prototype.search() with a positive lookbehind assertion to find digits after '$'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str53: string = "price: $100, discount: $50";
      const re53: RegExp = new RegExp('(?<=\\$)\\d+');
      const result53 = str53.search(re53);
      const expected: number = 8;
      expect(result53).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5400
     * @tc.name      testStringRegularMethodModuleTestCase0054
     * @tc.desc      Verify String.prototype.search() with a negative lookahead assertion to find 'a' not followed by 'p'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str54: string = "apple banana orange";
      const re54: RegExp = new RegExp('a(?!p)');
      const result54: number = str54.search(re54);
      const expected: number = 7;
      expect(result54).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5500
     * @tc.name      testStringRegularMethodModuleTestCase0055
     * @tc.desc      Verify String.prototype.replace() with global regex to replace all 'page=\\d+' with 'page=10' in URL.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str55: string = "https://example.com?page=1&sort=asc&page=2";
      const re55: RegExp = new RegExp('(page=)\\d+', 'g');
      const result55: string = str55.replace(re55, "$110");
      const expected: string = "https://example.com?page=10&sort=asc&page=10";
      expect(result55).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5600
     * @tc.name      testStringRegularMethodModuleTestCase0056
     * @tc.desc      Verify String.prototype.replace() with a replacer function to conditionally replace numbers with 'odd' or 'even'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str56: string = "1 2 3 4 5 6 7 8 9";
      const re56: RegExp = new RegExp('\\d+', 'g');
      const result56: string = str56.replace(re56, (num: string): string => {
        const n: number = Number(num);
        return n % 2 === 0 ? "even" : "odd";
      });
      const expected: string = "odd even odd even odd even odd even odd";
      expect(result56).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5700
     * @tc.name      testStringRegularMethodModuleTestCase0057
     * @tc.desc      Verify String.prototype.split() with zero-width lookaround assertions to split string into individual characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str57: string = "abcdef";
      const re57: RegExp = new RegExp('(?<=.)(?=.)', 'g');
      const result57: string[] = str57.split(re57);
      const expected: string[] = ["a", "b", "c", "d", "e", "f"];
      const testPassed: boolean = result57.length === expected.length &&
      result57.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_5900
     * @tc.name      testStringRegularMethodModuleTestCase0059
     * @tc.desc      Verify String.prototype.match() with non-capturing group to match email addresses starting with 'user' or 'admin'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str59: string = "user@example.com, admin@test.org";
      const re59: RegExp = new RegExp('(?:user|admin)@\\w+\\.\\w+', 'g');
      const result59: RegExpMatchArray | null = str59.match(re59);
      const expected: string[] = ["user@example.com", "admin@test.org"];
      const testPassed: boolean = result59 !== null &&
        result59.length === expected.length &&
      result59.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6000
     * @tc.name      testStringRegularMethodModuleTestCase0060
     * @tc.desc      Verify String.prototype.match() with multiline and global flags combined, using lookbehind to extract words after colon.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str60: string = "Line 1: apple\nLine 2: banana\nLine 3: cherry";
      const re60: RegExp = new RegExp('(?<=: )\\w+', 'gm');
      const result60: RegExpMatchArray | null = str60.match(re60);
      const expected: string[] = ["apple", "banana", "cherry"];
      const testPassed: boolean = result60 !== null &&
        result60.length === expected.length &&
      result60.every((v, i) => v === expected[i]);
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6200
     * @tc.name      testStringRegularMethodModuleTestCase0062
     * @tc.desc      Verify String.prototype.search() with a complex pattern to find the start index of 'Password: \w+'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str62: string = "Username: user123, Password: pass456";
      const re62: RegExp = new RegExp("Password: \\w+");
      const result62: number = str62.search(re62);
      const expected: number = 19;
      expect(result62).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_BASEDATA_STRING_REGULAR_METHOD_MODULE_TEST_CASE_6300
     * @tc.name      testStringRegularMethodModuleTestCase0063
     * @tc.desc      Verify String.prototype.replace() to escape dollar signs by replacing '$' with '\\$'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testStringRegularMethodModuleTestCase0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str63: string = "Price: $100, Discount: $50";
      const re63: RegExp = new RegExp("\\$", 'g');
      const result63: string = str63.replace(re63, "\\$");
      const expected: string = "Price: \\$100, Discount: \\$50";
      expect(result63).assertEqual(expected);
    });
  })
}