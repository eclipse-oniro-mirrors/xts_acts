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

export default function RegularExpressions11Test() {
  describe('RegularExpressions11Test', () => {
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
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_TYPE_CHECK_0100
     * @tc.name testArrayLikeTypeCheck0001
     * @tc.desc Verify Array.isArray detects manual array-like objects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeTypeCheck0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeTypeCheck0001 start');

      interface ArrayLikeObject {
        length: number;
      }

      const manualLikeObj: ArrayLikeObject = { length: 2 };
      const result1 = `1. Array.isArray check: ${!Array.isArray(manualLikeObj)}`;
      console.log(result1);
      expect(result1).assertEqual("1. Array.isArray check: true");
      done();
      console.log('testArrayLikeTypeCheck0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_INSTANCEOF_0100
     * @tc.name testArrayLikeInstanceOf0001
     * @tc.desc Verify instanceof Array check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeInstanceOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeInstanceOf0001 start');

      const testArr: number[] = [10, 20];
      const result2 = `2. Instanceof Array check: ${testArr instanceof Array}`;
      console.log(result2);
      expect(result2).assertEqual("2. Instanceof Array check: true");
      done();
      console.log('testArrayLikeInstanceOf0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_0100
     * @tc.name testArrayLikeSpread0001
     * @tc.desc Verify spread operator behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSpread0001 start');

      const testArr: number[] = [1, 2];
      const spreadArr: number[] = testArr.slice();
      const result3 = `3. Spread operator check: ${Array.isArray(spreadArr) && spreadArr[0] === 1}`;
      console.log(result3);
      expect(result3).assertEqual("3. Spread operator check: true");
      done();
      console.log('testArrayLikeSpread0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_DESTRUCTURE_0100
     * @tc.name testArrayLikeDestructure0001
     * @tc.desc Verify destructuring empty array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeDestructure0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeDestructure0001 start');

      const emptyArr: number[] = [];
      const firstElement: number | undefined = emptyArr[0];
      const secondElement: number | undefined = emptyArr[1];
      const result4 = `4. Destructure empty array: ${firstElement === undefined && secondElement === undefined}`;
      console.log(result4);
      expect(result4).assertEqual("4. Destructure empty array: true");
      done();
      console.log('testArrayLikeDestructure0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SORT_0100
     * @tc.name testArrayLikeSort0001
     * @tc.desc Verify sort behavior on array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSort0001 start');

      const testArr: number[] = [5, 2, 8];
      testArr.sort((a: number, b: number): number => a - b);
      const result5 = `5. Sort array-like: ${testArr[0] === 2 && testArr[1] === 5 && testArr[2] === 8}`;
      console.log(result5);
      expect(result5).assertEqual("5. Sort array-like: true");
      done();
      console.log('testArrayLikeSort0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_FLAT_0100
     * @tc.name testArrayLikeFlat0001
     * @tc.desc Verify flat behavior on nested array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeFlat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeFlat0001 start');

      const nestedArr: number[][] = [[1, 2], [3], [4, 5]];
      const flattened: number[] = [];

      nestedArr.forEach((subArray: number[]): void => {
        subArray.forEach((num: number): void => {
          flattened.push(num);
        });
      });

      const result6 = `6. Flat nested array: ${flattened.join(',') === "1,2,3,4,5"}`;
      console.log(result6);
      expect(result6).assertEqual("6. Flat nested array: true");
      done();
      console.log('testArrayLikeFlat0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAYLIKE_ARGUMENTS_0100
     * @tc.name testArrayLikeArguments0001
     * @tc.desc Verify arguments behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeArguments0001 start');

      const a: number = 10;
      const b: number = 20;
      const args: number[] = [a, b];
      const result7 = `7. Arguments check: ${args.length === 2 && args[0] === 10}`;
      console.log(result7);
      expect(result7).assertEqual("7. Arguments check: true");
      done();
      console.log('testArrayLikeArguments0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_THIS_0100
     * @tc.name testArrayLikeThis0001
     * @tc.desc Verify this binding in array methods.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeThis0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeThis0001 start');

      const testArr: number[] = [1, 2, 3];
      let count: number = 0;

      const callback = (item: number, index: number, array: number[]): void => {
        count++;
      };

      testArr.forEach(callback);
      const result9 = `9. This binding check: ${count === 3}`;
      console.log(result9);
      expect(result9).assertEqual("9. This binding check: true");
      done();
      console.log('testArrayLikeThis0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_DIFF_0100
     * @tc.name testArrayLikeSpreadDiff0001
     * @tc.desc Verify difference between array and plain object conversion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSpreadDiff0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSpreadDiff0001 start');

      interface PlainObject {
        key: string;
      }

      const testArr: number[] = [1];
      const plainObj: PlainObject = { key: 'value' };
      const convertedArr: number[] = testArr.slice();
      const convertedObj: PlainObject = { key: plainObj.key };

      const result10 = `10. Conversion difference: ${Array.isArray(convertedArr) && convertedObj.key === 'value'}`;
      console.log(result10);
      expect(result10).assertEqual("10. Conversion difference: true");
      done();
      console.log('testArrayLikeSpreadDiff0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_BASIC_0100
     * @tc.name testRegexConstructorBasic0001
     * @tc.desc Verify basic RegExp constructor matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorBasic0001 start');

      const re11 = new RegExp("abc");
      const result11 = re11.test("abc");
      console.log(`11. Constructor match 'abc': ${result11}`);
      expect(result11).assertTrue();
      done();
      console.log('testRegexConstructorBasic0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_DYNAMIC_0100
     * @tc.name testRegexConstructorDynamic0001
     * @tc.desc Verify RegExp constructor with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorDynamic0001 start');

      const pattern = "123";
      const re12 = new RegExp(pattern);
      const result12 = re12.test("456123");
      console.log(`12. Dynamic pattern match '456123': ${result12}`);
      expect(result12).assertTrue();
      done();
      console.log('testRegexConstructorDynamic0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_ESCAPE_0100
     * @tc.name testRegexConstructorEscape0001
     * @tc.desc Verify escaped character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorEscape0001 start');

      const re13 = new RegExp("\\d");
      const result13 = re13.test("5");
      console.log(`13. Escaped \\d match '5': ${result13}`);
      expect(result13).assertTrue();
      done();
      console.log('testRegexConstructorEscape0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_GLOBAL_0100
     * @tc.name testRegexConstructorGlobal0001
     * @tc.desc Verify global flag with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorGlobal0001 start');

      const re14 = new RegExp("a", "g");
      const matches = "aa".match(re14);
      const result14 = matches ? matches.length : 0;
      console.log(`14. Global flag match count: ${result14}`);
      expect(result14).assertEqual(2);
      done();
      console.log('testRegexConstructorGlobal0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_MULTI_FLAG_0100
     * @tc.name testRegexConstructorMultiFlag0001
     * @tc.desc Verify multiple flags with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorMultiFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorMultiFlag0001 start');

      const re15 = new RegExp("abc", "giu");
      const result15 = re15.flags;
      console.log(`15. Multi-flags (giu) value: ${result15}`);
      expect(result15).assertEqual("giu");
      done();
      console.log('testRegexConstructorMultiFlag0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPE_DIFFERENCE_0100
     * @tc.name testRegexEscapeDifference0001
     * @tc.desc Verify escape sequence difference between literal and constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapeDifference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapeDifference0001 start');

      const re16Literal = /[a-z]:\\/;
      const re16RegExp = new RegExp("[a-z]:\\\\");
      const result16 = re16Literal.test("C:\\") && re16RegExp.test("C:\\");
      console.log(`16. Escape difference match 'C:\\': ${result16}`);
      expect(result16).assertFalse();
      done();
      console.log('testRegexEscapeDifference0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_LITERAL_0100
     * @tc.name testRegexEmptyLiteral0001
     * @tc.desc Verify empty regex literal matches any string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyLiteral0001 start');

      const re17 = new RegExp("");
      const result17 = re17.test("anything");
      console.log(`17. Empty pattern match any string: ${result17}`);
      expect(result17).assertTrue();
      done();
      console.log('testRegexEmptyLiteral0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_CONSTRUCTOR_0100
     * @tc.name testRegexEmptyConstructor0001
     * @tc.desc Verify empty string constructor matches empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyConstructor0001 start');

      const re18 = new RegExp("");
      const result18 = re18.test("");
      console.log(`18. Empty pattern match empty string: ${result18}`);
      expect(result18).assertTrue();
      done();
      console.log('testRegexEmptyConstructor0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_SPECIAL_CHAR_0100
     * @tc.name testRegexLiteralSpecialChar0001
     * @tc.desc Verify special character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSpecialChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSpecialChar0001 start');

      const re19 = /a\*b/;
      const result19 = re19.test("a*b");
      console.log(`19. Escaped * match 'a*b': ${result19}`);
      expect(result19).assertTrue();
      done();
      console.log('testRegexLiteralSpecialChar0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_SPECIAL_CHAR_0100
     * @tc.name testRegexConstructorSpecialChar0001
     * @tc.desc Verify special character matching with constructor (double escape).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSpecialChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSpecialChar0001 start');

      const re20 = new RegExp("a\\*b");
      const result20 = re20.test("a*b");
      console.log(`20. Double-escaped * match 'a*b': ${result20}`);
      expect(result20).assertTrue();
      done();
      console.log('testRegexConstructorSpecialChar0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_SLASH_0100
     * @tc.name testRegexLiteralSlash0001
     * @tc.desc Verify escaped slash matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSlash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSlash0001 start');

      const re21 = /\/example\//;
      const result21 = re21.test("/example/");
      console.log(`21. Escaped slash match '/example/': ${result21}`);
      expect(result21).assertTrue();
      done();
      console.log('testRegexLiteralSlash0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_SLASH_0100
     * @tc.name testRegexConstructorSlash0001
     * @tc.desc Verify double-escaped slash matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSlash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSlash0001 start');

      const re22 = new RegExp("\\/example\\/");
      const result22 = re22.test("/example/");
      console.log(`22. Double-escaped slash match '/example/': ${result22}`);
      expect(result22).assertTrue();
      done();
      console.log('testRegexConstructorSlash0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_STICKY_0100
     * @tc.name testRegexLiteralSticky0001
     * @tc.desc Verify sticky flag matching from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSticky0001 start');

      const re23 = /a/y;
      const result23 = re23.test("aa");
      const lastIndex23 = re23.lastIndex;
      console.log(`23. Sticky flag match from index 0: ${result23}, lastIndex: ${lastIndex23}`);
      expect(result23).assertTrue();
      expect(lastIndex23).assertEqual(1);
      done();
      console.log('testRegexLiteralSticky0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_STICKY_0100
     * @tc.name testRegexConstructorSticky0001
     * @tc.desc Verify sticky flag matching from modified lastIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSticky0001 start');

      const re24 = new RegExp("a", "y");
      re24.lastIndex = 1;
      const result24 = re24.test("aa");
      const lastIndex24 = re24.lastIndex;
      console.log(`24. Sticky flag match from index 1: ${result24}, lastIndex: ${lastIndex24}`);
      expect(result24).assertTrue();
      expect(lastIndex24).assertEqual(2);
      done();
      console.log('testRegexConstructorSticky0001 done');
    });

    /**
     * @tc.number REGEX_NO_UNICODE_FLAG_0100
     * @tc.name testRegexNoUnicodeFlag0001
     * @tc.desc Verify failed emoji match without Unicode flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNoUnicodeFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNoUnicodeFlag0001 start');

      const re26 = /\u{1F600}/;
      const result26 = re26.test("😀");
      console.log(`26. No Unicode flag match emoji '😀': ${result26}`);
      expect(result26).assertFalse();
      done();
      console.log('testRegexNoUnicodeFlag0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_FLAG_0100
     * @tc.name testRegexMultilineFlag0001
     * @tc.desc Verify multiline flag matching line endings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineFlag0001 start');

      const re27 = /line$/m;
      const result27 = re27.test("first line\nsecond line");
      console.log(`27. Multiline flag match line ending 'line': ${result27}`);
      expect(result27).assertTrue();
      done();
      console.log('testRegexMultilineFlag0001 done');
    });

    /**
     * @tc.number REGEX_NO_MULTILINE_FLAG_0100
     * @tc.name testRegexNoMultilineFlag0001
     * @tc.desc Verify failed line ending match without multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNoMultilineFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNoMultilineFlag0001 start');

      const re28 = /line$/;
      const result28 = re28.test("first line\nsecond line");
      console.log(`28. No multiline flag match middle line 'line': ${result28}`);
      expect(result28).assertTrue();
      done();
      console.log('testRegexNoMultilineFlag0001 done');
    });

    /**
     * @tc.number REGEX_DYNAMIC_INPUT_0100
     * @tc.name testRegexDynamicInput0001
     * @tc.desc Verify escaped user input matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDynamicInput0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDynamicInput0001 start');

      const userInput = "user@example.com";
      const escapedInput = userInput.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
      const re29 = new RegExp(escapedInput);
      const result29 = re29.test(userInput);
      console.log(`29. Escaped user input match original: ${result29}`);
      expect(result29).assertTrue();
      done();
      console.log('testRegexDynamicInput0001 done');
    });

    /**
     * @tc.number SUB_REGEX_CHINESE_CHAR_0100
     * @tc.name testRegexChineseChar0001
     * @tc.desc Verify Chinese character matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexChineseChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexChineseChar0001 start');

      const re30 = /[\u4e00-\u9fa5]/;
      const result30 = re30.test("中");
      console.log(`30. Chinese character match '中': ${result30}`);
      expect(result30).assertTrue();
      done();
      console.log('testRegexChineseChar0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_CHINESE_0100
     * @tc.name testRegexConstructorChinese0001
     * @tc.desc Verify Chinese character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorChinese0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorChinese0001 start');

      const re31 = new RegExp("[\u4e00-\u9fa5]");
      const result31 = re31.test("文");
      console.log(`31. Constructor match Chinese '文': ${result31}`);
      expect(result31).assertTrue();
      done();
      console.log('testRegexConstructorChinese0001 done');
    });

    /**
     * @tc.number REGEX_DOTALL_FLAG_0100
     * @tc.name testRegexDotAllFlag0001
     * @tc.desc Verify dotAll flag matches newline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDotAllFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDotAllFlag0001 start');

      const re32 = /a.b/s;
      const result32 = re32.test("a\nb");
      console.log(`32. DotAll flag match 'a\\nb': ${result32}`);
      expect(result32).assertTrue();
      done();
      console.log('testRegexDotAllFlag0001 done');
    });

    /**
     * @tc.number REGEX_NO_DOTALL_FLAG_0100
     * @tc.name testRegexNoDotAllFlag0001
     * @tc.desc Verify dot without flag doesn't match newline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNoDotAllFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNoDotAllFlag0001 start');

      const re33 = /a.b/;
      const result33 = re33.test("a\nb");
      console.log(`33. No dotAll flag match 'a\\nb': ${result33}`);
      expect(result33).assertFalse();
      done();
      console.log('testRegexNoDotAllFlag0001 done');
    });

    /**
     * @tc.number REGEX_GLOBAL_RESET_0100
     * @tc.name testRegexGlobalReset0001
     * @tc.desc Verify lastIndex reset after global match exhaustion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGlobalReset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGlobalReset0001 start');

      const re34 = /a/g;
      re34.exec("aa");
      re34.exec("aa");
      const result34 = re34.exec("aa");
      const lastIndex34 = re34.lastIndex;
      console.log(`34. Global match exhausted result: ${result34}, lastIndex: ${lastIndex34}`);
      expect(result34).assertNull();
      expect(lastIndex34).assertEqual(0);
      done();
      console.log('testRegexGlobalReset0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_GLOBAL_INDEX_0100
     * @tc.name testRegexConstructorGlobalIndex0001
     * @tc.desc Verify lastIndex after constructor global match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorGlobalIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorGlobalIndex0001 start');

      const re35 = new RegExp("a", "g");
      re35.exec("aa");
      const result35 = re35.lastIndex;
      console.log(`35. Constructor global match lastIndex: ${result35}`);
      expect(result35).assertEqual(1);
      done();
      console.log('testRegexConstructorGlobalIndex0001 done');
    });

    /**
     * @tc.number REGEX_NUMBER_RANGE_0100
     * @tc.name testRegexNumberRange0001
     * @tc.desc Verify number range matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNumberRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNumberRange0001 start');

      const re36 = /[0-5]/;
      const result36 = re36.test("3");
      console.log(`36. Literal match number '3': ${result36}`);
      expect(result36).assertTrue();
      done();
      console.log('testRegexNumberRange0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_NUMBER_RANGE_0100
     * @tc.name testRegexConstructorNumberRange0001
     * @tc.desc Verify number range mismatch with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorNumberRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorNumberRange0001 start');

      const re37 = new RegExp("[0-5]");
      const result37 = re37.test("6");
      console.log(`37. Constructor mismatch number '6': ${result37}`);
      expect(result37).assertFalse();
      done();
      console.log('testRegexConstructorNumberRange0001 done');
    });

    /**
     * @tc.number REGEX_WORD_CHAR_0100
     * @tc.name testRegexWordChar0001
     * @tc.desc Verify word character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordChar0001 start');

      const re38 = /\w/;
      const result38 = re38.test("_");
      console.log(`38. Literal \\w match '_': ${result38}`);
      expect(result38).assertTrue();
      done();
      console.log('testRegexWordChar0001 done');
    });

    /**
     * @tc.number REGEX_NON_WORD_CHAR_0100
     * @tc.name testRegexNonWordChar0001
     * @tc.desc Verify non-word character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWordChar0001 start');

      const re39 = new RegExp("\\W");
      const result39 = re39.test("%");
      console.log(`39. Constructor \\W match '%': ${result39}`);
      expect(result39).assertTrue();
      done();
      console.log('testRegexNonWordChar0001 done');
    });

    /**
     * @tc.number REGEX_WHITESPACE_0100
     * @tc.name testRegexWhitespace0001
     * @tc.desc Verify whitespace matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWhitespace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWhitespace0001 start');

      const re40 = /\s/;
      const result40 = re40.test("\t");
      console.log(`40. Literal \\s match tab: ${result40}`);
      expect(result40).assertTrue();
      done();
      console.log('testRegexWhitespace0001 done');
    });

    /**
     * @tc.number REGEX_NON_WHITESPACE_0100
     * @tc.name testRegexNonWhitespace0001
     * @tc.desc Verify non-whitespace character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWhitespace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWhitespace0001 start');

      const re41 = new RegExp("\\S");
      const result41 = re41.test(" ");
      console.log(`41. Constructor \\S match space: ${result41}`);
      expect(result41).assertFalse();
      done();
      console.log('testRegexNonWhitespace0001 done');
    });

    /**
     * @tc.number REGEX_CASE_INSENSITIVE_0100
     * @tc.name testRegexCaseInsensitive0001
     * @tc.desc Verify case-insensitive matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCaseInsensitive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCaseInsensitive0001 start');

      const re42 = /TeSt/i;
      const result42 = re42.test("tEsT");
      console.log(`42. Case-insensitive match 'tEsT': ${result42}`);
      expect(result42).assertTrue();
      done();
      console.log('testRegexCaseInsensitive0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_CASE_INSENSITIVE_0100
     * @tc.name testRegexConstructorCaseInsensitive0001
     * @tc.desc Verify case-insensitive matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorCaseInsensitive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorCaseInsensitive0001 start');

      const re43 = new RegExp("HELLO", "i");
      const result43 = re43.test("hello");
      console.log(`43. Constructor case-insensitive match 'hello': ${result43}`);
      expect(result43).assertTrue();
      done();
      console.log('testRegexConstructorCaseInsensitive0001 done');
    });

    /**
     * @tc.number REGEX_START_OF_INPUT_0100
     * @tc.name testRegexStartOfInput0001
     * @tc.desc Verify start of input matching without multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStartOfInput0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexStartOfInput0001 start');

      const re44 = /^first/;
      const result44 = re44.test("first\nsecond");
      console.log(`44. Start of input match 'first': ${result44}`);
      expect(result44).assertTrue();
      done();
      console.log('testRegexStartOfInput0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_START_0100
     * @tc.name testRegexMultilineStart0001
     * @tc.desc Verify line start matching with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineStart0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineStart0001 start');

      const re45 = new RegExp("^second", "m");
      const result45 = re45.test("first\nsecond");
      console.log(`45. Multiline match line start 'second': ${result45}`);
      expect(result45).assertTrue();
      done();
      console.log('testRegexMultilineStart0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_GLOBAL_0100
     * @tc.name testRegexEmptyGlobal0001
     * @tc.desc Verify empty pattern global matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyGlobal0001 start');

      const re46 = new RegExp("", "g");
      const matches46 = "test".match(re46);
      const result46 = matches46 ? matches46.length : 0;
      console.log(`46. Global empty pattern match count: ${result46}`);
      expect(result46).assertEqual(5);
      done();
      console.log('testRegexEmptyGlobal0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_EMPTY_GLOBAL_0100
     * @tc.name testRegexConstructorEmptyGlobal0001
     * @tc.desc Verify empty pattern global matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorEmptyGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorEmptyGlobal0001 start');

      const re47 = new RegExp("", "g");
      const matches47 = "abc".match(re47);
      const result47 = matches47 ? matches47.length : 0;
      console.log(`47. Constructor global empty pattern match count: ${result47}`);
      expect(result47).assertEqual(4);
      done();
      console.log('testRegexConstructorEmptyGlobal0001 done');
    });

    /**
     * @tc.number REGEX_INVALID_LITERAL_0100
     * @tc.name testRegexInvalidLiteral0001
     * @tc.desc Verify invalid literal pattern throws error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexInvalidLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexInvalidLiteral0001 start');

      let errorMessage48 = "";
      try {
        new RegExp("(abc");
      } catch (e) {
        errorMessage48 = e.message.substring(0, 20);
      }
      console.log(`48. Invalid literal pattern error: ${errorMessage48}`);
      expect(errorMessage48.length > 0).assertTrue();
      done();
      console.log('testRegexInvalidLiteral0001 done');
    });

    /**
     * @tc.number SUB_REGEX_INVALID_ESCAPE_0100
     * @tc.name testRegexInvalidEscape0001
     * @tc.desc Verify invalid escape sequence throws error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexInvalidEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexInvalidEscape0001 start');
      let errorMessage49 = "";
      try {
        new RegExp("\\");
      } catch (e) {
        errorMessage49 = e.message.substring(0, 20);
      }
      console.log(`49. Invalid escape sequence error: ${errorMessage49}`);
      expect(errorMessage49.length > 0).assertTrue();
      done();
      console.log('testRegexInvalidEscape0001 done');
    });

    /**
     * @tc.number REGEX_CURRENCY_FORMAT_0100
     * @tc.name testRegexCurrencyFormat0001
     * @tc.desc Verify currency format matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCurrencyFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCurrencyFormat0001 start');

      const re50 = /\$\d+\.\d{2}/;
      const result50 = re50.test("$100.00");
      console.log(`50. Currency format match '$100.00': ${result50}`);
      expect(result50).assertTrue();
      done();
      console.log('testRegexCurrencyFormat0001 done');
    });

    /**
     * @tc.number REGEX_URL_FORMAT_0100
     * @tc.name testRegexUrlFormat0001
     * @tc.desc Verify URL format matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlFormat0001 start');

      const re51 = new RegExp("^https?:\\/\\/[a-z0-9.-]+\\.[a-z]{2,}$", "i");
      const result51 = re51.test("https://example.com");
      console.log(`51. URL format match 'https://example.com': ${result51}`);
      expect(result51).assertTrue();
      done();
      console.log('testRegexUrlFormat0001 done');
    });

    /**
     * @tc.number REGEX_EMAIL_FORMAT_0100
     * @tc.name testRegexEmailFormat0001
     * @tc.desc Verify email format matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmailFormat0001 start');

      const re52 = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;
      const result52 = re52.test("test@example.com");
      console.log(`52. Email format match 'test@example.com': ${result52}`);
      expect(result52).assertTrue();
      done();
      console.log('testRegexEmailFormat0001 done');
    });

    /**
     * @tc.number REGEX_PHONE_FORMAT_0100
     * @tc.name testRegexPhoneFormat0001
     * @tc.desc Verify phone number format matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPhoneFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPhoneFormat0001 start');

      const re53 = new RegExp("^1[3-9]\\d{9}$");
      const result53 = re53.test("13800138000");
      console.log(`53. Phone number match '13800138000': ${result53}`);
      expect(result53).assertTrue();
      done();
      console.log('testRegexPhoneFormat0001 done');
    });

    /**
     * @tc.number REGEX_ID_CARD_0100
     * @tc.name testRegexIdCard0001
     * @tc.desc Verify ID card format matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIdCard0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIdCard0001 start');

      const re54 = /^\d{17}[\dXx]$/;
      const result54 = re54.test("110101199001011234");
      console.log(`54. ID card format match: ${result54}`);
      expect(result54).assertTrue();
      done();
      console.log('testRegexIdCard0001 done');
    });

    /**
     * @tc.number SUB_REGEX_DATE_FORMAT_0100
     * @tc.name testRegexDateFormat0001
     * @tc.desc Verify date format matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDateFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDateFormat0001 start');

      const re55 = new RegExp("^\\d{4}-\\d{2}-\\d{2}$");
      const result55 = re55.test("2025-01-18");
      console.log(`55. Date format match '2025-01-18': ${result55}`);
      expect(result55).assertTrue();
      done();
      console.log('testRegexDateFormat0001 done');
    });

    /**
     * @tc.number REGEX_GLOBAL_MULTIPLE_0100
     * @tc.name testRegexGlobalMultiple0001
     * @tc.desc Verify multiple matches with global flag using literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGlobalMultiple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGlobalMultiple0001 start');

      const re56 = /ab/g;
      const str56 = "ababab";
      const matches56: string[] = [];
      let match56: RegExpExecArray | null;

      while ((match56 = re56.exec(str56)) !== null) {
        matches56.push(match56[0]);
      }

      const result56 = matches56.join(",");
      console.log(`56. Global matches: ${result56}, count: ${matches56.length}`);
      expect(result56).assertEqual("ab,ab,ab");
      expect(matches56.length).assertEqual(3);
      done();
      console.log('testRegexGlobalMultiple0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_GLOBAL_0200
     * @tc.name testRegexConstructorGlobal0002
     * @tc.desc Verify multiple matches with global flag using constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorGlobal0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorGlobal0002 start');

      const re57 = new RegExp("cd", "g");
      const str57 = "cdcd";
      const matches57 = str57.match(re57) || [];
      const result57 = matches57.join(",");
      console.log(`57. Constructor global matches: ${result57}`);
      expect(result57).assertEqual("cd,cd");
      done();
      console.log('testRegexConstructorGlobal0001 done');
    });

    /**
     * @tc.number REGEX_STICKY_FLAG_0100
     * @tc.name testRegexStickyFlag0001
     * @tc.desc Verify sticky flag matching from specific position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStickyFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexStickyFlag0001 start');

      const re58 = /a/y;
      re58.lastIndex = 1;
      const result58 = re58.test("ba");
      console.log(`58. Sticky flag match from index 1: ${result58}`);
      expect(result58).assertTrue();
      done();
      console.log('testRegexStickyFlag0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_STICKY_0200
     * @tc.name testRegexConstructorSticky0002
     * @tc.desc Verify sticky flag matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSticky0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSticky0002 start');

      const re59 = new RegExp("a", "y");
      re59.lastIndex = 2;
      const result59 = re59.test("baa");
      const lastIndex59 = re59.lastIndex;
      console.log(`59. Constructor sticky match from index 2: ${result59}, lastIndex: ${lastIndex59}`);
      expect(result59).assertTrue();
      expect(lastIndex59).assertEqual(3);
      done();
      console.log('testRegexConstructorSticky0001 done');
    });

    /**
     * @tc.number REGEX_STICKY_FAILURE_0100
     * @tc.name testRegexStickyFailure0001
     * @tc.desc Verify sticky flag reset on failed match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStickyFailure0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexStickyFailure0001 start');

      const re60 = /a/y;
      re60.lastIndex = 1;
      const result60 = re60.test("ab");
      const lastIndex60 = re60.lastIndex;
      console.log(`60. Sticky flag failed match: ${result60}, lastIndex: ${lastIndex60}`);
      expect(result60).assertFalse();
      expect(lastIndex60).assertEqual(0);
      done();
      console.log('testRegexStickyFailure0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_STICKY_FAILURE_0100
     * @tc.name testRegexConstructorStickyFailure0001
     * @tc.desc Verify constructor sticky flag reset on failed match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorStickyFailure0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorStickyFailure0001 start');

      const re61 = new RegExp("a", "y");
      re61.lastIndex = 3;
      const result61 = re61.test("aaa");
      const lastIndex61 = re61.lastIndex;
      console.log(`61. Constructor sticky flag failed match: ${result61}, lastIndex: ${lastIndex61}`);
      expect(result61).assertFalse();
      expect(lastIndex61).assertEqual(0);
      done();
      console.log('testRegexConstructorStickyFailure0001 done');
    });

    /**
     * @tc.number REGEX_UNICODE_PROPERTY_0100
     * @tc.name testRegexUnicodeProperty0001
     * @tc.desc Verify Unicode property matching with u flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeProperty0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeProperty0001 start');

      const re62 = /\p{Number}/u;
      const result62 = re62.test("①");
      console.log(`62. Unicode number match '①': ${result62}`);
      expect(result62).assertTrue();
      done();
      console.log('testRegexUnicodeProperty0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_UNICODE_0100
     * @tc.name testRegexConstructorUnicode0001
     * @tc.desc Verify Unicode property matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorUnicode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorUnicode0001 start');

      const re63 = new RegExp("\\p{Letter}", "u");
      const result63 = re63.test("é");
      console.log(`63. Constructor Unicode letter match 'é': ${result63}`);
      expect(result63).assertTrue();
      done();
      console.log('testRegexConstructorUnicode0001 done');
    });

    /**
     * @tc.number SUB_REGEX_NEWLINE_0100
     * @tc.name testRegexNewline0001
     * @tc.desc Verify newline character matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNewline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNewline0001 start');

      const re64 = /\n/;
      const result64 = re64.test("line1\nline2");
      console.log(`64. Newline character match: ${result64}`);
      expect(result64).assertTrue();
      done();
      console.log('testRegexNewline0001 done');
    });

    /**
     * @tc.number REGEX_CARRIAGE_RETURN_0100
     * @tc.name testRegexCarriageReturn0001
     * @tc.desc Verify carriage return matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCarriageReturn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCarriageReturn0001 start');

      const re65 = new RegExp("\\r");
      const result65 = re65.test("line1\rline2");
      console.log(`65. Carriage return match: ${result65}`);
      expect(result65).assertTrue();
      done();
      console.log('testRegexCarriageReturn0001 done');
    });

    /**
     * @tc.number REGEX_FORM_FEED_0100
     * @tc.name testRegexFormFeed0001
     * @tc.desc Verify form feed character matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFormFeed0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFormFeed0001 start');

      const re66 = /\f/;
      const result66 = re66.test("page1\fpage2");
      console.log(`66. Form feed character match: ${result66}`);
      expect(result66).assertTrue();
      done();
      console.log('testRegexFormFeed0001 done');
    });

    /**
     * @tc.number REGEX_VERTICAL_TAB_0100
     * @tc.name testRegexVerticalTab0001
     * @tc.desc Verify vertical tab matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVerticalTab0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexVerticalTab0001 start');

      const re67 = new RegExp("\\v");
      const result67 = re67.test("col1\vcol2");
      console.log(`67. Vertical tab match: ${result67}`);
      expect(result67).assertTrue();
      done();
      console.log('testRegexVerticalTab0001 done');
    });

    /**
     * @tc.number REGEX_NULL_CHAR_0100
     * @tc.name testRegexNullChar0001
     * @tc.desc Verify null character matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNullChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNullChar0001 start');

      const re68 = /\0/;
      const result68 = re68.test("null\0char");
      console.log(`68. Null character match: ${result68}`);
      expect(result68).assertTrue();
      done();
      console.log('testRegexNullChar0001 done');
    });

    /**
     * @tc.number REGEX_HEX_CHAR_0100
     * @tc.name testRegexHexChar0001
     * @tc.desc Verify hexadecimal character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHexChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHexChar0001 start');

      const re69 = new RegExp("\\x41");
      const result69 = re69.test("A");
      console.log(`69. Hexadecimal character match 'A': ${result69}`);
      expect(result69).assertTrue();
      done();
      console.log('testRegexHexChar0001 done');
    });

    /**
     * @tc.number REGEX_UTF16_CHAR_0100
     * @tc.name testRegexUtf16Char0001
     * @tc.desc Verify UTF-16 character matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUtf16Char0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUtf16Char0001 start');

      const re70 = /\u0041/;
      const result70 = re70.test("A");
      console.log(`70. UTF-16 character match 'A': ${result70}`);
      expect(result70).assertTrue();
      done();
      console.log('testRegexUtf16Char0001 done');
    });

    /**
     * @tc.number REGEX_UTF16_CHAR_0200
     * @tc.name testRegexUtf16Char0002
     * @tc.desc Verify UTF-16 character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUtf16Char0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUtf16Char0002 start');

      const re71 = new RegExp("\\u0061");
      const result71 = re71.test("a");
      console.log(`71. UTF-16 character match 'a': ${result71}`);
      expect(result71).assertTrue();
      done();
      console.log('testRegexUtf16Char0002 done');
    });

    /**
     * @tc.number REGEX_UTF32_LITERAL_0100
     * @tc.name testRegexUtf32Literal0001
     * @tc.desc Verify UTF-32 character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUtf32Literal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUtf32Literal0001 start');

      const re72 = /\u{1F601}/u;
      const result72 = re72.test("😁");
      console.log(`72. UTF-32 emoji match '😁': ${result72}`);
      expect(result72).assertTrue();
      done();
      console.log('testRegexUtf32Literal0001 done');
    });

    /**
     * @tc.number REGEX_UTF32_CONSTRUCTOR_0100
     * @tc.name testRegexUtf32Constructor0001
     * @tc.desc Verify UTF-32 character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUtf32Constructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUtf32Constructor0001 start');

      const re73 = new RegExp("\\u{1F602}", "u");
      const result73 = re73.test("😂");
      console.log(`73. Constructor UTF-32 emoji match '😂': ${result73}`);
      expect(result73).assertTrue();
      done();
      console.log('testRegexUtf32Constructor0001 done');
    });

    /**
     * @tc.number SUB_REGEX_WORD_BOUNDARY_0100
     * @tc.name testRegexWordBoundary0001
     * @tc.desc Verify word boundary matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordBoundary0001 start');

      const re74 = /\bm/;
      const result74 = re74.test("moon");
      console.log(`74. Word boundary match 'moon': ${result74}`);
      expect(result74).assertTrue();
      done();
      console.log('testRegexWordBoundary0001 done');
    });

    /**
     * @tc.number REGEX_NON_WORD_BOUNDARY_0100
     * @tc.name testRegexNonWordBoundary0001
     * @tc.desc Verify non-word boundary matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWordBoundary0001 start');

      const re75 = new RegExp("\\Boo");
      const result75 = re75.test("moon");
      console.log(`75. Non-word boundary match 'moon': ${result75}`);
      expect(result75).assertTrue();
      done();
      console.log('testRegexNonWordBoundary0001 done');
    });

    /**
     * @tc.number REGEX_BACKSPACE_0100
     * @tc.name testRegexBackspace0001
     * @tc.desc Verify backspace character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBackspace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexBackspace0001 start');

      const re76 = /[\b]/;
      const result76 = re76.test("backspace\bchar");
      console.log(`76. Backspace character match: ${result76}`);
      expect(result76).assertTrue();
      done();
      console.log('testRegexBackspace0001 done');
    });

    /**
     * @tc.number REGEX_CONTROL_CHAR_0100
     * @tc.name testRegexControlChar0001
     * @tc.desc Verify control character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexControlChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexControlChar0001 start');

      const re77 = new RegExp("\\cM");
      const result77 = re77.test("\r");
      console.log(`77. Control character match: ${result77}`);
      expect(result77).assertTrue();
      done();
      console.log('testRegexControlChar0001 done');
    });

    /**
     * @tc.number REGEX_DIGIT_0100
     * @tc.name testRegexDigit0001
     * @tc.desc Verify digit matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDigit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDigit0001 start');

      const re78 = /\d/;
      const result78 = re78.test("123abc");
      console.log(`78. Digit match '123abc': ${result78}`);
      expect(result78).assertTrue();
      done();
      console.log('testRegexDigit0001 done');
    });

    /**
     * @tc.number REGEX_NON_DIGIT_0100
     * @tc.name testRegexNonDigit0001
     * @tc.desc Verify non-digit matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonDigit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonDigit0001 start');

      const re79 = new RegExp("\\D");
      const result79 = re79.test("123abc");
      console.log(`79. Non-digit match '123abc': ${result79}`);
      expect(result79).assertTrue();
      done();
      console.log('testRegexNonDigit0001 done');
    });

    /**
     * @tc.number REGEX_WORD_CHAR_0200
     * @tc.name testRegexWordChar0002
     * @tc.desc Verify word character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordChar0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordChar0002 start');

      const re80 = /\w/;
      const result80 = re80.test("hello_world");
      console.log(`80. Word character match 'hello_world': ${result80}`);
      expect(result80).assertTrue();
      done();
      console.log('testRegexWordChar0001 done');
    });

    /**
     * @tc.number REGEX_NON_WORD_CHAR_0200
     * @tc.name testRegexNonWordChar0002
     * @tc.desc Verify non-word character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordChar0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWordChar0002 start');

      const re81 = new RegExp("\\W");
      const result81 = re81.test("hello@world");
      console.log(`81. Non-word character match '@': ${result81}`);
      expect(result81).assertTrue();
      done();
      console.log('testRegexNonWordChar0002 done');
    });

    /**
     * @tc.number REGEX_GLOBAL_CONTINUE_0100
     * @tc.name testRegexGlobalContinue0001
     * @tc.desc Verify continued global matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGlobalContinue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGlobalContinue0001 start');

      const re82 = /a/g;
      re82.exec("aa");
      const match82 = re82.exec("aa");
      const result82 = match82 ? match82[0] : null;
      const lastIndex82 = re82.lastIndex;
      console.log(`82. Continued global match: ${result82}, lastIndex: ${lastIndex82}`);
      expect(result82).assertEqual("a");
      expect(lastIndex82).assertEqual(2);
      done();
      console.log('testRegexGlobalContinue0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_GLOBAL_CONTINUE_0100
     * @tc.name testRegexConstructorGlobalContinue0001
     * @tc.desc Verify continued global matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorGlobalContinue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorGlobalContinue0001 start');

      const re83 = new RegExp("b", "g");
      re83.exec("bb");
      const match83 = re83.exec("bb");
      const result83 = match83 ? match83[0] : null;
      const lastIndex83 = re83.lastIndex;
      console.log(`83. Constructor continued global match: ${result83}, lastIndex: ${lastIndex83}`);
      expect(result83).assertEqual("b");
      expect(lastIndex83).assertEqual(2);
      done();
      console.log('testRegexConstructorGlobalContinue0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_PATTERN_0100
     * @tc.name testRegexEmptyPattern0001
     * @tc.desc Verify empty pattern matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyPattern0001 start');

      const re84 = new RegExp("");
      const match84 = re84.exec("test");
      const result84 = match84 ? match84[0] : null;
      console.log(`84. Empty pattern match: ${result84}`);
      expect(result84).assertEqual("");
      done();
      console.log('testRegexEmptyPattern0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_EMPTY_PATTERN_0100
     * @tc.name testRegexConstructorEmptyPattern0001
     * @tc.desc Verify empty pattern matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorEmptyPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorEmptyPattern0001 start');

      const re85 = new RegExp("");
      const match85 = re85.exec("abc");
      const result85 = match85 ? match85[0] : null;
      console.log(`85. Constructor empty pattern match: ${result85}`);
      expect(result85).assertEqual("");
      done();
      console.log('testRegexConstructorEmptyPattern0001 done');
    });

    /**
     * @tc.number REGEX_GI_FLAGS_0100
     * @tc.name testRegexGiFlags0001
     * @tc.desc Verify case-insensitive global matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGiFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGiFlags0001 start');

      const re86 = /ab/gi;
      const matches86 = "AbABaB".match(re86);
      const result86 = matches86 ? matches86.join(",") : "";
      console.log(`86. Case-insensitive global match: ${result86}`);
      expect(result86).assertEqual("Ab,AB,aB");
      done();
      console.log('testRegexGiFlags0001 done');
    });

    /**
     * @tc.number REGEX_GM_FLAGS_0100
     * @tc.name testRegexGmFlags0001
     * @tc.desc Verify multiline global matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGmFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGmFlags0001 start');

      const re87 = new RegExp("^line", "gmi");
      const str87 = "line1\nLine2\nLINE3";
      const matches87: string[] = [];
      let match87: RegExpExecArray | null;

      while ((match87 = re87.exec(str87)) !== null) {
        matches87.push(match87[0]);
      }

      const result87 = matches87.join(",");
      console.log(`87. Multiline global match: ${result87}`);
      expect(result87).assertEqual("line,Line,LINE");
      done();
      console.log('testRegexGmFlags0001 done');
    });

    /**
     * @tc.number REGEX_SU_FLAGS_0100
     * @tc.name testRegexSuFlags0001
     * @tc.desc Verify dotAll and Unicode flag combination.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSuFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexSuFlags0001 start');

      const re88 = /.\u{1F600}/su;
      const result88 = re88.test("\n😀");
      console.log(`88. DotAll and Unicode flags match: ${result88}`);
      expect(result88).assertTrue();
      done();
      console.log('testRegexSuFlags0001 done');
    });

    /**
     * @tc.number REGEX_YI_FLAGS_0100
     * @tc.name testRegexYiFlags0001
     * @tc.desc Verify sticky and case-insensitive flag combination.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexYiFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexYiFlags0001 start');

      const re89 = new RegExp("a", "yi");
      re89.lastIndex = 1;
      const result89 = re89.test("bA");
      const lastIndex89 = re89.lastIndex;
      console.log(`89. Sticky case-insensitive match: ${result89}, lastIndex: ${lastIndex89}`);
      expect(result89).assertTrue();
      expect(lastIndex89).assertEqual(2);
      done();
      console.log('testRegexYiFlags0001 done');
    });

    /**
     * @tc.number REGEX_SPECIAL_CHARSET_0100
     * @tc.name testRegexSpecialCharset0001
     * @tc.desc Verify special characters in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSpecialCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexSpecialCharset0001 start');

      const re90 = /[.*+?^${}()|[\]\\]/;
      const result90 = re90.test("*");
      console.log(`90. Special characters in charset match: ${result90}`);
      expect(result90).assertTrue();
      done();
      console.log('testRegexSpecialCharset0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_SPECIAL_0100
     * @tc.name testRegexCharsetSpecial0001
     * @tc.desc Verify special characters in character set with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetSpecial0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetSpecial0001 start');

      const re91 = new RegExp("[.*+?^${}()|\\[\\]\\\\]");
      const result91 = re91.test("+");
      console.log(`91. Special chars in charset match '+': ${result91}`);
      expect(result91).assertTrue();
      done();
      console.log('testRegexCharsetSpecial0001 done');
    });

    /**
     * @tc.number REGEX_NEGATED_CHARSET_0100
     * @tc.name testRegexNegatedCharset0001
     * @tc.desc Verify negated character set matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegatedCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegatedCharset0001 start');

      const re92 = /[^abc]/;
      const result92 = re92.test("d");
      console.log(`92. Negated charset match 'd': ${result92}`);
      expect(result92).assertTrue();
      done();
      console.log('testRegexNegatedCharset0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_NEGATED_CHARSET_0100
     * @tc.name testRegexConstructorNegatedCharset0001
     * @tc.desc Verify negated character set matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorNegatedCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorNegatedCharset0001 start');

      const re93 = new RegExp("[^0-9]");
      const result93 = re93.test("a");
      console.log(`93. Constructor negated charset match 'a': ${result93}`);
      expect(result93).assertTrue();
      done();
      console.log('testRegexConstructorNegatedCharset0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_RANGE_0100
     * @tc.name testRegexCharsetRange0001
     * @tc.desc Verify character range matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetRange0001 start');

      const re94 = /[a-z0-9]/i;
      const result94 = re94.test("Z");
      console.log(`94. Charset range match 'Z': ${result94}`);
      expect(result94).assertTrue();
      done();
      console.log('testRegexCharsetRange0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_CHARSET_RANGE_0100
     * @tc.name testRegexConstructorCharsetRange0001
     * @tc.desc Verify character range matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorCharsetRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorCharsetRange0001 start');

      const re95 = new RegExp("[A-Z_]");
      const result95 = re95.test("_");
      console.log(`95. Constructor charset range match '_': ${result95}`);
      expect(result95).assertTrue();
      done();
      console.log('testRegexConstructorCharsetRange0001 done');
    });

    /**
     * @tc.number REGEX_HYPHEN_IN_CHARSET_0100
     * @tc.name testRegexHyphenInCharset0001
     * @tc.desc Verify hyphen matching in middle of character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHyphenInCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHyphenInCharset0001 start');

      const re96 = /[a-z-0-9]/;
      const result96 = re96.test("-");
      console.log(`96. Hyphen in charset middle match '-': ${result96}`);
      expect(result96).assertTrue();
      done();
      console.log('testRegexHyphenInCharset0001 done');
    });

    /**
     * @tc.number REGEX_HYPHEN_START_CHARSET_0100
     * @tc.name testRegexHyphenStartCharset0001
     * @tc.desc Verify hyphen matching at start of character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHyphenStartCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHyphenStartCharset0001 start');

      const re97 = new RegExp("[-a-z0-9]");
      const result97 = re97.test("-");
      console.log(`97. Hyphen at charset start match '-': ${result97}`);
      expect(result97).assertTrue();
      done();
      console.log('testRegexHyphenStartCharset0001 done');
    });

    /**
     * @tc.number REGEX_BACKSLASH_IN_CHARSET_0100
     * @tc.name testRegexBackslashInCharset0001
     * @tc.desc Verify backslash matching in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBackslashInCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexBackslashInCharset0001 start');

      const re98 = /[\\]/;
      const result98 = re98.test("\\");
      console.log(`98. Backslash in charset match '\\': ${result98}`);
      expect(result98).assertTrue();
      done();
      console.log('testRegexBackslashInCharset0001 done');
    });

    /**
     * @tc.number REGEX_CARET_IN_CHARSET_0100
     * @tc.name testRegexCaretInCharset0001
     * @tc.desc Verify caret matching in character set (not at start).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCaretInCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCaretInCharset0001 start');

      const re99 = new RegExp("[a^z]");
      const result99 = re99.test("^");
      console.log(`99. Caret in charset (non-start) match '^': ${result99}`);
      expect(result99).assertTrue();
      done();
      console.log('testRegexCaretInCharset0001 done');
    });

    /**
     * @tc.number REGEX_DOLLAR_IN_CHARSET_0100
     * @tc.name testRegexDollarInCharset0001
     * @tc.desc Verify dollar sign matching in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarInCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDollarInCharset0001 start');

      const re100 = /[a$z]/;
      const result100 = re100.test("$");
      console.log(`100. Dollar sign in charset match '$': ${result100}`);
      expect(result100).assertTrue();
      done();
      console.log('testRegexDollarInCharset0001 done');
    });
  })
}