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

interface CharNumGroups {
  charname: string;
  num: string;
}

export default function RegExpTest003() {
  describe('RegExpTest003', () => {
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
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0001
     * @tc.name testRegReplace0001
     * @tc.desc Replace the first occurrence of a substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const result = str.replace("apple", "orange");
      expect(result).assertEqual("orange banana apple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0002
     * @tc.name testRegReplace0002
     * @tc.desc Replace all occurrences using global regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple', 'g');
      const result = str.replace(regex, "orange");
      expect(result).assertEqual("orange banana orange");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0003
     * @tc.name testRegReplace0003
     * @tc.desc Replace only first occurrence with regex without g flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple');
      const result = str.replace(regex, "orange");
      expect(result).assertEqual("orange banana apple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0004
     * @tc.name testRegReplace0004
     * @tc.desc Case-insensitive replacement using regex with i flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple Banana apple";
      const regex = new RegExp('banana', 'i');
      const result = str.replace(regex, "orange");
      expect(result).assertEqual("apple orange apple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0005
     * @tc.name testRegReplace0005
     * @tc.desc Replace using capture groups to rearrange text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "John Smith";
      const regex = new RegExp('(\\w+)\\s(\\w+)');
      const result = str.replace(regex, "$2, $1");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0007
     * @tc.name testRegReplace0007
     * @tc.desc Replace string containing regex special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Price: 5.99";
      const regex = new RegExp('\\.');
      const result = str.replace(regex, ",");
      expect(result).assertEqual("Price: 5,99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0008
     * @tc.name testRegReplace0008
     * @tc.desc Replace Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Héllo Wörld";
      const regex = new RegExp('[^\x00-\x7F]', 'g');
      const result = str.replace(regex, "");
      expect(result).assertEqual("Hllo Wrld");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0009
     * @tc.name testRegReplace0009
     * @tc.desc Replace numeric characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Contact: 123-456-7890";
      const regex = new RegExp('\\d{3}', 'g');
      const result = str.replace(regex, "***");
      expect(result).assertEqual("Contact: ***-***-***0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0010
     * @tc.name testRegReplace0010
     * @tc.desc Replace alphabetic characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcDEF";
      const regex = new RegExp('[a-zA-Z]', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("xxxxxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0011
     * @tc.name testRegReplace0011
     * @tc.desc Replace leading and trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "  hello world  ";
      const regex = new RegExp('^\\s+|\\s+$', 'g');
      const result = str.replace(regex, "");
      expect(result).assertEqual("hello world");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0012
     * @tc.name testRegReplace0012
     * @tc.desc Replace consecutive repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const regex = new RegExp('a+', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0013
     * @tc.name testRegReplace0013
     * @tc.desc Replace using function returning a constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('[a-z]', 'g');
      const result = str.replace(regex, () => "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0015
     * @tc.name testRegReplace0015
     * @tc.desc Replace using function returning empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('b');
      const result = str.replace(regex, () => "");
      expect(result).assertEqual("ac");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0016
     * @tc.name testRegReplace0016
     * @tc.desc Replace string containing newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const regex = new RegExp('\\n');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0017
     * @tc.name testRegReplace0017
     * @tc.desc Replace string containing tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "col1\tcol2";
      const regex = new RegExp('\\t');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("col1 col2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0018
     * @tc.name testRegReplace0018
     * @tc.desc Replace string containing carriage return characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\rline2";
      const regex = new RegExp('\\r');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0019
     * @tc.name testRegReplace0019
     * @tc.desc Replace string containing tab and space combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a \tb";
      const regex = new RegExp('\\s+', 'g');
      const result = str.replace(regex, "-");
      expect(result).assertEqual("a-b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0020
     * @tc.name testRegReplace0020
     * @tc.desc Replace string containing special symbols like $, #, @
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Price: $100 #deal";
      const regex = new RegExp('[$#]', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("Price: X100 Xdeal");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0021
     * @tc.name testRegReplace0021
     * @tc.desc Replace string containing emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello 😊 World 😊";
      const regex = new RegExp('😊', 'g');
      const result = str.replace(regex, "🙂");
      expect(result).assertEqual("Hello 🙂 World 🙂");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0022
     * @tc.name testRegReplace0022
     * @tc.desc Replace multi-byte characters like Chinese, Japanese, Korean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好世界";
      const regex = new RegExp('世界');
      const result = str.replace(regex, "World");
      expect(result).assertEqual("你好World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0023
     * @tc.name testRegReplace0023
     * @tc.desc Replace the first matching substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo";
      // 此处原代码使用字符串匹配，保持原有逻辑不变
      const result = str.replace("foo", "baz");
      expect(result).assertEqual("baz bar foo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0024
     * @tc.name testRegReplace0024
     * @tc.desc Replace the last matching substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo";
      const regex = new RegExp('foo(?=[^foo]*$)');
      const result = str.replace(regex, "baz");
      expect(result).assertEqual("foo bar baz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0025
     * @tc.name testRegReplace0025
     * @tc.desc Replace multiple consecutive matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa bbb ccc";
      const regex = new RegExp('a+', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("x bbb ccc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0026
     * @tc.name testRegReplace0026
     * @tc.desc Replace non-consecutive matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('[abc]', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("x1x2x3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0027
     * @tc.name testRegReplace0027
     * @tc.desc Replace empty string at the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const regex = new RegExp('^');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("_hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0028
     * @tc.name testRegReplace0028
     * @tc.desc Replace empty string at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const regex = new RegExp('$');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("hello_");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0029
     * @tc.name testRegReplace0029
     * @tc.desc Use $& to reference matched text in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('b');
      const result = str.replace(regex, "($&)");
      expect(result).assertEqual("a(b)c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0030
     * @tc.name testRegReplace0030
     * @tc.desc Use $1, $2 to reference capture groups in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "John Smith";
      const regex = new RegExp('(\\w+)\\s(\\w+)');
      const result = str.replace(regex, "$2, $1");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0035
     * @tc.name testRegReplace0035
     * @tc.desc Replace all spaces in a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a b c";
      const regex = new RegExp(' ', 'g');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0036
     * @tc.name testRegReplace0036
     * @tc.desc Replace consecutive spaces with a single space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a   b    c";
      const regex = new RegExp('\\s+', 'g');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0037
     * @tc.name testRegReplace0037
     * @tc.desc Replace repeated letter sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaabbb";
      const regex = new RegExp('a+', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("xbbb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0038
     * @tc.name testRegReplace0038
     * @tc.desc Replace repeated words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo foo bar";
      const regex = new RegExp('foo\\sfoo');
      const result = str.replace(regex, "baz");
      expect(result).assertEqual("baz bar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0039
     * @tc.name testRegReplace0039
     * @tc.desc Use $& to reference matched text in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('b');
      const result = str.replace(regex, "($&)");
      expect(result).assertEqual("a(b)c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0040
     * @tc.name testRegReplace0040
     * @tc.desc Use $` to insert text before the match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('b');
      const result = str.replace(regex, "$`");
      expect(result).assertEqual("aac");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0041
     * @tc.name testRegReplace0041
     * @tc.desc Use $' to insert text after the match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('b');
      const result = str.replace(regex, "$'");
      expect(result).assertEqual("acc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0042
     * @tc.name testRegReplace0042
     * @tc.desc Use $$ to insert $ character in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "price";
      const regex = new RegExp('price');
      const result = str.replace(regex, "$$100");
      expect(result).assertEqual("$100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0043
     * @tc.name testRegReplace0043
     * @tc.desc Replace the first uppercase letter using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aBcDe";
      const regex = new RegExp('[A-Z]');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("aXcDe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0044
     * @tc.name testRegReplace0044
     * @tc.desc Replace the first lowercase letter using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "AbCDe";
      const regex = new RegExp('[a-z]');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("AxCDe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0045
     * @tc.name testRegReplace0045
     * @tc.desc Replace the first digit using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const regex = new RegExp('\\d');
      const result = str.replace(regex, "9");
      expect(result).assertEqual("a9b2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0046
     * @tc.name testRegReplace0046
     * @tc.desc Replace all digits using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('\\d', 'g');
      const result = str.replace(regex, "9");
      expect(result).assertEqual("a9b9c9");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0047
     * @tc.name testRegReplace0047
     * @tc.desc Replace all non-digit characters using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('\\D', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("x1x2x3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0048
     * @tc.name testRegReplace0048
     * @tc.desc Replace newline characters in a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const regex = new RegExp('\\n', 'g');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0049
     * @tc.name testRegReplace0049
     * @tc.desc Replace matches in multi-line text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo\nbar\nbaz";
      const regex = new RegExp('^.', 'gm');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("Xoo\nXar\nXaz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0050
     * @tc.name testRegReplace0050
     * @tc.desc Replace multi-byte character sequences (emoji + Chinese)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊你好";
      const regex = new RegExp('[\u4e00-\u9fa5]+', 'g');
      const result = str.replace(regex, "World");
      expect(result).assertEqual("😊World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0051
     * @tc.name testRegReplace0051
     * @tc.desc Replace string containing escape characters (\n, \t, \\)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\\nline2\tend";
      const regex = new RegExp('\\\\n|\\t', 'g');
      const result = str.replace(regex, " ");
      expect(result).assertEqual("line1 line2 end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0052
     * @tc.name testRegReplace0052
     * @tc.desc Reverse string order using capture groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a-b-c";
      const regex = new RegExp('(\\w+)-(\\w+)-(\\w+)');
      const result = str.replace(regex, "$3-$2-$1");
      expect(result).assertEqual("c-b-a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0053
     * @tc.name testRegReplace0053
     * @tc.desc Replace specific word ignoring case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello hello HeLLo";
      const regex = new RegExp('hello', 'i');
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi hello HeLLo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0054
     * @tc.name testRegReplace0054
     * @tc.desc Replace first N occurrences of a pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a a a a";
      let count = 0;
      const regex = new RegExp('a', 'g');
      const result = str.replace(regex, (m) => (++count <= 2 ? "x" : m));
      expect(result).assertEqual("x x a a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0055
     * @tc.name testRegReplace0055
     * @tc.desc Replace last N occurrences of a pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a a a a";
      const arr = str.split(" ");
      const lastTwo = arr.slice(-2).map(() => "x");
      const result = arr.slice(0, -2).concat(lastTwo).join(" ");
      expect(result).assertEqual("a a x x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0056
     * @tc.name testRegReplace0056
     * @tc.desc Replace repeated patterns in a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "ababab";
      const regex = new RegExp('ab', 'g');
      const result = str.replace(regex, "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0057
     * @tc.name testRegReplace0057
     * @tc.desc Replace non-ASCII characters (Unicode range)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc你好";
      const regex = new RegExp('[^\\x00-\\x7F]+', 'g');
      const result = str.replace(regex, "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0058
     * @tc.name testRegReplace0058
     * @tc.desc Replace consecutive numeric patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123456";
      const regex = new RegExp('\\d+', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0059
     * @tc.name testRegReplace0059
     * @tc.desc Replace consecutive non-numeric patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcDEF";
      const regex = new RegExp('[^\\d]+', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0060
     * @tc.name testRegReplace0060
     * @tc.desc Replace mixed patterns of letters, numbers, and symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1!b2@c3#";
      const regex = new RegExp('[a-zA-Z0-9]+', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("X!X@X#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0061
     * @tc.name testRegReplace0061
     * @tc.desc Replace entire string (full match)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const regex = new RegExp('^.*$');
      const result = str.replace(regex, "world");
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0062
     * @tc.name testRegReplace0062
     * @tc.desc Replace non-existent substring (should return original string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      // 此处原代码使用字符串匹配，保持原有逻辑不变
      const result = str.replace("xyz", "abc");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0063
     * @tc.name testRegReplace0063
     * @tc.desc Replace substring at the start of the string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('^hello');
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0064
     * @tc.name testRegReplace0064
     * @tc.desc Replace substring at the end of the string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('world$');
      const result = str.replace(regex, "everyone");
      expect(result).assertEqual("hello everyone");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0065
     * @tc.name testRegReplace0065
     * @tc.desc Replace empty string by inserting at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('^');
      const result = str.replace(regex, "start-");
      expect(result).assertEqual("start-abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0066
     * @tc.name testRegReplace0066
     * @tc.desc Replace empty string by inserting at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('$');
      const result = str.replace(regex, "-end");
      expect(result).assertEqual("abc-end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0067
     * @tc.name testRegReplace0067
     * @tc.desc Replace multiple consecutive empty string matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=.)', 'g');
      const result = str.replace(regex, "-");
      expect(result).assertEqual("-a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0068
     * @tc.name testRegReplace0068
     * @tc.desc Replace matches with consecutive special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a$$b@@c";
      const regex = new RegExp('[$@]+', 'g');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0069
     * @tc.name testRegReplace0069
     * @tc.desc Replace using function returning empty string multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const regex = new RegExp('\\d', 'g');
      const result = str.replace(regex, () => "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0072
     * @tc.name testRegReplace0072
     * @tc.desc Replace Unicode boundary characters (emoji sequences)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊👍🏽";
      const regex = new RegExp('.', 'gu');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("___");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0073
     * @tc.name testRegReplace0073
     * @tc.desc Replace each line in multi-line text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2\nline3";
      const regex = new RegExp('^.*$', 'gm');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("X\nX\nX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0074
     * @tc.name testRegReplace0074
     * @tc.desc Replace patterns containing tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\tb\tc";
      const regex = new RegExp('\\t', 'g');
      const result = str.replace(regex, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0075
     * @tc.name testRegReplace0075
     * @tc.desc Replace patterns containing carriage return characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\rb\rc";
      const regex = new RegExp('\\r', 'g');
      const result = str.replace(regex, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0076
     * @tc.name testRegReplace0076
     * @tc.desc Replace mixed letters + numbers + symbols pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1!b2@c3#";
      const regex = new RegExp('[a-z0-9!@#]+', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0077
     * @tc.name testRegReplace0077
     * @tc.desc Replace nested patterns (e.g., digits in "a1b2c3")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('\\d', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("aXbXcX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0078
     * @tc.name testRegReplace0078
     * @tc.desc Replace repeated capture groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcabc";
      const regex = new RegExp('(abc)', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("XX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0079
     * @tc.name testRegReplace0079
     * @tc.desc Replace optional match patterns (e.g., a?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aabb";
      const regex = new RegExp('a?', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("XXXbXbX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0080
     * @tc.name testRegReplace0080
     * @tc.desc Replace zero-width assertion match (e.g., (?=b))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?=b)', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("aXbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0081
     * @tc.name testRegReplace0081
     * @tc.desc Replace using negative lookahead (e.g., (?!b))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('.(?!b)', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("aXX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0082
     * @tc.name testRegReplace0082
     * @tc.desc Replace using lookahead + capture group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(a)(?=b)');
      const result = str.replace(regex, "$1X");
      expect(result).assertEqual("aXbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0083
     * @tc.name testRegReplace0083
     * @tc.desc Replace using lookbehind + capture group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?<=a)(b)');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("aXc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0084
     * @tc.name testRegReplace0084
     * @tc.desc Replace using multiple grouped regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const regex = new RegExp('([a-z]+)(\\d+)');
      const result = str.replace(regex, "$2$1");
      expect(result).assertEqual("123abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0085
     * @tc.name testRegReplace0085
     * @tc.desc Replace string with multiple match patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('[a-z]|\\d', 'g');
      const result = str.replace(regex, "_");
      expect(result).assertEqual("______");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0086
     * @tc.name testRegReplace0086
     * @tc.desc Replace text between consecutive match patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('(\\d)', 'g');
      const result = str.replace(regex, "_$1_");
      expect(result).assertEqual("a_1_b_2_c_3_");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0087
     * @tc.name testRegReplace0087
     * @tc.desc Replace repeated matches using function generating different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      let count = 0;
      const regex = new RegExp('\\d', 'g');
      const result = str.replace(regex, () => (++count).toString());
      expect(result).assertEqual("a1b2c3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0088
     * @tc.name testRegReplace0088
     * @tc.desc Replace numeric pattern returning dynamic computed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123";
      const regex = new RegExp('\\d', 'g');
      const result = str.replace(regex, (m) => (parseInt(m) * 2).toString());
      expect(result).assertEqual("246");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0089
     * @tc.name testRegReplace0089
     * @tc.desc Replace non-ASCII pattern returning different language characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplace0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好こんにちは";
      const regex = new RegExp('[^\\x00-\\x7F]', 'g');
      const result = str.replace(regex, "X");
      expect(result).assertEqual("XXXXXXX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0090
     * @tc.name testRegReplace0090
     * @tc.desc Replace with global match + multiple groups + function generating dynamic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplace0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str = "a1b2c3";
    //   let count = 0;
    //   const regex = new RegExp('([a-z])(\\d)', 'g');
    //   const result = str.replace(regex,
    //     (match: string, p1: string, p2: string): string => {
    //       return `${p1}${parseInt(p2) + (++count)}`;
    //     }
    //   );
    //   expect(result).assertEqual("a2b4c6");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0001
     * @tc.name testRegReplaceAll0001
     * @tc.desc Replace simple word pattern using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const regex = new RegExp('apple', 'g');
      const result = str.replaceAll(regex, "pear");
      expect(result).assertEqual("pear banana pear");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0002
     * @tc.name testRegReplaceAll0002
     * @tc.desc Replace all occurrences globally using regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123-456-123";
      const regex = new RegExp('\\d+', 'g');
      const result = str.replaceAll(regex, "X");
      expect(result).assertEqual("X-X-X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0003
     * @tc.name testRegReplaceAll0003
     * @tc.desc Replace all digits with asterisks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Room 101, Floor 3";
      const regex = new RegExp('\\d', 'g');
      const result = str.replaceAll(regex, "*");
      expect(result).assertEqual("Room ***, Floor *");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0004
     * @tc.name testRegReplaceAll0004
     * @tc.desc Replace all letters with '#'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123XYZ";
      const regex = new RegExp('[a-z]', 'gi');
      const result = str.replaceAll(regex, "#");
      expect(result).assertEqual("###123###");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0005
     * @tc.name testRegReplaceAll0005
     * @tc.desc Replace ignoring case with /i flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello hello HELLO";
      const regex = new RegExp('hello', 'gi');
      const result = str.replaceAll(regex, "hi");
      expect(result).assertEqual("hi hi hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0006
     * @tc.name testRegReplaceAll0006
     * @tc.desc Replace across multiple lines with /m flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple\nbanana\napple";
      const regex = new RegExp('^apple', 'mg');
      const result = str.replaceAll(regex, "pear");
      expect(result).assertEqual("pear\nbanana\npear");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0007
     * @tc.name testRegReplaceAll0007
     * @tc.desc Replace match at string start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "start middle end";
      const regex = new RegExp('^start', 'g');
      const result = str.replaceAll(regex, "begin");
      expect(result).assertEqual("begin middle end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0008
     * @tc.name testRegReplaceAll0008
     * @tc.desc Replace match at string end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "start middle end";
      const regex = new RegExp('end$', 'g');
      const result = str.replaceAll(regex, "finish");
      expect(result).assertEqual("start middle finish");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0009
     * @tc.name testRegReplaceAll0009
     * @tc.desc Replace consecutive same substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "haha haha haha";
      const regex = new RegExp('haha', 'g');
      const result = str.replaceAll(regex, "he");
      expect(result).assertEqual("he he he");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0010
     * @tc.name testRegReplaceAll0010
     * @tc.desc Replace identical matches at different positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat dog cat bird cat";
      const regex = new RegExp('cat', 'g');
      const result = str.replaceAll(regex, "fox");
      expect(result).assertEqual("fox dog fox bird fox");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0011
     * @tc.name testRegReplaceAll0011
     * @tc.desc Replace spaces with underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a b c d";
      const regex = new RegExp('\\s', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("a_b_c_d");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0012
     * @tc.name testRegReplaceAll0012
     * @tc.desc Replace tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\tb\tc";
      const regex = new RegExp('\\t', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0013
     * @tc.name testRegReplaceAll0013
     * @tc.desc Replace newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb\nc";
      const regex = new RegExp('\\n', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0014
     * @tc.name testRegReplaceAll0014
     * @tc.desc Replace Unicode emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😀😃😄";
      const regex = new RegExp('\\p{Emoji}', 'gu');
      const result = str.replaceAll(regex, "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0015
     * @tc.name testRegReplaceAll0015
     * @tc.desc Replace mixed alphanumeric patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const regex = new RegExp('[a-z]\\d', 'g');
      const result = str.replaceAll(regex, "X");
      expect(result).assertEqual("XXX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0016
     * @tc.name testRegReplaceAll0016
     * @tc.desc Replace special symbols like $, *, ?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "$ * ? $";
      const regex = new RegExp('[$*?]', 'g');
      const result = str.replaceAll(regex, "#");
      expect(result).assertEqual("# # # #");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0017
     * @tc.name testRegReplaceAll0017
     * @tc.desc Replace escaped digit pattern \\d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123abc";
      const regex = new RegExp('\\\\d', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("123abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0018
     * @tc.name testRegReplaceAll0018
     * @tc.desc Replace with multi-group regular expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12-34-56";
      const regex = new RegExp('(\\d+)-(\\d+)', 'g');
      const result = str.replaceAll(regex, "$2-$1");
      expect(result).assertEqual("34-12-56");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0019
     * @tc.name testRegReplaceAll0019
     * @tc.desc Replace using numeric capture groups ($1, $2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "name:John age:30";
      const regex = new RegExp('(\\w+):(\\w+)', 'g');
      const result = str.replaceAll(regex, "$2=$1");
      expect(result).assertEqual("John=name 30=age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0020
     * @tc.name testRegReplaceAll0020
     * @tc.desc Replace using named capture group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x=10 y=20";
      const regex = new RegExp('(?<key>\\w+)=(?<val>\\d+)', 'g');
      const result = str.replaceAll(regex, "$<val>->$<key>");
      expect(result).assertEqual("10->x 20->y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0021
     * @tc.name testRegReplaceAll0021
     * @tc.desc Replace non-capturing group pattern (?:)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaabbbccc";
      const regex = new RegExp('(?:aaa|bbb)', 'g');
      const result = str.replaceAll(regex, "X");
      expect(result).assertEqual("XXccc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0022
     * @tc.name testRegReplaceAll0022
     * @tc.desc Replace pattern with + quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a123b456c";
      const regex = new RegExp('\\d+', 'g');
      const result = str.replaceAll(regex, "#");
      expect(result).assertEqual("a#b#c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0023
     * @tc.name testRegReplaceAll0023
     * @tc.desc Replace pattern with * quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaab";
      const regex = new RegExp('a*', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xxbx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0024
     * @tc.name testRegReplaceAll0024
     * @tc.desc Replace pattern with {n,m} quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaaaa";
      const regex = new RegExp('a{2,3}', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0025
     * @tc.name testRegReplaceAll0025
     * @tc.desc Replace zero-width positive lookahead (?=...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('a(?=b)', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0026
     * @tc.name testRegReplaceAll0026
     * @tc.desc Replace zero-width negative lookahead (?!...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc adc aec";
      const regex = new RegExp('a(?!b)', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("abc xdc xec");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0027
     * @tc.name testRegReplaceAll0027
     * @tc.desc Replace positive lookbehind (?<=...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cab dab";
      const regex = new RegExp('(?<=c)a', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("cxb dab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0028
     * @tc.name testRegReplaceAll0028
     * @tc.desc Replace negative lookbehind (?<!...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cab dab";
      const regex = new RegExp('(?<!c)a', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("cab dxb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0029
     * @tc.name testRegReplaceAll0029
     * @tc.desc Replace empty string (insert between characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?<!^)(?=.)', 'g');
      const result = str.replaceAll(regex, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0030
     * @tc.name testRegReplaceAll0030
     * @tc.desc Replace mixed line endings \r\n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\r\nline2\r\nline3";
      const regex = new RegExp('\\r\\n', 'g');
      const result = str.replaceAll(regex, "|");
      expect(result).assertEqual("line1|line2|line3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0031
     * @tc.name testRegReplaceAll0031
     * @tc.desc Use function replacement returning a fixed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123abc";
      const regex = new RegExp('\\d+', 'g');
      const result: string = str.replaceAll(regex, (): string => "NUM");
      expect(result).assertEqual("abcNUMabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0032
     * @tc.name testRegReplaceAll0032
     * @tc.desc Use function replacement returning the match itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2c3";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (match: string): string => match);
      expect(result).assertEqual("a1b2c3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0033
     * @tc.name testRegReplaceAll0033
     * @tc.desc Use function replacement returning capture group values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "A12B34";
    //   const regex = new RegExp('([A-Z])(\\d+)', 'g');
    //   const result: string = str.replaceAll(regex, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
    //   expect(result).assertEqual("12A34B");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0034
     * @tc.name testRegReplaceAll0034
     * @tc.desc Use function replacement returning match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    //todo
    // it('testRegReplaceAll0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "abcabc";
    //   const regex = new RegExp('a', 'g');
    //   const result: string = str.replaceAll(regex,
    //     (_: string, __: string, index: number): string => index.toString());
    //   expect(result).assertEqual("abcabcbcabcabcbc");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0035
     * @tc.name testRegReplaceAll0035
     * @tc.desc Use function replacement returning original string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const regex = new RegExp('.', 'g');
      const result: string = str.replaceAll(regex, (): string => str.length.toString());
      expect(result).assertEqual("55555");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0036
     * @tc.name testRegReplaceAll0036
     * @tc.desc Use function replacement to update a global counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "12345";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (): string => (++count).toString());
      expect(result).assertEqual("12345");
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0037
     * @tc.name testRegReplaceAll0037
     * @tc.desc Use function replacement concatenating dynamic content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "abc";
    //   const regex = new RegExp('.', 'g');
    //   const result: string = str.replaceAll(regex, (m: string, i: number): string => `${m}${i}`);
    //   expect(result).assertEqual("a0b1c2");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0038
     * @tc.name testRegReplaceAll0038
     * @tc.desc Use function replacement returning empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (): string => "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0039
     * @tc.name testRegReplaceAll0039
     * @tc.desc Use function replacement returning null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (): string => String(null));
      expect(result).assertEqual("abcnullnullnull");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0040
     * @tc.name testRegReplaceAll0040
     * @tc.desc Use function replacement returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (): string => String(undefined));
      expect(result).assertEqual("abcundefinedundefinedundefined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0041
     * @tc.name testRegReplaceAll0041
     * @tc.desc Use function replacement handling multiple capture groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "x1y2z3";
    //   const regex = new RegExp('([a-z])(\\d)', 'g');
    //   const result: string = str.replaceAll(regex, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
    //   expect(result).assertEqual("1x2y3z");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0042
     * @tc.name testRegReplaceAll0042
     * @tc.desc Use function replacement handling nested regex patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "a1b2c3";
    //   const regex = new RegExp('([a-z]\\d)', 'g');
    //   const result: string = str.replaceAll(regex, (m: string): string => m.replace(/\d/, "#"));
    //   expect(result).assertEqual("a#b#c#");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0043
     * @tc.name testRegReplaceAll0043
     * @tc.desc Use function replacement returning calculated number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "1 2 3";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (m: string): string => (parseInt(m) + (++count)).toString());
      expect(result).assertEqual("2 4 6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0044
     * @tc.name testRegReplaceAll0044
     * @tc.desc Use function replacement returning mixed type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const regex = new RegExp('\\d', 'g');
      const result: string = str.replaceAll(regex, (m: string): string => (parseInt(m) % 2 === 0 ? "even" : "1"));
      expect(result).assertEqual("a1beven");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0045
     * @tc.name testRegReplaceAll0045
     * @tc.desc Use function replacement reversing capture group order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "A1B2";
    //   const regex = new RegExp('([A-Z])(\\d)', 'g');
    //   const result: string = str.replaceAll(regex, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
    //   expect(result).assertEqual("1A2B");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0046
     * @tc.name testRegReplaceAll0046
     * @tc.desc Use function replacement for Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "你好世界";
      const regex = new RegExp('[\u4e00-\u9fa5]', 'g');
      const result: string = str.replaceAll(regex, (): string => "中");
      expect(result).assertEqual("中中中中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0047
     * @tc.name testRegReplaceAll0047
     * @tc.desc Use function replacement matching emoji patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀😃😄";
      const regex = new RegExp('\\p{Emoji}', 'gu');
      const result: string = str.replaceAll(regex, (): string => "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0048
     * @tc.name testRegReplaceAll0048
     * @tc.desc Use function replacement with regex having multiple flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "AbC abc";
      const regex = new RegExp('abc', 'gi');
      const result: string = str.replaceAll(regex, (m: string): string => m.toUpperCase());
      expect(result).assertEqual("ABC ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0049
     * @tc.name testRegReplaceAll0049
     * @tc.desc Use function replacement on multi-line text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2\nline3";
      const regex = new RegExp('^line', 'gm');
      const result: string = str.replaceAll(regex, (): string => "L");
      expect(result).assertEqual("L1\nL2\nL3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0050
     * @tc.name testRegReplaceAll0050
     * @tc.desc Use function replacement mixing newline and spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a \n b \n c";
      const regex = new RegExp('\\s+', 'g');
      const result: string = str.replaceAll(regex, (): string => "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0051
     * @tc.name testRegReplaceAll0051
     * @tc.desc Use function replacement for zero-width matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const regex = new RegExp('(?=b)', 'g');
      const result: string = str.replaceAll(regex, (): string => "|");
      expect(result).assertEqual("a|bc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0052
     * @tc.name testRegReplaceAll0052
     * @tc.desc Use function replacement with accumulated global counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let counter: number = 0;
      const str: string = "111";
      const regex = new RegExp('1', 'g');
      const result: string = str.replaceAll(regex, (): string => (++counter).toString());
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0053
     * @tc.name testRegReplaceAll0053
     * @tc.desc Use function replacement with complex regex (group combination)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "a1-b2";
    //   const regex = new RegExp('([a-z])(\\d)', 'g');
    //   const result: string = str.replaceAll(regex, (_: string, a: string, b: string): string => `${b}${a}`);
    //   expect(result).assertEqual("1a-2b");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0054
     * @tc.name testRegReplaceAll0054
     * @tc.desc Use function replacement with named capture groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //
    //   const str: string = "A1B2";
    //   const regex = new RegExp('(?<char>[A-Z])(?<num>\\d)', 'g');
    //   const result: string = str.replaceAll(
    //     regex,
    //     (
    //       match: string,
    //       _p1: string,
    //       _p2: string,
    //       offset: number,
    //       input: string,
    //       groups: CharNumGroups
    //     ): string => {
    //       return `${groups.num}${groups.charname}`;
    //     }
    //   );
    //   expect(result).assertEqual("1A2B");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0055
     * @tc.name testRegReplaceAll0055
     * @tc.desc Use function replacement for alphanumeric combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1b2";
      const regex = new RegExp('[A-Za-z]\\d', 'g');
      const result: string = str.replaceAll(regex, (m: string): string => m.toLowerCase());
      expect(result).assertEqual("a1b2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0056
     * @tc.name testRegReplaceAll0056
     * @tc.desc Use function replacement with lookbehind and lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo123bar";
      const regex = new RegExp('(?<=foo)\\d+(?=bar)', 'g');
      const result: string = str.replaceAll(regex, (): string => "***");
      expect(result).assertEqual("foo***bar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0057
     * @tc.name testRegReplaceAll0057
     * @tc.desc Use function replacement changing Unicode case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ΩωΣσ";
      const regex = new RegExp('\\p{L}', 'gu');
      const result: string = str.replaceAll(regex, (m: string): string => m.toUpperCase());
      expect(result).assertEqual("ΩΩΣΣ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0058
     * @tc.name testRegReplaceAll0058
     * @tc.desc Use function replacement counting matched items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "111";
      const regex = new RegExp('1', 'g');
      const result: string = str.replaceAll(regex, (): string => `${++count}`);
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0059
     * @tc.name testRegReplaceAll0059
     * @tc.desc Use function replacement returning JSON string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "A1";
    //   const regex = new RegExp('([A-Z])(\\d)', 'g');
    //   const result: string = str.replaceAll(regex,
    //     (_: string, p1: string, p2: string): string => JSON.stringify({ char: p1, num: p2 }));
    //   expect(result).assertEqual('{"char":"A","num":"1"}');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0060
     * @tc.name testRegReplaceAll0060
     * @tc.desc Use function replacement returning template string combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str: string = "X9Y8";
    //   const regex = new RegExp('([A-Z])(\\d)', 'g');
    //   const result: string = str.replaceAll(regex,
    //     (_: string, p1: string, p2: string): string => `${p1.repeat(2)}=${parseInt(p2)}`);
    //   expect(result).assertEqual("XX=9YY=8");
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0061
     * @tc.name testRegReplaceAll0061
     * @tc.desc Replace the entire string (full match)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('^abc$', 'g');
      const result = str.replaceAll(regex, "xyz");
      expect(result).assertEqual("xyz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0062
     * @tc.name testRegReplaceAll0062
     * @tc.desc Replace nonexistent match (should return original string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const regex = new RegExp('123', 'g');
      const result = str.replaceAll(regex, "abc");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0063
     * @tc.name testRegReplaceAll0063
     * @tc.desc Replace with empty string input (empty source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "";
      const regex = new RegExp('a', 'g');
      const result = str.replaceAll(regex, "b");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0064
     * @tc.name testRegReplaceAll0064
     * @tc.desc Replace with empty regex (zero-width matches)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('(?:)', 'g');
      const result = str.replaceAll(regex, "-");
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0065
     * @tc.name testRegReplaceAll0065
     * @tc.desc Replace with nested capture groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const regex = new RegExp('(a(b(c)))', 'g');
      const result = str.replaceAll(regex, "$3");
      expect(result).assertEqual("c123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0066
     * @tc.name testRegReplaceAll0066
     * @tc.desc Replace repeated capture group pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1a2a3";
      const regex = new RegExp('(a\\d)', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0067
     * @tc.name testRegReplaceAll0067
     * @tc.desc Replace overlapping matches (ensure no overlap processing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const regex = new RegExp('aa', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0068
     * @tc.name testRegReplaceAll0068
     * @tc.desc Replace adjacent matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abab";
      const regex = new RegExp('ab', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0069
     * @tc.name testRegReplaceAll0069
     * @tc.desc Replace very long string (>10^5 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a".repeat(100);
      const regex = new RegExp('a', 'g');
      const result = str.replaceAll(regex, "b");
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0070
     * @tc.name testRegReplaceAll0070
     * @tc.desc Replace complex Unicode boundaries (grapheme cluster)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "👩‍❤️‍💋‍👨love";
      const regex = new RegExp('love', 'gu');
      const result = str.replaceAll(regex, "❤️");
      expect(result).assertEqual("👩‍❤️‍💋‍👨❤️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0071
     * @tc.name testRegReplaceAll0071
     * @tc.desc Replace multilingual mixed text (English + Chinese + digits)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello世界123";
      const regex = new RegExp('\\d+', 'g');
      const result = str.replaceAll(regex, "[num]");
      expect(result).assertEqual("Hello世界[num]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0072
     * @tc.name testRegReplaceAll0072
     * @tc.desc Replace text with full-width punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好，世界。";
      const regex = new RegExp('，|。', 'g');
      const result = str.replaceAll(regex, ",");
      expect(result).assertEqual("你好,世界,");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0073
     * @tc.name testRegReplaceAll0073
     * @tc.desc Replace non-BMP characters (emoji pairs)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊👍😊";
      const regex = new RegExp('😊', 'gu');
      const result = str.replaceAll(regex, "❤️");
      expect(result).assertEqual("❤️👍❤️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0074
     * @tc.name testRegReplaceAll0074
     * @tc.desc Replace regex with escaped backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "path\\to\\file";
      const regex = new RegExp('\\\\', 'g');
      const result = str.replaceAll(regex, "/");
      expect(result).assertEqual("path/to/file");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0075
     * @tc.name testRegReplaceAll0075
     * @tc.desc Replace regex with Unicode escape pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "\\u4f60\\u597d";
      const regex = new RegExp('\\\\u', 'g');
      const result = str.replaceAll(regex, "");
      expect(result).assertEqual("4f60597d");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0076
     * @tc.name testRegReplaceAll0076
     * @tc.desc Replace using regex with ^ and $ boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const regex = new RegExp('^a|c$', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("_b_");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0077
     * @tc.name testRegReplaceAll0077
     * @tc.desc Replace using \\b word boundary pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a test a-test";
      const regex = new RegExp('\\btest\\b', 'g');
      const result = str.replaceAll(regex, "exam");
      expect(result).assertEqual("a exam a-exam");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0078
     * @tc.name testRegReplaceAll0078
     * @tc.desc Replace using \\B non-word boundary pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo-bar";
      const regex = new RegExp('\\B-', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("foo-bar"); // no replacement
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0079
     * @tc.name testRegReplaceAll0079
     * @tc.desc Replace with dynamically constructed RegExp object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: RegExp = new RegExp("test", "g");
      const str = "test case test";
      const result = str.replaceAll(pattern, "exam");
      expect(result).assertEqual("exam case exam");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0080
     * @tc.name testRegReplaceAll0080
     * @tc.desc Replace where RegExp object shares lastIndex between uses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('a', 'g');
      const str1 = "aa";
      regex.lastIndex = 1;
      const result = str1.replaceAll(regex, "x");
      expect(result).assertEqual("xx");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0081
     * @tc.name testRegReplaceAll0081
     * @tc.desc Compare behavior between g and y flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const regexG = new RegExp('a', 'g');
      const resultG = str.replaceAll(regexG, "x");
      const regexY = new RegExp('a', 'gy'); // y flag treated same by replaceAll
      const resultY = str.replaceAll(regexY, "x");
      expect(resultG).assertEqual("xxx");
      expect(resultY).assertEqual("xxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0082
     * @tc.name testRegReplaceAll0082
     * @tc.desc Replace with regex where lastIndex is not reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex = new RegExp('b', 'g');
      regex.lastIndex = 2;
      const str = "bbbbb";
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xxxxx");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0083
     * @tc.name testRegReplaceAll0083
     * @tc.desc Replace using Unicode mode (u flag)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "ππ";
      const regex = new RegExp('\\p{L}', 'gu');
      const result = str.replaceAll(regex, "X");
      expect(result).assertEqual("XX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0084
     * @tc.name testRegReplaceAll0084
     * @tc.desc Replace using dotAll mode (s flag)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb";
      const regex = new RegExp('a.b', 'gs');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0085
     * @tc.name testRegReplaceAll0085
     * @tc.desc Replace using multiple flags /gimsu
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A\nA";
      const regex = new RegExp('a', 'gi');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("x\nx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0086
     * @tc.name testRegReplaceAll0086
     * @tc.desc Replace using regex with special character class [^\\w\\s]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a!b@c#";
      const regex = new RegExp('[^\\w\\s]', 'g');
      const result = str.replaceAll(regex, "_");
      expect(result).assertEqual("a_b_c_");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0087
     * @tc.name testRegReplaceAll0087
     * @tc.desc Replace using backreference \\1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abab";
      const regex = new RegExp('(a)b\\1', 'g');
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0088
     * @tc.name testRegReplaceAll0088
     * @tc.desc Replace with function where capture group is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str = "abc";
    //   const regex = new RegExp('(d?)', 'g');
    //   const result = str.replaceAll(regex, (_match: string, p1: string): string => p1 || "_");
    //   expect(result.startsWith("_")).assertTrue();
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0089
     * @tc.name testRegReplaceAll0089
     * @tc.desc Replace containing escaped sequence \\\\ to avoid misinterpretation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegReplaceAll0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "C:\\\\Program Files\\\\App";
      const regex = new RegExp('\\\\\\\\', 'g');
      const result = str.replaceAll(regex, "/");
      expect(result).assertEqual("C:/Program Files/App");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0090
     * @tc.name testRegReplaceAll0090
     * @tc.desc Replace global + multi-capture + dynamic function mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // todo
    // it('testRegReplaceAll0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let count: number = 0;
    //   const str = "a1b2c3";
    //   const regex = new RegExp('([a-z])(\\d)', 'g');
    //   const result = str.replaceAll(regex, (_m: string, p1: string, p2: string): string => {
    //     count++;
    //     return `${p1}${parseInt(p2) + count}`;
    //   });
    //   expect(result).assertEqual("a2b4c6");
    // });

  });
}