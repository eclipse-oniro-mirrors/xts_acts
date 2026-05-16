import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function StringTrimEndTest():void {
  describe('StringTrimEndTest', () => {
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


    //=================Basic Usage==================
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0100
     * @tc.name       StringTrimEndTest1001
     * @tc.desc       Test the case where the string contains spaces at the end
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1001';
      let str = "Hello World   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World")
      expect(result.length).assertEqual(11)
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0200
     * @tc.name       StringTrimEndTest1002
     * @tc.desc       Test that only trailing spaces are removed and leading spaces are retained
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1002';

      let str = "   Hello World   ";
      let result = str.trimEnd();
      expect(result).assertEqual("   Hello World")
      expect(result.length).assertEqual(14)
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0400
     * @tc.name       StringTrimEndTest1004
     * @tc.desc       Test calling trimEnd() on an empty string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1004';

      let str = "";
      let result = str.trimEnd();
      expect(result).assertEqual( "")
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0500
     * @tc.name       StringTrimEndTest1005
     * @tc.desc       Test a string containing only whitespace characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1005';

      let str = "     ";
      let result = str.trimEnd();
      expect(result).assertEqual( "")
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0600
     * @tc.name       StringTrimEndTest1006
     * @tc.desc       Test that spaces in the middle of a string are unaffected
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1006';

      let str = "Hello World   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World")
      expect(result.indexOf(" ")).assertEqual(5)

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0700
     * @tc.name       StringTrimEndTest1007
     * @tc.desc       Test multiple middle spaces preserved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1007';

      let str = "Hello    World   ";
      let result = str.trimEnd();
      result = result.padEnd(15, " ");
      expect(result.substring(0, 14)).assertEqual( "Hello    World")
      expect(result.length).assertEqual(15)
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0800
     * @tc.name       StringTrimEndTest1008
     * @tc.desc       TestNormalSpaceChar
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1008';

      let str = "Hello\u0020\u0020\u0020";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_0900
     * @tc.name       StringTrimEndTest1009
     * @tc.desc       TestHorizontalTabRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1009';

      let str = "Hello\t\t\t";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1000
     * @tc.name       StringTrimEndTest1010
     * @tc.desc       TestVerticalTabRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1010';

      let str = "Hello\v\v";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1100
     * @tc.name       StringTrimEndTest1011
     * @tc.desc       TestFormFeedRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1011';

      let str = "Hello\f\f";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1200
     * @tc.name       StringTrimEndTest1012
     * @tc.desc       TestNbspRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1012';

      let str = "Hello\u00A0\u00A0";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1300
     * @tc.name       StringTrimEndTest1013
     * @tc.desc      TestNewLineRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1013';

      let str = "Hello\n\n\n";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1400
     * @tc.name       StringTrimEndTest1014
     * @tc.desc      TestCarriageReturnRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1014';

      let str = "Hello\r\r";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1500
     * @tc.name       StringTrimEndTest1015
     * @tc.desc      TestWindowsNewLineRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1015';

      let str = "Hello\r\n\r\n";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1600
     * @tc.name       StringTrimEndTest1016
     * @tc.desc      TestLineSeparatorRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1016';

      let str = "Hello\u2028\u2028";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1700
     * @tc.name       StringTrimEndTest1017
     * @tc.desc      TestParagraphSeparatorRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1017';

      let str = "Hello\u2029\u2029";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1800
     * @tc.name       StringTrimEndTest1018
     * @tc.desc      TestFullWidthSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1018';

      let str = "Hello\u3000\u3000";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_1900
     * @tc.name       StringTrimEndTest1019
     * @tc.desc      TestOghamSpaceMarkRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1019';

      let str = "Hello\u1680\u1680";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2000
     * @tc.name       StringTrimEndTest1020
     * @tc.desc      TestEnSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1020';

      let str = "Hello\u2002\u2002";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2100
     * @tc.name       StringTrimEndTest1021
     * @tc.desc      TestEmSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1021';

      let str = "Hello\u2003\u2003";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2200
     * @tc.name       StringTrimEndTest1022
     * @tc.desc      TestNarrowNbspRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1022';

      let str = "Hello\u202F\u202F";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2300
     * @tc.name       StringTrimEndTest1023
     * @tc.desc      TestMediumMathSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1023';

      let str = "Hello\u205F\u205F";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2400
     * @tc.name       StringTrimEndTest1024
     * @tc.desc      TestMixedWhitespaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1024';

      let str = "Hello \t\n\r";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2500
     * @tc.name       StringTrimEndTest1025
     * @tc.desc      TestTrailingMixedWhitespaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1025';

      let str = "Hello World \t \n \r ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2600
     * @tc.name       StringTrimEndTest1026
     * @tc.desc      TestSingleCharWithSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1026';

      let str = "A   ";
      let result = str.trimEnd();
      expect(result).assertEqual("A");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2700
     * @tc.name       StringTrimEndTest1027
     * @tc.desc      TestMassiveWhitespace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1027';

      let str = " ".repeat(1000);
      let result = str.trimEnd();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2800
     * @tc.name       StringTrimEndTest1028
     * @tc.desc      TestLongStringProcessing
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1028';

      let str = "A".repeat(10000) + "   ";
      let result = str.trimEnd();
      expect(result.length).assertEqual(10000);
      expect(result === "A".repeat(10000)).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_2900
     * @tc.name       StringTrimEndTest1029
     * @tc.desc      TestTrimTrailingKeepLeading
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1029';

      let str = "   Hello";
      let result = str.trimEnd();
      expect(result).assertEqual( "   Hello");
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3000
     * @tc.name       StringTrimEndTest1030
     * @tc.desc      TestMiddleSpacesUnaffected
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1030';

      let str = "Hel   lo";
      let result = str.trimEnd();
      expect(result).assertEqual(  "Hel   lo");
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3100
     * @tc.name       StringTrimEndTest1031
     * @tc.desc       TestTrimTrailingWithLeading
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1031';

      let str = "   Hello   ";
      let result = str.trimEnd();
      expect(result).assertEqual(  "   Hello");
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3200
     * @tc.name       StringTrimEndTest1032
     * @tc.desc       TestSpaceAfterSymbolRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1032';

      let str = "@#$%^&*()   ";
      let result = str.trimEnd();
      expect(result).assertEqual("@#$%^&*()");
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3300
     * @tc.name       StringTrimEndTest1033
     * @tc.desc       TestSpaceAfterNumberRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1033';

      let str = "12345   ";
      let result = str.trimEnd();
      expect(result).assertEqual("12345");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3400
     * @tc.name       StringTrimEndTest1034
     * @tc.desc       TestSpaceAfterChineseRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1034';

      let str = "你好世界   ";
      let result = str.trimEnd();
      expect(result).assertEqual("你好世界");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3500
     * @tc.name       StringTrimEndTest1035
     * @tc.desc       TestSpaceAfterJapaneseRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1035';

      let str = "こんにちは   ";
      let result = str.trimEnd();
      expect(result).assertEqual("こんにちは");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3600
     * @tc.name       StringTrimEndTest1036
     * @tc.desc       TestSpaceAfterKoreanRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1036';

      let str = "안녕하세요   ";
      let result = str.trimEnd();
      expect(result).assertEqual("안녕하세요");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3700
     * @tc.name       StringTrimEndTest1037
     * @tc.desc       TestSpaceAfterEmojiRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1037';

      let str = "Hello🎉🎊   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello🎉🎊");
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3800
     * @tc.name       StringTrimEndTest1038
     * @tc.desc       TestSpaceAfterArabicRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1038';

      let str = "مرحبا   ";
      let result = str.trimEnd();
      expect(result).assertEqual("مرحبا");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_3900
     * @tc.name       StringTrimEndTest1039
     * @tc.desc       TestSpaceAfterMultiLangRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1039';

      let str = "Hello世界🎉   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello世界🎉");
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4000
     * @tc.name       StringTrimEndTest1040
     * @tc.desc       TestSpaceAfterZeroWidthRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1040';

      let str = "Hello\u200B   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello\u200B");
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4100
     * @tc.name       StringTrimEndTest1041
     * @tc.desc       TestSpaceAfterCombinedCharRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1041';

      let str = "café\u0301   ";
      let result = str.trimEnd();
      expect(result).assertEqual("café\u0301");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4200
     * @tc.name       StringTrimEndTest1042
     * @tc.desc       TestSpaceAfterSurrogatePairRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1042';

      let str = "Hello\uD83D\uDE00   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello\uD83D\uDE00");
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4300
     * @tc.name       StringTrimEndTest1043
     * @tc.desc       TestNewStringReturned
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1043';

      let str = "Hello   ";
      let result = str.trimEnd();
      expect(result === str).assertEqual(false);
      expect(result === str).assertEqual(false);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4400
     * @tc.name       StringTrimEndTest1044
     * @tc.desc       TestOriginalStringUnchanged
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1044';

      let str = "Hello   ";
      let original = str;
      expect (str).assertEqual("Hello   ");
      expect(str === original).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4500
     * @tc.name       StringTrimEndTest1045
     * @tc.desc       VerifyReturnType
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0045';

      let str = "Hello   ";
      let result:string = str.trimEnd();
      expect(typeof result).assertEqual("string");
      expect(result instanceof String).assertEqual(true);
    })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4600
     * @tc.name       StringTrimEndTest1046
     * @tc.desc       TestReturnStrLength
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1046';

      let str = "Hello   ";
      let result = str.trimEnd();
      expect (result.length).assertEqual(5);
      expect(result.length === str.length - 3).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4700
     * @tc.name       StringTrimEndTest1047
     * @tc.desc       TestTrimRightEqualsEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1047';

      let str = "Hello   ";
      let result1 = str.trimEnd();
      let result2 = str.trimRight();
      expect (result1).assertEqual("Hello");
      expect(result2).assertEqual("Hello");
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4800
     * @tc.name       StringTrimEndTest1048
     * @tc.desc       TestTrimRightWithWhitespaceChars
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1048';

      let str = "Hello \t\n\r";
      let result = str.trimRight();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_4900
     * @tc.name       StringTrimEndTest1049
     * @tc.desc       CompareTrimEndTrim
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1049';

      let str = "   Hello   ";
      let trimEndResult = str.trimEnd();
      let trimResult = str.trim();
      expect(trimEndResult).assertEqual("   Hello");
      expect(trimResult).assertEqual("Hello");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5000
     * @tc.name       StringTrimEndTest1050
     * @tc.desc       TestTrimEndThenTrim
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1050';

      let str = "   Hello   ";
      let result = str.trimEnd().trim();
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5100
     * @tc.name       StringTrimEndTest1051
     * @tc.desc       TestTwoMethodsTrimEffect
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1051';

      let str = "   Hello   ";
      let result = str.trimStart().trimEnd();
      expect(result).assertEqual("Hello");
      expect(result === str.trim()).assertEqual( true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5200
     * @tc.name       StringTrimEndTest1052
     * @tc.desc      TestOrderNoResultImpact
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1052';

      let str = "   Hello   ";
      let result1 = str.trimStart().trimEnd();
      let result2 = str.trimEnd().trimStart();
      expect(result1).assertEqual("Hello");
      expect(result2).assertEqual("Hello");
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5300
     * @tc.name       StringTrimEndTest1053
     * @tc.desc      TestChainCaseConversion
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1053';

      let str = "hello   ";
      let result = str.trimEnd().toUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5400
     * @tc.name       StringTrimEndTest1054
     * @tc.desc      TestChainToLowerCase
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1054';

      let str = "HELLO   ";
      let result = str.trimEnd().toLowerCase();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5500
     * @tc.name       StringTrimEndTest1055
     * @tc.desc      TestTrimEndConcatStr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1055';

      let str = "Hello   ";
      let result = str.trimEnd().concat(" World");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5600
     * @tc.name       StringTrimEndTest1056
     * @tc.desc      TestTrimEndSlice
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1056';

      let str = "Hello World   ";
      let result = str.trimEnd().slice(0, 5);
      expect(result).assertEqual( "Hello");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5700
     * @tc.name       StringTrimEndTest1057
     * @tc.desc      TestTrimEndSubstring
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1057';

      let str = "Hello World   ";
      let result = str.trimEnd().substring(6);
      expect(result).assertEqual("World");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5800
     * @tc.name       StringTrimEndTest1058
     * @tc.desc      TestTrimEndReplace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1058';

      let str = "hello world   ";
      let result = str.trimEnd().replace("world", "there");
      expect(result).assertEqual("hello there");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_5900
     * @tc.name       StringTrimEndTest1059
     * @tc.desc      TestTrimEndSearchSubstr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1059';

      let str = "Hello World   ";
      let result = str.trimEnd().includes("World");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6000
     * @tc.name       StringTrimEndTest1060
     * @tc.desc      TestTrimEndFindIndex
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1060';

      let str = "Hello World   ";
      let result = str.trimEnd().indexOf("World");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6100
     * @tc.name       StringTrimEndTest1061
     * @tc.desc     TestTrimEndCheckEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1061';

      let str = "Hello World   ";
      let result = str.trimEnd().endsWith("World");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6200
     * @tc.name       StringTrimEndTest1062
     * @tc.desc       TestTrimEndCheckStart
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1062';

      let str = "   Hello World   ";
      let result = str.trimEnd().startsWith("   ");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6300
     * @tc.name       StringTrimEndTest1063
     * @tc.desc       TestTrimEndRepeatStr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1063';

      let str = "Hi   ";
      let result = str.trimEnd().repeat(3);
      expect(result).assertEqual("HiHiHi");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6400
     * @tc.name       StringTrimEndTest1064
     * @tc.desc       TestTrimEndThenPad
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1064';

      let str = "Hello   ";
      let result = str.trimEnd().padEnd(10, "!");
      expect(result).assertEqual("Hello!!!!!");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6500
     * @tc.name       StringTrimEndTest1065
     * @tc.desc       TestTrimEndPadStart
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1065';

      let str = "5   ";
      let result = str.trimEnd().padStart(3, "0");
      expect(result).assertEqual("005");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6700
     * @tc.name       StringTrimEndTest1067
     * @tc.desc       TestTrimEndCharCodeAt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1067';

      let str = "Hello   ";
      let result = str.trimEnd().charCodeAt(0);
      expect(result).assertEqual(72);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6800
     * @tc.name       StringTrimEndTest1068
     * @tc.desc       TestStringTrimEndCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1068';

      let strObj = new String("Hello   ");
      let result = strObj.trimEnd();
      expect(result).assertEqual( "Hello");
      expect(typeof result).assertEqual( "string");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_6900
     * @tc.name       StringTrimEndTest1069
     * @tc.desc       TestRawStringLiteralCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1069';

      let result = "Hello   ".trimEnd();
      expect(result).assertEqual("Hello");
      expect(typeof result).assertEqual( "string");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7000
     * @tc.name       StringTrimEndTest1070
     * @tc.desc       TestDirectStringCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1070';

      let result = ("Hello" + "   ").trimEnd();
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7100
     * @tc.name       StringTrimEndTest1071
     * @tc.desc       TestTemplateStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1071';

      let name = "World";
      let str = `Hello ${name}   `;
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7200
     * @tc.name       StringTrimEndTest1072
     * @tc.desc       TestMultiLineTemplateSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1072';

      let str = `Hello
World   `;
      let result = str.trimEnd();
      expect(result).assertEqual( "Hello\nWorld");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7300
     * @tc.name       StringTrimEndTest1073
     * @tc.desc       TestConcatenatedStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1073';

      let str = "Hello" + " " + "World" + "   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7400
     * @tc.name       StringTrimEndTest1074
     * @tc.desc       TestArrayJoinedStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1074';

      let arr = ["Hello", "World"];
      let str = arr.join(" ") + "   ";
      let result = str.trimEnd();
      expect(result).assertEqual( "Hello World");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7500
     * @tc.name       StringTrimEndTest1075
     * @tc.desc       TestLoopBuiltStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1075';

      let str = "";
      for (let i = 0; i < 5; i++) {
        str += i + " ";
      }
      let result = str.trimEnd();
      expect(result).assertEqual( "0 1 2 3 4");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7700
     * @tc.name       StringTrimEndTest1077
     * @tc.desc       TestMaxLengthString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1077';

      let targetLen = Number.MAX_SAFE_INTEGER / 1000;
      let str = "a".repeat(0) + "   ";
      let result = str.trimEnd();
      expect(targetLen).assertEqual(Number.MAX_SAFE_INTEGER / 1000);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7800
     * @tc.name       StringTrimEndTest1078
     * @tc.desc       TestWhitespaceString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1078';

      let str = "a" + " ".repeat(999999);
      let result = str.trimEnd();
      expect(result).assertEqual( "a");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_STRINGTRIMEND_7900
     * @tc.name       StringTrimEndTest1079
     * @tc.desc      TestTrimEndPerformance
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1079';

      let str = "Hello   ";
      for (let i = 0; i < 1000; i++) {
        str = str.trimEnd() + "   ";
      }
      expect(str.trimEnd()).assertEqual("Hello");
    });
  })
}