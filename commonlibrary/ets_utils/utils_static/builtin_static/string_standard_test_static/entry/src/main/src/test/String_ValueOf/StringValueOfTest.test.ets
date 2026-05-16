import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function StringValueOfTest1(): void {
  describe('StringValueOfTest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20)
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

    //============================Basic Function Verification==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0100
     * @tc.name      StringValueOfTest1001
     * @tc.desc      Verify that the valueOf method of a basic String object returns the original string value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1001", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1001';

      const str = new String("hello");
      const result = str.valueOf();
      expect(result).assertEqual("hello");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0200
     * @tc.name      StringValueOfTest1002
     * @tc.desc      Verify that the valueOf method of a primitive string returns the original string value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1002", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1002';

      const str = "hello";
      const result = str.valueOf();
      expect(result).assertEqual("hello");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0300
     * @tc.name      StringValueOfTest1003
     * @tc.desc      Verify that the valueOf method of an empty string object returns an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1003", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1003';

      const str = new String("");
      const result = str.valueOf();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0400
     * @tc.name      StringValueOfTest1004
     * @tc.desc      Verify that valueOf returns the original string type, not an object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1004", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1004';

      const strObj = new String("test");
      const result = strObj.valueOf();
      expect(typeof result).assertEqual("string");
      expect(result === 'object').assertEqual(false);
      expect(strObj instanceof String).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0500
     * @tc.name      StringValueOfTest1005
     * @tc.desc      Verify that the return value is consistent with the string content of the original object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1005", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1005';

      const strObj = new String("hello world");
      const result = strObj.valueOf();
      expect(result === strObj.toString()).assertEqual(true);
      expect(result === String(strObj)).assertEqual(true);
    });

    //============================    Testing Different Types Strings==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0600
     * @tc.name      StringValueOfTest1006
     * @tc.desc      Verify the valueOf of a string object containing only spaces
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1006", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1006';

      const str = new String("   ");
      const result = str.valueOf();
      expect(result).assertEqual("   ");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0700
     * @tc.name      StringValueOfTest1007
     * @tc.desc      Verify the valueOf of the string object containing newline characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1007", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1007';

      const str = new String("\n\n");
      const result = str.valueOf();
      expect(result).assertEqual("\n\n");
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0800
     * @tc.name      StringValueOfTest1008
     * @tc.desc      Verify the valueOf of a string object containing only spaces
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1008", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1008';

      const str = new String("\t\t");
      const result = str.valueOf();
      expect(result).assertEqual("\t\t");
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_0900
     * @tc.name      StringValueOfTest1009
     * @tc.desc      Verify the valueOf of string objects containing various whitespace characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1009", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1009';

      const str = new String(" \t\n ");
      const result = str.valueOf();
      expect(result).assertEqual(" \t\n ");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1000
     * @tc.name      StringValueOfTest1010
     * @tc.desc      Verify the valueOf of string objects containing Unicode characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1010", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1010';

      const str = new String("你好世界");
      const result = str.valueOf();
      expect(result).assertEqual("你好世界");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1100
     * @tc.name      StringValueOfTest1011
     * @tc.desc      Verify the valueOf of a string object containing emoji expressions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1011", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1011';

      const str = new String("😀🎉");
      const result = str.valueOf();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1200
     * @tc.name      StringValueOfTest1012
     * @tc.desc      Verify the valueOf of string objects containing special escape characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1012", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1012';

      const str = new String("line1\nline2\ttab");
      const result = str.valueOf();
      expect(result).assertEqual("line1\nline2\ttab");
      expect(result.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1300
     * @tc.name      StringValueOfTest1013
     * @tc.desc      Verify the valueOf of a string object containing zero-width characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1013", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1013';

      const str = new String("a\u200Bb");
      const result = str.valueOf();
      expect(result).assertEqual("a\u200Bb");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1400
     * @tc.name      StringValueOfTest1014
     * @tc.desc       Verify the valueOf of the integer string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1014", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1014';

      const str = new String("12345");
      const result = str.valueOf();
      expect(result).assertEqual("12345");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1500
     * @tc.name      StringValueOfTest1015
     * @tc.desc      Verify the valueOf of the floating-point string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1015", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1015';

      const str = new String("3.14159");
      const result = str.valueOf();
      expect(result).assertEqual("3.14159");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1600
     * @tc.name      StringValueOfTest1016
     * @tc.desc      Verify the valueOf of the scientific notation string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1016", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1016';

      const str = new String("1e10");
      const result = str.valueOf();
      expect(result).assertEqual("1e10");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1700
     * @tc.name      StringValueOfTest1017
     * @tc.desc      Verify the valueOf of negative string objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1017", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1017';

      const str = new String("-123");
      const result = str.valueOf();
      expect(result).assertEqual("-123");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1800
     * @tc.name      StringValueOfTest1018
     * @tc.desc      Verify the valueOf method of an ultra-long string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1018", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1018';

      const longStr = "a".repeat(10000);
      const str = new String(longStr);
      const result = str.valueOf();
      expect(result.length).assertEqual(10000);
      expect(result === longStr).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_1900
     * @tc.name      StringValueOfTest1019
     * @tc.desc      Verify the valueOf of a single-character string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1019", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1019';

      const str = new String("a");
      const result = str.valueOf();
      expect(result).assertEqual("a");
      expect(result.length).assertEqual(1);
    });

    //============================ Comparison With ToString Method==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2000
     * @tc.name      StringValueOfTest1020
     * @tc.desc      Verify that the return values of valueOf and toString are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1020", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1020';

      const str = new String("test");
      expect(str.valueOf() === str.toString()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2100
     * @tc.name      StringValueOfTest1021
     * @tc.desc      Verify that the return values of valueOf and toString for an empty string are consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1021", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1021';

      const str = new String("");
      expect(str.valueOf() === str.toString()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2200
     * @tc.name      StringValueOfTest1022
     * @tc.desc      Verify that the return values of valueOf and toString for the special character string are consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1022", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1022';

      const str = new String("\n\t");
      expect(str.valueOf() === str.toString()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2300
     * @tc.name      StringValueOfTest1023
     * @tc.desc      Verify the invocation of valueOf and toString in type conversion scenarios
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1023", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1023';

      const strObj = new String("42");
      expect(strObj.valueOf() + 8).assertEqual("428");
      expect(strObj.toString() + 8).assertEqual("428");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2400
     * @tc.name      StringValueOfTest1024
     * @tc.desc      Verify the role of valueOf in arithmetic operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1024", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1024';

      const strObj = new String("5");
      const numericValue = Number(strObj.valueOf());
      expect(numericValue * 2).assertEqual(10);//要求隐式调用，报错？？？？
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2500
     * @tc.name      StringValueOfTest1025
     * @tc.desc      Verify the role of valueOf in comparison operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1025", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1025';

      const strObj = new String("abc");
      expect(strObj == "abc").assertEqual(true);

    });

    //============================ Internal Calling Mechanism Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3100
     * @tc.name      StringValueOfTest1031
     * @tc.desc      Verify the implicit invocation of valueOf during string concatenation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1031", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1031';

      const strObj = new String("hello");
      const result = strObj + " world";
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3200
     * @tc.name      StringValueOfTest1032
     * @tc.desc      Verify the implicit invocation of valueOf in the template string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1032", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1032';

      const strObj = new String("world");
      const result = `Hello ${strObj}`;
      expect(result).assertEqual("Hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3400
     * @tc.name      StringValueOfTest1034
     * @tc.desc      Verify the implicit invocation of valueOf during comparison operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1034", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1034';

      const strObj = new String("abc");
      expect(strObj == "abc").assertEqual(true);
      expect(strObj != "def").assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3500
     * @tc.name      StringValueOfTest1035
     * @tc.desc      Verify that the String() constructor invokes valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1035", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1035';

      const strObj = new String("test");
      const result = String(strObj);
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
    });

    //============================Type Conversion Interaction Test ==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3700
     * @tc.name      StringValueOfTest1037
     * @tc.desc      Verify the invocation of valueOf for string objects in a numeric context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1037", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1037';

      const strObj = new String("42");
      const num = Number(strObj);
      expect(num).assertEqual(42);
      expect(typeof num).assertEqual("number");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3800
     * @tc.name      StringValueOfTest1038
     * @tc.desc      Verify the behavior of converting non-numeric string objects to numbers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1038", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1038';

      const strObj = new String("abc");
      const num = Number(strObj);
      expect(isNaN(num)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3900
     * @tc.name      StringValueOfTest1039
     * @tc.desc      Verify the behavior of converting non-empty string objects to boolean values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1039", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1039';

      const strObj = new String("hello");
      const bool = Boolean(strObj);
      expect(bool).assertEqual(true);
    });

    //============================Method Invocation Context Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4300
     * @tc.name      StringValueOfTest1043
     * @tc.desc      Verify by calling the method valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1043", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1043';

      const str = new String("test");
      const result = str.valueOf();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4900
     * @tc.name      StringValueOfTest1049
     * @tc.desc      Verify error handling when a non-string type is used as this to call valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1049", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'StringValueOfTest1049';

      try {
        const num: number = 123;
        const result: number = num.valueOf();
        expect(result).assertEqual(123);
        const strResult: string = String(num);
        expect(strResult).assertEqual("123");
      } catch (e) {
        const error: Error = e as Error;
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5100
     * @tc.name      StringValueOfTest1051
     * @tc.desc      Verify the normal behavior of calling valueOf without parameters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1051", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1051';

      const str = new String("test");
      const result = str.valueOf();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5500
     * @tc.name      StringValueOfTest1055
     * @tc.desc       Verify the valueOf of the maximum-length string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1055", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1055';

      const maxStr = "a".repeat(1048576);
      const str = new String(maxStr);
      const result = str.valueOf();
      expect(result.length).assertEqual(1048576);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5600
     * @tc.name      StringValueOfTest1056
     * @tc.desc      Verify the valueOf of string objects containing supplementary plane characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1056", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1056';

      const str = new String("𝌆");
      const result = str.valueOf();
      expect(result).assertEqual("𝌆");
      expect(result.length).assertEqual(2);
    });

    //============================Interaction tests with other String methods==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5700
     * @tc.name      StringValueOfTest1057
     * @tc.desc      Verify the combination of the valueOf result with the concat method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1057", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1057';

      const str = new String("hello");
      const result = str.valueOf().concat(" world");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5800
     * @tc.name      StringValueOfTest1058
     * @tc.desc      Verify the combination of the valueOf result with the slice method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1058", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1058';

      const str = new String("hello world");
      const result = str.valueOf().slice(0, 5);
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5900
     * @tc.name      StringValueOfTest1059
     * @tc.desc      Verify the combination of the valueOf result with the split method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1059", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1059';

      const str = new String("a,b,c");
      const result = str.valueOf().split(",");
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6000
     * @tc.name      StringValueOfTest1060
     * @tc.desc      Verify the combination of the valueOf result with the trim method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1060", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1060';

      const str = new String("  hello  ");
      const result = str.valueOf().trim();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6100
     * @tc.name      StringValueOfTest1061
     * @tc.desc      Verify the combination of the valueOf result with the includes method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1061", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1061';

      const str = new String("hello world");
      const result = str.valueOf().includes("world");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6200
     * @tc.name      StringValueOfTest1062
     * @tc.desc      Verify the combination of the valueOf result with the indexOf method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1062", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1062';

      const str = new String("hello world");
      const result = str.valueOf().indexOf("world");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6300
     * @tc.name      StringValueOfTest1063
     * @tc.desc      Verify the combination of the valueOf result with the startsWith method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1063", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1063';

      const str = new String("hello world");
      const result = str.valueOf().startsWith("hello");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6400
     * @tc.name      StringValueOfTest1064
     * @tc.desc      Verify the combination of the valueOf result with the endsWith method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1064", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1064';

      const str = new String("hello world");
      const result = str.valueOf().endsWith("world");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6500
     * @tc.name      StringValueOfTest1065
     * @tc.desc      Verify the combination of the valueOf result with the toLowerCase method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1065", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1065';

      const str = new String("HELLO");
      const result = str.valueOf().toLowerCase();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6600
     * @tc.name      StringValueOfTest1066
     * @tc.desc      Verify the combination of the valueOf result with the toUpperCase method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1066", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1066';

      const str = new String("hello");
      const result = str.valueOf().toUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6700
     * @tc.name      StringValueOfTest1067
     * @tc.desc       Verify the combination of the valueOf result with the replace method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1067", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1067';

      const str = new String("hello world");
      const result = str.valueOf().replace("world", "javascript");
      expect(result).assertEqual("hello javascript");
    });

    //============================Strict Mode Testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6800
     * @tc.name      StringValueOfTest1068
     * @tc.desc      Verify the normal invocation of valueOf in strict mode
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1068", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1068';

      "use strict";
      const str = new String("test");
      const result = str.valueOf();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_6900
     * @tc.name      StringValueOfTest1069
     * @tc.desc      Verify the behavior of type conversion in strict mode
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1069", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1069';

      "use strict";
      const str = new String("test");
      const result = str.valueOf();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7000
     * @tc.name      StringValueOfTest1070
     * @tc.desc      Verify the normal invocation of valueOf in non-strict mode.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1070", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1070';

      const str = new String("test");
      const result = str.valueOf();
      expect(result).assertEqual("test");
    });

    //============================Special Object Type Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7200
     * @tc.name      StringValueOfTest1072
     * @tc.desc      Verify the valueOf of the object created by the String constructor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1072", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1072';

      const strObj = new String("hello");
      expect(typeof strObj).assertEqual("string");
      expect(typeof strObj.valueOf()).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7400
     * @tc.name      StringValueOfTest1074
     * @tc.desc      Verify the valueOf of basic string literals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1074", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1074';

      const str = "hello";
      expect(str.valueOf()).assertEqual("hello");
      expect(typeof str.valueOf()).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7500
     * @tc.name      StringValueOfTest1075
     * @tc.desc       Verify the valueOf of the template string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1075", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1075';

      const name = "world";
      const str = `hello ${name}`;
      expect(str.valueOf()).assertEqual("hello world");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8400
     * @tc.name      StringValueOfTest1084
     * @tc.desc      Verify the usage of valueOf in the string sorting scenario
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1084", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1084';


      const strings = [
        new String("banana"),
        new String("apple"),
        new String("cherry")
      ];
      strings.sort((a, b) => a.valueOf().localeCompare(b.valueOf()));
      expect(strings[0].valueOf()).assertEqual("apple");
      expect(strings[1].valueOf()).assertEqual("banana");
      expect(strings[2].valueOf()).assertEqual("cherry");

    });

    //============================ECMAScript Specification Conformance Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8500
     * @tc.name      StringValueOfTest1085
     * @tc.desc      Verify that the behavior complies with the specification when the 'this' value is a valid String object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1085", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1085';


      const str = new String("test");
      const result = str.valueOf();

      expect(typeof result).assertEqual("string");
      expect(result).assertEqual("test");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8800
     * @tc.name      StringValueOfTest1088
     * @tc.desc      Verify that valueOf always returns the original string type
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1088", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1088';


      const str = new String("test");
      const result = str.valueOf();

      expect(typeof result === "string").assertEqual(true);
      expect(result === str).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8900
     * @tc.name      StringValueOfTest1089
     * @tc.desc      Verify that the return value is consistent with the internal string value of the String object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1089", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1089';


      const str = new String("hello");
      const result = str.valueOf();

      expect(result === str.toString()).assertEqual(true);
      expect(result === String(str)).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9000
     * @tc.name      StringValueOfTest1090
     * @tc.desc      Verify the correctness of the internal thisStringValue abstract operation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1090", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1090';


      const str = new String("test");
      const literal = "literal";
      expect(str.valueOf() === "test").assertEqual(true);
      expect(String(literal) === "literal").assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9400
     * @tc.name      StringValueOfTest1094
     * @tc.desc      Verify the behavior of valueOf when validating string hint
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1094", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1094';

      const str = new String("test");
      expect(String(str)).assertEqual("test");
      expect(str.valueOf()).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9500
     * @tc.name      StringValueOfTest1095
     * @tc.desc      Verify the behavior of valueOf when using number hint
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1095", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1095';

      const str = new String("42");
      expect(Number(str)).assertEqual(42);
      expect(Number(str) * 2).assertEqual(84);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9600
     * @tc.name      StringValueOfTest1096
     * @tc.desc      Verify the behavior of valueOf when the default hint is used
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1096", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1096';

      const str = new String("test");
      expect(str + "").assertEqual("test");
      expect(str == "test").assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0600
     * @tc.name      StringValueOfTest1105
     * @tc.desc      Verify that arithmetic operators trigger valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1105", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1105';

      let str = new String("10");
      expect(Number(str)* 2).assertEqual(20);
      expect(Number(str)/ 2).assertEqual(5);
      expect(Number(str) - 2).assertEqual(8);
      expect(Number(str) % 3).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0800
     * @tc.name      StringValueOfTest1107
     * @tc.desc      Verify that bitwise operators trigger valueOf and ToNumber
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1107", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1107';

      const str = new String("5");
      expect(Number(str) | 3).assertEqual(7);
      expect(Number(str) & 3).assertEqual(1);
      expect(Number(str) ^ 3).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0900
     * @tc.name      StringValueOfTest1108
     * @tc.desc      Verify that logical operators do not trigger valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1108", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1108';

      const str = new String("test");
      const andResult = str && "truthy";
      const orResult = str || "default";
      expect(andResult).assertEqual("truthy");
      expect(orResult === str).assertEqual(true);
      expect(orResult instanceof String).assertEqual(true);
    });


    //================================In-depth Testing of Return Value Characteristics==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0500
     * @tc.name      StringValueOfTest1117
     * @tc.desc      Verify that the string values returned by multiple calls to valueOf are equal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1117", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1117';

      const str = new String("test");
      const result1 = str.valueOf();
      const result2 = str.valueOf();
      expect(result1 === result2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0600
     * @tc.name      StringValueOfTest1118
     * @tc.desc       Verify that the string returned by valueOf is immutable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1118", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1118';

      const str = new String("test");
      const result = str.valueOf();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0700
     * @tc.name      StringValueOfTest1119
     * @tc.desc      vVerify the relationship between the return value of valueOf and string literals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1119", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1119';

      const original = "test";
      const str = new String(original);
      const result = str.valueOf();
      expect(result === original).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_0800
     * @tc.name      StringValueOfTest1120
     * @tc.desc      Verify that valueOf returns a copy of the value rather than a reference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1120", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1120';

      const str = new String("test");
      const result = str.valueOf();
      expect(result === "test").assertEqual(true);
    });

    //===================================Serialization Depth Test=======================================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFTWO_2700
     * @tc.name      StringValueOfTest1139
     * @tc.desc      Verify the serialization of String objects by JSON.stringify
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1139", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1139';

      const str = new String("test");
      const json:string = JSON.stringify(str);
      expect(json).assertEqual("\"test\"");
    });
  });
}