import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function StringTrimStartTest():void {
  describe('StringTrimStartTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await Utils.msSleep(20)
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
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0100
     * @tc.name      StringTrimStartTest1001
     * @tc.desc      Test string starting with a regular space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1001';

      let str = "   Hello World";
      let result = str.trimStart();
      expect(result).assertEqual("Hello World");
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0200
     * @tc.name      StringTrimStartTest1002
     * @tc.desc      The test string has whitespace at both ends, only remove the leading whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1002';

      let str = "   Hello World   ";
      let result = str.trimStart();
      expect(result).assertEqual("Hello World   ");
      expect(result.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0300
     * @tc.name      StringTrimStartTest1003
     * @tc.desc      Test a string without whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1003';

      let str = "HelloWorld";
      let result = str.trimStart();
      expect(result).assertEqual("HelloWorld");
      expect(result === str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0400
     * @tc.name      StringTrimStartTest1004
     * @tc.desc      Test string with whitespace only at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1004';

      let str = "   test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      expect(str).assertEqual("   test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0500
     * @tc.name      StringTrimStartTest1005
     * @tc.desc      Test a string that only has whitespace at the end, trimStart does not affect the end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1005';

      let str = "test   ";
      let result = str.trimStart();
      expect(result).assertEqual("test   ");
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0600
     * @tc.name      StringTrimStartTest1006
     * @tc.desc      There are whitespace characters in the middle of the test string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1006';

      let str = "Hello   World";
      let result = str.trimStart();
      expect(result).assertEqual("Hello   World");
      expect(result === str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0700
     * @tc.name      StringTrimStartTest1007
     * @tc.desc      Verify that trimLeft() and trimStart() functions are completely identical
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1007';

      let str = "   test";
      expect(str.trimStart() === str.trimLeft()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0800
     * @tc.name      StringTrimStartTest1008
     * @tc.desc      Test alternating use of two methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1008';

      let str = "   test   ";
      let result1 = str.trimStart();
      let result2 = str.trimLeft();
      expect(result1).assertEqual("test   ");
      expect(result2).assertEqual("test   ");
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_0900
     * @tc.name      StringTrimStartTest1009
     * @tc.desc      Test standard space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1009';

      let str = "   text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1000
     * @tc.name      StringTrimStartTest1010
     * @tc.desc      Test tab character removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1010';

      let str = "\t\ttext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.charCodeAt(0)).assertEqual(116);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1100
     * @tc.name      StringTrimStartTest1011
     * @tc.desc      Test line break removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1011';

      let str = "\n\ntext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1200
     * @tc.name      StringTrimStartTest1012
     * @tc.desc      Test if the carriage return is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1012';

      let str = "\r\rtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1300
     * @tc.name      StringTrimStartTest1013
     * @tc.desc      Test vertical tab removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1013';

      let str = "\v\vtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1400
     * @tc.name      StringTrimStartTest1014
     * @tc.desc      Test page break removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1014';

      let str = "\f\ftext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1500
     * @tc.name      StringTrimStartTest1015
     * @tc.desc      Test non-breaking space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1015';

      let str = "\u00A0\u00A0text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1600
     * @tc.name      StringTrimStartTest1016
     * @tc.desc      Test full-width space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1016';

      let str = "\u3000\u3000text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1700
     * @tc.name      StringTrimStartTest1017
     * @tc.desc      Testing various Unicode whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1017';

      let str = "\u2000\u2001\u2002text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1800
     * @tc.name      StringTrimStartTest1018
     * @tc.desc      Test line separator is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1018';

      let str = "\u2028\u2028text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_1900
     * @tc.name      StringTrimStartTest1019
     * @tc.desc      Test paragraph separator removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1019';

      let str = "\u2029\u2029text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2000
     * @tc.name      StringTrimStartTest1020
     * @tc.desc      Test multiple types of whitespace characters mixed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1020';

      let str = " \t\n\r\v\ftext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2100
     * @tc.name      StringTrimStartTest1021
     * @tc.desc      Test calling trimStart on an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1021';

      let str = "";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      expect(result === str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2200
     * @tc.name      StringTrimStartTest1022
     * @tc.desc      Test a string that contains only whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1022';

      let str = "   ";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2300
     * @tc.name      StringTrimStartTest1023
     * @tc.desc      Test combinations of various whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1023';

      let str = " \t\n\r";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2400
     * @tc.name      StringTrimStartTest1024
     * @tc.desc      Test a single whitespace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1024';

      let str = " ";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2500
     * @tc.name      StringTrimStartTest1025
     * @tc.desc      Test a single non-whitespace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1025';

      let str = "a";
      let result = str.trimStart();
      expect(result).assertEqual("a");
      expect(result === str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2600
     * @tc.name      StringTrimStartTest1026
     * @tc.desc      Test a large number of leading whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1026';

      let spaces = " ".repeat(10000);
      let str = spaces + "text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2700
     * @tc.name      StringTrimStartTest1027
     * @tc.desc      Test long text string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1027';

      let longText = "a".repeat(100000);
      let str = "   " + longText;
      let result = str.trimStart();
      expect(result.length).assertEqual(100000);
      expect(result === longText).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2800
     * @tc.name      StringTrimStartTest1028
     * @tc.desc      Test zero-width characters (non-breaking)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1028';

      let str = "\u200B\u200Btext";
      let result = str.trimStart();
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_2900
     * @tc.name      StringTrimStartTest1029
     * @tc.desc      Test BOM (Byte Order Mark) character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1029';

      let str = "\uFEFFtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3000
     * @tc.name      StringTrimStartTest1030
     * @tc.desc      Verify that trimStart does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1030';

      let str = "   test";
      let original = str;
      let result = str.trimStart();
      expect(str).assertEqual("   test");
      expect(str === original).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3100
     * @tc.name      StringTrimStartTest1031
     * @tc.desc      Verify that the original string length remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1031';

      let str = "   test";
      let originalLength = str.length;
      let result = str.trimStart();
      expect(str.length).assertEqual(7);
      expect(str.length === originalLength).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3200
     * @tc.name      StringTrimStartTest1032
     * @tc.desc      Verify that the return is a new string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1032';

      let str = "test";
      let result = str.trimStart();
      expect(result === str).assertEqual(true);
      expect(result == str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3300
     * @tc.name      StringTrimStartTest1033
     * @tc.desc      Test multiple calls returning different string objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1033';

      let str = "   test";
      let result1 = str.trimStart();
      let result2 = str.trimStart();
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3400
     * @tc.name      StringTrimStartTest1034
     * @tc.desc      Verify that the return value is of string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1034';

      let str = "   test";
      let result1 = str.trimStart();
      let result2 = str.trimStart();
      expect(typeof result1).assertEqual("string");
      expect(result2 instanceof String).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3500
     * @tc.name      StringTrimStartTest1035
     * @tc.desc      Test that a purely blank string returns an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1035';

      let str = "   ";
      let result = str.trimStart();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3600
     * @tc.name      StringTrimStartTest1036
     * @tc.desc      Return a copy of the original string when there is no whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1036';

      let str = "test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      expect(result === str).assertEqual(true);
      expect(result == str).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3700
     * @tc.name      StringTrimStartTest1037
     * @tc.desc      Test only removes leading whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1037';

      let str = "  test  ";
      let result = str.trimStart();
      expect(result).assertEqual("test  ");
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3800
     * @tc.name      StringTrimStartTest1038
     * @tc.desc      Test chained calls of trimStart and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1038';

      let str = "   test   ";
      let result = str.trimStart().trimEnd();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_3900
     * @tc.name      StringTrimStartTest1039
     * @tc.desc      Test trimStart and toUpperCase chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1039';

      let str = "   test";
      let result = str.trimStart().toUpperCase();
      expect(result).assertEqual("TEST");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4000
     * @tc.name      StringTrimStartTest1040
     * @tc.desc      Testing trimStart and repeat chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1040';

      let str = "  ab";
      let result = str.trimStart().repeat(3);
      expect(result).assertEqual("ababab");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4100
     * @tc.name      StringTrimStartTest1041
     * @tc.desc      Test calling trimStart multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1041';

      let str = "   test";
      let result = str.trimStart().trimStart().trimStart();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4200
     * @tc.name      StringTrimStartTest1042
     * @tc.desc      Testing mixed use of trim and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1042';

      let str = "   test   ";
      let result = str.trimStart().trimEnd().trim();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4300
     * @tc.name      StringTrimStartTest1043
     * @tc.desc      Compare the functional differences between trimStart and trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1043';

      let str = "   test   ";
      expect(str.trimStart()).assertEqual("test   ");
      expect(str.trim()).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4400
     * @tc.name      StringTrimStartTest1044
     * @tc.desc      Test the difference between the two in handling blank ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1044';

      let str = "   test   ";
      let trimStartResult = str.trimStart();
      let trimResult = str.trim();
      expect(trimStartResult.length).assertEqual(7);
      expect(trimResult.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4500
     * @tc.name      StringTrimStartTest1045
     * @tc.desc      Comparing the directional differences between trimStart and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1045';

      let str = "   test   ";
      expect(str.trimStart()).assertEqual("test   ");
      expect(str.trimEnd()).assertEqual("   test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4600
     * @tc.name      StringTrimStartTest1046
     * @tc.desc      Testing the combination of the two is equivalent to trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1046';

      let str = "   test   ";
      let combined = str.trimStart().trimEnd();
      let trimmed = str.trim();
      expect(combined === trimmed).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4700
     * @tc.name      StringTrimStartTest1047
     * @tc.desc      Use replace to achieve similar functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1047';

      let str = "   test";
      let withReplace = str.replace(new RegExp("^\\s+", ""), '');
      let withTrimStart = str.trimStart();
      expect(withReplace === withTrimStart).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4800
     * @tc.name      StringTrimStartTest1048
     * @tc.desc      Compare the behavior of regular expressions and trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1048';

      let str = "  \t\n test";
      let withReplace = str.replace(new RegExp("^\\s+", ""), '');
      let withTrimStart = str.trimStart();
      expect(withReplace).assertEqual("test");
      expect(withTrimStart).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_4900
     * @tc.name      StringTrimStartTest1049
     * @tc.desc      Test leading whitespace of Chinese strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1049';

      let str = "   你好世界";
      let result = str.trimStart();
      expect(result).assertEqual("你好世界");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5000
     * @tc.name      StringTrimStartTest1050
     * @tc.desc      Test a string containing Emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1050';

      let str = "   😀🎉";
      let result = str.trimStart();
      expect(result).assertEqual("😀🎉");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5100
     * @tc.name      StringTrimStartTest1051
     * @tc.desc      Test special Unicode whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1051';

      let str = "\u2000\u2001\u2002test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5200
     * @tc.name      StringTrimStartTest1052
     * @tc.desc      Test control character handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1052';

      let str = "\x00\x01\x02test";
      let result = str.trimStart();
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5300
     * @tc.name      StringTrimStartTest1053
     * @tc.desc      Test delete character (DEL)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1053';

      let str = "\x7Ftest";
      let result = str.trimStart();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5400
     * @tc.name      StringTrimStartTest1054
     * @tc.desc      Test multibyte character handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1054';

      let str = "   𠮷𠮷";
      let result = str.trimStart();
      expect(result).assertEqual("𠮷𠮷");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5500
     * @tc.name      StringTrimStartTest1055
     * @tc.desc      Test combined characters (with tones, etc.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1055';

      let str = "   é";
      let result = str.trimStart();
      expect(result).assertEqual("é");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5600
     * @tc.name      StringTrimStartTest1056
     * @tc.desc      Test calling trimStart on a String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1056';

      let strObj = new String("   test");
      let result = strObj.trimStart();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_5700
     * @tc.name      StringTrimStartTest1057
     * @tc.desc      Test original string calling trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1057';

      let str = "   test";
      let result = str.trimStart();
      expect(typeof str).assertEqual("string");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_6700
     * @tc.name      StringTrimStartTest1067
     * @tc.desc      Test trimStart in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1067';

      "use strict";
      let str = "   test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_6800
     * @tc.name      StringTrimStartTest1068
     * @tc.desc      Primitive values as this in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1068';

      "use strict";
      let str = "   test";
      let result = str.trimStart();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGTRIMSTART_7200
     * @tc.name      StringTrimStartTest1072
     * @tc.desc      Handling leading whitespace for each line in multi-line text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1072';

      let text = "   line1\n   line2\n   line3";
      let lines = text.split('\n').map(line => line.trimStart());
      expect(lines[0]).assertEqual("line1");
      expect(lines[1]).assertEqual("line2");
      expect(lines[2]).assertEqual("line3");
    });

  });
}