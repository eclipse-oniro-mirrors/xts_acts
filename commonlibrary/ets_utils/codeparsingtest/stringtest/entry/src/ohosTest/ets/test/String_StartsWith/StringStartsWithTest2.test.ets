import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as startsWithTest from './string_startswith_test1';

export default function StringStartsWithTest2() {
  describe('StringStartsWithTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    });
    //==================== Chain calls and complex expressions ====================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0100
     * @tc.name      StringStartsWithTest2001
     * @tc.desc      Verify chained string methods with startsWith
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2001';


      const str = "  Hello World  ";
      expect(str.trim().toLowerCase().startsWith("hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0200
     * @tc.name      StringStartsWithTest2002
     * @tc.desc      Verify multiple calls to startsWith
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2002';


      const str = "Hello World";
      expect(str.startsWith("Hello") || str.startsWith("World")).assertTrue();
      expect(str.startsWith("Hello") && str.startsWith("Hel")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0300
     * @tc.name      StringStartsWithTest2003
     * @tc.desc      Verify matching with template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2003';


      const str = "Hello World";
      const prefix = "Hello";
      expect(str.startsWith(`${prefix}`)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0400
     * @tc.name      StringStartsWithTest2004
     * @tc.desc      Verify matching with dynamic template strings (Corrected Expectation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2004';


      const result: boolean[] = startsWithTest.testDynamicTemplateString();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0500
     * @tc.name      StringStartsWithTest2005
     * @tc.desc      Verify combining startsWith with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2005';


      const str = "Hello World";
      expect(str.startsWith("Hello") && str.length > 5).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0600
     * @tc.name      StringStartsWithTest2006
     * @tc.desc      Verify combining startsWith with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2006';


      const str = "Hello World";
      expect(str.startsWith("Hello") || str.startsWith("World")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0700
     * @tc.name      StringStartsWithTest2007
     * @tc.desc      Verify combining startsWith with NOT operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2007';


      const str = "Hello World";
      expect(!str.startsWith("World")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0800
     * @tc.name      StringStartsWithTest2008
     * @tc.desc      Verify using startsWith in a ternary operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2008';


      const str = "Hello World";
      const result = str.startsWith("Hello") ? "Starts with Hello" : "Does not start with Hello";
      expect(result).assertEqual("Starts with Hello");


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_0900
     * @tc.name      StringStartsWithTest2009
     * @tc.desc      Verify nested ternary operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2009';


      const str = "Hello World";
      const result = str.startsWith("Hello")
        ? "Starts with Hello"
        : str.startsWith("World")
          ? "Starts with World"
          : "Starts with something else";
      expect(result).assertEqual("Starts with Hello");


    });

    //==================== Performance and extreme cases test ====================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1000
     * @tc.name      StringStartsWithTest2010
     * @tc.desc      Verify matching on very long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2010';


      const longStr = "a".repeat(1000000);
      expect(longStr.startsWith("a")).assertTrue();
      expect(longStr.startsWith("aaa")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1100
     * @tc.name      StringStartsWithTest2011
     * @tc.desc      Verify matching with a long search string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2011';


      const str = "a".repeat(10000);
      const search = "a".repeat(5000);
      expect(str.startsWith(search)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1200
     * @tc.name      StringStartsWithTest2012
     * @tc.desc      Verify mismatch on a very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2012';


      const longStr = "b" + "a".repeat(1000000);
      expect(longStr.startsWith("a")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1300
     * @tc.name      StringStartsWithTest2013
     * @tc.desc      Verify behavior with negative Infinity position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2013';


      const str = "Hello";
      expect(str.startsWith("Hello", -Infinity)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1400
     * @tc.name      StringStartsWithTest2014
     * @tc.desc      Verify behavior with a very large negative position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2014';


      const str = "Hello";
      expect(str.startsWith("Hello", -999999999)).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1500
     * @tc.name      StringStartsWithTest2015
     * @tc.desc      Verify matching a repeated single character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2015';


      const str = "a".repeat(1000);
      expect(str.startsWith("a")).assertTrue();
      expect(str.startsWith("aa")).assertTrue();
      expect(str.startsWith("b")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1600
     * @tc.name      StringStartsWithTest2016
     * @tc.desc      Verify matching a repeated pattern string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2016';


      const str = "abc".repeat(1000);
      expect(str.startsWith("abc")).assertTrue();
      expect(str.startsWith("abcabc")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1700
     * @tc.name      StringStartsWithTest2017
     * @tc.desc      Verify fast fail on a long string mismatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2017';


      const str = "a".repeat(1000000);
      expect(str.startsWith("b")).assertFalse();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1800
     * @tc.name      StringStartsWithTest2018
     * @tc.desc      Verify full match on a long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2018';


      const str = "a".repeat(10000);
      const search = "a".repeat(10000);
      expect(str.startsWith(search)).assertTrue();


    });

    //==================== Strict mode and special environments ====================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_1900
     * @tc.name      StringStartsWithTest2019
     * @tc.desc      Verify startsWith in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2019';


      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2000
     * @tc.name      StringStartsWithTest2020
     * @tc.desc      Verify this binding in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2020';


      expect(startsWithTest.testStrictThis()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2100
     * @tc.name      StringStartsWithTest2021
     * @tc.desc      Verify calling with call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2021';


      expect(startsWithTest.testCall()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2200
     * @tc.name      StringStartsWithTest2022
     * @tc.desc      Verify calling with apply method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2022';


      expect(startsWithTest.testApply()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2300
     * @tc.name      StringStartsWithTest2023
     * @tc.desc      Verify calling with bind method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2023';


      expect(startsWithTest.testBind()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2400
     * @tc.name      StringStartsWithTest2024
     * @tc.desc      Verify behavior on array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2024';


      expect(startsWithTest.testArrayObjError()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2500
     * @tc.name      StringStartsWithTest2025
     * @tc.desc      Verify behavior on String wrapper objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2025';


      const strObj = new String("Hello World");
      expect(strObj.startsWith("Hello")).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2600
     * @tc.name      StringStartsWithTest2026
     * @tc.desc      Verify behavior on custom objects with toString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2026';


      expect(startsWithTest.testCustomObj()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2700
     * @tc.name      StringStartsWithTest2027
     * @tc.desc      Verify with iterator protocol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2027';


      expect(startsWithTest.testIterator()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2800
     * @tc.name      StringStartsWithTest2028
     * @tc.desc      Verify methods on the prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2028';


      const res: boolean[] = startsWithTest.testProtoChain();
      expect(res[0]).assertFalse();
      expect(res[1]).assertTrue();
      expect(res[2]).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_2900
     * @tc.name      StringStartsWithTest2029
     * @tc.desc      Verify modifying prototype method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2029';


      expect(startsWithTest.testModifyProto()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_3000
     * @tc.name      StringStartsWithTest2030
     * @tc.desc      Verify on frozen strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2030';


      expect(startsWithTest.testFrozen()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_3100
     * @tc.name      StringStartsWithTest2031
     * @tc.desc      Verify on sealed strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2031';


      expect(startsWithTest.testSealed()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_3200
     * @tc.name      StringStartsWithTest2032
     * @tc.desc      12.7.1 Verify on Proxy wrapped strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2032';


      expect(startsWithTest.testProxy()).assertTrue();


    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSTARTSWITHTWO_3300
     * @tc.name      StringStartsWithTest2033
     * @tc.desc      Verify across frames or windows
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWithTest2033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWithTest2033';


      const res: boolean[] = startsWithTest.testStartsWithCrossContext();
      expect(res[0]).assertTrue();
      expect(res[1]).assertTrue();
      expect(res[2]).assertTrue();
      expect(res[3]).assertTrue();


    });
  });
}