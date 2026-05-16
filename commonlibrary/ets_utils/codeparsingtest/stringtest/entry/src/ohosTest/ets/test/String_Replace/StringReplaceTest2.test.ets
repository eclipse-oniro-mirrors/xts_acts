import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_replace_test01';
export default function StringReplaceTest2() {
  describe('StringReplaceTest2', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0100
     * @tc.name      StringReplaceTest2001
     * @tc.desc      Call methods like toUpperCase after replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2001';
      
      const str = "hello world";
      const result = str.replace(/world/, "javascript").toUpperCase();
      expect(result).assertEqual("HELLO JAVASCRIPT");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0200
     * @tc.name      StringReplaceTest2002
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2002';
      
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(/hello/, "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0300
     * @tc.name      StringReplaceTest2003
     * @tc.desc      Remove HTML tags from text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2003';
      
      const html = "<p>Hello <b>World</b></p>";
      const text = html.replace(/<[^>]+>/g, "");
      expect(text).assertEqual("Hello World");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0400
     * @tc.name      StringReplaceTest2004
     * @tc.desc      Format numbers as phone numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2004';
      
      const phone = "1234567890";
      const formatted = phone.replace(/(\d{3})(\d{3})(\d{4})/, "($1) $2-$3");
      expect(formatted).assertEqual("(123) 456-7890");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0500
     * @tc.name      StringReplaceTest2005
     * @tc.desc   Convert date from one format to another
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2005';
      
      const date = "2024-03-09";
      const formatted = date.replace(/(\d{4})-(\d{2})-(\d{2})/, "$3/$2/$1");
      expect(formatted).assertEqual("09/03/2024");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0600
     * @tc.name      StringReplaceTest2006
     * @tc.desc      Format numbers as currency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2006';
      
      const str = "price: 1234567";
      const formatted = str.replace(/\d+/, (match) => {
        return "$" + parseInt(match).toLocaleString();
      });
      expect(formatted).assertEqual("price: $1,234,567");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0700
     * @tc.name      StringReplaceTest2007
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2007';
      
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(/hello/, "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0800
     * @tc.name      StringReplaceTest2008
     * @tc.desc     Replace multiple consecutive spaces with a single space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2008';
      
      const str = "hello    world   javascript";
      const result = str.replace(/\s+/g, " ");
      expect(result).assertEqual("hello world javascript");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_0900
     * @tc.name      StringReplaceTest2009
     * @tc.desc      Chained call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2009';
      
      const str = "  hello world  ";
      const result = str
        .trim()
        .replace(/hello/, "hi")
        .toUpperCase()
        .split(" ")
        .join("-");
      expect(result).assertEqual("HI-WORLD");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1000
     * @tc.name      StringReplaceTest2010
     * @tc.desc      Keep only letters and numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2010';
      
      const str = "hello!@#$world123";
      const result = str.replace(/[^a-zA-Z0-9]/g, "");
      expect(result).assertEqual("helloworld123");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1100
     * @tc.name      StringReplaceTest2011
     * @tc.desc      Normalize newlines across different systems
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2011';
      
      const str = "line1\r\nline2\nline3\rline4";
      const result = str.replace(/\r\n|\r|\n/g, "\n");
      expect(result).assertEqual("line1\nline2\nline3\nline4");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1200
     * @tc.name      StringReplaceTest2012
     * @tc.desc      Replace special characters in URL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2012';
      
      const str = "search query with spaces";
      const encoded = str.replace(/ /g, "%20");
      expect(encoded).assertEqual("search%20query%20with%20spaces");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1300
     * @tc.name      StringReplaceTest2013
     * @tc.desc      Replace variable placeholders in a template
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2013';
      
      const template = "Hello, {name}! Welcome to {place}.";

      interface TemplateData {
        name: string;
        place: string;
      }

      const data: TemplateData = { name: "John", place: "JavaScript" };
      const result = template.replace(/\{(\w+)\}/g, (match, key: string): string => {
        if (key === 'name') {
          return data.name;
        } else if (key === 'place') {
          return data.place;
        }
        return match;
      });
      expect(result).assertEqual("Hello, John! Welcome to JavaScript.");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1400
     * @tc.name      StringReplaceTest2014
     * @tc.desc      Replace based on conditions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2014';
      
      const template = "Status: {status}";

      interface StatusData {
        status: string;
      }

      const data: StatusData = { status: "active" };
      const result = template.replace(/\{status\}/, data.status === "active" ? "" : data.status);
      expect(result).assertEqual("Status: ");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1500
     * @tc.name      StringReplaceTest2015
     * @tc.desc      Process nested template variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2015';
      
      const template = "User: {{user.name}}, Email: {{user.email}}";

      interface UserInfo {
        name: string;
        email: string;
      }

      interface UserData {
        user: UserInfo;
      }

      const data: UserData = { user: { name: "John", email: "john@example.com" } };
      const result = template.replace(/\{\{(\w+)\.(\w+)\}\}/g, (match: string, obj: string, key: string): string => {
        if (obj === 'user') {
          if (key === 'name') {
            return data.user.name;
          } else if (key === 'email') {
            return data.user.email;
          }
        }
        return match;
      });
      expect(result).assertEqual("User: John, Email: john@example.com");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1600
     * @tc.name      StringReplaceTest2016
     * @tc.desc      Convert camelCase to kebab-case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2016';
      
      const str = "backgroundColor";
      const result = str.replace(/[A-Z]/g, (match: string): string => `-${match.toLowerCase()}`);
      expect(result).assertEqual("background-color");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1700
     * @tc.name      StringReplaceTest2017
     * @tc.desc      Convert kebab-case to camelCase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2017';
      
      const str = "background-color";
      const result = str.replace(/-([a-z])/g, (match: string, letter: string): string => letter.toUpperCase());
      expect(result).assertEqual("backgroundColor");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1800
     * @tc.name      StringReplaceTest2018
     * @tc.desc      Convert snake_case to camelCase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2018';
      
      const str = "background_color";
      const result = str.replace(/_([a-z])/g, (match: string, letter: string): string => letter.toUpperCase());
      expect(result).assertEqual("backgroundColor");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_1900
     * @tc.name      StringReplaceTest2019
     * @tc.desc      Hide the middle 4 digits of a phone number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2019';
      
      const phone = "13812345678";
      const masked = phone.replace(/(\d{3})\d{4}(\d{4})/, "$1****$2");
      expect(masked).assertEqual("138****5678");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2000
     * @tc.name      StringReplaceTest2020
     * @tc.desc      Mask part of the email characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2020';
      
      const email = "john.doe@example.com";
      const masked = email.replace(/(.{2}).+(@.+)/, "$1***$2");
      expect(masked).assertEqual("jo***@example.com");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2100
     * @tc.name      StringReplaceTest2021
     * @tc.desc      Hide the middle part of the ID card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2021';
      
      const idCard = "123456789012345678";
      const masked = idCard.replace(/(\d{4})\d{10}(\d{4})/, "$1**********$2");
      expect(masked).assertEqual("1234**********5678");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2200
     * @tc.name      StringReplaceTest2022
     * @tc.desc      Hide the middle part of the bank card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2022';
      
      const card = "6222021234567890123";
      const masked = card.replace(/(\d{4})\d+(\d{4})/, "$1****$2");
      expect(masked).assertEqual("6222****0123");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2300
     * @tc.name      StringReplaceTest2023
     * @tc.desc      Format date by region
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2023';
      
      const date = "2024-03-09";
      const usFormat = date.replace(/(\d{4})-(\d{2})-(\d{2})/, "$2/$3/$1");
      const euFormat = date.replace(/(\d{4})-(\d{2})-(\d{2})/, "$3/$2/$1");
      expect(usFormat).assertEqual("03/09/2024");
      expect(euFormat).assertEqual("09/03/2024");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2400
     * @tc.name      StringReplaceTest2024
     * @tc.desc      Format numbers for different regions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2024';
      
      const str = "price: 1234567.89";
      const result = str.replace(/\d+\.?\d*/, (match) => {
        return parseFloat(match).toLocaleString("de-DE");
      });
      expect(result).assertEqual("price: 1.234.567,89");

    });
    //--------------------replace-----------------------
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2500
     * @tc.name      StringReplaceTest2025
     * @tc.desc      Create a custom object to implement Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2025';
      
      let result: string = stringTest.testSplitJoin()
      expect(result).assertEqual("h-e-l-l-o");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2600
     * @tc.name      StringReplaceTest2026
     * @tc.desc      Control replacement behavior with a custom object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2026';
      
      let result: string = stringTest.testSplitReverse()
      expect(result).assertEqual("olleh!");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2700
     * @tc.name      StringReplaceTest2027
     * @tc.desc      The Symbol.replace method returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2027';
      
      let result: string = String(stringTest.testReturnUndefined());
      expect(result).assertEqual("undefined");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2800
     * @tc.name      StringReplaceTest2028
     * @tc.desc      Using replacement in Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2028';
      
      let result: string = stringTest.testCustomObjectAccess();
      expect(result).assertEqual("hello world");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_2900
     * @tc.name      StringReplaceTest2029
     * @tc.desc      Using replacement in Symbol.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2029';
      
      const str = "hello world";
      const regex = /world/;
      const result = str.replace(regex, "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3000
     * @tc.name      StringReplaceTest2030
     * @tc.desc      Directly call the Symbol.replace method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2030';
      
      let result: string = stringTest.testCallRegexReplace();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3100
     * @tc.name      StringReplaceTest2031
     * @tc.desc      Rewrite the Symbol.replace method of RegExp
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2031';
      
      let result: string = stringTest.testModifyRegexReplace();
      expect(result).assertEqual("hello JAVASCRIPT");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3200
     * @tc.name      StringReplaceTest2032
     * @tc.desc      Compare the behavioral differences between regular expressions and strings as patterns
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2032';
      
      const str = "hello.world.javascript";
      const result1 = str.replace(".", "-");
      const result2 = str.replace(/\./g, "-");
      expect(result1).assertEqual("hello-world.javascript");
      expect(result2).assertEqual("hello-world-javascript");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3300
     * @tc.name      StringReplaceTest2033
     * @tc.desc      Compare the performance of multiple replaces and a single regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2033';
      
      const str = "a-b-c-d-e";
      const result1 = str.replace(/-/g, "");
      const result2 = str.split("-").join("");
      expect(result1).assertEqual("abcde");
      expect(result2).assertEqual("abcde");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3400
     * @tc.name      StringReplaceTest2034
     * @tc.desc      Precompiling regular expressions improves performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2034';
      
      const str = "test string";
      const regex = /\s+/g;
      const result1 = str.replace(regex, " ");
      const result2 = "another test".replace(regex, "-");
      expect(result1).assertEqual("test string");
      expect(result2).assertEqual("another-test");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3500
     * @tc.name      StringReplaceTest2035
     * @tc.desc      Replacement of complex regular expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2035';
      
      const str = "email: test@example.com, phone: 123-456-7890";
      const regex = /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)|(\d{3}-\d{3}-\d{4})/g;
      const result = str.replace(regex, "[REDACTED]");
      expect(result).assertEqual("email: [REDACTED], phone: [REDACTED]");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3600
     * @tc.name      StringReplaceTest2036
     * @tc.desc      Test the maximum number of capture groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2036';
      console.log(TAG + ' start');
      let result: string = stringTest.testRepeatAndReplace();
      expect(result).assertEqual("a".repeat(99));
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3700
     * @tc.name      StringReplaceTest2037
     * @tc.desc      replace does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2037';
      console.log(TAG + ' start');
      const str = "hello";
      const result = str.replace(/hello/, "world");
      expect(result).assertEqual("world");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3800
     * @tc.name      StringReplaceTest2038
     * @tc.desc      Return a new string object even if there is no match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2038';
      console.log(TAG + ' start');
      const str = "hello";
      const result = str.replace(/xyz/, "abc");
      expect(result).assertEqual("hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_3900
     * @tc.name      StringReplaceTest2039
     * @tc.desc      The return value is always of type string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2039';
      console.log(TAG + ' start');
      let result: string = stringTest.testReturnValueType();
      expect(result).assertEqual("246");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4000
     * @tc.name      StringReplaceTest2040
     * @tc.desc      No matter what the input is, the return value is always of string type
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2040';
      console.log(TAG + ' start');
      let result: string = stringTest.testReturnValueIsString();
      expect(result).assertEqual("246");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4100
     * @tc.name      StringReplaceTest2041
     * @tc.desc      Convert String wrapper object to primitive string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2041';
      console.log(TAG + ' start');
      const strObj = new String("hello");
      const result = strObj.replace(/hello/, "world");
      expect(result).assertEqual("world");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4200
     * @tc.name      StringReplaceTest2042
     * @tc.desc      String directly calls replace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2042';
      console.log(TAG + ' start');
      const str = "hello world";
      const result = str.replace(/world/, "javascript");
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4300
     * @tc.name      StringReplaceTest2043
     * @tc.desc      Call using the call method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2043';
      console.log(TAG + ' start');
      let result: string = stringTest.testCalledViaCall();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4400
     * @tc.name      StringReplaceTest2044
     * @tc.desc      Call using the apply method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2044';
      console.log(TAG + ' start');
      let result: string = stringTest.testCalledViaApply();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4500
     * @tc.name      StringReplaceTest2045
     * @tc.desc      Call using the bind method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2045';
      console.log(TAG + ' start');
      let result: string = stringTest.testCalledViaBind();
      expect(result).assertEqual("hello javascript");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4600
     * @tc.name      StringReplaceTest2046
     * @tc.desc      Access replace from String.prototype
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2046';
      console.log(TAG + ' start');
      let result: string = stringTest.testAccessFromPrototype();
      expect(result).assertEqual("true");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4700
     * @tc.name      StringReplaceTest2047
     * @tc.desc      Override the replace method on an instance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2047';
      console.log(TAG + ' start');
      let result: string = stringTest.testOverrideInstanceMethod();
      expect(result).assertEqual("custom replace");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4800
     * @tc.name      StringReplaceTest2048
     * @tc.desc      Special behavior of matching empty strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2048';
      console.log(TAG + ' start');
      const str = "abc";
      const result = str.replace(/()/g, "-");
      expect(result).assertEqual("-a-b-c-");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_4900
     * @tc.name      StringReplaceTest2049
     * @tc.desc      Optional group matches an empty string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2049';
      console.log(TAG + ' start');
      const str = "abc";
      const result = str.replace(/a?/, "X");
      expect(result).assertEqual("Xbc");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5000
     * @tc.name      StringReplaceTest2050
     * @tc.desc      The lastIndex of a non-global regular expression does not affect matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2050';
      console.log(TAG + ' start');
      const str = "hello hello";
      const regex = /hello/;
      regex.lastIndex = 6;
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5100
     * @tc.name      StringReplaceTest2051
     * @tc.desc      Regular expression status after replacement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2051';
      
      const res: string[] = stringTest.testRegexLastIndexResetAfterReplace();
      expect(res[0]).assertEqual("hi world");
      expect(res[1]).assertEqual("0");

      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5200
     * @tc.name      StringReplaceTest2052
     * @tc.desc      Dynamically build regular expressions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2052';
      console.log(TAG + ' start');
      const str = "hello world";
      const pattern = "hello";
      const flags = "g";
      const regex = new RegExp(pattern, flags);
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi world");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5300
     * @tc.name      StringReplaceTest2053
     * @tc.desc      Create regex from user input (needs escaping)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2053';
      console.log(TAG + ' start');
      const str = "price: $100";
      const userInput = "$100";
      const escaped = userInput.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      const regex = new RegExp(escaped, "g");
      const result = str.replace(regex, "$200");
      expect(result).assertEqual("price: $200");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5400
     * @tc.name      StringReplaceTest2054
     * @tc.desc      Combination of various special modes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2054';
      console.log(TAG + ' start');
      const str = "hello world";
      const result = str.replace(/(\w+) (\w+)/, "[$&] ($`) ($') $1-$2");
      expect(result).assertEqual("[hello world] () () hello-world");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACETWO_5500
     * @tc.name      StringReplaceTest2055
     * @tc.desc      Complex conditional replacement logic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest2055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest2055';
      console.log(TAG + ' start');
      const str = "1 apple, 2 oranges, 3 bananas, 10 grapes";
      const result = str.replace(/\d+/g, (match) => {
        const num = parseInt(match);
        if (num === 1) return match;
        if (num < 5) return `few(${num})`;
        return `many(${num})`;
      });
      expect(result).assertEqual("1 apple, few(2) oranges, few(3) bananas, many(10) grapes");
      console.log(TAG + ' end');
    });
  });
};