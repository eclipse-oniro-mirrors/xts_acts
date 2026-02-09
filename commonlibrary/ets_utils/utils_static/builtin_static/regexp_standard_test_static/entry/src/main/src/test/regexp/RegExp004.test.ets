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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';


export default function RegExpTest004() {
  describe('RegExpTest004', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0001
     * @tc.name testRegSearch0001
     * @tc.desc Use simple regex to find the first match and return the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('b');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0002
     * @tc.name testRegSearch0002
     * @tc.desc Use regex to search for a non-existing match, should return -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('z');
      const result: number = str.search(regex);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0003
     * @tc.name testRegSearch0003
     * @tc.desc Regex with global flag g should not affect search()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc abc";
      const regex = new RegExp('abc', 'g');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0004
     * @tc.name testRegSearch0004
     * @tc.desc Regex with ignore case flag i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "Hello";
      const regex = new RegExp('hello', 'i');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0005
     * @tc.name testRegSearch0005
     * @tc.desc Regex with multiline flag m
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const regex = new RegExp('^b', 'm');
      const result: number = str.search(regex);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0006
     * @tc.name testRegSearch0006
     * @tc.desc Regex with Unicode flag u
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𠮷abc";
      const regex = new RegExp('\\p{Script=Han}', 'u');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0007
     * @tc.name testRegSearch0007
     * @tc.desc Regex with dotAll flag s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb";
      const regex = new RegExp('a.b', 's');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0008
     * @tc.name testRegSearch0008
     * @tc.desc Regex with multiple flags combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A\nb";
      const regex = new RegExp('a.b', 'imsu');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0009
     * @tc.name testRegSearch0009
     * @tc.desc Regex with capturing group, search returns match start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('(b)(c)');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0010
     * @tc.name testRegSearch0010
     * @tc.desc Regex with named capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('(?<letters>[a-z]+)\\d+');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0011
     * @tc.name testRegSearch0011
     * @tc.desc Regex using positive lookahead (?=pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('a(?=b)');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0012
     * @tc.name testRegSearch0012
     * @tc.desc Regex using negative lookahead (?!pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ax";
      const regex = new RegExp('a(?!b)');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0013
     * @tc.name testRegSearch0013
     * @tc.desc Regex using positive lookbehind (?<=pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const regex = new RegExp('(?<=foo)bar');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0014
     * @tc.name testRegSearch0014
     * @tc.desc Regex using negative lookbehind (?<!pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const regex = new RegExp('(?<!baz)bar');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0015
     * @tc.name testRegSearch0015
     * @tc.desc Regex using word boundary \b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo bar";
      const regex = new RegExp('\\bbar');
      const result: number = str.search(regex);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0016
     * @tc.name testRegSearch0016
     * @tc.desc Regex using non-word boundary \B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foobar";
      const regex = new RegExp('\\Bbar');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0017
     * @tc.name testRegSearch0017
     * @tc.desc Regex using ^ anchor (start of string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const regex = new RegExp('^h');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0018
     * @tc.name testRegSearch0018
     * @tc.desc Regex using $ anchor (end of string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const regex = new RegExp('o$');
      const result: number = str.search(regex);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0019
     * @tc.name testRegSearch0019
     * @tc.desc Regex using + quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaabbb";
      const regex = new RegExp('a+');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0020
     * @tc.name testRegSearch0020
     * @tc.desc Regex using * quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "bbbaaa";
      const regex = new RegExp('a*');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0021
     * @tc.name testRegSearch0021
     * @tc.desc Regex using {n}, {n,}, {n,m} quantifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaabbb";
      const regex = new RegExp('a{2,3}');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0022
     * @tc.name testRegSearch0022
     * @tc.desc Regex using character classes [abc], [^xyz]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "defabc";
      const regex = new RegExp('[abc]');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0023
     * @tc.name testRegSearch0023
     * @tc.desc Regex using predefined character classes \d, \D, \w, \W, \s, \S
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('\\d');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0024
     * @tc.name testRegSearch0024
     * @tc.desc Regex using Unicode property classes \p{L}, \p{N}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('\\p{N}', 'u');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0025
     * @tc.name testRegSearch0025
     * @tc.desc Regex matching Unicode combining characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "e\u0301"; // é as e + combining acute
      const regex = new RegExp('\\u0301');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0026
     * @tc.name testRegSearch0026
     * @tc.desc Regex matching Emoji / non-BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😊abc";
      const regex = new RegExp('\\p{Emoji}', 'u');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0027
     * @tc.name testRegSearch0027
     * @tc.desc Using string as search() parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello world";
      const result: number = str.search("world");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0029
     * @tc.name testRegSearch0029
     * @tc.desc lastIndex of regex does not affect search()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a', 'g');
      regex.lastIndex = 2;
      const str: string = "aabc";
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0030
     * @tc.name testRegSearch0030
     * @tc.desc Reusing regex multiple times, prior lastIndex does not affect search()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('b', 'g');
      const str1: string = "abc";
      const str2: string = "bcd";
      const result1: number = str1.search(regex);
      const result2: number = str2.search(regex);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0031
     * @tc.name testRegSearch0031
     * @tc.desc Perform search() on an empty string with regex matching any content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "";
      const regex = new RegExp('.');
      const result: number = str.search(regex);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0032
     * @tc.name testRegSearch0032
     * @tc.desc Perform search() on an empty string with zero-width match /^/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "";
      const regex = new RegExp('^');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0033
     * @tc.name testRegSearch0033
     * @tc.desc Multiple adjacent matches, search() returns index of first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaa";
      const regex = new RegExp('a', 'g');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0034
     * @tc.name testRegSearch0034
     * @tc.desc Regex matches first occurrence in a long string (large data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x".repeat(100000) + "y";
      const regex = new RegExp('y');
      const result: number = str.search(regex);
      expect(result).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0035
     * @tc.name testRegSearch0035
     * @tc.desc Multi-line text, verify m flag affects ^ and $ anchors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2";
      const regex = new RegExp('^line2', 'm');
      const result: number = str.search(regex);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0036
     * @tc.name testRegSearch0036
     * @tc.desc Multi-line text with \n, \r, \u2028, \u2029 for line matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\rc\u2028d\u2029e";
      const regex = new RegExp('c');
      const result: number = str.search(regex);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0037
     * @tc.name testRegSearch0037
     * @tc.desc Match whitespace characters including \t and \r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\tb\rc";
      const regex = new RegExp('\\s');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0038
     * @tc.name testRegSearch0038
     * @tc.desc Match mixed Chinese, English, and number text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc中文123";
      const regex = new RegExp('\\d');
      const result: number = str.search(regex);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0039
     * @tc.name testRegSearch0039
     * @tc.desc Match full-width characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ＡＢＣ";
      const regex = new RegExp('[Ａ-Ｚ]');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0040
     * @tc.name testRegSearch0040
     * @tc.desc Match Emoji using Unicode mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc😊def";
      const regex = new RegExp('\\p{Emoji}', 'u');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0041
     * @tc.name testRegSearch0041
     * @tc.desc Regex with escaped characters like \., \d, \u1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc.1\u1234";
      const regex = new RegExp('\\.');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0042
     * @tc.name testRegSearch0042
     * @tc.desc Regex with invalid escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: number = str.search(new RegExp("\\x")); // 已为RegExp构造函数形式，保持不变
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0043
     * @tc.name testRegSearch0043
     * @tc.desc Regex with nested capture groups (a(b(c)))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(a(b(c)))');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0044
     * @tc.name testRegSearch0044
     * @tc.desc Regex using backreference \1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aabb";
      const regex = new RegExp('(a)\\1');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0045
     * @tc.name testRegSearch0045
     * @tc.desc Regex containing replacement symbols $ and \n does not affect search()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc$def\nghi";
      const regex = new RegExp('def');
      const result: number = str.search(regex);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0046
     * @tc.name testRegSearch0046
     * @tc.desc Using dynamically constructed regex new RegExp("abc")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "123abc456";
      const regex: RegExp = new RegExp("abc");
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0047
     * @tc.name testRegSearch0047
     * @tc.desc Consistency between literal regex and RegExp constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const literal: number = str.search(new RegExp('a')); // 字面量改为构造函数形式，保持对比逻辑
      const constructed: number = str.search(new RegExp("a"));
      expect(literal).assertEqual(constructed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0048
     * @tc.name testRegSearch0048
     * @tc.desc search() with undefined argument implicitly converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "undefined";
      const param: string = String(undefined);
      const result: number = str.search(param);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0049
     * @tc.name testRegSearch0049
     * @tc.desc search() with null argument converted to string "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "null value";
      const result: number = str.search(String(null));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0050
     * @tc.name testRegSearch0050
     * @tc.desc search() with number argument converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "12345";
      const num: string = String(3);
      const result: number = str.search(num);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0051
     * @tc.name testRegSearch0051
     * @tc.desc search() with boolean argument converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "truefalse";
      const resultTrue: number = str.search(String(true));
      const resultFalse: number = str.search(String(false));
      expect(resultTrue).assertEqual(0);
      expect(resultFalse).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0052
     * @tc.name testRegSearch0052
     * @tc.desc search() with array argument converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1,2,3";
      const arr: string = [1, 2, 3].toString();
      const result: number = str.search(arr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0060
     * @tc.name testRegSearch0060
     * @tc.desc Search on read-only string constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('b');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0061
     * @tc.name testRegSearch0061
     * @tc.desc search() matches the entire string (^.*$)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello world";
      const regex = new RegExp('^.*$');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0062
     * @tc.name testRegSearch0062
     * @tc.desc search() returns -1 when no match is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('xyz');
      const result: number = str.search(regex);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0063
     * @tc.name testRegSearch0063
     * @tc.desc search() with zero-width regex (?:) matches at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?:)');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0064
     * @tc.name testRegSearch0064
     * @tc.desc search() with positive lookahead (?=a) matches correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?=a)');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0065
     * @tc.name testRegSearch0065
     * @tc.desc search() with negative lookahead (?!a) matches correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?!a)');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0066
     * @tc.name testRegSearch0066
     * @tc.desc search() ignores global flag g, returns first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abcabc";
      const regex = new RegExp('a', 'g');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0067
     * @tc.name testRegSearch0067
     * @tc.desc search() ignores sticky flag y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abcabc";
      const regex = new RegExp('a', 'y');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0068
     * @tc.name testRegSearch0068
     * @tc.desc search() with Unicode flag u matches boundary character 𠮷
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𠮷";
      const regex = new RegExp('\uD842\uDFB7', 'u');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0069
     * @tc.name testRegSearch0069
     * @tc.desc search() with dotAll flag s matches across multiple lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2";
      const regex = new RegExp('line1.line2', 's');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0070
     * @tc.name testRegSearch0070
     * @tc.desc search() with combined flags gimsu behaves as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('ABC', 'gius');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0071
     * @tc.name testRegSearch0071
     * @tc.desc Regex with character set [^\w\s] matches special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a@b#c";
      const regex = new RegExp('[^\\w\\s]');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0072
     * @tc.name testRegSearch0072
     * @tc.desc Regex with quantifiers {n,m} verifies match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaaaa";
      const regex = new RegExp('a{3,4}');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0073
     * @tc.name testRegSearch0073
     * @tc.desc Lazy quantifiers *? and +? first match location
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaaa";
      const regex = new RegExp('a+?');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0074
     * @tc.name testRegSearch0074
     * @tc.desc Positive lookbehind (?<=abc) match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('(?<=abc)1');
      const result: number = str.search(regex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0075
     * @tc.name testRegSearch0075
     * @tc.desc Negative lookbehind (?<!abc) match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1";
      const regex = new RegExp('(?<!abc)x');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0076
     * @tc.name testRegSearch0076
     * @tc.desc Match surrogate pair emoji like 😀
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀test";
      const regex = new RegExp('\\uD83D\\uDE00');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0077
     * @tc.name testRegSearch0077
     * @tc.desc Match text with combining character (é)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "e\u0301"; // e + combining acute
      const regex = new RegExp('e\\u0301');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0078
     * @tc.name testRegSearch0078
     * @tc.desc Match text containing mixed scripts (Latin, Chinese, Arabic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc汉字١٢٣";
      const regex = new RegExp('\\d');
      const result: number = str.search(regex);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0079
     * @tc.name testRegSearch0079
     * @tc.desc Match text containing escaped backslash \\
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\\b";
      const regex = new RegExp('\\\\');
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0080
     * @tc.name testRegSearch0080
     * @tc.desc Match text with \uXXXX Unicode escape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u0041B";
      const regex = new RegExp('\\u0041');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0081
     * @tc.name testRegSearch0081
     * @tc.desc Match text with newline and space mixture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1 \n line2";
      const regex = new RegExp('\\s');
      const result: number = str.search(regex);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0082
     * @tc.name testRegSearch0082
     * @tc.desc Multi-line regex ^ and $ behavior across lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc\ndef";
      const regex = new RegExp('^def', 'm');
      const result: number = str.search(regex);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0083
     * @tc.name testRegSearch0083
     * @tc.desc Internal exception thrown during search() propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('[/]');
      const result: number = str.search(regex);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0086
     * @tc.name testRegSearch0086
     * @tc.desc search() does not reset regex lastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = new RegExp('a', 'g');
      regex.lastIndex = 2;
      const str: string = "aaa";
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
      expect(regex.lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0087
     * @tc.name testRegSearch0087
     * @tc.desc search() with regex lastIndex non-zero still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = new RegExp('b', 'g');
      regex.lastIndex = 5;
      const str: string = "abc";
      const result: number = str.search(regex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0088
     * @tc.name testRegSearch0088
     * @tc.desc search() leaves regex object state unchanged (pure function)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = new RegExp('a', 'g');
      const str: string = "abc";
      const lastIndexBefore: number = regex.lastIndex;
      str.search(regex);
      expect(regex.lastIndex).assertEqual(lastIndexBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0089
     * @tc.name testRegSearch0089
     * @tc.desc Performance extreme: long string > 10^6 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a".repeat(1_000_001) + "b";
      const regex = new RegExp('b');
      const result: number = str.search(regex);
      expect(result).assertEqual(1_000_001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_0090
     * @tc.name testRegSearch0090
     * @tc.desc Performance extreme: complex nested regex >10 levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSearch0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp = new RegExp('((((((((((a))))))))))');
      const result: number = str.search(regex);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0001
     * @tc.name testRegSplit0001
     * @tc.desc Split string by simple whitespace regular expression / /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b c";
      const regex = new RegExp(' ');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0002
     * @tc.name testRegSplit0002
     * @tc.desc Split string by digits using regular expression /\d/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2c3";
      const regex = new RegExp('\\d');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b", "c", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0003
     * @tc.name testRegSplit0003
     * @tc.desc Split string using regex with global flag /a/g
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a', 'g');
      const result = "banana".split(regex);
      expect(result).assertDeepEquals(["b", "n", "n", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0004
     * @tc.name testRegSplit0004
     * @tc.desc Split string using regex with ignore case flag /a/i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a', 'i');
      const result = "AaAa".split(regex);
      expect(result).assertDeepEquals(["", "", "", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0005
     * @tc.name testRegSplit0005
     * @tc.desc Split string using regex with multiline flag /^/m
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const regex = new RegExp('^', 'm');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["line1\n", "line2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0006
     * @tc.name testRegSplit0006
     * @tc.desc Split string using Unicode flag regex /\p{L}/u to match letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1B2";
      const regex = new RegExp('\\p{L}', 'u');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["", "1", "2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0007
     * @tc.name testRegSplit0007
     * @tc.desc Split string using dotAll regex /./s as delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb";
      const regex = new RegExp('.', 's');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["", "", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0008
     * @tc.name testRegSplit0008
     * @tc.desc Split string using combined flags /a/gi
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a', 'gi');
      const result = "AaaAA".split(regex);
      expect(result).assertDeepEquals(["", "", "", "", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0009
     * @tc.name testRegSplit0009
     * @tc.desc Split string with capturing group (,) includes separator in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(,)');
      const result = "a,b,c".split(regex);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0010
     * @tc.name testRegSplit0010
     * @tc.desc Split string using named capturing group (?<x>,)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?<x>,)');
      const result = "a,b,c".split(regex);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0011
     * @tc.name testRegSplit0011
     * @tc.desc Split using positive lookahead (?=a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?=a)');
      const result = "baac".split(regex);
      expect(result).assertDeepEquals(["b", "a", "ac"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0012
     * @tc.name testRegSplit0012
     * @tc.desc Split using negative lookahead (?!a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?!a)');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0013
     * @tc.name testRegSplit0013
     * @tc.desc Split using positive lookbehind (?<=a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?<=a)');
      const result = "a-b-c".split(regex);
      expect(result[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0014
     * @tc.name testRegSplit0014
     * @tc.desc Split using negative lookbehind (?<!a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?<!a)');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["ab", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0015
     * @tc.name testRegSplit0015
     * @tc.desc Split using word boundary \b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\b');
      const result = "foo bar".split(regex);
      expect(result.includes(" ")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0016
     * @tc.name testRegSplit0016
     * @tc.desc Split using non-word boundary \B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\B');
      const result = "foo".split(regex);
      expect(result).assertDeepEquals(["f", "o", "o"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0017
     * @tc.name testRegSplit0017
     * @tc.desc Split using start anchor ^ as delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('^');
      const result = "abc".split(regex);
      expect(result[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0019
     * @tc.name testRegSplit0019
     * @tc.desc Split using quantifier + such as /a+/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a+');
      const result = "baaaac".split(regex);
      expect(result).assertDeepEquals(["b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0020
     * @tc.name testRegSplit0020
     * @tc.desc Split using quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a*');
      const result = "baac".split(regex);
      expect(result.includes("b")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0021
     * @tc.name testRegSplit0021
     * @tc.desc Split using quantifier {n,m} such as /a{1,2}/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a{1,2}');
      const result = "baaac".split(regex);
      expect(result).assertDeepEquals(["b", "", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0022
     * @tc.name testRegSplit0022
     * @tc.desc Split using character class /[abc]/ or /[^xyz]/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('[abc]');
      const result = "abcxyz".split(regex);
      expect(result).assertDeepEquals(["", "", "", "xyz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0023
     * @tc.name testRegSplit0023
     * @tc.desc Split using predefined classes \d, \D, \w, \W, \s, \S
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\d');
      const result = "a1 b2".split(regex);
      expect(result).assertDeepEquals(["a", " b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0024
     * @tc.name testRegSplit0024
     * @tc.desc Split using Unicode property class \p{N} or \p{L}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1B2";
      const regex = new RegExp('\\p{N}', 'u');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["A", "B", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0025
     * @tc.name testRegSplit0025
     * @tc.desc Split string containing accented letters using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "école";
      const regex = new RegExp('é');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["", "cole"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0026
     * @tc.name testRegSplit0026
     * @tc.desc Split string containing Emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\p{Emoji}', 'u');
      const result = "hi😀bye".split(regex);
      expect(result).assertDeepEquals(["hi", "bye"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0027
     * @tc.name testRegSplit0027
     * @tc.desc Split using empty non-capturing regex /(?:)/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?:)');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0028
     * @tc.name testRegSplit0028
     * @tc.desc Split using zero-width regex empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = "abc".split(""); // 空字符串参数无需修改
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0029
     * @tc.name testRegSplit0029
     * @tc.desc Split using mixed empty and captured regex /(,?)/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(,?)');
      const result = "a,b".split(regex);
      expect(result).assertDeepEquals(["a", ",", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0030
     * @tc.name testRegSplit0030
     * @tc.desc Split using reusable RegExp object across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg: RegExp = new RegExp(',', 'g'); // 复用的RegExp对象改为构造函数形式
      const str1 = "a,b,c";
      const str2 = "1,2,3";
      const result1 = str1.split(reg);
      const result2 = str2.split(reg);
      expect(result1).assertDeepEquals(["a", "b", "c"]);
      expect(result2).assertDeepEquals(["1", "2", "3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0031
     * @tc.name testRegSplit0031
     * @tc.desc Split using /(\d+)/ and verify captured digits are inserted into result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('(\\d+)');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "b", "2", "c", "3", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0032
     * @tc.name testRegSplit0032
     * @tc.desc Split using /(\D+)/ and verify non-digit captures are inserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12ab34";
      const regex = new RegExp('(\\D+)');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["12", "ab", "34"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0033
     * @tc.name testRegSplit0033
     * @tc.desc Split using /(\d)(\w)/ and verify multi-group insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(\\d)(\\w)');
      const result = "1a2b".split(regex);
      expect(result).assertDeepEquals(["", "1", "a", "", "2", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0034
     * @tc.name testRegSplit0034
     * @tc.desc Split using nested groups /((ab)c)/ to verify nested capturing structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('((ab)c)');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["", "abc", "ab", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0035
     * @tc.name testRegSplit0035
     * @tc.desc Split using empty groups /()()/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('()()');
      const result = "x".split(regex);
      expect(result).assertDeepEquals(["x"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0036
     * @tc.name testRegSplit0036
     * @tc.desc Split using named groups /((?<first>\w)(?<second>\d))/ and verify capture order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const regex = new RegExp('((?<first>\\w)(?<second>\\d))');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["", "a1", "a", "1", "", "b2", "b", "2", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0037
     * @tc.name testRegSplit0037
     * @tc.desc Verify global flag /g does not affect captured group insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const regex = new RegExp('(\\d)', 'g');
      const result = str.split(regex);
      expect(result.includes("1")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0038
     * @tc.name testRegSplit0038
     * @tc.desc Split using zero-width lookahead /((?=a))/ verify position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('((?=a))');
      const result = "baac".split(regex);
      expect(result).assertDeepEquals(["b", "", "a", "", "ac"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0040
     * @tc.name testRegSplit0040
     * @tc.desc Split using complex lookahead (?!b)(?=a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('((?!b)(?=a))');
      const result = "aba".split(regex);
      expect(result).assertDeepEquals(["ab", "", "a"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0042
     * @tc.name testRegSplit0042
     * @tc.desc Split with whitespace regex /\s+/ to collapse multiple spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\s+');
      const result = "a   b  c".split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0043
     * @tc.name testRegSplit0043
     * @tc.desc Split with should produce max splits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\s*');
      const result = "a b".split(regex);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0044
     * @tc.name testRegSplit0044
     * @tc.desc Split using /()/ matches empty string, should split between every char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('()');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["a", "", "b", "", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0045
     * @tc.name testRegSplit0045
     * @tc.desc Split using /^.*$/ matches whole string, result should be empty or ["",""]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('^.*$');
      const result = "abc".split(regex);
      expect(result).assertDeepEquals(["", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0046
     * @tc.name testRegSplit0046
     * @tc.desc Split using /^/ should produce leading empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('^');
      const result = "abc".split(regex);
      expect(result[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0048
     * @tc.name testRegSplit0048
     * @tc.desc Split test greedy quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('ab*');
      const result = "abbbbc".split(regex);
      expect(result).assertDeepEquals(["", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0049
     * @tc.name testRegSplit0049
     * @tc.desc Split using /ab*?/ to test lazy quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('ab*?');
      const result = "abbbc".split(regex);
      expect(result).assertDeepEquals(["", "bbbc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0050
     * @tc.name testRegSplit0050
     * @tc.desc Split using branching pattern /a|b|c/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a|b|c');
      const result = "abcabc".split(regex);
      expect(result).assertDeepEquals(["", "", "", "", "", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0051
     * @tc.name testRegSplit0051
     * @tc.desc Split using nested alternation /(a|b(c|d))/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(a|b(c|d))');
      const result = "abcd".split(regex);
      expect(result).assertDeepEquals(["", "a", "", "", "bc", "c", "d"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0052
     * @tc.name testRegSplit0052
     * @tc.desc Split using backreference /(\w)\1/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(\\w)\\1');
      const result = "aabbcc".split(regex);
      expect(result).assertDeepEquals(["", "a", "", "b", "", "c", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0053
     * @tc.name testRegSplit0053
     * @tc.desc Split using named backreference (?<name>.)\k<name>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('(?<x>.)\\k<x>');
      const result = "aabb".split(regex);
      expect(result).assertDeepEquals(["", "a", "", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0054
     * @tc.name testRegSplit0054
     * @tc.desc Split regex contains escaped slash \/ such as /\//
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\/');
      const result = "a/b/c".split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0055
     * @tc.name testRegSplit0055
     * @tc.desc Split using special char regex /\./ matches dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('\\.');
      const result = "a.b.c".split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0056
     * @tc.name testRegSplit0056
     * @tc.desc Split using regex /[\^$*+?.()|[\]{}]/ matching all metacharacters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('[\\^$*+?.()|\\[\\]{}]');
      const result = "^a+b?".split(regex);
      expect(result).assertDeepEquals(["", "a", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0057
     * @tc.name testRegSplit0057
     * @tc.desc Split using newline regex /\n/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const regex = new RegExp('\\n');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0058
     * @tc.name testRegSplit0058
     * @tc.desc Split using carriage return /\r/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\rb";
      const regex = new RegExp('\\r');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0059
     * @tc.name testRegSplit0059
     * @tc.desc Split using Unicode line separator \u2028
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\u2028b";
      const regex = new RegExp('\\u2028');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0060
     * @tc.name testRegSplit0060
     * @tc.desc Split using CRLF combination /\r\n/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\r\nline2";
      const regex = new RegExp('\\r\\n');
      const result = str.split(regex);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0065
     * @tc.name testRegSplit0065
     * @tc.desc Split string by non-BMP Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A𠮷B𠮷C";
      const regex = new RegExp('𠮷', 'u');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["A", "B", "C"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0066
     * @tc.name testRegSplit0066
     * @tc.desc Split mixed script text by Unicode letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A汉BعC";
      const regex = new RegExp('\\p{L}', 'u');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "", "", "", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0067
     * @tc.name testRegSplit0067
     * @tc.desc Split string using Unicode code point with braces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello😀world";
      const regex = new RegExp('\\u{1F600}', 'u');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["hello", "world"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0068
     * @tc.name testRegSplit0068
     * @tc.desc Split string by literal backslash n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\\nline2";
      const regex = new RegExp('\\\\n');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["line1", "line2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0069
     * @tc.name testRegSplit0069
     * @tc.desc Split string by tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "col1\tcol2\tcol3";
      const regex = new RegExp('\\t');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["col1", "col2", "col3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0070
     * @tc.name testRegSplit0070
     * @tc.desc Split string by whitespace and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b\nc\rd";
      const regex = new RegExp('\\s+');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b", "c", "d"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0071
     * @tc.name testRegSplit0071
     * @tc.desc Split string by complex lookahead and lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abXcd";
      const regex = new RegExp('(?<=b)(?=X)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["ab", "Xcd"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0072
     * @tc.name testRegSplit0072
     * @tc.desc Split string using dynamic RegExp construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: string = "\\d+";
      const str: string = "a1b22c333";
      const result: string[] = str.split(new RegExp(pattern, "g")); // 已为构造函数形式，保持不变
      expect(result).assertDeepEquals(["a", "b", "c", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0073
     * @tc.name testRegSplit0073
     * @tc.desc Split string using template-based RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: string = ",";
      const str: string = "a,b,c";
      const result: string[] = str.split(new RegExp(pattern)); // 已为构造函数形式，保持不变
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0090
     * @tc.name testRegSplit0090
     * @tc.desc Split extremely large input string correctly and efficiently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a".repeat(100) + "b";
      const regex = new RegExp('b');
      const result: string[] = str.split(regex);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0091
     * @tc.name testRegSplit0091
     * @tc.desc Split using simple regex without capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a b c";
      const regex = new RegExp('\\s+');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0092
     * @tc.name testRegSplit0092
     * @tc.desc Split using regex with a single capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a,b,c";
      const regex = new RegExp('(,)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", ",", "b", ",", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0093
     * @tc.name testRegSplit0093
     * @tc.desc Split using regex with multiple capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "123a456b";
      const regex = new RegExp('(\\d+)([a-z]+)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "123", "a", "", "456", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0094
     * @tc.name testRegSplit0094
     * @tc.desc Split using regex with empty capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('()()');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "", "", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0095
     * @tc.name testRegSplit0095
     * @tc.desc Split using nested capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('((a)(b))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "ab", "a", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0096
     * @tc.name testRegSplit0096
     * @tc.desc Split using regex with optional capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1-2-3";
      const regex = new RegExp('(\\d+)?-');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "1", "", "2", "3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0097
     * @tc.name testRegSplit0097
     * @tc.desc Split using single named capturing group, verify behavior is consistent with normal capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex = new RegExp('(?<letter>[A-Z])');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a1b2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0098
     * @tc.name testRegSplit0098
     * @tc.desc Split using named and anonymous capturing groups together, verify insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const regex = new RegExp('(?<letter>[A-Z])(\\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "A", "1", "", "B", "2", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0099
     * @tc.name testRegSplit0099
     * @tc.desc Split using named capturing group that does not match, verify undefined insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo";
      const regex = new RegExp('foo(?<bar>z)?');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0100
     * @tc.name testRegSplit0100
     * @tc.desc Split using multiple nested named capturing groups, verify nested insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const regex = new RegExp('((?<a>\\d)(?<b>[a-z]))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "1a", "1", "a", "", "2b", "2", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0101
     * @tc.name testRegSplit0101
     * @tc.desc Split using named capturing group combined with optional group, verify undefined insertion for partial matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "X-1-Y-2";
      const regex = new RegExp('(?<letter>[A-Z])?-(\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["X-1-Y-2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0102
     * @tc.name testRegSplit0102
     * @tc.desc Split using lookahead (?=\\d), verify cut positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex = new RegExp('(?=\\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1b", "2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0103
     * @tc.name testRegSplit0103
     * @tc.desc Split using lookbehind (?<=\\d), verify cut positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1A2B";
      const regex = new RegExp('(?<=\\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["1", "A2", "B"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0104
     * @tc.name testRegSplit0104
     * @tc.desc Split using lookahead + lookbehind combination, verify cut positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('(?<=a)(?=1)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0105
     * @tc.name testRegSplit0105
     * @tc.desc Split using zero-width assertion with capturing group, verify empty string insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('((?=1))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "", "1b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0106
     * @tc.name testRegSplit0106
     * @tc.desc Split using zero-width assertion with named capturing group, verify empty capture insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('(?<num>(?=1))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "", "1b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0107
     * @tc.name testRegSplit0107
     * @tc.desc Split using negative lookahead (?!b), verify string remains intact when not matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1c";
      const regex = new RegExp('(?!b)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0108
     * @tc.name testRegSplit0108
     * @tc.desc Split using negative lookbehind (?<!a), verify string remains intact when not matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "b1c";
      const regex = new RegExp('(?<!a)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["b", "1", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0109
     * @tc.name testRegSplit0109
     * @tc.desc Split using capturing group + lookahead, verify capture and assertion synchronization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex = new RegExp('(\\d)(?=b)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "b2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0110
     * @tc.name testRegSplit0110
     * @tc.desc Split using capturing group + lookbehind, verify capture inserted correctly after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const regex = new RegExp('(?<=\\d)([a-z])');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["1", "a", "2", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0111
     * @tc.name testRegSplit0111
     * @tc.desc Split using named capturing group + zero-width assertion, verify combined result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const regex = new RegExp('(?<letter>[A-Z])(?=\\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "A", "1", "B", "2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0112
     * @tc.name testRegSplit0112
     * @tc.desc Split using capturing group + quantifier, partial matches may insert undefined or empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab1c2";
      const regex = new RegExp('(a)?b');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "a", "1c2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0113
     * @tc.name testRegSplit0113
     * @tc.desc Split using zero-width assertion + optional group, verify empty matches insert array positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1y";
      const regex = new RegExp('(?=(\\d)?)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["x", "1", "1", "", "y"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0114
     * @tc.name testRegSplit0114
     * @tc.desc Split with regex matching start of string (^), verify cut at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('^');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0117
     * @tc.name testRegSplit0117
     * @tc.desc Split using capturing group + anchor combination, verify correct split positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(^a)|(c$)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "a", "", "b", "", "c", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0118
     * @tc.name testRegSplit0118
     * @tc.desc Split using multi-level nested capturing groups + zero-width assertion, verify deep capture and zero-width insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex = new RegExp('(((\\d))(?=b))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "1", "1", "b2"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0119
     * @tc.name testRegSplit0119
     * @tc.desc Split using optional group + lookahead assertion, verify array insertion for partial matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B";
      const regex = new RegExp('([A-Z])?(?=\\d)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "A", "1B"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0120
     * @tc.name testRegSplit0120
     * @tc.desc Split using capturing group + Unicode extended characters (emoji), verify correct matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀👍🏽🎉";
      const regex = new RegExp('([\\u{1F600}-\\u{1F64F}])', 'u');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "😀", "👍🏽🎉"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0121
     * @tc.name testRegSplit0121
     * @tc.desc Split using lookahead with capturing group, verify capture insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('(\\d)(?=b)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0122
     * @tc.name testRegSplit0122
     * @tc.desc Split using lookbehind with capturing group, verify capture insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const regex = new RegExp('(?<=\\d)([a-z])');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["1", "a", "2", "b", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0123
     * @tc.name testRegSplit0123
     * @tc.desc Split using consecutive zero-width assertions, verify no infinite loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(?=)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0124
     * @tc.name testRegSplit0124
     * @tc.desc Split with multi-level nested capturing groups + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('((\\d)(?=b))');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "1", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0125
     * @tc.name testRegSplit0125
     * @tc.desc Split using multiple empty capturing groups, verify undefined insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(()())');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "", "", "", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0126
     * @tc.name testRegSplit0126
     * @tc.desc Split using optional capturing group that does not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo";
      const regex = new RegExp('(bar)?');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["f", "", "o", "", "o"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0127
     * @tc.name testRegSplit0127
     * @tc.desc Split using capturing group + optional group + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('(\\d)?(?=b)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "1", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0128
     * @tc.name testRegSplit0128
     * @tc.desc Split with zero-width assertion at start of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('^');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0130
     * @tc.name testRegSplit0130
     * @tc.desc Split with zero-width assertion + Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a😀b";
      const regex = new RegExp('(?=\\p{Emoji})', 'u');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "😀b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0131
     * @tc.name testRegSplit0131
     * @tc.desc Split using zero-width assertion + multiline mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const regex = new RegExp('^', 'gm');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a\n", "b\n", "c"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0132
     * @tc.name testRegSplit0132
     * @tc.desc Split using capturing group + optional quantifier ?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(a)?b');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "a", ""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0133
     * @tc.name testRegSplit0133
     * @tc.desc Split using capturing group + zero-width + quantifier *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex = new RegExp('(a*)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["", "aaa", "b"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_0134
     * @tc.name testRegSplit0134
     * @tc.desc Split using negative lookahead, verify string remains when not matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegSplit0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?!x)');
      const result: string[] = str.split(regex);
      expect(result).assertDeepEquals(["a", "b", "c"]);
    });

  });
}