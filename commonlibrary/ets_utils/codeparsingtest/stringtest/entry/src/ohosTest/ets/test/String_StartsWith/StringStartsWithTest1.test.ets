import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as startsWithTest from './string_startswith_test1';

export default function StringStartsWithTest() {
  describe('StringStartsWithTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    });
    afterEach(() => {
      // Presets an clear action, which is performed after each unit test case ends.
    });
    afterAll(() => {
      // Presets an clear action, which is performed after all test cases of the test suite end.
    });

    //========================== Basic Function Test ============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0100
     * @tc.name      StringStartsWithTest1001
     * @tc.desc      Verify complete match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1001';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0200
     * @tc.name      StringStartsWithTest1002
     * @tc.desc      Verify partial match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1002';


      const str = "Hello World";
      expect(str.startsWith("Hel")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0300
     * @tc.name      StringStartsWithTest1003
     * @tc.desc      Verify no match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1003';


      const str = "Hello World";
      expect(str.startsWith("World")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0400
     * @tc.name      StringStartsWithTest1004
     * @tc.desc      Verify no match when search string is in the middle or end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1004';


      const str = "Hello World";
      expect(str.startsWith("World")).assertFalse();
      expect(str.startsWith("llo")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0500
     * @tc.name      StringStartsWithTest1005
     * @tc.desc      Verify return type and value for a true matching condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1005';


      const str = "Hello";
      const result = str.startsWith("Hel");

      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0600
     * @tc.name      StringStartsWithTest1006
     * @tc.desc      Verify return type and value for a false matching condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1006';


      const str = "Hello";
      const result = str.startsWith("xyz");

      expect(typeof result).assertEqual("boolean");
      expect(result).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0700
     * @tc.name      StringStartsWithTest1007
     * @tc.desc      Verify match when search string equals the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1007';


      const str = "Hello";
      expect(str.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0800
     * @tc.name      StringStartsWithTest1008
     * @tc.desc      Verify no match when search string is longer than original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1008';


      const str = "Hi";
      expect(str.startsWith("Hello World")).assertFalse();


    });

    //========================== Parameter Type Test ============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_0900
     * @tc.name      StringStartsWithTest1009
     * @tc.desc      Verify matching with standard string type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1009';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1000
     * @tc.name      StringStartsWithTest1010
     * @tc.desc      Verify implicit conversion of number type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1010';


      const result: boolean = startsWithTest.testNumberConversion();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1100
     * @tc.name      StringStartsWithTest1011
     * @tc.desc      Verify implicit conversion of boolean type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1011';


      const result: boolean = startsWithTest.testBooleanConversion();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1200
     * @tc.name      StringStartsWithTest1012
     * @tc.desc      Verify implicit conversion of undefined searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1012';


      const result: boolean = startsWithTest.testUndefinedConversion();
      expect(result).assertTrue();

      expect("undefined value".startsWith("undefined")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1300
     * @tc.name      StringStartsWithTest1013
     * @tc.desc      Verify implicit conversion of null searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1013';


      const result: boolean = startsWithTest.testNullConversion();
      expect(result).assertTrue();
      expect("null pointer".startsWith("null")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1400
     * @tc.name      StringStartsWithTest1014
     * @tc.desc      Verify implicit conversion of object type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1014';


      const result: boolean = startsWithTest.testObjectConversion();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1500
     * @tc.name      StringStartsWithTest1015
     * @tc.desc      Verify implicit conversion of array type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1015';


      const result: boolean = startsWithTest.testArrayConversion();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1600
     * @tc.name      StringStartsWithTest1016
     * @tc.desc      Verify passing RegExp throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1016';


      const isTypeError: boolean = startsWithTest.testRegExpException();
      expect(isTypeError).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1700
     * @tc.name      StringStartsWithTest1017
     * @tc.desc      Verify match with valid number position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1017';


      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1800
     * @tc.name      StringStartsWithTest1018
     * @tc.desc      Verify implicit conversion of string number position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1018';


      const result: boolean = startsWithTest.testPositionStringNumber();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_1900
     * @tc.name      StringStartsWithTest1019
     * @tc.desc      Verify behavior with negative position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1019';


      const str = "Hello World";
      expect(str.startsWith("Hello", -1)).assertTrue();
      expect(str.startsWith("Hello", -100)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2000
     * @tc.name      StringStartsWithTest1020
     * @tc.desc      Verify behavior with float position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1020';


      const str = "Hello World";
      expect(str.startsWith("World", 6.9)).assertTrue();
      expect(str.startsWith("World", 6.1)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2100
     * @tc.name      StringStartsWithTest1021
     * @tc.desc      Verify behavior with NaN position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1021';


      const str = "Hello World";
      expect(str.startsWith("Hello", NaN)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2200
     * @tc.name      StringStartsWithTest1022
     * @tc.desc      Verify behavior with undefined position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1022';


      const str = "Hello World";
      expect(str.startsWith("Hello", undefined)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2300
     * @tc.name      StringStartsWithTest1023
     * @tc.desc      Verify behavior with null position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1023';


      const result: boolean = startsWithTest.testPositionNull();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2400
     * @tc.name      StringStartsWithTest1024
     * @tc.desc      Verify match when position exceeds string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1024';


      const str = "Hello";
      expect(str.startsWith("", 100)).assertTrue();
      expect(str.startsWith("H", 100)).assertFalse();


    });

    //========================== Boundary Value Test ============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2500
     * @tc.name      StringStartsWithTest1025
     * @tc.desc      Verify matching when both strings are empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1025';


      const str = "";
      expect(str.startsWith("")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2600
     * @tc.name      StringStartsWithTest1026
     * @tc.desc      Verify matching when original string is empty and search string is non-empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1026';


      const str = "";
      expect(str.startsWith("a")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2700
     * @tc.name      StringStartsWithTest1027
     * @tc.desc      Verify non-empty string always starts with empty string at any position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1027';


      const str = "Hello";
      expect(str.startsWith("")).assertTrue();
      expect(str.startsWith("", 0)).assertTrue();
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("", 100)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2800
     * @tc.name      StringStartsWithTest1028
     * @tc.desc      Verify single character string matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1028';


      const str = "a";
      expect(str.startsWith("a")).assertTrue();
      expect(str.startsWith("b")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_2900
     * @tc.name      StringStartsWithTest1029
     * @tc.desc      Verify single character string starts with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1029';


      const str = "a";
      expect(str.startsWith("")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3000
     * @tc.name      StringStartsWithTest1030
     * @tc.desc      Verify searching from position 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1030';


      const str = "Hello World";
      expect(str.startsWith("Hello", 0)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3100
     * @tc.name      StringStartsWithTest1031
     * @tc.desc      Verify behavior when position equals string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1031';


      const str = "Hello";
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("a", 5)).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3200
     * @tc.name      StringStartsWithTest1032
     * @tc.desc      Verify behavior when position is greater than string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1032';


      const str = "Hello";
      expect(str.startsWith("", 1000)).assertTrue();
      expect(str.startsWith("a", 1000)).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3300
     * @tc.name      StringStartsWithTest1033
     * @tc.desc      Verify behavior when position is Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1033';


      const str = "Hello";
      expect(str.startsWith("", Infinity)).assertTrue();
      expect(str.startsWith("H", Infinity)).assertFalse();


    });

    //========================== Position Parameter Test ============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3400
     * @tc.name      StringStartsWithTest1034
     * @tc.desc      Verify matching from position 0 by default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1034';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("Hello", 0)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3500
     * @tc.name      StringStartsWithTest1035
     * @tc.desc      Verify matching from the middle of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1035';


      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.startsWith("Wor", 6)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3600
     * @tc.name      StringStartsWithTest1036
     * @tc.desc      Verify matching at the very end of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1036';


      const str = "Hello";
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("o", 4)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3700
     * @tc.name      StringStartsWithTest1037
     * @tc.desc      Verify position parameter as a mathematical expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1037';


      const str = "Hello World";
      const pos = 2 + 4;
      expect(str.startsWith("World", pos)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3800
     * @tc.name      StringStartsWithTest1038
     * @tc.desc      Verify position parameter calculated from string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1038';


      const str = "Hello World";
      expect(str.startsWith("d", str.length - 1)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_3900
     * @tc.name      StringStartsWithTest1039
     * @tc.desc      Verify skipping characters using position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1039';


      const str = "abcabc";
      expect(str.startsWith("abc", 0)).assertTrue();
      expect(str.startsWith("abc", 3)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4000
     * @tc.name      StringStartsWithTest1040
     * @tc.desc      Verify match when search string overlaps with position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1040';


      const str = "Hello";
      expect(str.startsWith("ello", 1)).assertTrue();
      expect(str.startsWith("llo", 2)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4100
     * @tc.name      StringStartsWithTest1041
     * @tc.desc      Verify case sensitivity with exact match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1041';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("hello")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4200
     * @tc.name      StringStartsWithTest1042
     * @tc.desc      Verify case sensitivity with full uppercase string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1042';


      const str = "HELLO WORLD";
      expect(str.startsWith("HELLO")).assertTrue();
      expect(str.startsWith("hello")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4300
     * @tc.name      StringStartsWithTest1043
     * @tc.desc      Verify case sensitivity with full lowercase string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1043';


      const str = "hello world";
      expect(str.startsWith("hello")).assertTrue();
      expect(str.startsWith("HELLO")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4400
     * @tc.name      StringStartsWithTest1044
     * @tc.desc      Verify case sensitivity with mixed case string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1044';


      const str = "HeLLo WoRLd";
      expect(str.startsWith("HeLLo")).assertTrue();
      expect(str.startsWith("Hello")).assertFalse();
      expect(str.startsWith("HELLO")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4500
     * @tc.name      StringStartsWithTest1045
     * @tc.desc      Verify matching with space characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1045';


      const str = " Hello World";
      expect(str.startsWith(" ")).assertTrue();
      expect(str.startsWith(" Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4600
     * @tc.name      StringStartsWithTest1046
     * @tc.desc      Verify matching with tab characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1046';


      const str = "\tHello World";
      expect(str.startsWith("\t")).assertTrue();
      expect(str.startsWith("\tHello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4700
     * @tc.name      StringStartsWithTest1047
     * @tc.desc      Verify matching with newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1047';


      const str = "\nHello World";
      expect(str.startsWith("\n")).assertTrue();
      expect(str.startsWith("\nHello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4800
     * @tc.name      StringStartsWithTest1048
     * @tc.desc      Verify matching with carriage return characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1048';


      const str = "\rHello World";
      expect(str.startsWith("\r")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_4900
     * @tc.name      StringStartsWithTest1049
     * @tc.desc      Verify matching with multiple types of whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1049';


      const str = " \t\nHello World";
      expect(str.startsWith(" \t\n")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5000
     * @tc.name      StringStartsWithTest1050
     * @tc.desc      Verify matching with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1050';


      const str = "\\Hello World";
      expect(str.startsWith("\\")).assertTrue();
      expect(str.startsWith("\\Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5100
     * @tc.name      StringStartsWithTest1051
     * @tc.desc      Verify matching with quote characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1051';


      const str = '"Hello" World';
      expect(str.startsWith('"')).assertTrue();
      expect(str.startsWith('"Hello"')).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5200
     * @tc.name      StringStartsWithTest1052
     * @tc.desc      Verify matching with backslash in paths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1052';


      const str = "\\path\\to\\file";
      expect(str.startsWith("\\")).assertTrue();
      expect(str.startsWith("\\path")).assertTrue();


    });

    //========= Unicode and Multi-byte Character Test =========

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5300
     * @tc.name      StringStartsWithTest1053
     * @tc.desc      Verify matching with Chinese characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1053';


      const str = "你好世界";
      expect(str.startsWith("你好")).assertTrue();
      expect(str.startsWith("世界")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5400
     * @tc.name      StringStartsWithTest1054
     * @tc.desc      Verify matching with mixed Chinese and English characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1054';


      const str = "Hello世界World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("世界", 5)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5500
     * @tc.name      StringStartsWithTest1055
     * @tc.desc      Verify matching with a single Emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1055';


      const str = "😀Hello World";
      expect(str.startsWith("😀")).assertTrue();
      expect(str.startsWith("😀Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5600
     * @tc.name      StringStartsWithTest1056
     * @tc.desc      Verify matching with multiple Emojis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1056';


      const str = "😀🎉🎊Hello";
      expect(str.startsWith("😀🎉🎊")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5700
     * @tc.name      StringStartsWithTest1057
     * @tc.desc      Verify Emoji position calculation (Surrogate pairs)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1057';


      const str = "😀Hello";
      expect(str.startsWith("Hello", 2)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5800
     * @tc.name      StringStartsWithTest1058
     * @tc.desc      Verify matching with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1058';


      const str = "\u0048\u0065\u006c\u006c\u006f";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("\u0048")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_5900
     * @tc.name      StringStartsWithTest1059
     * @tc.desc      Verify matching with special Unicode symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1059';


      const str = "♠♣♥♦Hello";
      expect(str.startsWith("♠♣♥♦")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6000
     * @tc.name      StringStartsWithTest1060
     * @tc.desc      Verify matching with partial multi-byte characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1060';


      const str = "你好世界";
      expect(str.startsWith("你")).assertTrue();
      expect(str.startsWith("你 好")).assertFalse();


    });

    //========================== Exception Handling Test ============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6100
     * @tc.name      StringStartsWithTest1061
     * @tc.desc      Verify TypeError when passing a direct regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1061';


      const result: boolean = startsWithTest.testRegexError();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6200
     * @tc.name      StringStartsWithTest1062
     * @tc.desc      Verify TypeError when passing a regex with flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1062';


      const result: boolean = startsWithTest.testRegexFlagsError();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6300
     * @tc.name      StringStartsWithTest1063
     * @tc.desc      Verify TypeError when passing a RegExp object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1063';


      const result: boolean = startsWithTest.testRegExpObjectError();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6400
     * @tc.name      StringStartsWithTest1064
     * @tc.desc      Verify TypeError when this is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1064';


      const result: boolean = startsWithTest.testNullThisError();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6500
     * @tc.name      StringStartsWithTest1065
     * @tc.desc      Verify TypeError when this is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1065';


      const result: boolean = startsWithTest.testUndefinedThisError();
      expect(result).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6600
     * @tc.name      StringStartsWithTest1066
     * @tc.desc      Verify handling of custom toString throwing error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1066';


      const result: string = startsWithTest.testToStringError();
      expect(result).assertEqual("toString error");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6700
     * @tc.name      StringStartsWithTest1067
     * @tc.desc      Compare startsWith and endsWith on the same string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1067';


      const str = "Hello World Hello";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.endsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6800
     * @tc.name      StringStartsWithTest1068
     * @tc.desc      Use startsWith and endsWith at different positions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1068';


      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.endsWith("World")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_6900
     * @tc.name      StringStartsWithTest1069
     * @tc.desc      Verify includes is true when startsWith is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1069';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.includes("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7000
     * @tc.name      StringStartsWithTest1070
     * @tc.desc      Verify includes is true while startsWith is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1070';


      const str = "Hello World";
      expect(str.includes("World")).assertTrue();
      expect(str.startsWith("World")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7100
     * @tc.name      StringStartsWithTest1071
     * @tc.desc      Verify indexOf alignment when startsWith is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1071';


      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.indexOf("World")).assertEqual(6);


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7200
     * @tc.name      StringStartsWithTest1072
     * @tc.desc      Verify startsWith behavior when indexOf returns index > 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1072';


      const str = "Hello World";
      expect(str.indexOf("World")).assertEqual(6);
      expect(str.startsWith("World")).assertFalse();
      expect(str.startsWith("World", 6)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7300
     * @tc.name      StringStartsWithTest1073
     * @tc.desc      Verify startsWith on a sliced sub-string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1073';


      const str = "Hello World";
      const sliced = str.slice(6);
      expect(sliced.startsWith("World")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7400
     * @tc.name      StringStartsWithTest1074
     * @tc.desc      Verify startsWith on a substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1074';


      const str = "Hello World";
      const sub = str.substring(6);
      expect(sub.startsWith("World")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7500
     * @tc.name      StringStartsWithTest1075
     * @tc.desc      Verify startsWith after case conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1075';


      const str = "Hello World";
      expect(str.toLowerCase().startsWith("hello")).assertTrue();
      expect(str.toUpperCase().startsWith("HELLO")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7600
     * @tc.name      StringStartsWithTest1076
     * @tc.desc      Simulate case-insensitive matching using conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1076';


      const str = "Hello World";
      const search = "HELLO";
      expect(str.toLowerCase().startsWith(search.toLowerCase())).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7700
     * @tc.name      StringStartsWithTest1077
     * @tc.desc      Verify startsWith after trimming whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1077';


      const str = "  Hello World";
      expect(str.startsWith("Hello")).assertFalse();
      expect(str.trim().startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7800
     * @tc.name      StringStartsWithTest1078
     * @tc.desc      Verify matching with leading spaces using position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1078';


      const str = "  Hello World";
      expect(str.startsWith("  ")).assertTrue();
      expect(str.startsWith("Hello", 2)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_7900
     * @tc.name      StringStartsWithTest1079
     * @tc.desc      Verify startsWith on repeated strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1079';


      const str = "abc".repeat(3);
      expect(str.startsWith("abc")).assertTrue();
      expect(str.startsWith("abcabc")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8000
     * @tc.name      StringStartsWithTest1080
     * @tc.desc      Verify matching a repeated pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1080';


      const str = "Hello".repeat(2);
      expect(str.startsWith("HelloHello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8100
     * @tc.name      StringStartsWithTest1081
     * @tc.desc      Verify startsWith after padStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1081';


      const str = "5".padStart(3, "0");
      expect(str.startsWith("00")).assertTrue();
      expect(str.startsWith("0")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8200
     * @tc.name      StringStartsWithTest1082
     * @tc.desc      Verify checking for padding characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1082';


      const str = "abc".padStart(10, "xyz");
      expect(str.startsWith("xyzxyzx")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8300
     * @tc.name      StringStartsWithTest1083
     * @tc.desc      Verify startsWith after string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1083';


      const str = "Hello World";
      const replaced = str.replace("Hello", "Hi");
      expect(replaced.startsWith("Hi")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8400
     * @tc.name      StringStartsWithTest1084
     * @tc.desc      Verify startsWith after replacing the start of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1084';


      const str = "Hello World";
      const replaced = str.replace("Hello", "Goodbye");
      expect(replaced.startsWith("Goodbye")).assertTrue();


    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8500
     * @tc.name      StringStartsWithTest1085
     * @tc.desc      Verify startsWith on elements of a split string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1085';


      const str = "Hello,World,Test";
      const parts = str.split(",");
      expect(parts[0].startsWith("Hello")).assertTrue();
      expect(parts[1].startsWith("World")).assertTrue();


    });
    //==================== Actual Application Scenario Test ====================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8600
     * @tc.name      StringStartsWithTest1086
     * @tc.desc      Verify URL protocol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1086';


      const url = "https://example.com";
      expect(url.startsWith("https://")).assertTrue();
      expect(url.startsWith("http://")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8700
     * @tc.name      StringStartsWithTest1087
     * @tc.desc      Verify URL domain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1087';


      const url = "https://example.com/path";
      expect(url.startsWith("https://example.com")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8800
     * @tc.name      StringStartsWithTest1088
     * @tc.desc      Verify absolute file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1088';


      const path = "/usr/local/bin";
      expect(path.startsWith("/")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_8900
     * @tc.name      StringStartsWithTest1089
     * @tc.desc      Verify relative file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1089';


      const path = "./folder/file.txt";
      expect(path.startsWith("./")).assertTrue();
      expect(path.startsWith("../")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9000
     * @tc.name      StringStartsWithTest1090
     * @tc.desc      Verify Windows file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1090';


      const path = "C:\\Users\\Documents";
      expect(path.startsWith("C:")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9100
     * @tc.name      StringStartsWithTest1091
     * @tc.desc      Verify file prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1091';


      const filename = "backup_20231215.zip";
      expect(filename.startsWith("backup_")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9200
     * @tc.name      StringStartsWithTest1092
     * @tc.desc      Verify command line flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1092';


      const arg = "--verbose";
      expect(arg.startsWith("--")).assertTrue();
      expect(arg.startsWith("-")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9300
     * @tc.name      StringStartsWithTest1093
     * @tc.desc      Verify command line short flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1093';


      const arg = "-v";
      expect(arg.startsWith("-")).assertTrue();
      expect(arg.startsWith("--")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9400
     * @tc.name      StringStartsWithTest1094
     * @tc.desc      Verify Base64 data URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1094';


      const dataUri = "data:image/png;base64,iVBORw0KG...";
      expect(dataUri.startsWith("data:image/")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9500
     * @tc.name      StringStartsWithTest1095
     * @tc.desc      Verify JSON data format string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1095';


      const json = '{"name": "John"}';
      expect(json.startsWith("{")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9600
     * @tc.name      StringStartsWithTest1096
     * @tc.desc      Verify line starts with specific character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1096';


      const line = "# Heading";
      expect(line.startsWith("#")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9700
     * @tc.name      StringStartsWithTest1097
     * @tc.desc      Verify line indentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1097';


      const line = "    indented text";
      expect(line.startsWith("    ")).assertTrue();
      expect(line.startsWith("\t")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9800
     * @tc.name      StringStartsWithTest1098
     * @tc.desc      Verify phone number prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1098';


      const phone = "+86-13800138000";
      expect(phone.startsWith("+86")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITH_9900
     * @tc.name      StringStartsWithTest1099
     * @tc.desc      Verify credit card prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1099';


      const cardNumber = "4111111111111111";
      expect(cardNumber.startsWith("4")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHONE_0100
     * @tc.name      StringStartsWithTest1100
     * @tc.desc      Verify variable naming prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1100';


      const identifier = "_privateVar";
      expect(identifier.startsWith("_")).assertTrue();
      expect(/^[a-zA-Z_$]/.test(identifier)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHONE_0200
     * @tc.name      StringStartsWithTest1101
     * @tc.desc      Verify class name starts with uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest1101';


      const className = "MyClass";
      expect(/^[A-Z]/.test(className)).assertTrue();


    });
  });
}