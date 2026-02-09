/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { testRegSearchJs0053, testRegSearchJs0054, testRegSearchJs0055, testRegSearchJs0057,
  testRegSearchJs0058,
  testRegSearchJs0059,
  testRegSplitJs0074,
  testRegSplitJs0075,
  testRegSplitJs0076,
  testRegSplitJs0077,
  testRegSplitJs0079,
  testRegSplitJs0082,
  testRegSplitJs0083,
  testRegSplitJs0084,
  testRegSplitJs0085,
  testRegSplitJs0086,
  testRegSplitJs0087,
  testRegSplitJs0088} from './RegExp.test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTest004() {
  describe('RegExpTest004', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testRegSearch0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0001
     * @tc.desc   Use simple regex to find the first match and return the index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/b/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0002
     * @tc.desc   Use regex to search for a non-existing match, should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/z/);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0003
     * @tc.desc   Regex with global flag g should not affect search()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc abc";
      const result: number = str.search(/abc/g);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0004
     * @tc.desc   Regex with ignore case flag i
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "Hello";
      const result: number = str.search(/hello/i);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0005
     * @tc.desc   Regex with multiline flag m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const result: number = str.search(/^b/m);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testRegSearch0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0006
     * @tc.desc   Regex with Unicode flag u
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𠮷abc";
      const result: number = str.search(/\p{Script=Han}/u);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0007
     * @tc.desc   Regex with dotAll flag s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb";
      const result: number = str.search(/a.b/s);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0008
     * @tc.desc   Regex with multiple flags combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A\nb";
      const result: number = str.search(/a.b/imsu);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0009
     * @tc.desc   Regex with capturing group, search returns match start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/(b)(c)/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0010
     * @tc.desc   Regex with named capturing group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/(?<letters>[a-z]+)\d+/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0011
     * @tc.desc   Regex using positive lookahead (?=pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/a(?=b)/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0012
     * @tc.desc   Regex using negative lookahead (?!pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ax";
      const result: number = str.search(/a(?!b)/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0013
     * @tc.desc   Regex using positive lookbehind (?<=pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const result: number = str.search(/(?<=foo)bar/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0014
     * @tc.desc   Regex using negative lookbehind (?<!pattern)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const result: number = str.search(/(?<!baz)bar/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0015
     * @tc.desc   Regex using word boundary \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo bar";
      const result: number = str.search(/\bbar/);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0016
     * @tc.desc   Regex using non-word boundary \B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const result: number = str.search(/\Bbar/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0017
     * @tc.desc   Regex using ^ anchor (start of string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const result: number = str.search(/^h/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0018
     * @tc.desc   Regex using $ anchor (end of string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const result: number = str.search(/o$/);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0019
     * @tc.desc   Regex using + quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaabbb";
      const result: number = str.search(/a+/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0020
     * @tc.desc   Regex using * quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "bbbaaa";
      const result: number = str.search(/a*/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0021
     * @tc.desc   Regex using {n}, {n,}, {n,m} quantifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaabbb";
      const result: number = str.search(/a{2,3}/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0022
     * @tc.desc   Regex using character classes [abc], [^xyz]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "defabc";
      const result: number = str.search(/[abc]/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0023
     * @tc.desc   Regex using predefined character classes \d, \D, \w, \W, \s, \S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/\d/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0024
     * @tc.desc   Regex using Unicode property classes \p{L}, \p{N}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/\p{N}/u);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0025
     * @tc.desc   Regex matching Unicode combining characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "e\u0301"; // é as e + combining acute
      const result: number = str.search(/\u0301/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0026
     * @tc.desc   Regex matching Emoji / non-BMP characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😊abc";
      const result: number = str.search(/\p{Emoji}/u);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0027
     * @tc.desc   Using string as search() parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello world";
      const result: number = str.search("world");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   testRegSearch0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0028
     * @tc.desc   Using object with Symbol.search method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testRegSearch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const obj = {
    //     [Symbol.search](string: string): number {
    //       return string.indexOf("test");
    //     }
    //   };
    //   const str: string = "this is a test string";
    //   const result: number = str.search(obj as any);
    //   expect(result).assertEqual(10);
    // });

    /**
     * @tc.name   testRegSearch0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0029
     * @tc.desc   lastIndex of regex does not affect search()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /a/g;
      regex.lastIndex = 2;
      const str: string = "aabc";
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0030
     * @tc.desc   Reusing regex multiple times, prior lastIndex does not affect search()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = /b/g;
      const str1: string = "abc";
      const str2: string = "bcd";
      const result1: number = str1.search(regex);
      const result2: number = str2.search(regex);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0031
     * @tc.desc   Perform search() on an empty string with regex matching any content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "";
      const result: number = str.search(/./);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0032
     * @tc.desc   Perform search() on an empty string with zero-width match /^/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "";
      const result: number = str.search(/^/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0033
     * @tc.desc   Multiple adjacent matches, search() returns index of first match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaa";
      const result: number = str.search(/a/g);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0034
     * @tc.desc   Regex matches first occurrence in a long string (large data)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x".repeat(100000) + "y";
      const result: number = str.search(/y/);
      expect(result).assertEqual(100000);
    });

    /**
     * @tc.name   testRegSearch0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0035
     * @tc.desc   Multi-line text, verify m flag affects ^ and $ anchors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2";
      const result: number = str.search(/^line2/m);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   testRegSearch0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0036
     * @tc.desc   Multi-line text with \n, \r, \u2028, \u2029 for line matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\rc\u2028d\u2029e";
      const result: number = str.search(/c/);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0037
     * @tc.desc   Match whitespace characters including \t and \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\tb\rc";
      const result: number = str.search(/\s/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0038
     * @tc.desc   Match mixed Chinese, English, and number text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc中文123";
      const result: number = str.search(/\d/);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testRegSearch0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0039
     * @tc.desc   Match full-width characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ＡＢＣ";
      const result: number = str.search(/[Ａ-Ｚ]/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0040
     * @tc.desc   Match Emoji using Unicode mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc😊def";
      const result: number = str.search(/\p{Emoji}/u);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0041
     * @tc.desc   Regex with escaped characters like \., \d, \u1234
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc.1\u1234";
      const result: number = str.search(/\./);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0042
     * @tc.desc   Regex with invalid escape sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(new RegExp("\\x")); // invalid escape
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0043
     * @tc.desc   Regex with nested capture groups (a(b(c)))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/(a(b(c)))/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0044
     * @tc.desc   Regex using backreference \1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aabb";
      const result: number = str.search(/(a)\1/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0045
     * @tc.desc   Regex containing replacement symbols $ and \n does not affect search()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc$def\nghi";
      const result: number = str.search(/def/);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0046
     * @tc.desc   Using dynamically constructed regex new RegExp("abc")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "123abc456";
      const regex: RegExp = new RegExp("abc");
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0047
     * @tc.desc   Consistency between literal regex and RegExp constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const literal: number = str.search(/a/);
      const constructed: number = str.search(new RegExp("a"));
      expect(literal).assertEqual(constructed);
    });

    /**
     * @tc.name   testRegSearch0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0048
     * @tc.desc   search() with undefined argument implicitly converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "undefined";
      const param: string = String(undefined);
      const result: number = str.search(param);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0049
     * @tc.desc   search() with null argument converted to string "null"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "null value";
      const result: number = str.search(String(null));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0050
     * @tc.desc   search() with number argument converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "12345";
      const num: string = String(3);
      const result: number = str.search(num);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testRegSearch0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0051
     * @tc.desc   search() with boolean argument converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "truefalse";
      const resultTrue: number = str.search(String(true));
      const resultFalse: number = str.search(String(false));
      expect(resultTrue).assertEqual(0);
      expect(resultFalse).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0052
     * @tc.desc   search() with array argument converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1,2,3";
      const arr: string = [1,2,3].toString();
      const result: number = str.search(arr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0053
     * @tc.desc   search() with object argument calls toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0053()).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0054
     * @tc.desc   Object with custom toString() returning specific pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0054()).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0055
     * @tc.desc   Object with custom Symbol.search() method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0055()).assertEqual(42);
    });

    /**
     * @tc.name   testRegSearch0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0057
     * @tc.desc   RegExp object frozen with Object.freeze()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0057()).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0058
     * @tc.desc   RegExp object wrapped in Proxy, exec intercepted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0058()).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0059
     * @tc.desc   RegExp exec() method overridden, search() uses it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSearchJs0059()).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0060
     * @tc.desc   Search on read-only string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/b/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0061
     * @tc.desc   search() matches the entire string (^.*$)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello world";
      const result: number = str.search(/^.*$/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0062
     * @tc.desc   search() returns -1 when no match is found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/xyz/);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0063
     * @tc.desc   search() with zero-width regex (?:) matches at position 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/(?:)/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0064
     * @tc.desc   search() with positive lookahead (?=a) matches correct position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/(?=a)/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0065
     * @tc.desc   search() with negative lookahead (?!a) matches correct position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/(?!a)/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0066
     * @tc.desc   search() ignores global flag g, returns first match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abcabc";
      const result: number = str.search(/a/g);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0067
     * @tc.desc   search() ignores sticky flag y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abcabc";
      const result: number = str.search(/a/y);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0068
     * @tc.desc   search() with Unicode flag u matches boundary character 𠮷
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𠮷";
      const result: number = str.search(/\uD842\uDFB7/u);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0069
     * @tc.desc   search() with dotAll flag s matches across multiple lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2";
      const result: number = str.search(/line1.line2/s);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0070
     * @tc.desc   search() with combined flags gimsu behaves as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/ABC/gius);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0071
     * @tc.desc   Regex with character set [^\w\s] matches special symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a@b#c";
      const result: number = str.search(/[^\w\s]/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0072
     * @tc.desc   Regex with quantifiers {n,m} verifies match position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaaaa";
      const result: number = str.search(/a{3,4}/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0073
     * @tc.desc   Lazy quantifiers *? and +? first match location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaaa";
      const result: number = str.search(/a+?/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0074
     * @tc.desc   Positive lookbehind (?<=abc) match position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: number = str.search(/(?<=abc)1/);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testRegSearch0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0075
     * @tc.desc   Negative lookbehind (?<!abc) match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1";
      const result: number = str.search(/(?<!abc)x/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0076
     * @tc.desc   Match surrogate pair emoji like 😀
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀test";
      const result: number = str.search(/\uD83D\uDE00/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0077
     * @tc.desc   Match text with combining character (é)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "e\u0301"; // e + combining acute
      const result: number = str.search(/e\u0301/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0078
     * @tc.desc   Match text containing mixed scripts (Latin, Chinese, Arabic)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc汉字١٢٣";
      const result: number = str.search(/\d/);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0079
     * @tc.desc   Match text containing escaped backslash \\
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\\b";
      const result: number = str.search(/\\/);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0080
     * @tc.desc   Match text with \uXXXX Unicode escape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u0041B";
      const result: number = str.search(/\u0041/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSearch0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0081
     * @tc.desc   Match text with newline and space mixture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1 \n line2";
      const result: number = str.search(/\s/);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testRegSearch0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0082
     * @tc.desc   Multi-line regex ^ and $ behavior across lines
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc\ndef";
      const result: number = str.search(/^def/m);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testRegSearch0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0083
     * @tc.desc   Internal exception thrown during search() propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(/[/]/);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSearch0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0086
     * @tc.desc   search() does not reset regex lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /a/g;
      regex.lastIndex = 2;
      const str: string = "aaa";
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
      expect(regex.lastIndex).assertEqual(2);
    });

    /**
     * @tc.name   testRegSearch0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0087
     * @tc.desc   search() with regex lastIndex non-zero still works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /b/g;
      regex.lastIndex = 5;
      const str: string = "abc";
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0088
     * @tc.desc   search() leaves regex object state unchanged (pure function)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /a/g;
      const str: string = "abc";
      const lastIndexBefore: number = regex.lastIndex;
      str.search(regex);
      expect(regex.lastIndex).assertEqual(lastIndexBefore);
    });

    /**
     * @tc.name   testRegSearch0089
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0089
     * @tc.desc   Performance extreme: long string > 10^6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a".repeat(1_000_001) + "b";
      const result: number = str.search(/b/);
      expect(result).assertEqual(1_000_001);
    });

    /**
     * @tc.name   testRegSearch0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0090
     * @tc.desc   Performance extreme: complex nested regex >10 levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp = /((((((((((a))))))))))/;
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testRegSplit0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0001
     * @tc.desc   Split string by simple whitespace regular expression / /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b c";
      const result: string[] = str.split(/ /);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0002
     * @tc.desc   Split string by digits using regular expression /\d/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2c3";
      const result: string[] = str.split(/\d/);
      expect(result).assertDeepEquals(["a", "b", "c", ""]);
    });

    /**
     * @tc.name   testRegSplit0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0003
     * @tc.desc   Split string using regex with global flag /a/g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "banana".split(/a/g);
      expect(result).assertDeepEquals(["b", "n", "n", ""]);
    });

    /**
     * @tc.name   testRegSplit0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0004
     * @tc.desc   Split string using regex with ignore case flag /a/i
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "AaAa".split(/a/i);
      expect(result).assertDeepEquals(["", "", "", "", ""]);
    });

    /**
     * @tc.name   testRegSplit0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0005
     * @tc.desc   Split string using regex with multiline flag /^/m
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const result = str.split(/^/m);
      expect(result).assertDeepEquals(["line1\n", "line2"]);
    });

    /**
     * @tc.name   testRegSplit0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0006
     * @tc.desc   Split string using Unicode flag regex /\p{L}/u to match letters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1B2";
      const result = str.split(/\p{L}/u);
      expect(result).assertDeepEquals(["", "1", "2"]);
    });

    /**
     * @tc.name   testRegSplit0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0007
     * @tc.desc   Split string using dotAll regex /./s as delimiter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb";
      const result = str.split(/./s);
      expect(result).assertDeepEquals(["", "", "", ""]);
    });

    /**
     * @tc.name   testRegSplit0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0008
     * @tc.desc   Split string using combined flags /a/gi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "AaaAA".split(/a/gi);
      expect(result).assertDeepEquals(["", "", "", "", "", ""]);
    });

    /**
     * @tc.name   testRegSplit0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0009
     * @tc.desc   Split string with capturing group (,) includes separator in result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a,b,c".split(/(,)/);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.name   testRegSplit0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0010
     * @tc.desc   Split string using named capturing group (?<x>,)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a,b,c".split(/(?<x>,)/);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.name   testRegSplit0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0011
     * @tc.desc   Split using positive lookahead (?=a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "baac".split(/(?=a)/);
      expect(result).assertDeepEquals(["b", "a", "ac"]);
    });

    /**
     * @tc.name   testRegSplit0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0012
     * @tc.desc   Split using negative lookahead (?!a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/(?!a)/);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0013
     * @tc.desc   Split using positive lookbehind (?<=a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a-b-c".split(/(?<=a)/);
      expect(result[0]).assertEqual("a");
    });

    /**
     * @tc.name   testRegSplit0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0014
     * @tc.desc   Split using negative lookbehind (?<!a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/(?<!a)/);
      expect(result).assertDeepEquals(["ab", "c"]);
    });

    /**
     * @tc.name   testRegSplit0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0015
     * @tc.desc   Split using word boundary \b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "foo bar".split(/\b/);
      expect(result.includes(" ")).assertTrue();
    });

    /**
     * @tc.name   testRegSplit0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0016
     * @tc.desc   Split using non-word boundary \B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "foo".split(/\B/);
      expect(result).assertDeepEquals( ["f", "o", "o"]);
    });

    /**
     * @tc.name   testRegSplit0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0017
     * @tc.desc   Split using start anchor ^ as delimiter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/^/);
      expect(result[0]).assertEqual("abc");
    });

    /**
     * @tc.name   testRegSplit0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0019
     * @tc.desc   Split using quantifier + such as /a+/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "baaaac".split(/a+/);
      expect(result).assertDeepEquals(["b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0020
     * @tc.desc   Split using quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "baac".split(/a*/);
      expect(result.includes("b")).assertTrue();
    });

    /**
     * @tc.name   testRegSplit0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0021
     * @tc.desc   Split using quantifier {n,m} such as /a{1,2}/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "baaac".split(/a{1,2}/);
      expect(result).assertDeepEquals(["b", "", "c"]);
    });

    /**
     * @tc.name   testRegSplit0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0022
     * @tc.desc   Split using character class /[abc]/ or /[^xyz]/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abcxyz".split(/[abc]/);
      expect(result).assertDeepEquals(["", "", "", "xyz"]);
    });

    /**
     * @tc.name   testRegSplit0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0023
     * @tc.desc   Split using predefined classes \d, \D, \w, \W, \s, \S
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a1 b2".split(/\d/);
      expect(result).assertDeepEquals(["a", " b", ""]);
    });

    /**
     * @tc.name   testRegSplit0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0024
     * @tc.desc   Split using Unicode property class \p{N} or \p{L}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1B2";
      const result = str.split(/\p{N}/u);
      expect(result).assertDeepEquals(["A", "B", ""]);
    });

    /**
     * @tc.name   testRegSplit0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0025
     * @tc.desc   Split string containing accented letters using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "école";
      const result = str.split(/é/);
      expect(result).assertDeepEquals( ["", "cole"]);
    });

    /**
     * @tc.name   testRegSplit0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0026
     * @tc.desc   Split string containing Emoji characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "hi😀bye".split(/\p{Emoji}/u);
      expect(result).assertDeepEquals(["hi", "bye"]);
    });

    /**
     * @tc.name   testRegSplit0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0027
     * @tc.desc   Split using empty non-capturing regex /(?:)/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/(?:)/);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0028
     * @tc.desc   Split using zero-width regex empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split("");
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0029
     * @tc.desc   Split using mixed empty and captured regex /(,?)/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a,b".split(/(,?)/);
      expect(result).assertDeepEquals( ["a", ",", "b"]);
    });

    /**
     * @tc.name   testRegSplit0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0030
     * @tc.desc   Split using reusable RegExp object across multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = /,/g;
      const str1 = "a,b,c";
      const str2 = "1,2,3";
      const result1 = str1.split(reg);
      const result2 = str2.split(reg);
      expect(result1).assertDeepEquals(["a", "b", "c"]);
      expect(result2).assertDeepEquals(["1", "2", "3"]);
    });

    /**
     * @tc.name   testRegSplit0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0031
     * @tc.desc   Split using /(\d+)/ and verify captured digits are inserted into result array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.split(/(\d+)/);
      expect(result).assertDeepEquals(["a", "1", "b", "2", "c", "3", ""]);
    });

    /**
     * @tc.name   testRegSplit0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0032
     * @tc.desc   Split using /(\D+)/ and verify non-digit captures are inserted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12ab34";
      const result = str.split(/(\D+)/);
      expect(result).assertDeepEquals(["12", "ab", "34"]);
    });

    /**
     * @tc.name   testRegSplit0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0033
     * @tc.desc   Split using /(\d)(\w)/ and verify multi-group insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "1a2b".split(/(\d)(\w)/);
      expect(result).assertDeepEquals(["", "1", "a", "", "2", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0034
     * @tc.desc   Split using nested groups /((ab)c)/ to verify nested capturing structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/((ab)c)/);
      expect(result).assertDeepEquals(["", "abc", "ab", ""]);
    });

    /**
     * @tc.name   testRegSplit0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0035
     * @tc.desc   Split using empty groups /()()/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "x".split(/()()/);
      expect(result).assertDeepEquals(["x"]);
    });

    /**
     * @tc.name   testRegSplit0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0036
     * @tc.desc   Split using named groups /((?<first>\w)(?<second>\d))/ and verify capture order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const result = str.split(/((?<first>\w)(?<second>\d))/);
      expect(result).assertDeepEquals(["", "a1", "a", "1", "", "b2", "b", "2", ""]);
    });

    /**
     * @tc.name   testRegSplit0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0037
     * @tc.desc   Verify global flag /g does not affect captured group insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const result = str.split(/(\d)/g);
      expect(result.includes("1")).assertTrue();
    });

    /**
     * @tc.name   testRegSplit0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0038
     * @tc.desc   Split using zero-width lookahead /((?=a))/ verify position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "baac".split(/((?=a))/);
      expect(result).assertDeepEquals(["b", "", "a", "", "ac"]);
    });

    /**
     * @tc.name   testRegSplit0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0040
     * @tc.desc   Split using complex lookahead (?!b)(?=a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "aba".split(/((?!b)(?=a))/);
      expect(result).assertDeepEquals(["ab", "", "a"]);
    });

    /**
     * @tc.name   testRegSplit0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0042
     * @tc.desc   Split with whitespace regex /\s+/ to collapse multiple spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a   b  c".split(/\s+/);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0043
     * @tc.desc   Split with should produce max splits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a b".split(/\s*/);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.name   testRegSplit0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0044
     * @tc.desc   Split using /()/ matches empty string, should split between every char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/()/);
      expect(result).assertDeepEquals(["a", "", "b", "", "c"]);
    });

    /**
     * @tc.name   testRegSplit0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0045
     * @tc.desc   Split using /^.*$/ matches whole string, result should be empty or ["",""]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/^.*$/);
      expect(result).assertDeepEquals(["", ""]);
    });

    /**
     * @tc.name   testRegSplit0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0046
     * @tc.desc   Split using /^/ should produce leading empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(/^/);
      expect(result[0]).assertEqual("abc");
    });

    /**
     * @tc.name   testRegSplit0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0048
     * @tc.desc   Split test greedy quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abbbbc".split(/ab*/);
      expect(result).assertDeepEquals(["", "c"]);
    });

    /**
     * @tc.name   testRegSplit0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0049
     * @tc.desc   Split using /ab*?/ to test lazy quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abbbc".split(/ab*?/);
      expect(result).assertDeepEquals(["", "bbbc"]);
    });

    /**
     * @tc.name   testRegSplit0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0050
     * @tc.desc   Split using branching pattern /a|b|c/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abcabc".split(/a|b|c/);
      expect(result).assertDeepEquals(["", "", "", "", "", "", ""]);
    });

    /**
     * @tc.name   testRegSplit0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0051
     * @tc.desc   Split using nested alternation /(a|b(c|d))/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abcd".split(/(a|b(c|d))/);
      expect(result).assertDeepEquals(["", "a", undefined, "", "bc", "c", "d"]);
    });

    /**
     * @tc.name   testRegSplit0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0052
     * @tc.desc   Split using backreference /(\w)\1/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "aabbcc".split(/(\w)\1/);
      expect(result).assertDeepEquals(["", "a", "", "b", "", "c", ""]);
    });

    /**
     * @tc.name   testRegSplit0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0053
     * @tc.desc   Split using named backreference (?<name>.)\k<name>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "aabb".split(/(?<x>.)\k<x>/);
      expect(result).assertDeepEquals(["", "a", "", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0054
     * @tc.desc   Split regex contains escaped slash \/ such as /\//
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a/b/c".split(/\//);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0055
     * @tc.desc   Split using special char regex /\./ matches dot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "a.b.c".split(/\./);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0056
     * @tc.desc   Split using regex /[\^$*+?.()|[\]{}]/ matching all metacharacters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "^a+b?".split(/[\^$*+?.()|[\]{}]/);
      expect(result).assertDeepEquals(["", "a", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0057
     * @tc.desc   Split using newline regex /\n/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const result = str.split(/\n/);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.name   testRegSplit0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0058
     * @tc.desc   Split using carriage return /\r/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\rb";
      const result = str.split(/\r/);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.name   testRegSplit0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0059
     * @tc.desc   Split using Unicode line separator \u2028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\u2028b";
      const result = str.split(/\u2028/);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.name   testRegSplit0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0060
     * @tc.desc   Split using CRLF combination /\r\n/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\r\nline2";
      const result = str.split(/\r\n/);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.name   testRegSplit0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0065
     * @tc.desc   Split string by non-BMP Unicode character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A𠮷B𠮷C";
      const result: string[] = str.split(/𠮷/u);
      expect(result).assertDeepEquals(["A", "B", "C"]);
    });

    /**
     * @tc.name   testRegSplit0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0066
     * @tc.desc   Split mixed script text by Unicode letter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A汉BعC";
      const result: string[] = str.split(/\p{L}/u);
      expect(result).assertDeepEquals(["", "", "", "", "", ""]);
    });

    /**
     * @tc.name   testRegSplit0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0067
     * @tc.desc   Split string using Unicode code point with braces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello😀world";
      const result: string[] = str.split(/\u{1F600}/u);
      expect(result).assertDeepEquals(["hello", "world"]);
    });

    /**
     * @tc.name   testRegSplit0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0068
     * @tc.desc   Split string by literal backslash n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\\nline2";
      const result: string[] = str.split(/\\n/);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.name   testRegSplit0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0069
     * @tc.desc   Split string by tab character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "col1\tcol2\tcol3";
      const result: string[] = str.split(/\t/);
      expect(result).assertDeepEquals(["col1", "col2", "col3"]);
    });

    /**
     * @tc.name   testRegSplit0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0070
     * @tc.desc   Split string by whitespace and newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b\nc\rd";
      const result: string[] = str.split(/\s+/);
      expect(result).assertDeepEquals(["a", "b", "c", "d"]);
    });

    /**
     * @tc.name   testRegSplit0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0071
     * @tc.desc   Split string by complex lookahead and lookbehind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abXcd";
      const result: string[] = str.split(/(?<=b)(?=X)/);
      expect(result).assertDeepEquals(["ab", "Xcd"]);
    });

    /**
     * @tc.name   testRegSplit0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0072
     * @tc.desc   Split string using dynamic RegExp construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: string = "\\d+";
      const str: string = "a1b22c333";
      const result: string[] = str.split(new RegExp(pattern, "g"));
      expect(result).assertDeepEquals(["a", "b", "c", ""]);
    });

    /**
     * @tc.name   testRegSplit0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0073
     * @tc.desc   Split string using template-based RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: string = ",";
      const str: string = "a,b,c";
      const result: string[] = str.split(new RegExp(pattern));
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0074
     * @tc.desc   Split string with frozen RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0074()).assertDeepEquals(["", "1", "2", "3"]);
    });

    /**
     * @tc.name   testRegSplit0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0075
     * @tc.desc   Split string using Proxy-wrapped RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0075()).assertDeepEquals(["", "1", "2", "3"]);
    });

    /**
     * @tc.name   testRegSplit0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0076
     * @tc.desc   Split string with custom exec method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0076()).assertDeepEquals(["","1","2"]);
    });

    /**
     * @tc.name   testRegSplit0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0077
     * @tc.desc   Split string using custom Symbol.split
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0077()).assertDeepEquals(["fixed"]);
    });

    /**
     * @tc.name   testRegSplit0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0079
     * @tc.desc   Split string with Symbol.split returning non-array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0079()).assertEqual("abc");
    });

    /**
     * @tc.name   testRegSplit0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0082
     * @tc.desc   Split string with undefined converted to /undefined/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0082()).assertDeepEquals(["abc", "xyz"]);
    });

    /**
     * @tc.name   testRegSplit0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0083
     * @tc.desc   Split string with null converted to string 'null'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0083()).assertDeepEquals(["abc", "xyz"]);
    });

    /**
     * @tc.name   testRegSplit0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0084
     * @tc.desc   Split string with number converted to string regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0084()).assertDeepEquals(["abc", "xyz"]);
    });

    /**
     * @tc.name   testRegSplit0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0085
     * @tc.desc   Split string with boolean true converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0085()).assertDeepEquals(["abc", "xyz"]);
    });

    /**
     * @tc.name   testRegSplit0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0086
     * @tc.desc   Split string with array converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0086()).assertDeepEquals(["", ",ab"]);
    });

    /**
     * @tc.name   testRegSplit0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0087
     * @tc.desc   Split string with object calling toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0087()).assertDeepEquals(["abc", "YZdef"]);
    });

    /**
     * @tc.name   testRegSplit0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0088
     * @tc.desc   Split string using object with Symbol.split
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testRegSplitJs0088()).assertDeepEquals(["split"]);
    });

    /**
     * @tc.name   testRegSplit0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0090
     * @tc.desc   Split extremely large input string correctly and efficiently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a".repeat(1000000) + "b";
      const result: string[] = str.split(/b/);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual("");
    });

    /**
     * @tc.name   testRegSplit0091
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0091
     * @tc.desc   Split using simple regex without capturing group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b c";
      const result: string[] = str.split(/\s+/);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.name   testRegSplit0092
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0092
     * @tc.desc   Split using regex with a single capturing group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a,b,c";
      const result: string[] = str.split(/(,)/);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.name   testRegSplit0093
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0093
     * @tc.desc   Split using regex with multiple capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "123a456b";
      const result: string[] = str.split(/(\d+)([a-z]+)/);
      expect(result).assertDeepEquals( ["", "123", "a", "", "456", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0094
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0094
     * @tc.desc   Split using regex with empty capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const result: string[] = str.split(/()()/);
      expect(result).assertDeepEquals(["a", "", "", "b"]);
    });

    /**
     * @tc.name   testRegSplit0095
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0095
     * @tc.desc   Split using nested capturing groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const result: string[] = str.split(/((a)(b))/);
      expect(result).assertDeepEquals(["", "ab", "a", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0096
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0096
     * @tc.desc   Split using regex with optional capturing group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1-2-3";
      const result: string[] = str.split(/(\d+)?-/);
      expect(result).assertDeepEquals(["", "1", "", "2", "3"]);
    });

    /**
     * @tc.name   testRegSplit0097
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0097
     * @tc.desc   Split using single named capturing group, verify behavior is consistent with normal capturing group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const result: string[] = str.split(/(?<letter>[A-Z])/);
      expect(result).assertDeepEquals(["a1b2"]);
    });

    /**
     * @tc.name   testRegSplit0098
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0098
     * @tc.desc   Split using named and anonymous capturing groups together, verify insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const result: string[] = str.split(/(?<letter>[A-Z])(\d)/);
      expect(result).assertDeepEquals(["", "A", "1", "", "B", "2", ""]);
    });

    /**
     * @tc.name   testRegSplit0099
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0099
     * @tc.desc   Split using named capturing group that does not match, verify undefined insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo";
      const result: string[] = str.split(/foo(?<bar>z)?/);
      expect(result).assertDeepEquals(["", undefined, ""]);
    });

    /**
     * @tc.name   testRegSplit0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0100
     * @tc.desc   Split using multiple nested named capturing groups, verify nested insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const result: string[] = str.split(/((?<a>\d)(?<b>[a-z]))/);
      expect(result).assertDeepEquals(["", "1a", "1", "a", "", "2b", "2", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0101
     * @tc.desc   Split using named capturing group combined with optional group, verify undefined insertion for partial matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "X-1-Y-2";
      const result: string[] = str.split(/(?<letter>[A-Z])?-(\d)/);
      expect(result).assertDeepEquals(["", "X", "1", "-", "Y", "2", ""]);
    });

    /**
     * @tc.name   testRegSplit0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0102
     * @tc.desc   Split using lookahead (?=\\d), verify cut positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const result: string[] = str.split(/(?=\d)/);
      expect(result).assertDeepEquals(["a", "1b", "2"]);
    });

    /**
     * @tc.name   testRegSplit0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0103
     * @tc.desc   Split using lookbehind (?<=\\d), verify cut positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1A2B";
      const result: string[] = str.split(/(?<=\d)/);
      expect(result).assertDeepEquals(["1", "A2", "B"]);
    });

    /**
     * @tc.name   testRegSplit0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0104
     * @tc.desc   Split using lookahead + lookbehind combination, verify cut positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/(?<=a)(?=1)/);
      expect(result).assertDeepEquals(["a", "1b"]);
    });

    /**
     * @tc.name   testRegSplit0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0105
     * @tc.desc   Split using zero-width assertion with capturing group, verify empty string insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/((?=1))/);
      expect(result).assertDeepEquals(["a", "", "1b"]);
    });

    /**
     * @tc.name   testRegSplit0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0106
     * @tc.desc   Split using zero-width assertion with named capturing group, verify empty capture insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/(?<num>(?=1))/);
      expect(result).assertDeepEquals(["a", "", "1b"]);
    });

    /**
     * @tc.name   testRegSplit0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0107
     * @tc.desc   Split using negative lookahead (?!b), verify string remains intact when not matched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1c";
      const result: string[] = str.split(/(?!b)/);
      expect(result).assertDeepEquals(["a", "1", "c"]);
    });

    /**
     * @tc.name   testRegSplit0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0108
     * @tc.desc   Split using negative lookbehind (?<!a), verify string remains intact when not matched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "b1c";
      const result: string[] = str.split(/(?<!a)/);
      expect(result).assertDeepEquals(["b", "1", "c"]);
    });

    /**
     * @tc.name   testRegSplit0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0109
     * @tc.desc   Split using capturing group + lookahead, verify capture and assertion synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const result: string[] = str.split(/(\d)(?=b)/);
      expect(result).assertDeepEquals(["a", "1", "b2"]);
    });

    /**
     * @tc.name   testRegSplit0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0110
     * @tc.desc   Split using capturing group + lookbehind, verify capture inserted correctly after match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const result: string[] = str.split(/(?<=\d)([a-z])/);
      expect(result).assertDeepEquals( ["1", "a", "2", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0111
     * @tc.desc   Split using named capturing group + zero-width assertion, verify combined result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const result: string[] = str.split(/(?<letter>[A-Z])(?=\d)/);
      expect(result).assertDeepEquals(["", "A", "1", "B", "2"]);
    });

    /**
     * @tc.name   testRegSplit0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0112
     * @tc.desc   Split using capturing group + quantifier, partial matches may insert undefined or empty strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab1c2";
      const result: string[] = str.split(/(a)?b/);
      expect(result).assertDeepEquals(["", "a", "1c2"]);
    });

    /**
     * @tc.name   testRegSplit0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0113
     * @tc.desc   Split using zero-width assertion + optional group, verify empty matches insert array positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1y";
      const result: string[] = str.split(/(?=(\d)?)/);
      expect(result).assertDeepEquals(["x", "1", "1", undefined, "y"]);
    });

    /**
     * @tc.name   testRegSplit0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0114
     * @tc.desc   Split with regex matching start of string (^), verify cut at beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string[] = str.split(/^/);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.name   testRegSplit0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0117
     * @tc.desc   Split using capturing group + anchor combination, verify correct split positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string[] = str.split(/(^a)|(c$)/);
      expect(result).assertDeepEquals(["", "a", undefined, "b", undefined, "c", ""]);
    });

    /**
     * @tc.name   testRegSplit0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0118
     * @tc.desc   Split using multi-level nested capturing groups + zero-width assertion, verify deep capture and zero-width insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const result: string[] = str.split(/(((\d))(?=b))/);
      expect(result).assertDeepEquals(["a", "1", "1", "1", "b2"]);
    });

    /**
     * @tc.name   testRegSplit0119
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0119
     * @tc.desc   Split using optional group + lookahead assertion, verify array insertion for partial matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B";
      const result: string[] = str.split(/([A-Z])?(?=\d)/);
      expect(result).assertDeepEquals(["", "A", "1B"]);
    });

    /**
     * @tc.name   testRegSplit0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0120
     * @tc.desc   Split using capturing group + Unicode extended characters (emoji), verify correct matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀👍🏽🎉";
      const result: string[] = str.split(/([\u{1F600}-\u{1F64F}])/u);
      expect(result).assertDeepEquals(["", "😀", "👍🏽🎉"]);
    });

    /**
     * @tc.name   testRegSplit0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0121
     * @tc.desc   Split using lookahead with capturing group, verify capture insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/(\d)(?=b)/);
      expect(result).assertDeepEquals(["a", "1", "b"]);
    });

    /**
     * @tc.name   testRegSplit0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0122
     * @tc.desc   Split using lookbehind with capturing group, verify capture insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const result: string[] = str.split(/(?<=\d)([a-z])/);
      expect(result).assertDeepEquals(["1", "a", "2", "b", ""]);
    });

    /**
     * @tc.name   testRegSplit0123
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0123
     * @tc.desc   Split using consecutive zero-width assertions, verify no infinite loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const result: string[] = str.split(/(?=)/);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.name   testRegSplit0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0124
     * @tc.desc   Split with multi-level nested capturing groups + zero-width assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/((\d)(?=b))/);
      expect(result).assertDeepEquals(["a", "1", "1", "b"]);
    });

    /**
     * @tc.name   testRegSplit0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0125
     * @tc.desc   Split using multiple empty capturing groups, verify undefined insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const result: string[] = str.split(/(()())/);
      expect(result).assertDeepEquals( ["a", "", "", "", "b"]);
    });

    /**
     * @tc.name   testRegSplit0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0126
     * @tc.desc   Split using optional capturing group that does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo";
      const result: string[] = str.split(/(bar)?/);
      expect(result).assertDeepEquals(["f", undefined, "o", undefined, "o"]);
    });

    /**
     * @tc.name   testRegSplit0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0127
     * @tc.desc   Split using capturing group + optional group + zero-width assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const result: string[] = str.split(/(\d)?(?=b)/);
      expect(result).assertDeepEquals(["a", "1", "b"]);
    });

    /**
     * @tc.name   testRegSplit0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0128
     * @tc.desc   Split with zero-width assertion at start of string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string[] = str.split(/^/);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.name   testRegSplit0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0130
     * @tc.desc   Split with zero-width assertion + Unicode character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a😀b";
      const result: string[] = str.split(/(?=\p{Emoji})/u);
      expect(result).assertDeepEquals(["a", "😀b"]);
    });

    /**
     * @tc.name   testRegSplit0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0131
     * @tc.desc   Split using zero-width assertion + multiline mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const result: string[] = str.split(/^/gm);
      expect(result).assertDeepEquals(["a\n","b\n","c"]);
    });

    /**
     * @tc.name   testRegSplit0132
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0132
     * @tc.desc   Split using capturing group + optional quantifier ?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const result: string[] = str.split(/(a)?b/);
      expect(result).assertDeepEquals(["", "a", ""]);
    });

    /**
     * @tc.name   testRegSplit0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0133
     * @tc.desc   Split using capturing group + zero-width + quantifier *
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const result: string[] = str.split(/(a*)/);
      expect(result).assertDeepEquals(["", "aaa", "b"]);
    });

    /**
     * @tc.name   testRegSplit0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0134
     * @tc.desc   Split using negative lookahead, verify string remains when not matched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string[] = str.split(/(?!x)/);
      expect(result).assertDeepEquals( ["a", "b", "c"]);
    });

  });
}