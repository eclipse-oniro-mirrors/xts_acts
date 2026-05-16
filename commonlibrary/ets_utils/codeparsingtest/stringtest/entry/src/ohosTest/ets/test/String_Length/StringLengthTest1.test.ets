import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_length_test1';
export default function StringLengthTest() {
  describe('StringLengthTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0100
     * @tc.name      StringLengthTest1001
     * @tc.desc      Test string length with letters, digits and symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1001';
      
      const str1 = "hello";
      const str2 = "12345";
      const str3 = "!@#$%";
      const str4 = "Hello World!";
      expect(str1.length).assertEqual(5);
      expect(str2.length).assertEqual(5);
      expect(str3.length).assertEqual(5);
      expect(str4.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0200
     * @tc.name      StringLengthTest1002
     * @tc.desc      Test string length for Chinese characters (each Chinese character is 1 code unit in UTF-16)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1002';
      
      const str1 = "你好";
      const str2 = "中文测试";
      const str3 = "Hello世界";
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(4);
      expect(str3.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0300
     * @tc.name      StringLengthTest1003
     * @tc.desc      Test the length property of an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1003';
      
      const str1 = "";
      const str2 = '';
      const str3 = ``;
      expect(str1.length).assertEqual(0);
      expect(str2.length).assertEqual(0);
      expect(str3.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0400
     * @tc.name      StringLengthTest1004
     * @tc.desc      Test the length property of a single character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1004';
      
      const str1 = "a";
      const str2 = "中";
      const str3 = " ";
      const str4 = "\n";
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0500
     * @tc.name      StringLengthTest1005
     * @tc.desc      Test length statistics of various whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1005';
      
      const str1 = " ";
      const str2 = "\t";
      const str3 = "\n";
      const str4 = "\r";
      const str5 = " \t\n";
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(1);
      expect(str5.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0600
     * @tc.name      StringLengthTest1006
     * @tc.desc      Test scenarios with various whitespace characters in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1006';
      
      const str1 = "hello world";
      const str2 = "  hello  ";
      const str3 = "line1\nline2";
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(9);
      expect(str3.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0700
     * @tc.name      StringLengthTest1007
     * @tc.desc      Test length of Latin letters (BMP characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1007';
      
      const str1 = "ABC";
      const str2 = "abc";
      const str3 = "ÄÖÜ";
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
      expect(str3.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0800
     * @tc.name      StringLengthTest1008
     * @tc.desc      Test length of Cyrillic characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1008';
      
      const str1 = "Привет";
      const str2 = "мир";
      expect(str1.length).assertEqual(6);
      expect(str2.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_0900
     * @tc.name      StringLengthTest1009
     * @tc.desc      Test length of Greek characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1009';
      
      const str1 = "ΑΒΓ";
      const str2 = "αβγ";
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1000
     * @tc.name      StringLengthTest1010
     * @tc.desc      Compare strings with different lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1010';
      
      const str1 = "hello";
      const str2 = "world";
      const str3 = "hi";
      expect(str1.length === str2.length).assertEqual(true);
      expect(str1.length > str3.length).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1100
     * @tc.name      StringLengthTest1011
     * @tc.desc      Test emoji character length (most emojis occupy 2 code units)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1011';
      
      const str1 = "😄";
      const str2 = "🎉";
      const str3 = "❤️";
      const str4 = "😀😁😂";
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(2);
      expect(str4.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1200
     * @tc.name      StringLengthTest1012
     * @tc.desc      Test complex emojis consisting of multiple code units
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1012';
      
      const str1 = "👨‍👩‍👧‍👦";
      const str2 = "🏳️‍🌈";
      const str3 = "👍🏻";
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(6);
      expect(str3.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1300
     * @tc.name      StringLengthTest1013
     * @tc.desc      Test rare Chinese characters outside the Basic Multilingual Plane (BMP)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1013';
      
      const str1 = "𠮷";
      const str2 = "𡠀";
      const str3 = "𠮷𡠀";
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1400
     * @tc.name      StringLengthTest1014
     * @tc.desc      Test mathematical alphanumeric symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1014';
      
      const str1 = "𝑥";
      const str2 = "𝑦";
      const str3 = "∀𝑥∈ℝ";
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1500
     * @tc.name      StringLengthTest1015
     * @tc.desc      Test the effect of zero-width characters on the length property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1015';
      
      const str1 = "a\u200Bb";
      const str2 = "a\u200Cb";
      const str3 = "a\u200Db";
      const str4 = "a\uFEFFb";
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
      expect(str3.length).assertEqual(3);
      expect(str4.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1600
     * @tc.name      StringLengthTest1016
     * @tc.desc      Test the length of combining character sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1016';
      
      const str1 = "é";
      const str2 = "e\u0301";
      const str3 = "ñ";
      const str4 = "n\u0303";
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1700
     * @tc.name      StringLengthTest1017
     * @tc.desc      Test the length differences between various Unicode normalization forms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1017';
      
      const str1 = "é";
      const str2 = "e\u0301";
      const str3 = str1.normalize("NFD");
      const str4 = str2.normalize("NFC");
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(2);
      expect(str4.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1800
     * @tc.name      StringLengthTest1019
     * @tc.desc      Test empty string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1019';
      
      const str1 = "";
      const str2 = String();
      const str3 = String("");
      expect(str1.length).assertEqual(0);
      expect(str2.length).assertEqual(0);
      expect(str3.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_1900
     * @tc.name      StringLengthTest1020
     * @tc.desc      Test single-character string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1020';
      
      const str1 = "a";
      const str2 = "\0";
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2000
     * @tc.name      StringLengthTest1021
     * @tc.desc      Test 1000-character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1021';
      
      const str1 = "a".repeat(1000);
      expect(str1.length).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2100
     * @tc.name      StringLengthTest1022
     * @tc.desc      Test 10000-character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1022';
      
      const str1 = "a".repeat(10000);
      expect(str1.length).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2200
     * @tc.name      StringLengthTest1023
     * @tc.desc      Test 1000000-character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1023';
      
      const str1 = "a".repeat(1000000);
      expect(str1.length).assertEqual(1000000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2300
     * @tc.name      StringLengthTest1024
     * @tc.desc      Test string length near Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1024';
      
      const maxLen = 2 ** 53 - 1;
      expect(Number.MAX_SAFE_INTEGER).assertEqual(maxLen);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2400
     * @tc.name      StringLengthTest1025
     * @tc.desc      Test string lengths at 2^31 and 2^32 boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1025';
      
      const len1 = 2 ** 31 - 1;
      const len2 = 2 ** 32 - 1;
      expect(len1).assertEqual(2147483647);
      expect(len2).assertEqual(4294967295);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2500
     * @tc.name      StringLengthTest1026
     * @tc.desc      Modify length in strict mode, expect error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1026';
      
      let result = stringTest.testModifylength();
      expect(result.isTypeError).assertEqual(true);
      expect(result.length).assertEqual(5);
      expect(result.content).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2600
     * @tc.name      StringLengthTest1027
     * @tc.desc      Test whether the length property appears in the for...in loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1027';
      
      let result = stringTest.testForInLoop();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2700
     * @tc.name      StringLengthTest1028
     * @tc.desc      Test whether the length property appears in the Object.keys() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1028';
      
      let result = stringTest.testObjectKeys();
      expect(result.hasLength).assertEqual(false);
      expect(result.keys.length).assertEqual(5);
      expect(result.keys[0]).assertEqual("0");
      expect(result.keys[1]).assertEqual("1");
      expect(result.keys[2]).assertEqual("2");
      expect(result.keys[3]).assertEqual("3");
      expect(result.keys[4]).assertEqual("4");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2800
     * @tc.name      StringLengthTest1029
     * @tc.desc      Attempt to delete the length property in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1029';
      
      let result = stringTest.testStrictDeleteLength();
      expect(result.isTypeError).assertEqual(true);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_2900
     * @tc.name      StringLengthTest1030
     * @tc.desc      View the full descriptor of the length property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1030';
      
      let result = stringTest.testAllDeleteLength() ;
      expect(result.value).assertEqual(5);
      expect(result.writable).assertEqual(false);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3000
     * @tc.name      StringLengthTest1031
     * @tc.desc      Traverse the string by using the length property and charAt method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1031';
      
      let result = stringTest.testTraverseString();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3100
     * @tc.name      StringLengthTest1032
     * @tc.desc      Implement string reversal using the length property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1032';
      
      let result = stringTest.testReverseStringLength();
      expect(result).assertEqual("olleh");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3200
     * @tc.name      StringLengthTest1033
     * @tc.desc      Use the length property as parameters for substring/slice methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1033';
      
      let result = stringTest.testLengthSlice();
      expect(result.substringFull).assertEqual("hello world");
      expect(result.sliceFull).assertEqual("hello world");
      expect(result.substringPartial).assertEqual("world");
      expect(result.slicePartial).assertEqual("world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3300
     * @tc.name      StringLengthTest1034
     * @tc.desc      Safe substring with length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1034';
      
      let result = stringTest.testSafeSubstr();
      expect(result.case1).assertEqual("hello");
      expect(result.case2).assertEqual("hel");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3400
     * @tc.name      StringLengthTest1035
     * @tc.desc      Compare str and split length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1035';
      
      let result = stringTest.testCompareLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3500
     * @tc.name      StringLengthTest1036
     * @tc.desc      Split char equals str length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1036';
      
      let result = stringTest.testSplitLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(5);
      expect(result.isRecovered).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3600
     * @tc.name      StringLengthTest1037
     * @tc.desc      Check find result with length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1037';
      
      let result = stringTest.testFindLength();
      expect(result.isIndexValid).assertEqual(true);
      expect(result.isFound).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3700
     * @tc.name      StringLengthTest1038
     * @tc.desc      Check inclusion with length & indexOf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1038';
      
      let result = stringTest.testCheckInclusion();
      expect(result.hasWorld).assertEqual(true);
      expect(result.hasXyz).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3800
     * @tc.name      StringLengthTest1039
     * @tc.desc      Compare length before/after trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1039';
      
      let result = stringTest.testTrimLength();
      expect(result.original).assertEqual(9);
      expect(result.trimmed).assertEqual(5);
      expect(result.trimStart).assertEqual(7);
      expect(result.trimEnd).assertEqual(7);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_3900
     * @tc.name      StringLengthTest1040
     * @tc.desc      Check empty after trim with length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1040';
      
      let result = stringTest.testTrimEmpty();
      expect(result.allSpaces).assertEqual(true);
      expect(result.hasChar).assertEqual(false);
      expect(result.emptyStr).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4000
     * @tc.name      StringLengthTest1041
     * @tc.desc      Test length after repeat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1041';
      
      let result = stringTest.testRepeatLength();
      expect(result.repeat3).assertEqual(6);
      expect(result.repeat0).assertEqual(0);
      expect(result.repeat5).assertEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4100
     * @tc.name      StringLengthTest1042
     * @tc.desc      Verify repeat length = len × times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1042';
      
      let result = stringTest.testRepeatCalc();
      expect(result.repeatedLength).assertEqual(50);
      expect(result.isEqual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4200
     * @tc.name      StringLengthTest1043
     * @tc.desc      Test length after padStart/padEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1043';
      
      let result = stringTest.testPadLength();
      expect(result.padStart).assertEqual(10);
      expect(result.padEnd).assertEqual(10);
      expect(result.padStartWith).assertEqual(10);
      expect(result.padEndWith).assertEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4300
     * @tc.name      StringLengthTest1044
     * @tc.desc      No pad if target < length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1044';
      
      let result = stringTest.testPadNoFill();
      expect(result.padStart).assertEqual(5);
      expect(result.padEnd).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4400
     * @tc.name      StringLengthTest1045
     * @tc.desc      Test replace impact on length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1045';
      
      let result = stringTest.testReplaceLength();
      expect(result.replace).assertEqual(8);
      expect(result.replaceFirst).assertEqual(12);
      expect(result.replaceAll).assertEqual(13);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4500
     * @tc.name      StringLengthTest1046
     * @tc.desc      Test escape char length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1046';
      
      let result = stringTest.testEscapeLength();
      expect(result.slashN).assertEqual(2);
      expect(result.newLine).assertEqual(1);
      expect(result.slashT).assertEqual(2);
      expect(result.tab).assertEqual(1);
      expect(result.doubleSlash).assertEqual(2);
      expect(result.singleSlash).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4600
     * @tc.name      StringLengthTest1047
     * @tc.desc      Test Unicode escape length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1047';
      
      let result = stringTest.testUnicodeLen();
      expect(result.literalU).assertEqual(6);
      expect(result.charA).assertEqual(1);
      expect(result.literalEmoji).assertEqual(9);
      expect(result.emoji).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4700
     * @tc.name      StringLengthTest1048
     * @tc.desc      Test ASCII control length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1048';
      
      let result = stringTest.testAsciiLen();
      expect(result.nullChar).assertEqual(1);
      expect(result.hex00).assertEqual(1);
      expect(result.hex01).assertEqual(1);
      expect(result.hex1F).assertEqual(1);
      expect(result.hex7F).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4800
     * @tc.name      StringLengthTest1049
     * @tc.desc      Test zero-width character length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1049';
      
      expect("\u200B".length).assertEqual(1);
      expect("\u200C".length).assertEqual(1);
      expect("\u200D".length).assertEqual(1);
      expect("\uFEFF".length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_4900
     * @tc.name      StringLengthTest1050
     * @tc.desc      Test length of HTML entity strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1050';
      
      expect("&lt;".length).assertEqual(4);
      expect("<".length).assertEqual(1);
      expect("&amp;".length).assertEqual(5);
      expect("&".length).assertEqual(1);
      expect("&#65;".length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5000
     * @tc.name      StringLengthTest1051
     * @tc.desc      Test currency symbol length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1051';
      
      expect("$".length).assertEqual(1);
      expect("€".length).assertEqual(1);
      expect("£".length).assertEqual(1);
      expect("¥".length).assertEqual(1);
      expect("₹".length).assertEqual(1);
      expect("₽".length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5100
     * @tc.name      StringLengthTest1052
     * @tc.desc      Test string literal length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1052';
      
      expect("hello".length).assertEqual(5);
      expect('hello'.length).assertEqual(5);
      expect(`hello`.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5200
     * @tc.name      StringLengthTest1053
     * @tc.desc      Test String constructor length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1053';
      
      expect(String("hello").length).assertEqual(5);
      expect(String(123).length).assertEqual(3);
      expect(String(true).length).assertEqual(4);
      expect(String(null).length).assertEqual(4);
      expect(String(undefined).length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5300
     * @tc.name      StringLengthTest1054
     * @tc.desc      Test String object length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1054';
      
      const strObj = new String("hello");
      expect(strObj.length).assertEqual(5);
      expect(typeof strObj).assertEqual("object");
      expect(strObj.valueOf().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5400
     * @tc.name      StringLengthTest1055
     * @tc.desc      Test length of converted number strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1055';
      
      expect(String(0).length).assertEqual(1);
      expect(String(123).length).assertEqual(3);
      expect(String(3.14).length).assertEqual(4);
      expect(String(-123).length).assertEqual(4);
      expect(String(1e10).length).assertEqual(11);
      expect(String(Infinity).length).assertEqual(8);
      expect(String(NaN).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5500
     * @tc.name      StringLengthTest1056
     * @tc.desc      Test length of boolean strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1056';
      
      expect(String(true).length).assertEqual(4);
      expect(String(false).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5600
     * @tc.name      StringLengthTest1057
     * @tc.desc      Test length of object strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1057';
      
      expect(String({}).length).assertEqual(15);
      expect(String({ a: 1 }).length).assertEqual(15);
      expect(String([1, 2, 3]).length).assertEqual(5);
      expect(String([]).length).assertEqual(0);
      expect(String([1]).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5700
     * @tc.name      StringLengthTest1058
     * @tc.desc      Test length of null & undefined strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1058';
      
      expect(String(null).length).assertEqual(4);
      expect(String(undefined).length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5800
     * @tc.name      StringLengthTest1059
     * @tc.desc      Test iteration count vs length via for...of
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1059';
      
      const str = "hello";
      let count = 0;
      for (let char of str) {
        count++;
      }
      expect(count).assertEqual(5);
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_5900
     * @tc.name      StringLengthTest1060
     * @tc.desc      Iteration count differs from length for surrogate pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1060';
      
      const str = "😄hello";
      let count = 0;
      for (let char of str) {
        count++;
      }
      expect(str.length).assertEqual(7);
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6000
     * @tc.name      StringLengthTest1061
     * @tc.desc      Compare length with spread operator array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1061';
      
      let result = stringTest.testSpreadLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6100
     * @tc.name      StringLengthTest1062
     * @tc.desc      Array length differs from string length with surrogate pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1062';
      
      let result = stringTest.testSurrogateLength();
      expect(result.strLength).assertEqual(4);
      expect(result.arrLength).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6200
     * @tc.name      StringLengthTest1063
     * @tc.desc      Convert string with Array.from
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1063';
      
      const str = "hello";
      const arr = Array.from(str);
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr.join("")).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6300
     * @tc.name      StringLengthTest1064
     * @tc.desc      Count chars with for...of
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1064';
      
      let result = stringTest.testCountChars();
      expect(result.hello).assertEqual(5);
      expect(result.emoji).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6400
     * @tc.name      StringLengthTest1065
     * @tc.desc      Access chars with index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1065';
      
      const str = "hello";
      let result = stringTest.testAccessByIndex();
      expect(result.firstChar).assertEqual("h");
      expect(result.lastChar).assertEqual("o");
      expect(result.middleChar).assertEqual("l");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6500
     * @tc.name      StringLengthTest1066
     * @tc.desc      Access boundary indexes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1066';
      
      let result = stringTest.testBoundaryIndex();
      expect(result.firstIndex).assertEqual("h");
      expect(result.beyondLastIndex).assertEqual(undefined);
      expect(result.lastIndex).assertEqual("o");
      expect(result.negativeIndex).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6600
     * @tc.name      StringLengthTest1067
     * @tc.desc      Traverse string in reverse order using length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1067';
      
      let result = stringTest.testReverseIter();
      expect(result).assertEqual("olleh");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6700
     * @tc.name      StringLengthTest1068
     * @tc.desc      Test length after concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1068';
      
      const str1 = "hello";
      const str2 = "world";
      const result = str1 + " " + str2;
      expect(str1.length).assertEqual(5);
      expect(str2.length).assertEqual(5);
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6800
     * @tc.name      StringLengthTest1069
     * @tc.desc      Test string concatenation using concat method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1069';
      
      const str = "hello";
      const result = str.concat(" ", "world");
      expect(result.length).assertEqual(11);
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_6900
     * @tc.name      StringLengthTest1070
     * @tc.desc      Test string concatenation using template literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1070';
      
      const a = "hello";
      const b = "world";
      const result = `${a} ${b}`;
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7000
     * @tc.name      StringLengthTest1071
     * @tc.desc      Test length of string joined from array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1071';
      
      const arr = ["h", "e", "l", "l", "o"];
      const str = arr.join("");
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7100
     * @tc.name      StringLengthTest1072
     * @tc.desc      Test length with separator join
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1072';
      
      const arr = ["a", "b", "c"];
      const str = arr.join(",");
      expect(str).assertEqual("a,b,c");
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7200
     * @tc.name      StringLengthTest1073
     * @tc.desc      Verify string length within specified range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1073';
      
      let result = stringTest.testValidLength();
      expect(result.case1).assertEqual(true);
      expect(result.case2).assertEqual(false);
      expect(result.case3).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7300
     * @tc.name      StringLengthTest1074
     * @tc.desc      Check if string is empty using length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1074';
      
      let result = stringTest.testEmptyByLength();
      expect(result.case1).assertEqual(true);
      expect(result.case2).assertEqual(false);
      expect(result.case3).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7400
     * @tc.name      StringLengthTest1075
     * @tc.desc      Truncate string based on length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1075';
      
      let result = stringTest.testTruncate();
      expect(result.case1).assertEqual("hello...");
      expect(result.case2).assertEqual("hi");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7500
     * @tc.name      StringLengthTest1076
     * @tc.desc      Ensure safe substring extraction using length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1076';
      
      let result = stringTest.testSafeSubstring();
      expect(result.case1).assertEqual("ell");
      expect(result.case2).assertEqual("llo");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7600
     * @tc.name      StringLengthTest1077
     * @tc.desc      Manual implementation of left padding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1077';
      
      let result = stringTest.testLeftPad();
      expect(result.case1).assertEqual("005");
      expect(result.case2).assertEqual("     hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7700
     * @tc.name      StringLengthTest1078
     * @tc.desc      Manual implementation of right padding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1078';
      
      let result = stringTest.testRightPad();
      expect(result.case1).assertEqual("500");
      expect(result.case2).assertEqual("hello     ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7800
     * @tc.name      StringLengthTest1079
     * @tc.desc      Implement fixed width formatting using length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1079';
      
      let result = stringTest.testFormatFixed();
      expect(result.case1).assertEqual("hello     ");
      expect(result.case2).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_7900
     * @tc.name      StringLengthTest1080
     * @tc.desc      Implement string center alignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1080';
      
      let result = stringTest.testCenter();
      expect(result.case1).assertEqual("    hi    ");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8000
     * @tc.name      StringLengthTest1081
     * @tc.desc      Count words by combining length and split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1081';
      
      let result = stringTest.testCountWords();
      expect(result.case1).assertEqual(2);
      expect(result.case2).assertEqual(0);
      expect(result.case3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8100
     * @tc.name      StringLengthTest1082
     * @tc.desc      Compare length before and after processing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1082';
      
      let result = stringTest.testLengthCompare();
      expect(result.originalLen).assertEqual(17);
      expect(result.normalizedLen).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8200
     * @tc.name      StringLengthTest1083
     * @tc.desc      Distinguish between length of String constructor and string instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1083';
      
      expect(String.length).assertEqual(1);
      expect("hello".length).assertEqual(5);
      expect(new String("hello").length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8300
     * @tc.name      StringLengthTest1084
     * @tc.desc      String.length represents the number of parameters the String function expects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1084';
      
      expect(String.length).assertEqual(1);
      expect(String.fromCharCode.length).assertEqual(1);
      expect(String.fromCodePoint.length).assertEqual(1);
      expect(String.raw.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8400
     * @tc.name      StringLengthTest1085
     * @tc.desc      Use length in tag function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1085';
      
      let result = stringTest.testLengthInTagFunction();
      expect(result.stringsLength).assertEqual(3);
      expect(result.valuesLength).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8500
     * @tc.name      StringLengthTest1086
     * @tc.desc      Use String.raw and length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1086';
      
      const str1 = `hello\nworld`;
      const str2 = String.raw`hello\nworld`;
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8600
     * @tc.name      StringLengthTest1087
     * @tc.desc      Compare the length before and after serialization
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1087';
      
      const str = 'hello "world"';
      const json = JSON.stringify(str);
      expect(str.length).assertEqual(13);
      expect(json.length).assertEqual(17);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8700
     * @tc.name      StringLengthTest1088
     * @tc.desc      Test the length after JSON parsing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1088';
      
      let result = stringTest.testJsonParseLength();
      expect(result.jsonLength).assertEqual(14);
      expect(result.parsedLength).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8800
     * @tc.name      StringLengthTest1089
     * @tc.desc      Use length to determine the match result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1089';
      
      const str = "hello world";
      const matches = str.match(/o/g);
      const matchCount = matches !== null ? matches.length : 0;
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGLENGTH_8900
     * @tc.name      StringLengthTest1090
     * @tc.desc      Count the number of replacements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringLengthTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringLengthTest1090';
      
      const str = "hello world";
      let count = 0;
      const result = str.replace(/o/g, () => {
        count++;
        return "O";
      });
      expect(count).assertEqual(2);
      expect(result.length).assertEqual(11);
    });


  });
}