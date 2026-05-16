import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_replaceall_test01';
export default function StringReplaceAllTest2() {
  describe('StringReplaceAllTest2', () => {
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
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0100
     * @tc.name      StringReplaceAllTest2001
     * @tc.desc      Simple template string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2001';

      'use strict';
      let result = stringTest.testSimpleTemp();
      expect(result).assertEqual("Hello Alice, welcome to Wonderland");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0200
     * @tc.name      StringReplaceAllTest2002
     * @tc.desc      Modify query parameters in URL string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2002';

      'use strict';
      const url = "https://example.com?user=old&page=1";
      const result = url
        .replaceAll("user=old", "user=new")
        .replaceAll("page=1", "page=2");
      expect(result).assertEqual("https://example.com?user=new&page=2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0300
     * @tc.name      StringReplaceAllTest2003
     * @tc.desc      Replace var with let and single quotes with double quotes in code string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2003';

      'use strict';
      const code = "var name = 'John'; var age = 30;";
      const result = code
        .replaceAll("var ", "let ")
        .replaceAll("'", "\"");
      expect(result).assertEqual("let name = \"John\"; let age = 30;");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0400
     * @tc.name      StringReplaceAllTest2004
     * @tc.desc      Replace currency symbols with currency codes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2004';

      'use strict';
      const price = "Price: $100, €200, ¥300";
      const result = price
        .replaceAll("$", "USD ")
        .replaceAll("€", "EUR ")
        .replaceAll("¥", "JPY ");
      expect(result).assertEqual("Price: USD 100, EUR 200, JPY 300");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0500
     * @tc.name      StringReplaceAllTest2005
     * @tc.desc      Convert date separator from slash to hyphen
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2005';

      'use strict';
      const date = "2021/12/25";
      const result = date.replaceAll("/", "-");
      expect(result).assertEqual("2021-12-25");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0600
     * @tc.name      StringReplaceAllTest2006
     * @tc.desc      Remove password field from JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2006';

      'use strict';
      const json = '{"name":"John","password":"secret","age":30}';
      const result = json.replaceAll(/"password":"[^"]*",/g, "");
      expect(result).assertEqual("{\"name\":\"John\",\"age\":30}");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0700
     * @tc.name      StringReplaceAllTest2007
     * @tc.desc      Rename keys in JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2007';

      'use strict';
      const json = '{"oldName":"John","oldAge":30}';
      const result = json
        .replaceAll('"oldName"', '"name"')
        .replaceAll('"oldAge"', '"age"');
      expect(result).assertEqual('{"name":"John","age":30}');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0800
     * @tc.name      StringReplaceAllTest2008
     * @tc.desc      Convert Windows path separators to Unix style
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2008';

      'use strict';
      const path = "folder\\subfolder\\file.txt";
      const result = path.replaceAll("\\", "/");
      expect(result).assertEqual("folder/subfolder/file.txt");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_0900
     * @tc.name      StringReplaceAllTest2009
     * @tc.desc      Normalize multiple consecutive slashes in path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2009';

      'use strict';
      const path = "folder//subfolder///file.txt";
      const result = path.replaceAll(/\/+/g, "/");
      expect(result).assertEqual("folder/subfolder/file.txt");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1000
     * @tc.name      StringReplaceAllTest2010
     * @tc.desc      Replace non-overlapping substrings in sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2010';

      'use strict';
      const str = "aaa";
      const result = str.replaceAll("aa", "b");
      expect(result).assertEqual("ba");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1100
     * @tc.name      StringReplaceAllTest2011
     * @tc.desc      Replace non-overlapping matched substrings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2011';

      'use strict';
      const str = "ababa";
      const result = str.replaceAll("aba", "X");
      expect(result).assertEqual("Xba");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1200
     * @tc.name      StringReplaceAllTest2012
     * @tc.desc      Replace all non-overlapping matched substrings completely
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2012';

      'use strict';
      const str = "aaaa";
      const result = str.replaceAll("aa", "b");
      expect(result).assertEqual("bb");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1300
     * @tc.name      StringReplaceAllTest2013
     * @tc.desc      Replace characters in string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2013';
      let result: string = stringTest.testStringObject();
      expect(result).assertEqual("heLLo");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1400
     * @tc.name      StringReplaceAllTest2014
     * @tc.desc      Replace characters in non-string object converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2014';
      let result: string = stringTest.testNonStringObj();
      expect(result).assertEqual("1X3");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1500
     * @tc.name      StringReplaceAllTest2015
     * @tc.desc      Replace separators in array converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2015';
      let result: string = stringTest.testArrayAs();
      expect(result).assertEqual("1-2-3");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1600
     * @tc.name      StringReplaceAllTest2016
     * @tc.desc      Replace content in date object converted to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2016';
      let result: string = stringTest.testDateObjectAs();
      expect(result.includes("2022")).assertEqual(true);
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1700
     * @tc.name      StringReplaceAllTest2017
     * @tc.desc      Replace content in custom object's string representation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2017';

      class CustomStringObj {
        toString(): string {
          return "hello world";
        }
      }
      const obj = new CustomStringObj();
      const str = obj.toString();
      const result = str.replaceAll("world", "there");
      expect(result).assertEqual("hello there");
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1800
     * @tc.name      StringReplaceAllTest2018
     * @tc.desc      Replace characters in string wrapped in custom object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2018';
      console.log(TAG + ' start');
      interface StringWrapper {
        str: string;
      }
      const wrapper: StringWrapper = {
        str: "hello"
      };
      const customGet = (prop: string): void => {
        console.log(`Accessing method: ${prop}`);
      };
      customGet("replaceAll");
      const result = wrapper.str.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_1900
     * @tc.name      StringReplaceAllTest2019
     * @tc.desc      Replace characters in proxy-wrapped string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2019';
      let result: string = stringTest.testProxyObjIntercept();
      expect(result).assertEqual("hexxo");
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2000
     * @tc.name      StringReplaceAllTest2020
     * @tc.desc      Replace characters in frozen string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2020';
      console.log(TAG + ' start');
      'use strict';
      const strObj = "hello";
      const frozenStrObj = strObj;
      const result = frozenStrObj.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
      expect(strObj.toString()).assertEqual("hello");
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2100
     * @tc.name      StringReplaceAllTest2021
     * @tc.desc      Basic character replacement in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2021';
      console.log(TAG + ' start');
      'use strict';
      const strObj = "hello";
      const result = strObj.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2200
     * @tc.name      StringReplaceAllTest2022
     * @tc.desc      Replace characters in read-only string attribute
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2022';
      let result: string = stringTest.testReadOnlyAttr();
      expect(result.length).assertEqual(5);
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2300
     * @tc.name      StringReplaceAllTest2023
     * @tc.desc      Regex lastIndex is reset after replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2023';
      console.log(TAG + ' start');
      'use strict';
      const str = "test123test456";
      const regex = /test/g;
      regex.lastIndex = 5;
      const result = str.replaceAll(regex, "MATCH");
      expect(result).assertEqual("MATCH123MATCH456");
      expect(regex.lastIndex).assertEqual(0);
      console.log(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2400
     * @tc.name      StringReplaceAllTest2024
     * @tc.desc      Test regex lastIndex behavior in replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2024';
      let result: string = stringTest.testLastIndex();
      expect(result).assertEqual("bbb");
      console.log(TAG + " end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2500
     * @tc.name      StringReplaceAllTest2025
     * @tc.desc      Continue processing after replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2025';

      const str = "hello world";
      const result = str.replaceAll("l", "L").split(" ");
      expect(result.toString()).assertEqual("heLLo,worLd");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2600
     * @tc.name      StringReplaceAllTest2026
     * @tc.desc      Using replaceAll in template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2026';

      const name = "John";
      const greeting = `Hello ${name}`.replaceAll("John", "Alice");
      expect(greeting).assertEqual("Hello Alice");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2700
     * @tc.name      StringReplaceAllTest2027
     * @tc.desc      Behavior of replaceAll in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2027';

      const str = "test";
      const result = str.replaceAll("e", "E");
      expect(result).assertEqual("tEst");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2800
     * @tc.name      StringReplaceAllTest2028
     * @tc.desc      replaceAll behaves the same in non-strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2028';

      const str = "test";
      const result = str.replaceAll("e", "E");
      expect(result).assertEqual("tEst");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_2900
     * @tc.name      StringReplaceAllTest2029
     * @tc.desc      NaN is converted to the string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2029';

      const retObj: (string | string[])[] = stringTest.testReplaceAllChars();
      let bool : boolean = retObj[1][0] === "h" && retObj[1][1] === "e" && retObj[1][2] === "l" && retObj[1][3] === "l" && retObj[1][4] === "o";
      expect(retObj[0]).assertEqual("heLLo");
      expect(bool).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3000
     * @tc.name      StringReplaceAllTest2030
     * @tc.desc      NaN is converted to the string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2030';

      const str = "NaN value NaN";
      const result = str.replaceAll(String(NaN), "NOT_A_NUMBER");
      expect(result).assertEqual("NOT_A_NUMBER value NOT_A_NUMBER");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3100
     * @tc.name      StringReplaceAllTest2031
     * @tc.desc      Infinity is converted to the string "Infinity"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2031';

      const str = "Infinity value Infinity";
      const result = str.replaceAll(String(Infinity), "∞");
      expect(result).assertEqual("∞ value ∞");
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLTWO_3200
     * @tc.name      StringReplaceAllTest2032
     * @tc.desc      -0 is converted to the string "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest2032';

      const str = "0 value 0";
      const result = str.replaceAll(String(-0), "ZERO");
      expect(result).assertEqual("ZERO value ZERO");
    });

  });
}