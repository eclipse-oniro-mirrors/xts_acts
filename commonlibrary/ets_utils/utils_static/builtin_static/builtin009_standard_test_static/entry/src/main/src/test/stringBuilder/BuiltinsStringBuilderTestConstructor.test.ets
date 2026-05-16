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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsStringBuilderTestConstructor() {
  describe('BuiltinsStringBuilderTestConstructor', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsStringBuilderTestConstructor0001
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0001
     * @tc.desc    Test StringBuilder append(String) with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0002
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0002
     * @tc.desc    Test StringBuilder append(String) with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(specialChars);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(specialChars);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0003
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0003
     * @tc.desc    Test StringBuilder append(String) with full ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(asciiString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(asciiString);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0004
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0004
     * @tc.desc    Test StringBuilder append(String) with double special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleSpecial: string = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(doubleSpecial);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(doubleSpecial);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0005
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0005
     * @tc.desc    Test StringBuilder append(String) with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x42";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(escapeString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(escapeString);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0006
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0006
     * @tc.desc    Test StringBuilder append(String) with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojiString: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(emojiString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(emojiString);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0007
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0007
     * @tc.desc    Test StringBuilder append(String) with emoji Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicodeEmoji: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(unicodeEmoji);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(unicodeEmoji);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0008
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0008
     * @tc.desc    Test StringBuilder append(String) with invalid Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(invalidUnicode);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(invalidUnicode);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0009
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0009
     * @tc.desc    Test StringBuilder append(String) with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("0")
        .append("NaN")
        .append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0NaN');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0010
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0010
     * @tc.desc    Test StringBuilder append(String) with mixed content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Hello")
        .append(" ")
        .append("World")
        .append("!")
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Hello World!');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0011
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0011
     * @tc.desc    Test StringBuilder append(String) with long string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString: string = "a".repeat(1000);
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(longString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(longString);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0012
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0012
     * @tc.desc    Test StringBuilder append(String) with sliced string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "{k1:value1,k2:value2}";
      const slicedStr: string = str.substring(0, str.length - 2);
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(slicedStr);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual("{k1:value1,k2:value");
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0013
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0013
     * @tc.desc    Test StringBuilder append(String) with chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("First")
        .append("Second")
        .append("Third")
        .append("Fourth")
        .append("Fifth");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('FirstSecondThirdFourthFifth');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0014
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0014
     * @tc.desc    Test StringBuilder append(String) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Count: ")
        .append(100 as byte)
        .append(", Flag: ")
        .append(true)
        .append(", Text: ")
        .append("Hello")
        .append(", Number: ")
        .append(3.14);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Count: 100, Flag: true, Text: Hello, Number: 3.14');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0015
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0015
     * @tc.desc    Test StringBuilder append(String) with empty strings in chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("")
        .append("Hello")
        .append("")
        .append("World")
        .append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('HelloWorld');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0016
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0016
     * @tc.desc    Test StringBuilder append(String) only
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("SingleString");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('SingleString');
    });/**

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0017
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0017
     * @tc.desc    Test StringBuilder concatStrings with empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("", "");
      expect(result).assertEqual('');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0018
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0018
     * @tc.desc    Test StringBuilder concatStrings with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result: string = StringBuilder.concatStrings(specialChars, specialChars);
      expect(result).assertEqual(specialChars + specialChars);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0019
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0019
     * @tc.desc    Test StringBuilder concatStrings with full ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiPart1: string = "!\"#$%&'()*+,-./0123456789:;<=>?@";
      const asciiPart2: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const result: string = StringBuilder.concatStrings(asciiPart1, asciiPart2);
      expect(result).assertEqual(asciiPart1 + asciiPart2);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0020
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0020
     * @tc.desc    Test StringBuilder concatStrings with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString1: string = "\\a\\b\\f\\n\\r\\t\\v";
      const escapeString2: string = "\\\\\\'\\\"\\?\\0\\101\\x42";
      const result: string = StringBuilder.concatStrings(escapeString1, escapeString2);
      expect(result).assertEqual(escapeString1 + escapeString2);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0021
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0021
     * @tc.desc    Test StringBuilder concatStrings with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji1: string = "👆👿👀💯🎅😼";
      const emoji2: string = "🔧💇🤼‍♂️🛢🀄🏴";
      const result: string = StringBuilder.concatStrings(emoji1, emoji2);
      expect(result).assertEqual(emoji1 + emoji2);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0022
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0022
     * @tc.desc    Test StringBuilder concatStrings with Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicode1: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      const unicode2: string = "\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87";
      const result: string = StringBuilder.concatStrings(unicode1, unicode2);
      expect(result).assertEqual(unicode1 + unicode2);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0023
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0023
     * @tc.desc    Test StringBuilder concatStrings with invalid Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const normalString: string = "Hello";
      const result: string = StringBuilder.concatStrings(normalString, invalidUnicode);
      expect(result).assertEqual(normalString + invalidUnicode);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0024
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0024
     * @tc.desc    Test StringBuilder concatStrings with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("0", "NaN");
      expect(result1).assertEqual('0NaN');

      const result2: string = StringBuilder.concatStrings("NaN", "");
      expect(result2).assertEqual('NaN');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0025
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0025
     * @tc.desc    Test StringBuilder concatStrings with normal strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Hello ", "World!");
      expect(result).assertEqual('Hello World!');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0026
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0026
     * @tc.desc    Test StringBuilder concatStrings with long strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString1: string = "a".repeat(500);
      const longString2: string = "b".repeat(500);
      const result: string = StringBuilder.concatStrings(longString1, longString2);
      expect(result).assertEqual(longString1 + longString2);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0027
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0027
     * @tc.desc    Test StringBuilder concatStrings with sliced strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "{k1:value1,k2:value2}";
      const slicedStr1: string = str.substring(0, 10);
      const slicedStr2: string = str.substring(10);
      const result: string = StringBuilder.concatStrings(slicedStr1, slicedStr2);
      expect(result).assertEqual(str);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0028
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0028
     * @tc.desc    Test StringBuilder concatStrings with mixed content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Prefix: ", "123abc👆");
      expect(result).assertEqual('Prefix: 123abc👆');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0029
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0029
     * @tc.desc    Test StringBuilder concatStrings with reversed order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("Hello", "World");
      const result2: string = StringBuilder.concatStrings("World", "Hello");
      expect(result1).assertEqual('HelloWorld');
      expect(result2).assertEqual('WorldHello');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0030
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0030
     * @tc.desc    Test StringBuilder concatStrings with complex combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("", "NotEmpty");
      expect(result1).assertEqual('NotEmpty');

      const result2: string = StringBuilder.concatStrings("NotEmpty", "");
      expect(result2).assertEqual('NotEmpty');

      const result3: string = StringBuilder.concatStrings("Left", "Right");
      expect(result3).assertEqual('LeftRight');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0031
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0031
     * @tc.desc    Test StringBuilder concatStrings with whitespace characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Hello\t", "\nWorld");
      expect(result).assertEqual('Hello\t\nWorld');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0032
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0032
     * @tc.desc    Test StringBuilder concatStrings with number strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("123", "456");
      expect(result).assertEqual('123456');

      const result2: string = StringBuilder.concatStrings("3.14", "159");
      expect(result2).assertEqual('3.14159');
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0033
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0033
     * @tc.desc    Test StringBuilder stringLength with empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const length: int = builder.stringLength;
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0034
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0034
     * @tc.desc    Test StringBuilder stringLength with simple string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Hello");
      const length: int = builder.stringLength;
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0035
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0035
     * @tc.desc    Test StringBuilder stringLength with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      builder.append(specialChars);
      const length: int = builder.stringLength;
      expect(length).assertEqual(specialChars.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0036
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0036
     * @tc.desc    Test StringBuilder stringLength with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const emojiString: string = "👆👿👀💯🎅😼";
      builder.append(emojiString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(emojiString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0037
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0037
     * @tc.desc    Test StringBuilder stringLength with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const escapeString: string = "\\n\\t\\r\\\\";
      builder.append(escapeString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(escapeString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0038
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0038
     * @tc.desc    Test StringBuilder stringLength with incremental appends
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      expect(builder.stringLength).assertEqual(0);

      builder.append("Hello");
      expect(builder.stringLength).assertEqual(5);

      builder.append(" ");
      expect(builder.stringLength).assertEqual(6);

      builder.append("World");
      expect(builder.stringLength).assertEqual(11);

      builder.append("!");
      expect(builder.stringLength).assertEqual(12);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0039
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0039
     * @tc.desc    Test StringBuilder stringLength with mixed type appends
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("Count: ");
      builder.append(100 as byte);
      builder.append(", Flag: ");
      builder.append(true);
      builder.append(", Value: ");
      builder.append(3.14);

      const expectedString: string = "Count: 100, Flag: true, Value: 3.14";
      const length: int = builder.stringLength;
      expect(length).assertEqual(expectedString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0040
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0040
     * @tc.desc    Test StringBuilder stringLength with long string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const longString: string = "a".repeat(1000);
      builder.append(longString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(1000);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0041
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0041
     * @tc.desc    Test StringBuilder stringLength with Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const unicodeString: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      builder.append(unicodeString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(unicodeString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0042
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0042
     * @tc.desc    Test StringBuilder stringLength with full ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      builder.append(asciiString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(asciiString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0043
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0043
     * @tc.desc    Test StringBuilder stringLength after multiple operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("Hello");
      builder.append(" ");
      builder.append("World");
      expect(builder.stringLength).assertEqual(11);

      builder.append("!");
      builder.append(" Test");
      expect(builder.stringLength).assertEqual(17);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0044
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0044
     * @tc.desc    Test StringBuilder stringLength with number strings only
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("123");
      builder.append("456");
      builder.append("789");

      const length: int = builder.stringLength;
      expect(length).assertEqual(9);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0045
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0045
     * @tc.desc    Test StringBuilder stringLength with multiple builders
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder();
      builder1.append("First");
      expect(builder1.stringLength).assertEqual(5);

      const builder2: StringBuilder = new StringBuilder();
      builder2.append("SecondBuilder");
      expect(builder2.stringLength).assertEqual(13);

      const builder3: StringBuilder = new StringBuilder();
      expect(builder3.stringLength).assertEqual(0);
    });
    /**
     * @tc.name    builtinsStringBuilderTestConstructor0046
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0046
     * @tc.desc    Test StringBuilder constructor with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0047
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0047
     * @tc.desc    Test StringBuilder constructor with normal string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Hello World");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("Hello World");
      expect(length).assertEqual(11);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0048
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0048
     * @tc.desc    Test StringBuilder constructor with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder(specialChars);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(specialChars);
      expect(length).assertEqual(specialChars.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0049
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0049
     * @tc.desc    Test StringBuilder constructor with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojiString: string = "👆👿👀💯🎅😼";
      const builder: StringBuilder = new StringBuilder(emojiString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(emojiString);
      expect(length).assertEqual(emojiString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0050
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0050
     * @tc.desc    Test StringBuilder constructor with Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicodeString: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      const builder: StringBuilder = new StringBuilder(unicodeString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(unicodeString);
      expect(length).assertEqual(unicodeString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0051
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0051
     * @tc.desc    Test StringBuilder constructor with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString: string = "\\n\\t\\r\\\\\\\"\\'";
      const builder: StringBuilder = new StringBuilder(escapeString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(escapeString);
      expect(length).assertEqual(escapeString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0052
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0052
     * @tc.desc    Test StringBuilder constructor with full ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const builder: StringBuilder = new StringBuilder(asciiString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(asciiString);
      expect(length).assertEqual(asciiString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0053
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0053
     * @tc.desc    Test StringBuilder constructor with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("0");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("0");
      expect(length).assertEqual(1);

      const builder2: StringBuilder = new StringBuilder("NaN");
      const result2: string = builder2.toString();
      const length2: int = builder2.stringLength;
      expect(result2).assertEqual("NaN");
      expect(length2).assertEqual(3);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0054
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0054
     * @tc.desc    Test StringBuilder constructor with long string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString: string = "a".repeat(1000);
      const builder: StringBuilder = new StringBuilder(longString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(longString);
      expect(length).assertEqual(1000);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0055
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0055
     * @tc.desc    Test StringBuilder constructor with sliced string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalString: string = "{k1:value1,k2:value2}";
      const slicedString: string = originalString.substring(0, originalString.length - 2);
      const builder: StringBuilder = new StringBuilder(slicedString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(slicedString);
      expect(length).assertEqual(slicedString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0056
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0056
     * @tc.desc    Test StringBuilder constructor with invalid Unicode codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const builder: StringBuilder = new StringBuilder(invalidUnicode);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(invalidUnicode);
      expect(length).assertEqual(invalidUnicode.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0057
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0057
     * @tc.desc    Test StringBuilder constructor then append more content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Initial: ");
      builder.append("More Content");
      builder.append(123 as byte);
      builder.append(true);

      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("Initial: More Content123true");
      expect(length).assertEqual("Initial: More Content123true".length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0058
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0058
     * @tc.desc    Test StringBuilder constructor with whitespace characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const whitespaceString: string = "  \t\n\r  ";
      const builder: StringBuilder = new StringBuilder(whitespaceString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(whitespaceString);
      expect(length).assertEqual(whitespaceString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0059
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0059
     * @tc.desc    Test StringBuilder constructor with number strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberString: string = "123.456-789";
      const builder: StringBuilder = new StringBuilder(numberString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(numberString);
      expect(length).assertEqual(numberString.length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0060
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0060
     * @tc.desc    Test StringBuilder constructor with empty char array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charArray: char[] = [];
      const builder: StringBuilder = new StringBuilder(charArray);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });
    /**
     * @tc.name    builtinsStringBuilderTestConstructor0061
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0061
     * @tc.desc    Test StringBuilder constructor with empty FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0062
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0062
     * @tc.desc    Test StringBuilder constructor with simple FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Hello");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("Hello");
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0063
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0063
     * @tc.desc    Test StringBuilder constructor with HelloWorld FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const helloWorldStr: string = "HelloWorld123?";
      const builder: StringBuilder = new StringBuilder(helloWorldStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("HelloWorld123?");
      expect(length).assertEqual(14);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0064
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0064
     * @tc.desc    Test StringBuilder constructor with FixedArray<char> containing zeros
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let testString: string = "HelloWorld";
      for (let i = 0; i < 5; i++) {
        testString += String.fromCharCode(0);
      }
      testString += "123?";

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(19);
      expect(result.substring(0, 10)).assertEqual("HelloWorld");
      expect(result.charCodeAt(10)).assertEqual(0);
      expect(result.charCodeAt(11)).assertEqual(0);
      expect(result.charCodeAt(12)).assertEqual(0);
      expect(result.charCodeAt(13)).assertEqual(0);
      expect(result.charCodeAt(14)).assertEqual(0);
      expect(result.substring(15)).assertEqual("123?");
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0065
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0065
     * @tc.desc    Test StringBuilder constructor with full char range in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charCodes: int[] = [0, 1, 127, 255, 1000, 32767, 65535];
      let testString: string = "";
      for (const code of charCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(7);
      for (let i = 0; i < charCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(charCodes[i]);
      }
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0066
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0066
     * @tc.desc    Test StringBuilder constructor with special characters in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialStr: string = "!\"#$%&'()*+,-./";
      const builder: StringBuilder = new StringBuilder(specialStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("!\"#$%&'()*+,-./");
      expect(length).assertEqual(15);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0067
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0067
     * @tc.desc    Test StringBuilder constructor with ASCII characters in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiStr: string = "0123456789ABCDEFGHIJabcdefghij";
      const builder: StringBuilder = new StringBuilder(asciiStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("0123456789ABCDEFGHIJabcdefghij");
      expect(length).assertEqual(30);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0068
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0068
     * @tc.desc    Test StringBuilder constructor with FixedArray<char> then append more content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Start: ");
      builder.append(" Additional Text ");
      builder.append("123");
      builder.append("true");

      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("Start:  Additional Text 123true");
      expect(length).assertEqual("Start:  Additional Text 123true".length);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0069
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0069
     * @tc.desc    Test StringBuilder constructor with mixed char values in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charCodes: int[] = [10, 32, 65, 97, 255, 1000, 2000, 65535];
      let testString: string = "";
      for (const code of charCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;

      expect(length).assertEqual(8);
      for (let i = 0; i < charCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(charCodes[i]);
      }
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0070
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0070
     * @tc.desc    Test StringBuilder constructor with repeated char values in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const repeatedStr: string = "aaaaabbbcc";
      const builder: StringBuilder = new StringBuilder(repeatedStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("aaaaabbbcc");
      expect(length).assertEqual(10);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0071
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0071
     * @tc.desc    Test StringBuilder constructor with single char in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("X");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("X");
      expect(length).assertEqual(1);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0072
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0072
     * @tc.desc    Test StringBuilder constructor with control characters in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const controlCodes: int[] = [7, 8, 9, 10, 11, 12, 13, 27];
      let testString: string = "";
      for (const code of controlCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(8);
      for (let i = 0; i < controlCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(controlCodes[i]);
      }
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0073
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0073
     * @tc.desc    Test StringBuilder constructor with numeric char values in FixedArray<char>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numericStr: string = "01234";
      const builder: StringBuilder = new StringBuilder(numericStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("01234");
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0074
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0074
     * @tc.desc    Test StringBuilder default constructor (empty)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const result: string = builder.toString();
      const length: int = result.length;

      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0075
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0075
     * @tc.desc    Test StringBuilder constructor with string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString: string = "Hello World";
      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;

      expect(result).assertEqual("Hello World");
      expect(length).assertEqual(11);
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0076
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0076
     * @tc.desc    Test StringBuilder constructor with boolean parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder(true.toString());
      const result1: string = builder1.toString();
      expect(result1).assertEqual("true");

      const builder2: StringBuilder = new StringBuilder(false.toString());
      const result2: string = builder2.toString();
      expect(result2).assertEqual("false");
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0077
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0077
     * @tc.desc    Test StringBuilder constructor with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder("");
      const result1: string = builder1.toString();
      expect(result1).assertEqual("");
      expect(result1.length).assertEqual(0);

      const builder2: StringBuilder = new StringBuilder("");
      builder2.append("");
      builder2.append("");
      const result2: string = builder2.toString();
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0078
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0078
     * @tc.desc    Test StringBuilder constructor with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder(specialChars);
      const result: string = builder.toString();

      expect(result).assertEqual(specialChars);
      expect(result.length).assertEqual(32);

      for (let i = 0; i < specialChars.length; i++) {
        expect(result.charAt(i)).assertEqual(specialChars.charAt(i));
      }
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0079
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0079
     * @tc.desc    Test StringBuilder constructor with array-like inputs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const array1: int[] = [72, 101, 108, 108, 111];
      const arrayStr1: string = String.fromCharCode(...array1);
      const builder1: StringBuilder = new StringBuilder(arrayStr1);
      const result1: string = builder1.toString();
      expect(result1).assertEqual("Hello");

      const array2: int[] = [72, 101, 108, 108, 111, 0, 0, 0, 87, 111, 114, 108, 100];
      let arrayStr2: string = "";
      for (const code of array2) {
        arrayStr2 += String.fromCharCode(code);
      }
      const builder2: StringBuilder = new StringBuilder(arrayStr2);
      const result2: string = builder2.toString();
      expect(result2.length).assertEqual(array2.length);
      expect(result2.charCodeAt(5)).assertEqual(0);
      expect(result2.charCodeAt(6)).assertEqual(0);
      expect(result2.charCodeAt(7)).assertEqual(0);

      const array3: int[] = [72, 101, 108, 108, 111, -111, 114, 108, 100];
      let arrayStr3: string = "";
      for (const code of array3) {
        const normalizedCode = code < 0 ? 256 + (code % 256) : code;
        arrayStr3 += String.fromCharCode(normalizedCode);
      }
      const builder3: StringBuilder = new StringBuilder(arrayStr3);
      const result3: string = builder3.toString();
      expect(result3.length).assertEqual(array3.length);

      const emptyArray: number[] = [];
      const emptyStr: string = "";
      const builder4: StringBuilder = new StringBuilder(emptyStr);
      const result4: string = builder4.toString();
      expect(result4).assertEqual("");
      expect(result4.length).assertEqual(0);
    });

    /**
     *
     * @tc.name    builtinsStringBuilderTestConstructor0080
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0080
     * @tc.desc    Test StringBuilder constructor with TypedArray inputs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Array = new Int8Array([-128, -1, 0, 127, 128]);
      let int8Str: string = "";
      for (let i = 0; i < int8Array.length; i++) {
        int8Str += String.fromCharCode(int8Array[i].toInt() & 0xFF);
      }
      const builder1: StringBuilder = new StringBuilder(int8Str);
      const result1: string = builder1.toString();
      expect(result1.length).assertEqual(5);

      const uint8Array = new Uint8Array([0, 255, 256, -1]);
      let uint8Str: string = "";
      for (let i = 0; i < uint8Array.length; i++) {
        uint8Str += String.fromCharCode(uint8Array[i].toInt());
      }
      const builder2: StringBuilder = new StringBuilder(uint8Str);
      const result2: string = builder2.toString();
      expect(result2.length).assertEqual(4);
      expect(result2.charCodeAt(1)).assertEqual(255);

    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0081
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0081
     * @tc.desc    Test StringBuilder constructor boundary cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boundaryChars: int[] = [
        0,
        1,
        127,
        255,
        1000,
        32767,
        65535
      ];

      let boundaryStr: string = "";
      for (const code of boundaryChars) {
        boundaryStr += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(boundaryStr);
      const result: string = builder.toString();

      expect(result.length).assertEqual(boundaryChars.length);
      for (let i = 0; i < boundaryChars.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(boundaryChars[i]);
      }
    });

    /**
     * @tc.name    builtinsStringBuilderTestConstructor0082
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_CONSTRUCTOR_0082
     * @tc.desc    Test StringBuilder constructor chaining operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestConstructor0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Start");
      builder.append(" Middle");
      builder.append(" End");

      const result: string = builder.toString();
      expect(result).assertEqual("Start Middle End");

      const builder2: StringBuilder = new StringBuilder("");
      for (let i = 0; i < 10; i++) {
        builder2.append(i.toString());
      }

      const result2: string = builder2.toString();
      expect(result2).assertEqual("0123456789");
    });

  })
}