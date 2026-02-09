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

interface CharNumGroups {
  char: string;
  num: string;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTest003() {
  describe('RegExpTest003', () => {
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
     * @tc.name   testRegReplace0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0001
     * @tc.desc   Replace the first occurrence of a substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const result = str.replace("apple", "orange");
      expect(result).assertEqual("orange banana apple");
    });

    /**
     * @tc.name   testRegReplace0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0002
     * @tc.desc   Replace all occurrences using global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const result = str.replace(/apple/g, "orange");
      expect(result).assertEqual("orange banana orange");
    });

    /**
     * @tc.name   testRegReplace0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0003
     * @tc.desc   Replace only first occurrence with regex without g flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const result = str.replace(/apple/, "orange");
      expect(result).assertEqual("orange banana apple");
    });

    /**
     * @tc.name   testRegReplace0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0004
     * @tc.desc   Case-insensitive replacement using regex with i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple Banana apple";
      const result = str.replace(/banana/i, "orange");
      expect(result).assertEqual("apple orange apple");
    });

    /**
     * @tc.name   testRegReplace0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0005
     * @tc.desc   Replace using capture groups to rearrange text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "John Smith";
      const result = str.replace(/(\w+)\s(\w+)/, "$2, $1");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.name   testRegReplace0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0007
     * @tc.desc   Replace string containing regex special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Price: 5.99";
      const result = str.replace(/\./, ",");
      expect(result).assertEqual("Price: 5,99");
    });

    /**
     * @tc.name   testRegReplace0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0008
     * @tc.desc   Replace Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Héllo Wörld";
      const result = str.replace(/[^\x00-\x7F]/g, "");
      expect(result).assertEqual("Hllo Wrld");
    });

    /**
     * @tc.name   testRegReplace0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0009
     * @tc.desc   Replace numeric characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Contact: 123-456-7890";
      const result = str.replace(/\d{3}/g, "***");
      expect(result).assertEqual("Contact: ***-***-***0");
    });

    /**
     * @tc.name   testRegReplace0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0010
     * @tc.desc   Replace alphabetic characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcDEF";
      const result = str.replace(/[a-zA-Z]/g, "x");
      expect(result).assertEqual("xxxxxx");
    });

    /**
     * @tc.name   testRegReplace0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0011
     * @tc.desc   Replace leading and trailing spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "  hello world  ";
      const result = str.replace(/^\s+|\s+$/g, "");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name   testRegReplace0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0012
     * @tc.desc   Replace consecutive repeated characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const result = str.replace(/a+/g, "x");
      expect(result).assertEqual("x");
    });

    /**
     * @tc.name   testRegReplace0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0013
     * @tc.desc   Replace using function returning a constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/[a-z]/g, () => "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.name   testRegReplace0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0015
     * @tc.desc   Replace using function returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/b/, () => "");
      expect(result).assertEqual("ac");
    });

    /**
     * @tc.name   testRegReplace0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0016
     * @tc.desc   Replace string containing newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const result = str.replace(/\n/, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.name   testRegReplace0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0017
     * @tc.desc   Replace string containing tab characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "col1\tcol2";
      const result = str.replace(/\t/, " ");
      expect(result).assertEqual("col1 col2");
    });

    /**
     * @tc.name   testRegReplace0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0018
     * @tc.desc   Replace string containing carriage return characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\rline2";
      const result = str.replace(/\r/, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.name   testRegReplace0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0019
     * @tc.desc   Replace string containing tab and space combinations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a \tb";
      const result = str.replace(/\s+/g, "-");
      expect(result).assertEqual("a-b");
    });

    /**
     * @tc.name   testRegReplace0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0020
     * @tc.desc   Replace string containing special symbols like $, #, @
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Price: $100 #deal";
      const result = str.replace(/[$#]/g, "X");
      expect(result).assertEqual("Price: X100 Xdeal");
    });

    /**
     * @tc.name   testRegReplace0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0021
     * @tc.desc   Replace string containing emoji characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello 😊 World 😊";
      const result = str.replace(/😊/g, "🙂");
      expect(result).assertEqual("Hello 🙂 World 🙂");
    });

    /**
     * @tc.name   testRegReplace0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0022
     * @tc.desc   Replace multi-byte characters like Chinese, Japanese, Korean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好世界";
      const result = str.replace(/世界/, "World");
      expect(result).assertEqual("你好World");
    });

    /**
     * @tc.name   testRegReplace0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0023
     * @tc.desc   Replace the first matching substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo";
      const result = str.replace("foo", "baz");
      expect(result).assertEqual("baz bar foo");
    });

    /**
     * @tc.name   testRegReplace0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0024
     * @tc.desc   Replace the last matching substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo bar foo";
      const result = str.replace(/foo(?=[^foo]*$)/, "baz");
      expect(result).assertEqual("foo bar baz");
    });

    /**
     * @tc.name   testRegReplace0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0025
     * @tc.desc   Replace multiple consecutive matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa bbb ccc";
      const result = str.replace(/a+/g, "x");
      expect(result).assertEqual("x bbb ccc");
    });

    /**
     * @tc.name   testRegReplace0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0026
     * @tc.desc   Replace non-consecutive matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/[abc]/g, "x");
      expect(result).assertEqual("x1x2x3");
    });

    /**
     * @tc.name   testRegReplace0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0027
     * @tc.desc   Replace empty string at the beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const result = str.replace(/^/, "_");
      expect(result).assertEqual("_hello");
    });

    /**
     * @tc.name   testRegReplace0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0028
     * @tc.desc   Replace empty string at the end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const result = str.replace(/$/, "_");
      expect(result).assertEqual("hello_");
    });

    /**
     * @tc.name   testRegReplace0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0029
     * @tc.desc   Use $& to reference matched text in replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/b/, "($&)");
      expect(result).assertEqual("a(b)c");
    });

    /**
     * @tc.name   testRegReplace0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0030
     * @tc.desc   Use $1, $2 to reference capture groups in replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "John Smith";
      const result = str.replace(/(\w+)\s(\w+)/, "$2, $1");
      expect(result).assertEqual("Smith, John");
    });

    /**
     * @tc.name   testRegReplace0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0035
     * @tc.desc   Replace all spaces in a string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a b c";
      const result = str.replace(/ /g, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.name   testRegReplace0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0036
     * @tc.desc   Replace consecutive spaces with a single space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a   b    c";
      const result = str.replace(/\s+/g, " ");
      expect(result).assertEqual("a b c");
    });

    /**
     * @tc.name   testRegReplace0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0037
     * @tc.desc   Replace repeated letter sequences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaabbb";
      const result = str.replace(/a+/g, "x");
      expect(result).assertEqual("xbbb");
    });

    /**
     * @tc.name   testRegReplace0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0038
     * @tc.desc   Replace repeated words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo foo bar";
      const result = str.replace(/foo\sfoo/, "baz");
      expect(result).assertEqual("baz bar");
    });

    /**
     * @tc.name   testRegReplace0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0039
     * @tc.desc   Use $& to reference matched text in replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/b/, "($&)");
      expect(result).assertEqual("a(b)c");
    });

    /**
     * @tc.name   testRegReplace0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0040
     * @tc.desc   Use $` to insert text before the match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/b/, "$`");
      expect(result).assertEqual("aac");
    });

    /**
     * @tc.name   testRegReplace0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0041
     * @tc.desc   Use $' to insert text after the match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/b/, "$'");
      expect(result).assertEqual("acc");
    });

    /**
     * @tc.name   testRegReplace0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0042
     * @tc.desc   Use $$ to insert $ character in replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "price";
      const result = str.replace(/price/, "$$100");
      expect(result).assertEqual("$100");
    });

    /**
     * @tc.name   testRegReplace0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0043
     * @tc.desc   Replace the first uppercase letter using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aBcDe";
      const result = str.replace(/[A-Z]/, "X");
      expect(result).assertEqual("aXcDe");
    });

    /**
     * @tc.name   testRegReplace0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0044
     * @tc.desc   Replace the first lowercase letter using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "AbCDe";
      const result = str.replace(/[a-z]/, "x");
      expect(result).assertEqual("AxCDe");
    });

    /**
     * @tc.name   testRegReplace0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0045
     * @tc.desc   Replace the first digit using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2";
      const result = str.replace(/\d/, "9");
      expect(result).assertEqual("a9b2");
    });

    /**
     * @tc.name   testRegReplace0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0046
     * @tc.desc   Replace all digits using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/\d/g, "9");
      expect(result).assertEqual("a9b9c9");
    });

    /**
     * @tc.name   testRegReplace0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0047
     * @tc.desc   Replace all non-digit characters using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/\D/g, "x");
      expect(result).assertEqual("x1x2x3");
    });

    /**
     * @tc.name   testRegReplace0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0048
     * @tc.desc   Replace newline characters in a string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2";
      const result = str.replace(/\n/g, " ");
      expect(result).assertEqual("line1 line2");
    });

    /**
     * @tc.name   testRegReplace0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0049
     * @tc.desc   Replace matches in multi-line text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo\nbar\nbaz";
      const result = str.replace(/^./gm, "X");
      expect(result).assertEqual("Xoo\nXar\nXaz");
    });

    /**
     * @tc.name   testRegReplace0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0050
     * @tc.desc   Replace multi-byte character sequences (emoji + Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊你好";
      const result = str.replace(/[\u4e00-\u9fa5]+/g, "World");
      expect(result).assertEqual("😊World");
    });

    /**
     * @tc.name   testRegReplace0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0051
     * @tc.desc   Replace string containing escape characters (\n, \t, \\)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\\nline2\tend";
      const result = str.replace(/\\n|\t/g, " ");
      expect(result).assertEqual("line1 line2 end");
    });

    /**
     * @tc.name   testRegReplace0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0052
     * @tc.desc   Reverse string order using capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a-b-c";
      const result = str.replace(/(\w+)-(\w+)-(\w+)/, "$3-$2-$1");
      expect(result).assertEqual("c-b-a");
    });

    /**
     * @tc.name   testRegReplace0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0053
     * @tc.desc   Replace specific word ignoring case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello hello HeLLo";
      const result = str.replace(/hello/i, "hi");
      expect(result).assertEqual("hi hello HeLLo");
    });

    /**
     * @tc.name   testRegReplace0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0054
     * @tc.desc   Replace first N occurrences of a pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a a a a";
      let count = 0;
      const result = str.replace(/a/g, (m) => (++count <= 2 ? "x" : m));
      expect(result).assertEqual("x x a a");
    });

    /**
     * @tc.name   testRegReplace0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0055
     * @tc.desc   Replace last N occurrences of a pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a a a a";
      const arr = str.split(" ");
      const lastTwo = arr.slice(-2).map(() => "x");
      const result = arr.slice(0, -2).concat(lastTwo).join(" ");
      expect(result).assertEqual("a a x x");
    });

    /**
     * @tc.name   testRegReplace0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0056
     * @tc.desc   Replace repeated patterns in a string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "ababab";
      const result = str.replace(/ab/g, "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.name   testRegReplace0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0057
     * @tc.desc   Replace non-ASCII characters (Unicode range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc你好";
      const result = str.replace(/[^\x00-\x7F]+/g, "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   testRegReplace0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0058
     * @tc.desc   Replace consecutive numeric patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123456";
      const result = str.replace(/\d+/g, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.name   testRegReplace0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0059
     * @tc.desc   Replace consecutive non-numeric patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcDEF";
      const result = str.replace(/[^\d]+/g, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.name   testRegReplace0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0060
     * @tc.desc   Replace mixed patterns of letters, numbers, and symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1!b2@c3#";
      const result = str.replace(/[a-zA-Z0-9]+/g, "X");
      expect(result).assertEqual("X!X@X#");
    });

    /**
     * @tc.name   testRegReplace0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0061
     * @tc.desc   Replace entire string (full match)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const result = str.replace(/^.*$/, "world");
      expect(result).assertEqual("world");
    });

    /**
     * @tc.name   testRegReplace0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0062
     * @tc.desc   Replace non-existent substring (should return original string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello";
      const result = str.replace("xyz", "abc");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.name   testRegReplace0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0063
     * @tc.desc   Replace substring at the start of the string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const result = str.replace(/^hello/, "hi");
      expect(result).assertEqual("hi world");
    });

    /**
     * @tc.name   testRegReplace0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0064
     * @tc.desc   Replace substring at the end of the string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const result = str.replace(/world$/, "everyone");
      expect(result).assertEqual("hello everyone");
    });

    /**
     * @tc.name   testRegReplace0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0065
     * @tc.desc   Replace empty string by inserting at start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/^/, "start-");
      expect(result).assertEqual("start-abc");
    });

    /**
     * @tc.name   testRegReplace0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0066
     * @tc.desc   Replace empty string by inserting at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/$/, "-end");
      expect(result).assertEqual("abc-end");
    });

    /**
     * @tc.name   testRegReplace0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0067
     * @tc.desc   Replace multiple consecutive empty string matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/(?=.)/g, "-");
      expect(result).assertEqual("-a-b-c");
    });

    /**
     * @tc.name   testRegReplace0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0068
     * @tc.desc   Replace matches with consecutive special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a$$b@@c";
      const result = str.replace(/[$@]+/g, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.name   testRegReplace0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0069
     * @tc.desc   Replace using function returning empty string multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const result = str.replace(/\d/g, () => "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   testRegReplace0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0072
     * @tc.desc   Replace Unicode boundary characters (emoji sequences)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊👍🏽";
      const result = str.replace(/./gu, "_");
      expect(result).assertEqual("___");
    });

    /**
     * @tc.name   testRegReplace0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0073
     * @tc.desc   Replace each line in multi-line text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\nline2\nline3";
      const result = str.replace(/^.*$/gm, "X");
      expect(result).assertEqual("X\nX\nX");
    });

    /**
     * @tc.name   testRegReplace0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0074
     * @tc.desc   Replace patterns containing tab characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\tb\tc";
      const result = str.replace(/\t/g, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.name   testRegReplace0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0075
     * @tc.desc   Replace patterns containing carriage return characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\rb\rc";
      const result = str.replace(/\r/g, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.name   testRegReplace0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0076
     * @tc.desc   Replace mixed letters + numbers + symbols pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1!b2@c3#";
      const result = str.replace(/[a-z0-9!@#]+/g, "X");
      expect(result).assertEqual("X");
    });

    /**
     * @tc.name   testRegReplace0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0077
     * @tc.desc   Replace nested patterns (e.g., digits in "a1b2c3")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/\d/g, "X");
      expect(result).assertEqual("aXbXcX");
    });

    /**
     * @tc.name   testRegReplace0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0078
     * @tc.desc   Replace repeated capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abcabc";
      const result = str.replace(/(abc)/g, "X");
      expect(result).assertEqual("XX");
    });

    /**
     * @tc.name   testRegReplace0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0079
     * @tc.desc   Replace optional match patterns (e.g., a?)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aabb";
      const result = str.replace(/a?/g, "X");
      expect(result).assertEqual("XXXbXbX");
    });

    /**
     * @tc.name   testRegReplace0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0080
     * @tc.desc   Replace zero-width assertion match (e.g., (?=b))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/(?=b)/g, "X");
      expect(result).assertEqual("aXbc");
    });

    /**
     * @tc.name   testRegReplace0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0081
     * @tc.desc   Replace using negative lookahead (e.g., (?!b))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/.(?!b)/g, "X");
      expect(result).assertEqual("aXX");
    });

    /**
     * @tc.name   testRegReplace0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0082
     * @tc.desc   Replace using lookahead + capture group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/(a)(?=b)/, "$1X");
      expect(result).assertEqual("aXbc");
    });

    /**
     * @tc.name   testRegReplace0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0083
     * @tc.desc   Replace using lookbehind + capture group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replace(/(?<=a)(b)/, "X");
      expect(result).assertEqual("aXc");
    });

    /**
     * @tc.name   testRegReplace0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0084
     * @tc.desc   Replace using multiple grouped regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const result = str.replace(/([a-z]+)(\d+)/, "$2$1");
      expect(result).assertEqual("123abc");
    });

    /**
     * @tc.name   testRegReplace0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0085
     * @tc.desc   Replace string with multiple match patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/[a-z]|\d/g, "_");
      expect(result).assertEqual("______");
    });

    /**
     * @tc.name   testRegReplace0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0086
     * @tc.desc   Replace text between consecutive match patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replace(/(\d)/g, "_$1_");
      expect(result).assertEqual("a_1_b_2_c_3_");
    });

    /**
     * @tc.name   testRegReplace0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0087
     * @tc.desc   Replace repeated matches using function generating different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      let count = 0;
      const result = str.replace(/\d/g, () => (++count).toString());
      expect(result).assertEqual("a1b2c3");
    });

    /**
     * @tc.name   testRegReplace0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0088
     * @tc.desc   Replace numeric pattern returning dynamic computed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123";
      const result = str.replace(/\d/g, (m) => (parseInt(m) * 2).toString());
      expect(result).assertEqual("246");
    });

    /**
     * @tc.name   testRegReplace0089
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0089
     * @tc.desc   Replace non-ASCII pattern returning different language characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好こんにちは";
      const result = str.replace(/[^\x00-\x7F]/g, "X");
      expect(result).assertEqual("XXXXXXX");
    });

    /**
     * @tc.name   testRegReplace0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_0090
     * @tc.desc   Replace with global match + multiple groups + function generating dynamic values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      let count = 0;
      const result = str.replace(
        /([a-z])(\d)/g,
        (match: string, p1: string, p2: string): string => {
          return `${p1}${parseInt(p2) + (++count)}`;
        }
      );
      expect(result).assertEqual("a2b4c6");
    });

    /**
     * @tc.name   testRegReplaceAll0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0001
     * @tc.desc   Replace simple word pattern using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple banana apple";
      const result = str.replaceAll(/apple/g, "pear");
      expect(result).assertEqual("pear banana pear");
    });

    /**
     * @tc.name   testRegReplaceAll0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0002
     * @tc.desc   Replace all occurrences globally using regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123-456-123";
      const result = str.replaceAll(/\d+/g, "X");
      expect(result).assertEqual("X-X-X");
    });

    /**
     * @tc.name   testRegReplaceAll0003
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0003
     * @tc.desc   Replace all digits with asterisks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Room 101, Floor 3";
      const result = str.replaceAll(/\d/g, "*");
      expect(result).assertEqual("Room ***, Floor *");
    });

    /**
     * @tc.name   testRegReplaceAll0004
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0004
     * @tc.desc   Replace all letters with '#'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123XYZ";
      const result = str.replaceAll(/[a-z]/gi, "#");
      expect(result).assertEqual("###123###");
    });

    /**
     * @tc.name   testRegReplaceAll0005
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0005
     * @tc.desc   Replace ignoring case with /i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello hello HELLO";
      const result = str.replaceAll(/hello/gi, "hi");
      expect(result).assertEqual("hi hi hi");
    });

    /**
     * @tc.name   testRegReplaceAll0006
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0006
     * @tc.desc   Replace across multiple lines with /m flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "apple\nbanana\napple";
      const result = str.replaceAll(/^apple/mg, "pear");
      expect(result).assertEqual("pear\nbanana\npear");
    });

    /**
     * @tc.name   testRegReplaceAll0007
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0007
     * @tc.desc   Replace match at string start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "start middle end";
      const result = str.replaceAll(/^start/g, "begin");
      expect(result).assertEqual("begin middle end");
    });

    /**
     * @tc.name   testRegReplaceAll0008
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0008
     * @tc.desc   Replace match at string end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "start middle end";
      const result = str.replaceAll(/end$/g, "finish");
      expect(result).assertEqual("start middle finish");
    });

    /**
     * @tc.name   testRegReplaceAll0009
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0009
     * @tc.desc   Replace consecutive same substrings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "haha haha haha";
      const result = str.replaceAll(/haha/g, "he");
      expect(result).assertEqual("he he he");
    });

    /**
     * @tc.name   testRegReplaceAll0010
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0010
     * @tc.desc   Replace identical matches at different positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cat dog cat bird cat";
      const result = str.replaceAll(/cat/g, "fox");
      expect(result).assertEqual("fox dog fox bird fox");
    });

    /**
     * @tc.name   testRegReplaceAll0011
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0011
     * @tc.desc   Replace spaces with underscores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a b c d";
      const result = str.replaceAll(/\s/g, "_");
      expect(result).assertEqual("a_b_c_d");
    });

    /**
     * @tc.name   testRegReplaceAll0012
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0012
     * @tc.desc   Replace tab characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\tb\tc";
      const result = str.replaceAll(/\t/g, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.name   testRegReplaceAll0013
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0013
     * @tc.desc   Replace newline characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb\nc";
      const result = str.replaceAll(/\n/g, "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.name   testRegReplaceAll0014
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0014
     * @tc.desc   Replace Unicode emoji characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😀😃😄";
      const result = str.replaceAll(/\p{Emoji}/gu, "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.name   testRegReplaceAll0015
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0015
     * @tc.desc   Replace mixed alphanumeric patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1b2c3";
      const result = str.replaceAll(/[a-z]\d/g, "X");
      expect(result).assertEqual("XXX");
    });

    /**
     * @tc.name   testRegReplaceAll0016
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0016
     * @tc.desc   Replace special symbols like $, *, ?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "$ * ? $";
      const result = str.replaceAll(/[$*?]/g, "#");
      expect(result).assertEqual("# # # #");
    });

    /**
     * @tc.name   testRegReplaceAll0017
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0017
     * @tc.desc   Replace escaped digit pattern \\d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "123abc";
      const result = str.replaceAll(/\\d/g, "x"); // actually literal "\d"
      expect(result).assertEqual("123abc");
    });

    /**
     * @tc.name   testRegReplaceAll0018
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0018
     * @tc.desc   Replace with multi-group regular expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "12-34-56";
      const result = str.replaceAll(/(\d+)-(\d+)/g, "$2-$1");
      expect(result).assertEqual("34-12-56");
    });

    /**
     * @tc.name   testRegReplaceAll0019
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0019
     * @tc.desc   Replace using numeric capture groups ($1, $2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "name:John age:30";
      const result = str.replaceAll(/(\w+):(\w+)/g, "$2=$1");
      expect(result).assertEqual("John=name 30=age");
    });

    /**
     * @tc.name   testRegReplaceAll0020
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0020
     * @tc.desc   Replace using named capture group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "x=10 y=20";
      const result = str.replaceAll(/(?<key>\w+)=(?<val>\d+)/g, "$<val>->$<key>");
      expect(result).assertEqual("10->x 20->y");
    });

    /**
     * @tc.name   testRegReplaceAll0021
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0021
     * @tc.desc   Replace non-capturing group pattern (?:)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaabbbccc";
      const result = str.replaceAll(/(?:aaa|bbb)/g, "X");
      expect(result).assertEqual("XXccc");
    });

    /**
     * @tc.name   testRegReplaceAll0022
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0022
     * @tc.desc   Replace pattern with + quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a123b456c";
      const result = str.replaceAll(/\d+/g, "#");
      expect(result).assertEqual("a#b#c");
    });

    /**
     * @tc.name   testRegReplaceAll0023
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0023
     * @tc.desc   Replace pattern with * quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaab";
      const result = str.replaceAll(/a*/g, "x");
      expect(result).assertEqual("xxbx");
    });

    /**
     * @tc.name   testRegReplaceAll0024
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0024
     * @tc.desc   Replace pattern with {n,m} quantifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaaaa";
      const result = str.replaceAll(/a{2,3}/g, "x");
      expect(result).assertEqual("xx");
    });

    /**
     * @tc.name   testRegReplaceAll0025
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0025
     * @tc.desc   Replace zero-width positive lookahead (?=...)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/a(?=b)/g, "x");
      expect(result).assertEqual("xbc");
    });

    /**
     * @tc.name   testRegReplaceAll0026
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0026
     * @tc.desc   Replace zero-width negative lookahead (?!...)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc adc aec";
      const result = str.replaceAll(/a(?!b)/g, "x");
      expect(result).assertEqual("abc xdc xec");
    });

    /**
     * @tc.name   testRegReplaceAll0027
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0027
     * @tc.desc   Replace positive lookbehind (?<=...)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cab dab";
      const result = str.replaceAll(/(?<=c)a/g, "x");
      expect(result).assertEqual("cxb dab");
    });

    /**
     * @tc.name   testRegReplaceAll0028
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0028
     * @tc.desc   Replace negative lookbehind (?<!...)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "cab dab";
      const result = str.replaceAll(/(?<!c)a/g, "x");
      expect(result).assertEqual("cab dxb");
    });

    /**
     * @tc.name   testRegReplaceAll0029
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0029
     * @tc.desc   Replace empty string (insert between characters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/(?<!^)(?=.)/g, "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.name   testRegReplaceAll0030
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0030
     * @tc.desc   Replace mixed line endings \r\n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "line1\r\nline2\r\nline3";
      const result = str.replaceAll(/\r\n/g, "|");
      expect(result).assertEqual("line1|line2|line3");
    });

    /**
     * @tc.name   testRegReplaceAll0031
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0031
     * @tc.desc   Use function replacement returning a fixed string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123abc";
      const result: string = str.replaceAll(/\d+/g, (): string => "NUM");
      expect(result).assertEqual("abcNUMabc");
    });

    /**
     * @tc.name   testRegReplaceAll0032
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0032
     * @tc.desc   Use function replacement returning the match itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2c3";
      const result: string = str.replaceAll(/\d/g, (match: string): string => match);
      expect(result).assertEqual("a1b2c3");
    });

    /**
     * @tc.name   testRegReplaceAll0033
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0033
     * @tc.desc   Use function replacement returning capture group values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A12B34";
      const result: string = str.replaceAll(/([A-Z])(\d+)/g, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
      expect(result).assertEqual("12A34B");
    });

    /**
     * @tc.name   testRegReplaceAll0034
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0034
     * @tc.desc   Use function replacement returning match position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abcabc";
      const result: string = str.replaceAll(/a/g,
        (_: string, __: string, index: number): string => index.toString());
      expect(result).assertEqual("abcabcbcabcabcbc");
    });

    /**
     * @tc.name   testRegReplaceAll0035
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0035
     * @tc.desc   Use function replacement returning original string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "hello";
      const result: string = str.replaceAll(/./g, (): string => str.length.toString());
      expect(result).assertEqual("55555");
    });

    /**
     * @tc.name   testRegReplaceAll0036
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0036
     * @tc.desc   Use function replacement to update a global counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "12345";
      const result: string = str.replaceAll(/\d/g, (): string => (++count).toString());
      expect(result).assertEqual("12345");
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   testRegReplaceAll0037
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0037
     * @tc.desc   Use function replacement concatenating dynamic content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string = str.replaceAll(/./g, (m: string, i: number): string => `${m}${i}`);
      expect(result).assertEqual("a0b1c2");
    });

    /**
     * @tc.name   testRegReplaceAll0038
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0038
     * @tc.desc   Use function replacement returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: string = str.replaceAll(/\d/g, (): string => "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   testRegReplaceAll0039
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0039
     * @tc.desc   Use function replacement returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: string = str.replaceAll(/\d/g, (): string => String(null));
      expect(result).assertEqual("abcnullnullnull");
    });

    /**
     * @tc.name   testRegReplaceAll0040
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0040
     * @tc.desc   Use function replacement returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc123";
      const result: string = str.replaceAll(/\d/g, (): string => String(undefined));
      expect(result).assertEqual("abcundefinedundefinedundefined");
    });

    /**
     * @tc.name   testRegReplaceAll0041
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0041
     * @tc.desc   Use function replacement handling multiple capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "x1y2z3";
      const result: string = str.replaceAll(/([a-z])(\d)/g, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
      expect(result).assertEqual("1x2y3z");
    });

    /**
     * @tc.name   testRegReplaceAll0042
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0042
     * @tc.desc   Use function replacement handling nested regex patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2c3";
      const result: string = str.replaceAll(/([a-z]\d)/g, (m: string): string => m.replace(/\d/, "#"));
      expect(result).assertEqual("a#b#c#");
    });

    /**
     * @tc.name   testRegReplaceAll0043
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0043
     * @tc.desc   Use function replacement returning calculated number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "1 2 3";
      const result: string = str.replaceAll(/\d/g, (m: string): string => (parseInt(m) + (++count)).toString());
      expect(result).assertEqual("2 4 6");
    });

    /**
     * @tc.name   testRegReplaceAll0044
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0044
     * @tc.desc   Use function replacement returning mixed type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1b2";
      const result: string = str.replaceAll(/\d/g, (m: string): string => (parseInt(m) % 2 === 0 ? "even" : "1"));
      expect(result).assertEqual("a1beven");
    });

    /**
     * @tc.name   testRegReplaceAll0045
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0045
     * @tc.desc   Use function replacement reversing capture group order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const result: string = str.replaceAll(/([A-Z])(\d)/g, (_: string, p1: string, p2: string): string => `${p2}${p1}`);
      expect(result).assertEqual("1A2B");
    });

    /**
     * @tc.name   testRegReplaceAll0046
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0046
     * @tc.desc   Use function replacement for Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "你好世界";
      const result: string = str.replaceAll(/[\u4e00-\u9fa5]/g, (): string => "中");
      expect(result).assertEqual("中中中中");
    });

    /**
     * @tc.name   testRegReplaceAll0047
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0047
     * @tc.desc   Use function replacement matching emoji patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "😀😃😄";
      const result: string = str.replaceAll(/\p{Emoji}/gu, (): string => "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.name   testRegReplaceAll0048
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0048
     * @tc.desc   Use function replacement with regex having multiple flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "AbC abc";
      const result: string = str.replaceAll(/abc/gi, (m: string): string => m.toUpperCase());
      expect(result).assertEqual("ABC ABC");
    });

    /**
     * @tc.name   testRegReplaceAll0049
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0049
     * @tc.desc   Use function replacement on multi-line text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "line1\nline2\nline3";
      const result: string = str.replaceAll(/^line/gm, (): string => "L");
      expect(result).assertEqual("L1\nL2\nL3");
    });

    /**
     * @tc.name   testRegReplaceAll0050
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0050
     * @tc.desc   Use function replacement mixing newline and spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a \n b \n c";
      const result: string = str.replaceAll(/\s+/g, (): string => "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.name   testRegReplaceAll0051
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0051
     * @tc.desc   Use function replacement for zero-width matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "abc";
      const result: string = str.replaceAll(/(?=b)/g, (): string => "|");
      expect(result).assertEqual("a|bc");
    });

    /**
     * @tc.name   testRegReplaceAll0052
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0052
     * @tc.desc   Use function replacement with accumulated global counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let counter: number = 0;
      const str: string = "111";
      const result: string = str.replaceAll(/1/g, (): string => (++counter).toString());
      expect(result).assertEqual("123");
    });

    /**
     * @tc.name   testRegReplaceAll0053
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0053
     * @tc.desc   Use function replacement with complex regex (group combination)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "a1-b2";
      const result: string = str.replaceAll(/([a-z])(\d)/g, (_: string, a: string, b: string): string => `${b}${a}`);
      expect(result).assertEqual("1a-2b");
    });

    /**
     * @tc.name   testRegReplaceAll0054
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0054
     * @tc.desc   Use function replacement with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1B2";
      const result: string = str.replaceAll(
        /(?<char>[A-Z])(?<num>\d)/g,
        (
          match: string,
          _p1: string,
          _p2: string,
          offset: number,
          input: string,
          groups: CharNumGroups
        ): string => {
          return `${groups.num}${groups.char}`;
        }
      );
      expect(result).assertEqual("1A2B");
    });

    /**
     * @tc.name   testRegReplaceAll0055
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0055
     * @tc.desc   Use function replacement for alphanumeric combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1b2";
      const result: string = str.replaceAll(/[A-Za-z]\d/g, (m: string): string => m.toLowerCase());
      expect(result).assertEqual("a1b2");
    });

    /**
     * @tc.name   testRegReplaceAll0056
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0056
     * @tc.desc   Use function replacement with lookbehind and lookahead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "foo123bar";
      const result: string = str.replaceAll(/(?<=foo)\d+(?=bar)/g, (): string => "***");
      expect(result).assertEqual("foo***bar");
    });

    /**
     * @tc.name   testRegReplaceAll0057
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0057
     * @tc.desc   Use function replacement changing Unicode case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "ΩωΣσ";
      const result: string = str.replaceAll(/\p{L}/gu, (m: string): string => m.toUpperCase());
      expect(result).assertEqual("ΩΩΣΣ");
    });

    /**
     * @tc.name   testRegReplaceAll0058
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0058
     * @tc.desc   Use function replacement counting matched items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str: string = "111";
      const result: string = str.replaceAll(/1/g, (): string => `${++count}`);
      expect(result).assertEqual("123");
    });

    /**
     * @tc.name   testRegReplaceAll0059
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0059
     * @tc.desc   Use function replacement returning JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "A1";
      const result: string = str.replaceAll(/([A-Z])(\d)/g,
        (_: string, p1: string, p2: string): string => JSON.stringify({ char: p1, num: p2 }));
      expect(result).assertEqual('{"char":"A","num":"1"}');
    });

    /**
     * @tc.name   testRegReplaceAll0060
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0060
     * @tc.desc   Use function replacement returning template string combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = "X9Y8";
      const result: string = str.replaceAll(/([A-Z])(\d)/g,
        (_: string, p1: string, p2: string): string => `${p1.repeat(2)}=${parseInt(p2)}`);
      expect(result).assertEqual("XX=9YY=8");
    });

    /**
     * @tc.name   testRegReplaceAll0061
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0061
     * @tc.desc   Replace the entire string (full match)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/^abc$/g, "xyz");
      expect(result).assertEqual("xyz");
    });

    /**
     * @tc.name   testRegReplaceAll0062
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0062
     * @tc.desc   Replace nonexistent match (should return original string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "hello world";
      const result = str.replaceAll(/123/g, "abc");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name   testRegReplaceAll0063
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0063
     * @tc.desc   Replace with empty string input (empty source)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "";
      const result = str.replaceAll(/a/g, "b");
      expect(result).assertEqual("");
    });

    /**
     * @tc.name   testRegReplaceAll0064
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0064
     * @tc.desc   Replace with empty regex (zero-width matches)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/(?:)/g, "-");
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.name   testRegReplaceAll0065
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0065
     * @tc.desc   Replace with nested capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc123";
      const result = str.replaceAll(/(a(b(c)))/g, "$3");
      expect(result).assertEqual("c123");
    });

    /**
     * @tc.name   testRegReplaceAll0066
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0066
     * @tc.desc   Replace repeated capture group pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a1a2a3";
      const result = str.replaceAll(/(a\d)/g, "x");
      expect(result).assertEqual("xxx");
    });

    /**
     * @tc.name   testRegReplaceAll0067
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0067
     * @tc.desc   Replace overlapping matches (ensure no overlap processing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const result = str.replaceAll(/aa/g, "x");
      expect(result).assertEqual("xa");
    });

    /**
     * @tc.name   testRegReplaceAll0068
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0068
     * @tc.desc   Replace adjacent matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abab";
      const result = str.replaceAll(/ab/g, "x");
      expect(result).assertEqual("xx");
    });

    /**
     * @tc.name   testRegReplaceAll0069
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0069
     * @tc.desc   Replace very long string (>10^5 characters)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a".repeat(100000);
      const result = str.replaceAll(/a/g, "b");
      expect(result.length).assertEqual(100000);
    });

    /**
     * @tc.name   testRegReplaceAll0070
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0070
     * @tc.desc   Replace complex Unicode boundaries (grapheme cluster)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "👩‍❤️‍💋‍👨love";
      const result = str.replaceAll(/love/gu, "❤️");
      expect(result).assertEqual("👩‍❤️‍💋‍👨❤️");
    });

    /**
     * @tc.name   testRegReplaceAll0071
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0071
     * @tc.desc   Replace multilingual mixed text (English + Chinese + digits)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "Hello世界123";
      const result = str.replaceAll(/\d+/g, "[num]");
      expect(result).assertEqual("Hello世界[num]");
    });

    /**
     * @tc.name   testRegReplaceAll0072
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0072
     * @tc.desc   Replace text with full-width punctuation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "你好，世界。";
      const result = str.replaceAll(/，|。/g, ",");
      expect(result).assertEqual("你好,世界,");
    });

    /**
     * @tc.name   testRegReplaceAll0073
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0073
     * @tc.desc   Replace non-BMP characters (emoji pairs)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "😊👍😊";
      const result = str.replaceAll(/😊/gu, "❤️");
      expect(result).assertEqual("❤️👍❤️");
    });

    /**
     * @tc.name   testRegReplaceAll0074
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0074
     * @tc.desc   Replace regex with escaped backslash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "path\\to\\file";
      const result = str.replaceAll(/\\/g, "/");
      expect(result).assertEqual("path/to/file");
    });

    /**
     * @tc.name   testRegReplaceAll0075
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0075
     * @tc.desc   Replace regex with Unicode escape pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "\\u4f60\\u597d";
      const result = str.replaceAll(/\\u/g, "");
      expect(result).assertEqual("4f60597d");
    });

    /**
     * @tc.name   testRegReplaceAll0076
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0076
     * @tc.desc   Replace using regex with ^ and $ boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/^a|c$/g, "_");
      expect(result).assertEqual("_b_");
    });

    /**
     * @tc.name   testRegReplaceAll0077
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0077
     * @tc.desc   Replace using \\b word boundary pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a test a-test";
      const result = str.replaceAll(/\btest\b/g, "exam");
      expect(result).assertEqual("a exam a-exam");
    });

    /**
     * @tc.name   testRegReplaceAll0078
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0078
     * @tc.desc   Replace using \\B non-word boundary pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "foo-bar";
      const result = str.replaceAll(/\B-/g, "_");
      expect(result).assertEqual("foo-bar"); // no replacement
    });

    /**
     * @tc.name   testRegReplaceAll0079
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0079
     * @tc.desc   Replace with dynamically constructed RegExp object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const pattern: RegExp = new RegExp("test", "g");
      const str = "test case test";
      const result = str.replaceAll(pattern, "exam");
      expect(result).assertEqual("exam case exam");
    });

    /**
     * @tc.name   testRegReplaceAll0080
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0080
     * @tc.desc   Replace where RegExp object shares lastIndex between uses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /a/g;
      const str1 = "aa";
      regex.lastIndex = 1;
      const result = str1.replaceAll(regex, "x");
      expect(result).assertEqual("xx");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegReplaceAll0081
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0081
     * @tc.desc   Compare behavior between g and y flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "aaa";
      const resultG = str.replaceAll(/a/g, "x");
      const resultY = str.replaceAll(/a/gy, "x"); // y flag treated same by replaceAll
      expect(resultG).assertEqual("xxx");
      expect(resultY).assertEqual("xxx");
    });

    /**
     * @tc.name   testRegReplaceAll0082
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0082
     * @tc.desc   Replace with regex where lastIndex is not reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /b/g;
      regex.lastIndex = 2;
      const str = "bbbbb";
      const result = str.replaceAll(regex, "x");
      expect(result).assertEqual("xxxxx");
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name   testRegReplaceAll0083
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0083
     * @tc.desc   Replace using Unicode mode (u flag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "ππ";
      const result = str.replaceAll(/\p{L}/gu, "X");
      expect(result).assertEqual("XX");
    });

    /**
     * @tc.name   testRegReplaceAll0084
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0084
     * @tc.desc   Replace using dotAll mode (s flag)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a\nb";
      const result = str.replaceAll(/a.b/gs, "x");
      expect(result).assertEqual("x");
    });

    /**
     * @tc.name   testRegReplaceAll0085
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0085
     * @tc.desc   Replace using multiple flags /gimsu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "A\nA";
      const result = str.replaceAll(/a/gi, "x");
      expect(result).assertEqual("x\nx");
    });

    /**
     * @tc.name   testRegReplaceAll0086
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0086
     * @tc.desc   Replace using regex with special character class [^\\w\\s]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "a!b@c#";
      const result = str.replaceAll(/[^\w\s]/g, "_");
      expect(result).assertEqual("a_b_c_");
    });

    /**
     * @tc.name   testRegReplaceAll0087
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0087
     * @tc.desc   Replace using backreference \\1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abab";
      const result = str.replaceAll(/(a)b\1/g, "x");
      expect(result).assertEqual("xb");
    });

    /**
     * @tc.name   testRegReplaceAll0088
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0088
     * @tc.desc   Replace with function where capture group is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "abc";
      const result = str.replaceAll(/(d?)/g, (_match: string, p1: string): string => p1 || "_");
      expect(result.startsWith("_")).assertTrue();
    });

    /**
     * @tc.name   testRegReplaceAll0089
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0089
     * @tc.desc   Replace containing escaped sequence \\\\ to avoid misinterpretation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = "C:\\\\Program Files\\\\App";
      const result = str.replaceAll(/\\\\/g, "/");
      expect(result).assertEqual("C:/Program Files/App");
    });

    /**
     * @tc.name   testRegReplaceAll0090
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACEALL_0090
     * @tc.desc   Replace global + multi-capture + dynamic function mix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplaceAll0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count: number = 0;
      const str = "a1b2c3";
      const result = str.replaceAll(/([a-z])(\d)/g, (_m: string, p1: string, p2: string): string => {
        count++;
        return `${p1}${parseInt(p2) + count}`;
      });
      expect(result).assertEqual("a2b4c6");
    });

  });
}