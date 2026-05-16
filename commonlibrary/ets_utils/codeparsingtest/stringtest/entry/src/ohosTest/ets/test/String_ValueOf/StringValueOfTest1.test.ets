import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import * as stringTest from './string_valueOf_test01';

export default function StringValueOfTest1() {
  describe('StringValueOfTest1', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

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
      expect(strObj === "abc").assertEqual(false);
    });

    //============================ Inheritance and Prototype Chain Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2600
     * @tc.name      StringValueOfTest1026
     * @tc.desc      Verify that the valueOf method comes from String.prototype
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1026", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1026';

      let result = stringTest.testEmptyChars();
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2700
     * @tc.name      StringValueOfTest1027
     * @tc.desc      Verify the lookup process of the valueOf method in the prototype chain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1027", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1027';

      let result = stringTest.testLookupFlow();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2800
     * @tc.name      StringValueOfTest1028
     * @tc.desc      Verify that the custom string class inherits the valueOf method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1028", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1028';

      class MyString extends String {
        constructor(value:string) {
          super(value);
        }
      }
      const myStr = new MyString("custom");
      const result = myStr.valueOf();
      expect(result).assertEqual("custom");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_2900
     * @tc.name      StringValueOfTest1029
     * @tc.desc      Verify that the subclass overrides the valueOf method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1029", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1029';

      class MyString extends String {
        constructor(value:string) {
          super(value);
        }
        valueOf() {
          return "custom: " + super.valueOf();
        }
      }
      const myStr = new MyString("test");
      const result = myStr.valueOf();
      expect(result).assertEqual("custom: test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3000
     * @tc.name      StringValueOfTest1030
     * @tc.desc      Verify that the subclass calls the parent class valueOf via super
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1030", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1030';

      class CustomString extends String {
        valueOf() {
          const original = super.valueOf();
          return original.toUpperCase();
        }
      }
      const customStr = new CustomString("hello");
      expect(customStr.valueOf()).assertEqual("HELLO");
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3300
     * @tc.name      StringValueOfTest1033
     * @tc.desc      Verify the implicit invocation of valueOf during numerical operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1033", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1033';

      let result = stringTest.testImplicitCall();
      expect(result).assertEqual(20);
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

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_3600
     * @tc.name      StringValueOfTest1036
     * @tc.desc      Verify the invocation of valueOf in the label template function
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1036", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1036';

      let result:string = stringTest.testInvokeValue();
      expect(result).assertEqual("Hello world");
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

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4000
     * @tc.name      StringValueOfTest1040
     * @tc.desc      Verify the behavior of converting an empty string object to a Boolean value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1040", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1040';

      const strObj = new String("");
      const bool = Boolean(strObj);
      expect(bool).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4100
     * @tc.name      StringValueOfTest1041
     * @tc.desc      Verify the invocation of valueOf when a string object is used as the key of an object property
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1041", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1041';

      let result:string = stringTest.testObjProp();
      expect(result).assertEqual("value");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4200
     * @tc.name      StringValueOfTest1042
     * @tc.desc      Verify the invocation of valueOf during JSON serialization of string objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1042", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1042';

      const strObj = new String("hello");
      const json = JSON.stringify({ value: strObj });
      expect(json).assertEqual('{"value":"hello"}');
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4400
     * @tc.name      StringValueOfTest1044
     * @tc.desc       Verify the invocation of valueOf via the call method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1044", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1044';

      let result:string = stringTest.testCallObj();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4500
     * @tc.name      StringValueOfTest1045
     * @tc.desc       Verify the invocation of valueOf via the apply method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1045", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1045';

      let result:string = stringTest.testApplyObj();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4600
     * @tc.name      StringValueOfTest1046
     * @tc.desc      Verify the invocation of valueOf through the bind method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1046", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1046';

      let result:string = stringTest.testBindObj();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4700
     * @tc.name      StringValueOfTest1047
     * @tc.desc      Verify that a string literal calls valueOf as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1047", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1047';

      let result:string = stringTest.testPrimitive();
      expect(result).assertEqual("hello");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_4800
     * @tc.name      StringValueOfTest1048
     * @tc.desc      Verify that the string object calls valueOf as this
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1048", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1048';

      let result:string = stringTest.testCallValue();
      expect(result).assertEqual("world");
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

    //============================Boundary Value and Exception Testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5000
     * @tc.name      StringValueOfTest1050
     * @tc.desc      Verify that valueOf ignores extra parameters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1050", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1050';

      let result:string = stringTest.testWithParams();
      expect(result).assertEqual("test");
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5200
     * @tc.name      StringValueOfTest1052
     * @tc.desc       Verify the valueOf method of frozen string objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1052", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1052';

      let result:string = stringTest.testFrozenObj();
      expect(result).assertEqual("frozen");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5300
     * @tc.name      StringValueOfTest1053
     * @tc.desc      Verify the valueOf method of the sealed string object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1053", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1053';

      let result:string = stringTest.testSealedObj();
      expect(result).assertEqual("sealed");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_5400
     * @tc.name      StringValueOfTest1054
     * @tc.desc      Verify the valueOf of string objects with custom attributes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1054", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1054';

      let result: string[] = stringTest.testAfterValue();
      expect(result[0]).assertEqual("test");
      expect(result[1]).assertEqual(undefined);
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

      const maxStr = "a".repeat(Math.pow(2, 20));
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

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7100
     * @tc.name      StringValueOfTest1071
     * @tc.desc      Verify the automatic conversion of 'this' in non-strict mode
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1071", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1071';

      let result:string = stringTest.testPrimitiveStr();
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
      expect(typeof strObj).assertEqual("object");
      expect(typeof strObj.valueOf()).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7300
     * @tc.name      StringValueOfTest1073
     * @tc.desc      Verify the valueOf of the string object created through Object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1073", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1073';

      const strObj = new Object("hello");
      expect(strObj.valueOf()).assertEqual("hello");
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7600
     * @tc.name      StringValueOfTest1076
     * @tc.desc      Verify the valueOf of a string object with the Symbol property
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1076", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1076';

      let result:string[] = stringTest.testAfterSymbol();
      expect(result[0]).assertEqual("test");
      expect(result[1]).assertEqual(undefined);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7700
     * @tc.name      StringValueOfTest1077
     * @tc.desc      Verify the valueOf of a string object with getter/setter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1077", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1077';

      let result:string = stringTest.testAfterAccessor();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7800
     * @tc.name      StringValueOfTest1078
     * @tc.desc      Verify the use of valueOf for form input data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1078", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1078';

      expect(stringTest.testValidateInput("hello")).assertEqual(true);
      expect(stringTest.testValidateInput("  ")).assertEqual(false);
      expect(stringTest.testValidateInput("")).assertEqual(false);
      expect(stringTest.testValidateInput("test ")).assertEqual(false);
      expect(stringTest.testValidateInput(" test")).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_7900
     * @tc.name      StringValueOfTest1079
     * @tc.desc      Verify the usage of valueOf in the data cleaning scenario
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1079", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1079';

      expect(stringTest.testCleanData("  HELLO  ")).assertEqual("hello");
      expect(stringTest.testCleanData("WORLD")).assertEqual("world");
      expect(stringTest.testCleanData("  Test 123  ")).assertEqual("test 123");
      expect(stringTest.testCleanData("")).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8000
     * @tc.name      StringValueOfTest1080
     * @tc.desc      Verify the usage of valueOf in the string concatenation scenario
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1080", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1080';

      const strObj = new String("world");
      expect(stringTest.testConcat("Hello ", strObj, "!")).assertEqual("Hello world!");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8100
     * @tc.name      StringValueOfTest1081
     * @tc.desc      Verify the use of valueOf in string comparison scenarios
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1081", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1081';

      const strObj1 = new String("test");
      const strObj2 = new String("test");
      expect(stringTest.testCompareStrings(strObj1, strObj2)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8200
     * @tc.name      StringValueOfTest1082
     * @tc.desc      Verify valueOf() works in custom serialization for String object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1082", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1082';

      const strObj = new String("hello");
      interface SerializeResult {
        type: string;
        value: string;
      }
      const result = stringTest.testSerialize(strObj) as SerializeResult;
      expect(result.type).assertEqual("String");
      expect(result.value).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8300
     * @tc.name      StringValueOfTest1083
     * @tc.desc      Verify the usage of valueOf in the deep copy scenario
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1083", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1083';

      const strObj = new String("test");
      const cloned:string = stringTest.testDeepClone(strObj);
      expect(cloned.valueOf()).assertEqual("test");
      expect(cloned === strObj).assertEqual(false);

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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8600
     * @tc.name      StringValueOfTest1086
     * @tc.desc       Verify the autoboxing behavior when the 'this' value is a primitive String value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1086", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1086';

      let result:string= stringTest.testPrimitiveOne();
      expect(typeof result).assertEqual("string");
      expect(result).assertEqual("primitive");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_8700
     * @tc.name      StringValueOfTest1087
     * @tc.desc      Verify that a TypeError is thrown when the value of this is null or undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1087", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1087';

      let error:TypeError[]= stringTest.testCallNull();
      expect(error[0] instanceof TypeError).assertEqual(true);
      expect(error[1] instanceof TypeError).assertEqual(true);
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
      expect(result !== str).assertEqual(true);

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

    //============================Symbol.toPrimitive Interaction Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9100
     * @tc.name      StringValueOfTest1091
     * @tc.desc      Verify the type conversion behavior when only valueOf is defined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1091", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1091';

      let obj=stringTest.testObjBase();
      expect(String(obj)).assertEqual("[object Object]");
      expect(obj + "").assertEqual("from valueOf");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9200
     * @tc.name      StringValueOfTest1092
     * @tc.desc      Verify that Symbol.toPrimitive takes precedence over valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1092", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1092';

      let obj=stringTest.testObjPrim();
      expect(String(obj)).assertEqual("from toPrimitive, hint: string");
      expect(obj + "").assertEqual("from toPrimitive, hint: default");
      expect(String(Number(obj))).assertEqual("NaN"); // 注意：使用Number()进行显式转换

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9300
     * @tc.name      StringValueOfTest1093
     * @tc.desc      Verify that the String object does not have Symbol.toPrimitive and uses valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1093", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1093';

      const str = new String("test");
      let result: Function | undefined = stringTest.testSymbol();
      expect(result).assertEqual(undefined);
      expect(str.valueOf()).assertEqual("test");
      expect(str + "").assertEqual("test");
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9700
     * @tc.name      StringValueOfTest1097
     * @tc.desc      Verify that the custom object simulates String behavior through valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1097", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1097';

      const myStr = new stringTest.MyStringLike("hello");
      expect(myStr + " world").assertEqual("hello world");
      expect(String(myStr)).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9800
     * @tc.name      StringValueOfTest1098
     * @tc.desc      Verify that a custom object simulates String behavior via Symbol.toPrimitive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1098", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1098';

      const myStr = new stringTest.MyStringLike2("42");
      expect(String(myStr)).assertEqual("42");
      expect(Number(myStr) * 2).assertEqual(84);
    });

    //============================Test of the object primitive value conversion mechanism==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOF_9900
     * @tc.name      StringValueOfTest1099
     * @tc.desc      Verify the default behavior of ToPrimitive when there is no hint
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1099", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1099';

      let obj=stringTest.testObjPair();
      expect(obj + "").assertEqual("valueOf"); // default hint：valueOf优先
      expect(String(obj)).assertEqual("toString"); // string hint：toString优先
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0100
     * @tc.name      StringValueOfTest1100
     * @tc.desc      Verify that toString is called when valueOf returns an object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1100';

      let obj=stringTest.testObjToStr();
      expect(obj + "").assertEqual("toString");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0200
     * @tc.name      StringValueOfTest1101
     * @tc.desc      Verify that a TypeError is thrown when both valueOf and toString return objects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1101", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1101';

      let obj=stringTest.testObjThrow();
      let isTypeError = false;
      try {
        obj + "";
      } catch (e) {
        isTypeError = e instanceof TypeError;
      }
      expect(isTypeError).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0300
     * @tc.name      StringValueOfTest1102
     * @tc.desc      Verify that valueOf takes precedence in a numeric context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1102", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1102';

      let obj=stringTest.testObjCaseA();
      expect(Number(obj) * 2).assertEqual(84);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0400
     * @tc.name      StringValueOfTest1103
     * @tc.desc      Verify that toString takes precedence in the string context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1103", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1103';

      let obj=stringTest.testObjCaseB();
      expect(String(obj)).assertEqual("100");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0500
     * @tc.name      StringValueOfTest1104
     * @tc.desc      Verify that valueOf takes precedence in the default context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1104", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1104';

      let obj=stringTest.testObjCaseC();
      expect(obj + "").assertEqual("42");
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_0700
     * @tc.name      StringValueOfTest1106
     * @tc.desc      Verify that the comparison operator triggers valueOf
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1106", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1106';

      const str = new String("abc");
      expect(str == "abc").assertEqual(true);
      expect(str === "abc").assertEqual(false);
      expect(str < "abd").assertEqual(true);
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

    //============================ Modern JavaScript API Testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_1000
     * @tc.name      StringValueOfTest1109
     * @tc.desc      Verify the invocation of valueOf using Reflect.apply
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1109", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1109';

      const result = stringTest.testReflectApply();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_1100
     * @tc.name      StringValueOfTest1110
     * @tc.desc       Verify the behavioral consistency between Reflect.apply and the apply method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1110", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1110';

      const result:string[] = stringTest.testApplyEqual();
      expect(result[0]).assertEqual("test");
      expect(result[1]).assertEqual("test");
      expect(result[0] === result[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_1200
     * @tc.name      StringValueOfTest1111
     * @tc.desc      Verify that the get trap of Proxy can intercept the access to the valueOf method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1111", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1111';

      const type = stringTest.testProxyType();
      expect(type).assertEqual("function");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGVALUEOFONE_1300
     * @tc.name      StringValueOfTest1112
     * @tc.desc      Verify that the apply trap of Proxy can intercept the valueOf call
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringValueOfTest1112", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringValueOfTest1112';

      const result:string = stringTest.testProxyApply();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
    });

  });
}