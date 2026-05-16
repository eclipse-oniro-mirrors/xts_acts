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

export default function RegExpTest002() {
  describe('RegExpTest002', () => {
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
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0001
     * @tc.name testRegMatch0001
     * @tc.desc Test match() with global regex returning all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["apple", "apple"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0002
     * @tc.name testRegMatch0002
     * @tc.desc Test match() with regex without global flag returning match info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("apple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0003
     * @tc.name testRegMatch0003
     * @tc.desc Test match() with regex containing capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('(apple)');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("apple");
      expect(result?.[1]).assertEqual("apple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0004
     * @tc.name testRegMatch0004
     * @tc.desc Test match() returns null when there is no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('orange');
      const result = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0005
     * @tc.name testRegMatch0005
     * @tc.desc Test match() with global regex returns all matches (repetition)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["apple", "apple"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0006
     * @tc.name testRegMatch0006
     * @tc.desc Test match() with regex containing capturing group and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('(apple)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["apple", "apple"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0007
     * @tc.name testRegMatch0007
     * @tc.desc Test match() on an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "";
      const regex = new RegExp('.', 'g');
      const result = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0008
     * @tc.name testRegMatch0008
     * @tc.desc Test match() with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😀😃😄";
      const regex = new RegExp('.', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["😀", "😃", "😄"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0009
     * @tc.name testRegMatch0009
     * @tc.desc Test match() with multi-line string and ^/$ anchors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const regex = new RegExp('^line2$', 'm');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0010
     * @tc.name testRegMatch0010
     * @tc.desc Test match() with zero-width assertions (lookahead)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=b)c', 'g');
      const result = str.match(regex);
      expect(result).assertEqual(null); // lookahead doesn't consume, no match at 'c'
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0011
     * @tc.name testRegMatch0011
     * @tc.desc Test match() with optional capturing group that may not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "banana";
      const regex = new RegExp('(apple)?banana');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("banana");
      expect(result?.[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0012
     * @tc.name testRegMatch0012
     * @tc.desc Test match() with repeated pattern using quantifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaabbb";
      const regex = new RegExp('a+b+');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("aaabbb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0013
     * @tc.name testRegMatch0013
     * @tc.desc Test match() with alternation pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat";
      const regex = new RegExp('dog|cat|mouse');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("cat");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0014
     * @tc.name testRegMatch0014
     * @tc.desc Test match() with character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const regex = new RegExp('[a-z]+');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0015
     * @tc.name testRegMatch0015
     * @tc.desc Test match() with Unicode combining marks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "e\u0301clair";
      const regex = new RegExp('e\u0301');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("e\u0301");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0016
     * @tc.name testRegMatch0016
     * @tc.desc Test match() with lookahead assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foobar";
      const regex = new RegExp('foo(?=bar)');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("foo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0017
     * @tc.name testRegMatch0017
     * @tc.desc Test match() with lookbehind assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foobar";
      const regex = new RegExp('(?<=foo)bar');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("bar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0018
     * @tc.name testRegMatch0018
     * @tc.desc Test match() with multiple capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "2025-10-09";
      const regex = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("2025-10-09");
      expect(result?.[1]).assertEqual("2025");
      expect(result?.[2]).assertEqual("10");
      expect(result?.[3]).assertEqual("09");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0019
     * @tc.name testRegMatch0019
     * @tc.desc Test match() with global regex on multiple occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "red blue red green red";
      const regex = new RegExp('red', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["red", "red", "red"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0020
     * @tc.name testRegMatch0020
     * @tc.desc Test match() with non-matching string returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('foo');
      const result = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0021
     * @tc.name testRegMatch0021
     * @tc.desc Test match() with regex containing word boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat scatter cater";
      const regex = new RegExp('\\bcat\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["cat"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0022
     * @tc.name testRegMatch0022
     * @tc.desc Test match() with regex containing optional non-capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour";
      const regex = new RegExp('colou?r', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["color", "colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0023
     * @tc.name testRegMatch0023
     * @tc.desc Test match() with regex containing digit character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Phone: 123-4567";
      const regex = new RegExp('\\d+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["123", "4567"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0024
     * @tc.name testRegMatch0024
     * @tc.desc Test match() with regex containing non-digit character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123xyz";
      const regex = new RegExp('\\D+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "xyz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0025
     * @tc.name testRegMatch0025
     * @tc.desc Test match() with regex containing word characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var_1 var_2 var_3";
      const regex = new RegExp('\\w+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var_1", "var_2", "var_3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0026
     * @tc.name testRegMatch0026
     * @tc.desc Test match() with regex containing whitespace character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a b\tc\nd";
      const regex = new RegExp('\\s+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" ", "\t", "\n"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0027
     * @tc.name testRegMatch0027
     * @tc.desc Test match() with regex containing negated character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123XYZ";
      const regex = new RegExp('[^a-z]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["123XYZ"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0028
     * @tc.name testRegMatch0028
     * @tc.desc Test match() with regex containing start of string anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('^hello');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0029
     * @tc.name testRegMatch0029
     * @tc.desc Test match() with regex containing end of string anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('world$');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0030
     * @tc.name testRegMatch0030
     * @tc.desc Test match() with regex containing any character dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('a.c');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0031
     * @tc.name testRegMatch0031
     * @tc.desc Test match() with regex containing tab and newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\tline2\nline3";
      const regex = new RegExp('[^\\S\\r\\n]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["\t"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0032
     * @tc.name testRegMatch0032
     * @tc.desc Test match() with regex containing hex character escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "\x41\x42\x43";
      const regex = new RegExp('\x41', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0033
     * @tc.name testRegMatch0033
     * @tc.desc Test match() with regex containing Unicode escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "\u{1F600}\u{1F601}"; // 😀😁
      const regex = new RegExp('\\u{1F600}', 'u');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0034
     * @tc.name testRegMatch0034
     * @tc.desc Test match() with regex containing non-capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour";
      const regex = new RegExp('colou(?:r)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0035
     * @tc.name testRegMatch0035
     * @tc.desc Test match() with regex containing nested capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "2025-10-09";
      const regex = new RegExp('((\\d{4})-(\\d{2})-(\\d{2}))');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("2025-10-09");
      expect(result?.[1]).assertEqual("2025-10-09");
      expect(result?.[2]).assertEqual("2025");
      expect(result?.[3]).assertEqual("10");
      expect(result?.[4]).assertEqual("09");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0036
     * @tc.name testRegMatch0036
     * @tc.desc Test match() with regex containing positive lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo123";
      const regex = new RegExp('foo(?=\\d+)');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("foo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0037
     * @tc.name testRegMatch0037
     * @tc.desc Test match() with regex containing negative lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foobar";
      const regex = new RegExp('foo(?!bar)');
      const result = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0038
     * @tc.name testRegMatch0038
     * @tc.desc Test match() with regex containing positive lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123abc";
      const regex = new RegExp('(?<=123)abc');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0039
     * @tc.name testRegMatch0039
     * @tc.desc Test match() with regex containing negative lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?<!123)abc');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0040
     * @tc.name testRegMatch0040
     * @tc.desc Test match() with regex containing multiple alternations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana cat";
      const regex = new RegExp('dog|cat|apple', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["apple", "cat"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0041
     * @tc.name testRegMatch0041
     * @tc.desc Test match() with regex containing start-of-line and global flag on multi-line string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "first line\nsecond line\nthird line";
      const regex = new RegExp('^.*line$', 'gm');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["first line", "second line", "third line"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0042
     * @tc.name testRegMatch0042
     * @tc.desc Test match() with regex containing optional quantifiers and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour colouur";
      const regex = new RegExp('colou?r', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["color", "colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0043
     * @tc.name testRegMatch0043
     * @tc.desc Test match() with regex matching non-printable ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello\u0007world";
      const regex = new RegExp('[\x00-\x1F]', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["\u0007"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0044
     * @tc.name testRegMatch0044
     * @tc.desc Test match() with regex containing Unicode property escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello 𐐷 World";
      const regex = new RegExp('\\p{Script=Deseret}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𐐷"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0045
     * @tc.name testRegMatch0045
     * @tc.desc Test match() with regex containing empty string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=a)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0046
     * @tc.name testRegMatch0046
     * @tc.desc Test match() with regex containing optional nested capturing groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple";
      const regex = new RegExp('(a(b(c)?))?');
      const result = str.match(regex);
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0047
     * @tc.name testRegMatch0047
     * @tc.desc Test match() with regex containing repeated groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hahahehe";
      const regex = new RegExp('(ha)+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["haha"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0048
     * @tc.name testRegMatch0048
     * @tc.desc Test match() with regex containing mixed character classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('[a-z]\\d', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["a1", "b2", "c3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0049
     * @tc.name testRegMatch0049
     * @tc.desc Test match() with regex containing lookahead and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar baz";
      const regex = new RegExp('foo(?= bar)|baz', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo", "baz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0051
     * @tc.name testRegMatch0051
     * @tc.desc Test match() with regex containing multiple Unicode emoji characters and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😀😃😄😁";
      const regex = new RegExp('\\p{Emoji}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["😀", "😃", "😄", "😁"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0052
     * @tc.name testRegMatch0052
     * @tc.desc Test match() with regex containing multiple consecutive zero-width assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=a)(?=b)(?=c)', 'g');
      const result = str.match(regex);
      expect(result).assertNull(); // multiple zero-width assertions match empty string
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0053
     * @tc.name testRegMatch0053
     * @tc.desc Test match() with regex containing a combination of word and digit character classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('\\w\\d', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["a1", "b2", "c3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0054
     * @tc.name testRegMatch0054
     * @tc.desc Test match() with regex containing negative lookahead at the start of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foobar";
      const regex = new RegExp('^(?!foo)bar');
      const result = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0055
     * @tc.name testRegMatch0055
     * @tc.desc Test match() with regex containing non-greedy quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<div>content</div>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<div>", "</div>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0056
     * @tc.name testRegMatch0056
     * @tc.desc Test match() with regex containing lookbehind and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123abc 456def";
      const regex = new RegExp('(?<=123)abc|(?<=456)def', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "def"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0057
     * @tc.name testRegMatch0057
     * @tc.desc Test match() with regex containing mixed Unicode letters and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1B2C3";
      const regex = new RegExp('[A-Z]\\d', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A1", "B2", "C3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0058
     * @tc.name testRegMatch0058
     * @tc.desc Test match() with regex containing Unicode letters beyond BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐷𐐸𐑀";
      const regex = new RegExp('\\p{Script=Deseret}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𐐷", "𐐸", "𐑀"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0059
     * @tc.name testRegMatch0059
     * @tc.desc Test match() with regex containing optional non-capturing groups and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v1 v2 v10";
      const regex = new RegExp('v(?:\\d)+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v1", "v2", "v10"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0060
     * @tc.name testRegMatch0060
     * @tc.desc Test match() with regex containing non-capturing group with alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat dog mouse";
      const regex = new RegExp('(?:cat|dog)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["cat", "dog"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0061
     * @tc.name testRegMatch0061
     * @tc.desc Test match() with regex containing multiple consecutive whitespace characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a  b   c";
      const regex = new RegExp('\\s+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["  ", "   "]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0062
     * @tc.name testRegMatch0062
     * @tc.desc Test match() with regex containing repeating digits and word boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12 123 1234";
      const regex = new RegExp('\\b\\d{3}\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["123"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0063
     * @tc.name testRegMatch0063
     * @tc.desc Test match() with regex containing Unicode surrogate pairs and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𠀋𠀌𠀍";
      const regex = new RegExp('[\\u{20000}-\\u{2A6DF}]', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𠀋", "𠀌", "𠀍"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0064
     * @tc.name testRegMatch0064
     * @tc.desc Test match() with regex containing optional digit sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v v1 v12 v123";
      const regex = new RegExp('v\\d*', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v", "v1", "v12", "v123"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0065
     * @tc.name testRegMatch0065
     * @tc.desc Test match() with regex containing nested optional groups and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc ac ab";
      const regex = new RegExp('a(b(c)?)?', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "a", "ab"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0066
     * @tc.name testRegMatch0066
     * @tc.desc Test match() with regex containing multiple alternations and zero-width assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar baz";
      const regex = new RegExp('(?=foo)|bar|baz', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["", "bar", "baz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0067
     * @tc.name testRegMatch0067
     * @tc.desc Test match() with regex containing non-capturing groups and optional letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour colouur";
      const regex = new RegExp('colou?r', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["color", "colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0068
     * @tc.name testRegMatch0068
     * @tc.desc Test match() with regex containing repeated Unicode letters and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐷𐐷𐐸𐐸";
      const regex = new RegExp('\\p{Script=Deseret}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𐐷", "𐐷", "𐐸", "𐐸"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0069
     * @tc.name testRegMatch0069
     * @tc.desc Test match() with regex containing alternation and optional digit group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v1 v2 v10";
      const regex = new RegExp('v\\d?|v\\d\\d', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v1", "v2", "v1"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0070
     * @tc.name testRegMatch0070
     * @tc.desc Test match() with regex containing mixed word, digit, and underscore characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var_1 var2 var_3";
      const regex = new RegExp('\\w+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var_1", "var2", "var_3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0071
     * @tc.name testRegMatch0071
     * @tc.desc Test match() with regex containing multiple consecutive punctuation characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello!!! Are you... ok?";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "...", "?"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0073
     * @tc.name testRegMatch0073
     * @tc.desc Test match() with regex containing zero-width assertions at string boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "start middle end";
      const regex = new RegExp('(?<=^start)(?=\\smiddle)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([""]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0074
     * @tc.name testRegMatch0074
     * @tc.desc Test match() with regex containing Unicode digits from different scripts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123٤٥٦";
      const regex = new RegExp('\\p{Nd}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["1", "2", "3", "٤", "٥", "٦"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0075
     * @tc.name testRegMatch0075
     * @tc.desc Test match() with regex containing word boundaries and repeated patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo bar";
      const regex = new RegExp('\\bfoo\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo", "foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0076
     * @tc.name testRegMatch0076
     * @tc.desc Test match() with regex containing mixed uppercase and lowercase Unicode letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "AbC aBc ABC";
      const regex = new RegExp('[A-Z][a-z][A-Z]', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["AbC"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0077
     * @tc.name testRegMatch0077
     * @tc.desc Test match() with regex containing zero-width negative lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def";
      const regex = new RegExp('(?<!xyz)abc', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0078
     * @tc.name testRegMatch0078
     * @tc.desc Test match() with regex containing repeated non-greedy quantifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<div>content</div><span>more</span>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<div>", "</div>", "<span>", "</span>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0079
     * @tc.name testRegMatch0079
     * @tc.desc Test match() with regex containing Unicode letters and combining marks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "e\u0301 a\u0300";
      const regex = new RegExp('\\p{L}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["e", "a"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0080
     * @tc.name testRegMatch0080
     * @tc.desc Test match() with regex containing mixed letters, digits, punctuation, and underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var1_var2.var3,var4";
      const regex = new RegExp('[\\w.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var1_var2.var3", "var4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0082
     * @tc.name testRegMatch0082
     * @tc.desc Test match() with regex containing repeated special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "!!! ?? ...";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "??", "..."]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0083
     * @tc.name testRegMatch0083
     * @tc.desc Test match() with regex containing optional non-capturing groups and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour colouur";
      const regex = new RegExp('colou?r', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["color", "colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0084
     * @tc.name testRegMatch0084
     * @tc.desc Test match() with regex containing nested alternation and zero-width lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar baz";
      const regex = new RegExp('(?=foo)|bar|baz', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["", "bar", "baz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0086
     * @tc.name testRegMatch0086
     * @tc.desc Test match() with regex containing repeated Unicode surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𠀋𠀌𠀍𠀋";
      const regex = new RegExp('[\\u{20000}-\\u{2A6DF}]', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𠀋", "𠀌", "𠀍", "𠀋"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0087
     * @tc.name testRegMatch0087
     * @tc.desc Test match() with regex containing optional repeated digits and letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v v1 v12 v123";
      const regex = new RegExp('v\\d*', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v", "v1", "v12", "v123"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0088
     * @tc.name testRegMatch0088
     * @tc.desc Test match() with regex containing mixed word characters, digits, punctuation, and underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var1_var2.var3,var4";
      const regex = new RegExp('[\\w.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var1_var2.var3", "var4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0089
     * @tc.name testRegMatch0089
     * @tc.desc Test match() with regex containing multiple consecutive spaces and tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a \t  b   c";
      const regex = new RegExp('\\s+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" \t  ", "   "]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0091
     * @tc.name testRegMatch0091
     * @tc.desc Test match() with regex containing Unicode letters with diacritics and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "café naïve résumé";
      const regex = new RegExp('\\p{L}+', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["café", "naïve", "résumé"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0092
     * @tc.name testRegMatch0092
     * @tc.desc Test match() with regex containing repeated punctuation and optional spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello!!!  Are you?? ... fine!";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "??", "...", "!"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0093
     * @tc.name testRegMatch0093
     * @tc.desc Test match() with regex containing nested optional groups with alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "gray grey grEy";
      const regex = new RegExp('gr(a|e)y', 'gi');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["gray", "grey", "grEy"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0094
     * @tc.name testRegMatch0094
     * @tc.desc Test match() with regex containing lookbehind for specific pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123abc 456def";
      const regex = new RegExp('(?<=123)abc|(?<=456)def', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "def"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0095
     * @tc.name testRegMatch0095
     * @tc.desc Test match() with regex containing repeated digits with word boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12 123 1234 567";
      const regex = new RegExp('\\b\\d{3}\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["123", "567"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0096
     * @tc.name testRegMatch0096
     * @tc.desc Test match() with regex containing mixed word characters and underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var1_var2 var_3 var4";
      const regex = new RegExp('\\w+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var1_var2", "var_3", "var4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0097
     * @tc.name testRegMatch0097
     * @tc.desc Test match() with regex containing non-greedy quantifier and tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<p>text</p><div>more</div>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<p>", "</p>", "<div>", "</div>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0098
     * @tc.name testRegMatch0098
     * @tc.desc Test match() with regex containing optional letters and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v v1 v12 v123";
      const regex = new RegExp('v\\d*', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v", "v1", "v12", "v123"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0099
     * @tc.name testRegMatch0099
     * @tc.desc Test match() with regex containing Unicode letters across BMP and supplementary planes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐷𐐸A𐐹B";
      const regex = new RegExp('\\p{L}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𐐷", "𐐸", "A", "𐐹", "B"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0100
     * @tc.name testRegMatch0100
     * @tc.desc Test match() with regex containing zero-width lookahead and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar baz";
      const regex = new RegExp('(?=foo)|bar|baz', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["", "bar", "baz"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0103
     * @tc.name testRegMatch0103
     * @tc.desc Test match() with regex containing repeated special characters with optional spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "!!!  ?? ... !!!";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "??", "...", "!!!"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0104
     * @tc.name testRegMatch0104
     * @tc.desc Test match() with regex containing Unicode letters across multiple scripts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "AαБ𐐷";
      const regex = new RegExp('\\p{L}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A", "α", "Б", "𐐷"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0105
     * @tc.name testRegMatch0105
     * @tc.desc Test match() with regex containing zero-width positive lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar";
      const regex = new RegExp('foo(?= bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0106
     * @tc.name testRegMatch0106
     * @tc.desc Test match() with regex containing zero-width negative lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar";
      const regex = new RegExp('foo(?!baz)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0107
     * @tc.name testRegMatch0107
     * @tc.desc Test match() with regex containing non-greedy quantifiers and HTML-like tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<div>text</div><span>more</span>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<div>", "</div>", "<span>", "</span>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0108
     * @tc.name testRegMatch0108
     * @tc.desc Test match() with regex containing repeated digits and word boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12 123 1234 567";
      const regex = new RegExp('\\b\\d{3}\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["123", "567"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0109
     * @tc.name testRegMatch0109
     * @tc.desc Test match() with regex containing mixed word characters, digits, punctuation, and underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var1_var2.var3,var4";
      const regex = new RegExp('[\\w.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var1_var2.var3", "var4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0110
     * @tc.name testRegMatch0110
     * @tc.desc Test match() with regex containing empty string and optional groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc ac a";
      const regex = new RegExp('a(b(c)?)?', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "a", "a"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0111
     * @tc.name testRegMatch0111
     * @tc.desc Test match() with regex containing zero-width positive lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def";
      const regex = new RegExp('(?<=abc) def', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" def"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0112
     * @tc.name testRegMatch0112
     * @tc.desc Test match() with regex containing repeated Unicode surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𠀋𠀌𠀍𠀋";
      const regex = new RegExp('[\\u{20000}-\\u{2A6DF}]', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𠀋", "𠀌", "𠀍", "𠀋"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0113
     * @tc.name testRegMatch0113
     * @tc.desc Test match() with regex containing alternation and optional groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "color colour colouur";
      const regex = new RegExp('colou?r', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["color", "colour"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0114
     * @tc.name testRegMatch0114
     * @tc.desc Test match() with regex containing nested non-greedy quantifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<div>text</div><span>more</span>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<div>", "</div>", "<span>", "</span>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0115
     * @tc.name testRegMatch0115
     * @tc.desc Test match() with regex containing repeated digits and optional letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "v v1 v12 v123";
      const regex = new RegExp('v\\d*', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["v", "v1", "v12", "v123"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0116
     * @tc.name testRegMatch0116
     * @tc.desc Test match() with regex containing word boundaries and repeated letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo bar";
      const regex = new RegExp('\\bfoo\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo", "foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0117
     * @tc.name testRegMatch0117
     * @tc.desc Test match() with regex containing zero-width negative lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def";
      const regex = new RegExp('(?<!xyz)abc', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0118
     * @tc.name testRegMatch0118
     * @tc.desc Test match() with regex containing mixed Unicode letters, digits, and punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1! α2? Б3.";
      const regex = new RegExp('[\\p{L}\\d]+', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A1", "α2", "Б3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0119
     * @tc.name testRegMatch0119
     * @tc.desc Test match() with regex containing zero-width lookahead and optional letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar";
      const regex = new RegExp('foo(?= bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0121
     * @tc.name testRegMatch0121
     * @tc.desc Test match() with regex containing zero-width positive lookahead and repeated letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc abc abc";
      const regex = new RegExp('abc(?= )', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0122
     * @tc.name testRegMatch0122
     * @tc.desc Test match() with regex containing Unicode letters from multiple scripts with global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "AαБ𐐷Δ";
      const regex = new RegExp('\\p{L}', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A", "α", "Б", "𐐷", "Δ"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0123
     * @tc.name testRegMatch0123
     * @tc.desc Test match() with regex containing repeated punctuation and optional spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "!!! ?? ... !!! ???";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "??", "...", "!!!", "???"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0124
     * @tc.name testRegMatch0124
     * @tc.desc Test match() with regex containing optional nested groups with alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "gray grey grEy";
      const regex = new RegExp('gr(a|e)y', 'gi');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["gray", "grey", "grEy"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0125
     * @tc.name testRegMatch0125
     * @tc.desc Test match() with regex containing zero-width negative lookahead and repeated words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo baz";
      const regex = new RegExp('\\bfoo(?! baz)\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0126
     * @tc.name testRegMatch0126
     * @tc.desc Test match() with regex containing mixed word characters, digits, punctuation, and underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "var1_var2.var3,var4";
      const regex = new RegExp('[\\w.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["var1_var2.var3", "var4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0127
     * @tc.name testRegMatch0127
     * @tc.desc Test match() with regex containing Unicode letters and digits combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1 α2 Б3";
      const regex = new RegExp('[\\p{L}\\d]+', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A1", "α2", "Б3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0128
     * @tc.name testRegMatch0128
     * @tc.desc Test match() with regex containing repeated letters and zero-width lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def abc";
      const regex = new RegExp('(?<=abc) def', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" def"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0129
     * @tc.name testRegMatch0129
     * @tc.desc Test match() with regex containing zero-width negative lookbehind and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def ghi";
      const regex = new RegExp('(?<!xyz)abc|def', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "def"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0130
     * @tc.name testRegMatch0130
     * @tc.desc Test match() with regex containing non-greedy quantifiers and HTML-like tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<p>text</p><div>more</div>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<p>", "</p>", "<div>", "</div>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0131
     * @tc.name testRegMatch0131
     * @tc.desc Test match() with regex containing multiple consecutive spaces and optional letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a  ab   abc    abcd";
      const regex = new RegExp('a\\s*b*', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["a  ", "ab", "ab", "ab"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0132
     * @tc.name testRegMatch0132
     * @tc.desc Test match() with regex containing Unicode supplementary plane characters and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐷𐐸𐐹𐐺";
      const regex = new RegExp('[\\u{10400}-\\u{1044F}]', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["𐐷", "𐐸", "𐐹", "𐐺"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0133
     * @tc.name testRegMatch0133
     * @tc.desc Test match() with regex containing repeated punctuation with optional spaces and global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "!!! ??? ... !!!";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!!", "???", "...", "!!!"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0134
     * @tc.name testRegMatch0134
     * @tc.desc Test match() with regex containing optional nested groups with alternation and case-insensitive flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "gray Grey GRAY";
      const regex = new RegExp('gr(a|e)y', 'gi');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["gray", "Grey", "GRAY"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0135
     * @tc.name testRegMatch0135
     * @tc.desc Test match() with regex containing zero-width positive lookbehind and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def ghi";
      const regex = new RegExp('(?<=abc|def) ghi', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" ghi"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0136
     * @tc.name testRegMatch0136
     * @tc.desc Test match() with regex containing zero-width negative lookahead and optional letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foobar";
      const regex = new RegExp('foo(?!bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0137
     * @tc.name testRegMatch0137
     * @tc.desc Test match() with regex containing nested non-greedy quantifiers and HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<div>text</div><span>more</span>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<div>", "</div>", "<span>", "</span>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0138
     * @tc.name testRegMatch0138
     * @tc.desc Test match() with regex containing word boundaries, repeated letters, and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo1 bar2 foo3";
      const regex = new RegExp('\\bfoo\\d\\b', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo1", "foo3"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0139
     * @tc.name testRegMatch0139
     * @tc.desc Test match() with regex containing zero-width negative lookbehind and repeated words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def abc ghi";
      const regex = new RegExp('(?<!xyz)abc', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0141
     * @tc.name testRegMatch0141
     * @tc.desc Test match() with regex containing zero-width positive lookahead and multiple words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar baz foo qux";
      const regex = new RegExp('foo(?= bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0142
     * @tc.name testRegMatch0142
     * @tc.desc Test match() with regex containing zero-width negative lookahead and multiple words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foobar";
      const regex = new RegExp('foo(?!bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0143
     * @tc.name testRegMatch0143
     * @tc.desc Test match() with regex containing repeated punctuation, spaces, and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "!!  ? 123 ... !!";
      const regex = new RegExp('[!?.]+', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["!!", "?", "...", "!!"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0144
     * @tc.name testRegMatch0144
     * @tc.desc Test match() with regex containing Unicode letters, digits, and word boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A1 α2 Б3 Δ4";
      const regex = new RegExp('[\\p{L}\\d]+', 'gu');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["A1", "α2", "Б3", "Δ4"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0145
     * @tc.name testRegMatch0145
     * @tc.desc Test match() with regex containing nested optional groups and alternation with global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat bat hat";
      const regex = new RegExp('(c|b|h)at', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["cat", "bat", "hat"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0146
     * @tc.name testRegMatch0146
     * @tc.desc Test match() with regex containing zero-width positive lookbehind and alternation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def ghi";
      const regex = new RegExp('(?<=abc|def) ghi', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals([" ghi"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0147
     * @tc.name testRegMatch0147
     * @tc.desc Test match() with regex containing zero-width negative lookbehind and multiple occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def abc ghi";
      const regex = new RegExp('(?<!xyz)abc', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["abc", "abc"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0148
     * @tc.name testRegMatch0148
     * @tc.desc Test match() with regex containing non-greedy quantifiers and multiple HTML-like tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "<p>text</p><div>more</div><span>even more</span>";
      const regex = new RegExp('<.*?>', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["<p>", "</p>", "<div>", "</div>", "<span>", "</span>"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0149
     * @tc.name testRegMatch0149
     * @tc.desc Test match() with regex containing zero-width lookahead and optional letters in repeated words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo baz foo qux";
      const regex = new RegExp('foo(?= bar)', 'g');
      const result = str.match(regex);
      expect(result).assertDeepEquals(["foo"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0150
     * @tc.name testRegMatch0150
     * @tc.desc Single named capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?<letter>b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['letter']).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0151
     * @tc.name testRegMatch0151
     * @tc.desc Named + anonymous capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?<x>b)(c)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("b");
      expect(result?.[1]).assertEqual("b");
      expect(result?.[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0152
     * @tc.name testRegMatch0152
     * @tc.desc Named capturing group not matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('(?<x>b)?c');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0154
     * @tc.name testRegMatch0154
     * @tc.desc Named + optional capturing group partially matched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('(?<x>a)?c');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0155
     * @tc.name testRegMatch0155
     * @tc.desc Named capturing group + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(?<x>a)(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0156
     * @tc.name testRegMatch0156
     * @tc.desc Positive lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('a(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0157
     * @tc.name testRegMatch0157
     * @tc.desc Positive lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?<=a)b');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0158
     * @tc.name testRegMatch0158
     * @tc.desc Negative lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('a(?!b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0159
     * @tc.name testRegMatch0159
     * @tc.desc Negative lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "bc";
      const regex = new RegExp('(?<!a)b');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0160
     * @tc.name testRegMatch0160
     * @tc.desc Lookahead + capturing group combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b";
      const regex = new RegExp('(\\d)(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("1");
      expect(result?.[1]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0161
     * @tc.name testRegMatch0161
     * @tc.desc Lookbehind + capturing group combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2b";
      const regex = new RegExp('(?<=\\d)([a-z])');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0162
     * @tc.name testRegMatch0162
     * @tc.desc Lookahead + lookbehind combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2";
      const regex = new RegExp('(?<=1)a(?=2)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0163
     * @tc.name testRegMatch0163
     * @tc.desc Nested zero-width assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?=(?<=a)b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0164
     * @tc.name testRegMatch0164
     * @tc.desc Zero-width assertion + optional group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(a)?(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0165
     * @tc.name testRegMatch0165
     * @tc.desc Capturing group + quantifier with partial match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex = new RegExp('(a*)b');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("aaab");
      expect(result?.[1]).assertEqual("aaa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0166
     * @tc.name testRegMatch0166
     * @tc.desc Zero-width assertion + quantifier *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "b";
      const regex = new RegExp('(a*)b');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
      expect(result?.[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0167
     * @tc.name testRegMatch0167
     * @tc.desc Zero-width assertion + optional capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(a)?(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0168
     * @tc.name testRegMatch0168
     * @tc.desc String start anchor ^
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('^a');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0169
     * @tc.name testRegMatch0169
     * @tc.desc String end anchor $
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('c$');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0170
     * @tc.name testRegMatch0170
     * @tc.desc Multiline mode with ^ anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const regex = new RegExp('^b', 'm');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0171
     * @tc.name testRegMatch0171
     * @tc.desc Multiline mode with $ anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb\nc";
      const regex = new RegExp('b$', 'm');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0173
     * @tc.name testRegMatch0173
     * @tc.desc Capturing group + start anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('^(a)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0174
     * @tc.name testRegMatch0174
     * @tc.desc Capturing group + end anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(c)$');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("c");
      expect(result?.[1]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0175
     * @tc.name testRegMatch0175
     * @tc.desc Nested capturing groups + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('((?<=a)b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
      expect(result?.[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0176
     * @tc.name testRegMatch0176
     * @tc.desc Optional group + lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(a)?(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0177
     * @tc.name testRegMatch0177
     * @tc.desc Capturing group + Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\u{1F600}b";
      const regex = new RegExp('(\\u{1F600})', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("\u{1F600}");
      expect(result?.[1]).assertEqual("\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0178
     * @tc.name testRegMatch0178
     * @tc.desc Named capturing + Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x\u{1F600}y";
      const regex = new RegExp('(?<emoji>\\u{1F600})', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['emoji']).assertEqual("\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0179
     * @tc.name testRegMatch0179
     * @tc.desc Zero-width assertion + Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u{1F600}a";
      const regex = new RegExp('(?<=\\u{1F600})a', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0180
     * @tc.name testRegMatch0180
     * @tc.desc Unicode surrogate pair + lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\uD834\uDD1E1";
      const regex = new RegExp('(?=\\d)', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0181
     * @tc.name testRegMatch0181
     * @tc.desc Capturing group + multiple quantifiers + partial match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex = new RegExp('(a+)(b)?');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("aaab");
      expect(result?.[1]).assertEqual("aaa");
      expect(result?.[2]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0182
     * @tc.name testRegMatch0182
     * @tc.desc Nested capturing groups + optional + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('((a)?(?=b))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0183
     * @tc.name testRegMatch0183
     * @tc.desc Zero-width assertion + optional capturing group missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "b";
      const regex = new RegExp('(a)?(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("");
      expect(result?.[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0184
     * @tc.name testRegMatch0184
     * @tc.desc Multi-level nested capturing + zero-width + quantifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex = new RegExp('((a+)?(?=b))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("aaa");
      expect(result?.[1]).assertEqual("aaa");
      expect(result?.[2]).assertEqual("aaa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0185
     * @tc.name testRegMatch0185
     * @tc.desc Lookahead + optional nested capturing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('((a)?(?=c))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0186
     * @tc.name testRegMatch0186
     * @tc.desc Nested capturing group + lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1ab";
      const regex = new RegExp('(?<=1((a)?))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("");
      expect(result?.[1]).assertEqual("");
      expect(result?.[2]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0187
     * @tc.name testRegMatch0187
     * @tc.desc Negative lookahead + capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('(a)(?!b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0188
     * @tc.name testRegMatch0188
     * @tc.desc Negative lookbehind + capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "bc";
      const regex = new RegExp('(?<!a)(b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
      expect(result?.[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0189
     * @tc.name testRegMatch0189
     * @tc.desc Named capturing group + nested zero-width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(?<x>a)(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("a");
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0190
     * @tc.name testRegMatch0190
     * @tc.desc Named capturing group + optional nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('(?<x>a)?(?=c)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0191
     * @tc.name testRegMatch0191
     * @tc.desc Zero-width + optional capturing + Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u{1F600}a";
      const regex = new RegExp('(\\u{1F600})?(?=a)', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("\u{1F600}");
      expect(result?.[1]).assertEqual("\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0192
     * @tc.name testRegMatch0192
     * @tc.desc Multi-level nested capturing + Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u{1F600}a";
      const regex = new RegExp('((\\u{1F600})?)(?=a)', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("\u{1F600}");
      expect(result?.[1]).assertEqual("\u{1F600}");
      expect(result?.[2]).assertEqual("\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0193
     * @tc.name testRegMatch0193
     * @tc.desc Capturing group + lookbehind + Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u{1F600}a";
      const regex = new RegExp('(?<=\\u{1F600})(a)', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0194
     * @tc.name testRegMatch0194
     * @tc.desc Multi-level nested capturing + lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2";
      const regex = new RegExp('((?<=1)(a)(?=2))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0195
     * @tc.name testRegMatch0195
     * @tc.desc Nested optional capturing + lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1b";
      const regex = new RegExp('(?<=1(a)?)(b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("b");
      expect(result?.[1]).assertEqual(undefined);
      expect(result?.[2]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0196
     * @tc.name testRegMatch0196
     * @tc.desc Multi-layer zero-width + optional groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('((a)?(?=(b)?))');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
      expect(result?.[2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0197
     * @tc.name testRegMatch0197
     * @tc.desc Lookahead + negative lookbehind + capturing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex = new RegExp('(?<!x)(a)(?=b)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("a");
      expect(result?.[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0198
     * @tc.name testRegMatch0198
     * @tc.desc Named capturing + lookahead + optional nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ac";
      const regex = new RegExp('(?<x>a)?(?=c)');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.groups?.['x']).assertEqual("a");
      expect(result?.[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_0199
     * @tc.name testRegMatch0199
     * @tc.desc Nested capturing + Unicode + zero-width + optional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatch0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "\u{1F600}a";
      const regex = new RegExp('((\\u{1F600})?)(?=a)', 'u');
      const result: RegExpMatchArray | null = str.match(regex);
      expect(result?.[0]).assertEqual("\u{1F600}");
      expect(result?.[1]).assertEqual("\u{1F600}");
      expect(result?.[2]).assertEqual("\u{1F600}");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0002
     * @tc.name testRegMatchAll0002
     * @tc.desc Capturing group at string start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc def";
      const regex = new RegExp('(abc)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0003
     * @tc.name testRegMatchAll0003
     * @tc.desc Capturing group at string end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "def abc";
      const regex = new RegExp('(abc)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0007
     * @tc.name testRegMatchAll0007
     * @tc.desc Lookbehind assertion match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x1 y2 z3";
      const regex = new RegExp('(?<=y)2', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0008
     * @tc.name testRegMatchAll0008
     * @tc.desc Zero-width word boundary match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar";
      const regex = new RegExp('\\b', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0009
     * @tc.name testRegMatchAll0009
     * @tc.desc Zero-width start-of-string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('^(?=a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0010
     * @tc.name testRegMatchAll0010
     * @tc.desc Zero-width end-of-string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=$)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("");
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0027
     * @tc.name testRegMatchAll0027
     * @tc.desc Zero-width assertion + supplementary plane character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐀a𐐁";
      const regex = new RegExp('(?<=𐐀)a(?=𐐁)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0031
     * @tc.name testRegMatchAll0031
     * @tc.desc Lookahead assertion on mixed ASCII/Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a𐐀b𐐁c";
      const regex = new RegExp('[a-z](?=𐐀)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0036
     * @tc.name testRegMatchAll0036
     * @tc.desc Long ASCII string global match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a".repeat(1000);
      const regex = new RegExp('a', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0037
     * @tc.name testRegMatchAll0037
     * @tc.desc Long ASCII string with capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "b".repeat(500) + "c";
      const regex = new RegExp('(b)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(500);
      expect(result[0][1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0038
     * @tc.name testRegMatchAll0038
     * @tc.desc Zero-width assertion on long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x".repeat(200);
      const regex = new RegExp('(?=x)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0039
     * @tc.name testRegMatchAll0039
     * @tc.desc Long Unicode string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐀".repeat(50);
      const regex = new RegExp('[\\u{10400}]', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0040
     * @tc.name testRegMatchAll0040
     * @tc.desc Long Unicode string with capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "𐐀𐐁𐐂𐐃".repeat(10);
      const regex = new RegExp('([\\u{10400}-\\u{10403}])', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(40);
      expect(result[0][1]).assertEqual("𐐀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0041
     * @tc.name testRegMatchAll0041
     * @tc.desc Basic regex without capture group: verify global match iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc abc";
      const regex: RegExp = new RegExp('abc', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual("abc");
      expect(result[1][0]).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0042
     * @tc.name testRegMatchAll0042
     * @tc.desc Single capturing group: verify captured content in each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('([a-z])\\d', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual("a1");
      expect(result[0][1]).assertEqual("a");
      expect(result[1][0]).assertEqual("b2");
      expect(result[1][1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0043
     * @tc.name testRegMatchAll0043
     * @tc.desc Multiple capturing groups: verify group order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('([a-z])(\\d)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual("a1");
      expect(result[0][1]).assertEqual("a");
      expect(result[0][2]).assertEqual("1");
      expect(result[1][0]).assertEqual("b2");
      expect(result[1][1]).assertEqual("b");
      expect(result[1][2]).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0044
     * @tc.name testRegMatchAll0044
     * @tc.desc Empty capturing group: verify undefined insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(a)?b', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(1);
      expect(result[0][0]).assertEqual("ab");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0045
     * @tc.name testRegMatchAll0045
     * @tc.desc Nested capturing group: verify nested insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp = new RegExp('((a)(b)?)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(1);
      expect(result[0][0]).assertEqual("ab");
      expect(result[0][1]).assertEqual("ab");
      expect(result[0][2]).assertEqual("a");
      expect(result[0][3]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0046
     * @tc.name testRegMatchAll0046
     * @tc.desc Optional capturing group: unmatched returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "b";
      const regex: RegExp = new RegExp('(a)?b', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(1);
      expect(result[0][0]).assertEqual("b");
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0047
     * @tc.name testRegMatchAll0047
     * @tc.desc Single named capturing group: verify groups property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('(?<letter>[a-z])\\d', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(2);
      expect(result[0].groups?.['letter']).assertEqual("a");
      expect(result[1].groups?.['letter']).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0048
     * @tc.name testRegMatchAll0048
     * @tc.desc Named + anonymous capturing groups: verify insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1y2";
      const regex: RegExp = new RegExp('(?<letter>[a-z])(\\d)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("x1");
      expect(result[0][2]).assertEqual("1");
      expect(result[0].groups?.['letter']).assertEqual("x");
      expect(result[1][0]).assertEqual("y2");
      expect(result[1][2]).assertEqual("2");
      expect(result[1].groups?.['letter']).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0049
     * @tc.name testRegMatchAll0049
     * @tc.desc Named capturing unmatched: insertion undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1b";
      const regex: RegExp = new RegExp('(?<letter>[a-z])?b', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['letter']).assertEqual(undefined);
      expect(result[0][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0050
     * @tc.name testRegMatchAll0050
     * @tc.desc Multi named capturing groups nested: verify nested insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(?<x>a)(?<y>b)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("ab");
      expect(result[0].groups?.['x']).assertEqual("a");
      expect(result[0].groups?.['y']).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0051
     * @tc.name testRegMatchAll0051
     * @tc.desc Positive lookahead: verify zero-width match positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2";
      const regex: RegExp = new RegExp('\\d(?=a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0052
     * @tc.name testRegMatchAll0052
     * @tc.desc Positive lookbehind: verify zero-width match positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?<=1)a', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0053
     * @tc.name testRegMatchAll0053
     * @tc.desc Lookahead + lookbehind combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2";
      const regex: RegExp = new RegExp('(?<=1)a(?=2)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0054
     * @tc.name testRegMatchAll0054
     * @tc.desc Zero-width assertion + capturing group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('((?<=1)a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0055
     * @tc.name testRegMatchAll0055
     * @tc.desc Zero-width assertion + named capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?<x>(?<=1)a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("a");
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0056
     * @tc.name testRegMatchAll0056
     * @tc.desc Negative lookahead: unmatched positions ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('a(?!c)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0057
     * @tc.name testRegMatchAll0057
     * @tc.desc Negative lookbehind: unmatched positions ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(?<!x)b', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0058
     * @tc.name testRegMatchAll0058
     * @tc.desc Capturing group + zero-width lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(\\d)(?=a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("1");
      expect(result[0][1]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0059
     * @tc.name testRegMatchAll0059
     * @tc.desc Capturing group + zero-width lookbehind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?<=1)(a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0060
     * @tc.name testRegMatchAll0060
     * @tc.desc Named capturing + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?<x>(?<=1)a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("a");
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0061
     * @tc.name testRegMatchAll0061
     * @tc.desc Named capturing + zero-width assertion: verify named capture with assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?<x>(?<=1)a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("a");
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0062
     * @tc.name testRegMatchAll0062
     * @tc.desc Capturing group + quantifier: empty match inserts undefined or empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a";
      const regex: RegExp = new RegExp('(b)?', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0063
     * @tc.name testRegMatchAll0063
     * @tc.desc Zero-width assertion + optional group: verify iterator position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('(?=(a)?)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0064
     * @tc.name testRegMatchAll0064
     * @tc.desc Match start of string ^: verify first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp =new RegExp('^a', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0065
     * @tc.name testRegMatchAll0065
     * @tc.desc Match end of string $: verify tail empty insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('b$', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0066
     * @tc.name testRegMatchAll0066
     * @tc.desc Multiline mode m + ^: match start of each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb";
      const regex: RegExp = new RegExp('^.', 'gm');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[1][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0067
     * @tc.name testRegMatchAll0067
     * @tc.desc Multiline mode m + $: match end of each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a\nb";
      const regex: RegExp = new RegExp('.$', 'gm');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[1][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0068
     * @tc.name testRegMatchAll0068
     * @tc.desc Capturing group + anchor combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp = new RegExp('^(a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0069
     * @tc.name testRegMatchAll0069
     * @tc.desc Match empty string /()?/: consecutive zero-width matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('()?', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0071
     * @tc.name testRegMatchAll0071
     * @tc.desc Multi-layer nested capture + zero-width assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('((?<=1)(a))', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0072
     * @tc.name testRegMatchAll0072
     * @tc.desc Optional group + lookahead: verify insertion in iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp =new RegExp('(\\d)?(?=a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("1");
      expect(result[0][1]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0073
     * @tc.name testRegMatchAll0073
     * @tc.desc Capturing group + Unicode character (emoji)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a😀b";
      const regex: RegExp = new RegExp('(.)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[1][0]).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0074
     * @tc.name testRegMatchAll0074
     * @tc.desc Consecutive global matches: verify iterator returns different matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp =new RegExp('\\w', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[1][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0075
     * @tc.name testRegMatchAll0075
     * @tc.desc No match: iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex: RegExp = new RegExp('x', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0076
     * @tc.name testRegMatchAll0076
     * @tc.desc Zero-width assertion + global match: verify iterator returns each match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(?=\\w)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0077
     * @tc.name testRegMatchAll0077
     * @tc.desc Capturing group + global match: each element contains capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('([a-z])\\d', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("a");
      expect(result[1][1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0078
     * @tc.name testRegMatchAll0078
     * @tc.desc Named capture + global match: verify groups property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1y2";
      const regex: RegExp = new RegExp('(?<l>[a-z])\\d', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['l']).assertEqual("x");
      expect(result[1].groups?.['l']).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0079
     * @tc.name testRegMatchAll0079
     * @tc.desc Multiple capturing groups + global match: order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('([a-z])(\\d)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("a");
      expect(result[0][2]).assertEqual("1");
      expect(result[1][1]).assertEqual("b");
      expect(result[1][2]).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0080
     * @tc.name testRegMatchAll0080
     * @tc.desc Optional capturing + global match: unmatched returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('([c])?', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0081
     * @tc.name testRegMatchAll0081
     * @tc.desc Unicode character + capturing group: verify surrogate pair matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𐐀a";
      const regex: RegExp = new RegExp('(.)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("𐐀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0082
     * @tc.name testRegMatchAll0082
     * @tc.desc Emoji + capturing group: verify multi-codepoint character matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a😀b";
      const regex: RegExp = new RegExp('(.)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[1][0]).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0083
     * @tc.name testRegMatchAll0083
     * @tc.desc Unicode + zero-width assertion: verify assertion position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "𐐀a";
      const regex: RegExp =new RegExp('(?=a)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0084
     * @tc.name testRegMatchAll0084
     * @tc.desc Named capturing + Unicode: verify groups property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀a";
      const regex: RegExp = new RegExp('(?<x>.)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0085
     * @tc.name testRegMatchAll0085
     * @tc.desc Optional group + Unicode: unmatched returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀";
      const regex: RegExp = new RegExp('(b)?', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0086
     * @tc.name testRegMatchAll0086
     * @tc.desc Multi-layer nested capture + global match: verify each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex: RegExp = new RegExp('((.)\\d)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("a1");
      expect(result[0][2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0087
     * @tc.name testRegMatchAll0087
     * @tc.desc Capturing group + lookahead + lookbehind: combine iterator elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a2";
      const regex: RegExp = new RegExp('(?<=1)(a)(?=2)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0088
     * @tc.name testRegMatchAll0088
     * @tc.desc Named capturing + zero-width assertion + Unicode: iterator correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀a";
      const regex: RegExp = new RegExp('(?<x>(?<=😀).)', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0089
     * @tc.name testRegMatchAll0089
     * @tc.desc Capturing group + quantifier + global match: iterator each element capture count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex: RegExp = new RegExp('(a)+', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("aaa");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0093
     * @tc.name testRegMatchAll0093
     * @tc.desc Lookbehind + capturing group + multi-layer nesting: iterator results as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "1a";
      const regex: RegExp = new RegExp('((?<=1)a)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0095
     * @tc.name testRegMatchAll0095
     * @tc.desc Negative lookbehind + capturing group: iterator excludes unmatched positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(?<!x)(b)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0096
     * @tc.name testRegMatchAll0096
     * @tc.desc Capturing group + empty string match: iterator element contains empty string and capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a";
      const regex: RegExp = new RegExp('(b)?', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0097
     * @tc.name testRegMatchAll0097
     * @tc.desc Zero-width assertion + empty capture group + global
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a";
      const regex: RegExp = new RegExp('((?=b))', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0098
     * @tc.name testRegMatchAll0098
     * @tc.desc Named capturing + optional group + multi-layer nesting: iterator groups correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ab";
      const regex: RegExp = new RegExp('(?<x>(a)?)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0].groups?.['x']).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0099
     * @tc.name testRegMatchAll0099
     * @tc.desc Multiple capturing groups + quantifier + global: iterator preserves capture order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "aaab";
      const regex: RegExp = new RegExp('((a)+)', 'g');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][1]).assertEqual("aaa");
      expect(result[0][2]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_0100
     * @tc.name testRegMatchAll0100
     * @tc.desc Multi-layer nested capturing + zero-width assertion + Unicode + global match: iterator covers complex scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegMatchAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀a";
      const regex: RegExp = new RegExp('((?<=😀)(.))', 'gu');
      const result = Array.from(str.matchAll(regex));
      expect(result[0][0]).assertEqual("a");
      expect(result[0][1]).assertEqual("a");
    });
  });
}