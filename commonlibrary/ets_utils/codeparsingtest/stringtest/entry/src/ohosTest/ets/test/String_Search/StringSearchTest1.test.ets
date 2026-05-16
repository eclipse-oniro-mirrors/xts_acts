import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import * as stringSearchHelper from './string_search_helper';

export default function StringSearchTest() {
  describe('StringSearchTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    //============================Basic Function Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0100
     * @tc.name      StringSearchTest1001
     * @tc.desc      Verify that the search method can find a single character in a string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1001", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1001';

      const str = "hello world";
      const result = str.search("o");
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0200
     * @tc.name      StringSearchTest1002
     * @tc.desc      Verify that the search method returns -1 for non-existent characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1002", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1002';

      const str = "hello world";
      const result = str.search("z");
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0300
     * @tc.name      StringSearchTest1003
     * @tc.desc      Verify that the search method returns the position of the first match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1003", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1003';

      const str = "hello hello";
      const result = str.search("l");
      expect(result).assertEqual(2);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0400
     * @tc.name      StringSearchTest1004
     * @tc.desc      Verify that the search method can match partial substrings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1004", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1004';

      const str = "hello world";
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0500
     * @tc.name      StringSearchTest1005
     * @tc.desc      Verify that the search method can match partial substrings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1005", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1005';

      const str = "hello world";
      const result = str.search("wor");
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0600
     * @tc.name      StringSearchTest1006
     * @tc.desc      Verify that the search method returns 0 for empty strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1006", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1006';

      const str = "hello world";
      const result = str.search("");
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0700
     * @tc.name      StringSearchTest1007
     * @tc.desc      Verify that the search method returns -1 for empty strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1007", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1007';

      const str = "Hello World";
      const result = str.search("world");
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONEE_0700
     * @tc.name      StringSearchTest1008
     * @tc.desc      Verify that the search method uses i flag for case-insensitive matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1008", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1008';

      const str = "Hello World";
      const result = str.search(/hello/i);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0800
     * @tc.name      StringSearchTest1009
     * @tc.desc      Verify the search method's matching behavior in mixed-case strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1009", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1009';

      const str = "HeLLo WoRLd";
      const result1 = str.search("hello");
      expect(result1).assertEqual(-1);
      const result2 = str.search(/hello/i);
      expect(result2).assertEqual(0);

    });

    //============================Parameter Type Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_0900
     * @tc.name      StringSearchTest1010
     * @tc.desc      Verify that the search method works with standard RegExp object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1010", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1010';

      const str = "hello world";
      const regex = new RegExp("world");
      const result = str.search(regex);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1000
     * @tc.name      StringSearchTest1011
     * @tc.desc      Verify that the search method works with literal RegExp object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1011", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1011';

      const str = "hello world";
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1100
     * @tc.name      StringSearchTest1012
     * @tc.desc      Verify that the search method works with RegExp object with flags
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1012", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1012';

      const str = "Hello World";
      const result = str.search(/hello/i);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1200
     * @tc.name      StringSearchTest1013
     * @tc.desc      Verify that the search method works with ordinary string parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1013", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1013';

      const str = "hello world";
      const result = str.search("world");
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1300
     * @tc.name      StringSearchTest1014
     * @tc.desc      Verify that the search method handles strings with special regex characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1014", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1014';

      const str = "hello.world";
      const result = str.search("\\.");
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1400
     * @tc.name      StringSearchTest1015
     * @tc.desc      Verify that the search method handles empty string parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1015", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1015';

      const str = "hello";
      const result = str.search("");
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1500
     * @tc.name      StringSearchTest1016
     * @tc.desc      Verify that the search method works with custom Symbol.search method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1016", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1016';

      const result = stringSearchHelper.testCustomSymbol();
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1600
     * @tc.name      StringSearchTest1017
     * @tc.desc      Verify that the search method works when Symbol.search returns a number
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1017", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1017';

      const result = stringSearchHelper.testSymbolReturnsNumber();
      expect(result).assertEqual(42);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1700
     * @tc.name      StringSearchTest1018
     * @tc.desc      Verify that the search method works when Symbol.search returns -1 (not found)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1018", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1018';

      const result = stringSearchHelper.testSymbolReturnsNegOne();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1800
     * @tc.name      StringSearchTest1019
     * @tc.desc      Verify that the search method works when Symbol.search throws an exception
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1019", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1019';

      const error:string = stringSearchHelper.testSymbolThrowsError();
      expect(error).assertEqual("Search failed");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_1900
     * @tc.name      StringSearchTest1020
     * @tc.desc      Verify that the search method handles number parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1020", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1020';

      const result = stringSearchHelper.testNumberParam();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2000
     * @tc.name      StringSearchTest1021
     * @tc.desc      Verify that the search method handles boolean parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1021", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1021';

      const result = stringSearchHelper.testBooleanParam() ;
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2100
     * @tc.name      StringSearchTest1022
     * @tc.desc      Verify that the search method handles null parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1022", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1022';

      const result = stringSearchHelper.testNullParam();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2200
     * @tc.name      StringSearchTest1023
     * @tc.desc      Verify that the search method handles undefined parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1023", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1023';

      const result = stringSearchHelper.testUndefinedParam();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2300
     * @tc.name      StringSearchTest1024
     * @tc.desc      Verify that the search method handles array parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1024", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1024';

      const result = stringSearchHelper.testArrayParam();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2400
     * @tc.name      StringSearchTest1025
     * @tc.desc      Verify that the search method handles plain object parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1025", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1025';

      const result = stringSearchHelper.testObjectParam();
      expect(result).assertEqual(1);

    });

    //============================Regular expression feature testing==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2500
     * @tc.name      StringSearchTest1026
     * @tc.desc      Verify that the search method works with \d digit character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1026", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1026';

      const str = "abc123def";
      const result = str.search(/\d/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2600
     * @tc.name      StringSearchTest1027
     * @tc.desc      Verify that the search method works with \D non-digit character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1027", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1027';

      const str = "123abc";
      const result = str.search(/\D/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2700
     * @tc.name      StringSearchTest1028
     * @tc.desc      Verify that the search method works with \w word character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1028", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1028';

      const str = "!@#abc";
      const result = str.search(/\w/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2800
     * @tc.name      StringSearchTest1029
     * @tc.desc      Verify that the search method works with \W non-word character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1029", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1029';

      const str = "abc!@#";
      const result = str.search(/\W/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_2900
     * @tc.name      StringSearchTest1030
     * @tc.desc      Verify that the search method works with \s whitespace character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1030", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1030';

      const str = "hello world";
      const result = str.search(/\s/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3000
     * @tc.name      StringSearchTest1031
     * @tc.desc      Verify that the search method works with \S non-whitespace character class
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1031", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1031';

      const str = "  hello";
      const result = str.search(/\S/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3100
     * @tc.name      StringSearchTest1032
     * @tc.desc      Verify that the search method works with custom character set [aeiou]
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1032", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1032';

      const str = "hello world";
      const result = str.search(/[aeiou]/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3200
     * @tc.name      StringSearchTest1033
     * @tc.desc      Verify that the search method works with negated character set [^a-z]
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1033", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1033';

      const str = "hello";
      const result = str.search(/[^a-z]/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3300
     * @tc.name      StringSearchTest1034
     * @tc.desc      Verify that the search method works with character range [0-9]
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1034", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1034';

      const str = "abc123";
      const result = str.search(/[0-9]/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3400
     * @tc.name      StringSearchTest1035
     * @tc.desc      Verify that the search method works with ^ start anchor matching string beginning
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1035", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1035';

      const str = "hello world";
      const result = str.search(/^hello/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3500
     * @tc.name      StringSearchTest1036
     * @tc.desc      Verify that the search method does not match ^ anchor at non-start position
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1036", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1036';

      const str = "hello world";
      const result = str.search(/^world/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3600
     * @tc.name      StringSearchTest1037
     * @tc.desc      Verify that the search method works with $ end anchor matching string ending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1037", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1037';

      const str = "hello world";
      const result = str.search(/world$/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3700
     * @tc.name      StringSearchTest1038
     * @tc.desc      Verify that the search method does not match $ anchor at non-end position
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1038", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1038';

      const str = "hello world";
      const result = str.search(/hello$/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3800
     * @tc.name      StringSearchTest1039
     * @tc.desc      Verify that the search method works with \b word boundary anchor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1039", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1039';

      const str = "hello world";
      const result = str.search(/\bworld\b/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_3900
     * @tc.name      StringSearchTest1040
     * @tc.desc      Verify that the search method works with \B non-word boundary anchor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1040", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1040';

      const str = "hello world";
      const result = str.search(/\Bllo\b/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4000
     * @tc.name      StringSearchTest1041
     * @tc.desc      Verify that the search method works with * quantifier matching zero or more times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1041", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1041';

      const str = "abbbc";
      const result = str.search(/ab*c/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4100
     * @tc.name      StringSearchTest1042
     * @tc.desc      Verify that the search method works with + quantifier matching one or more times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1042", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1042';

      const str = "abbbc";
      const result = str.search(/ab+c/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4200
     * @tc.name      StringSearchTest1043
     * @tc.desc      Verify that the search method works with ? quantifier matching zero or one time
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1043", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1043';

      const str = "ac";
      const result = str.search(/ab?c/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4300
     * @tc.name      StringSearchTest1044
     * @tc.desc      Verify that the search method works with {n} quantifier matching exactly n times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1044", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1044';

      const str = "aaabbb";
      const result = str.search(/a{3}/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4400
     * @tc.name      StringSearchTest1045
     * @tc.desc      Verify that the search method works with {n,} quantifier matching at least n times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1045", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1045';

      const str = "aaaaa";
      const result = str.search(/a{3,}/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4500
     * @tc.name      StringSearchTest1046
     * @tc.desc      Verify that the search method works with {n,m} quantifier matching n to m times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1046", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1046';

      const str = "aaaa";
      const result = str.search(/a{2,4}/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4600
     * @tc.name      StringSearchTest1047
     * @tc.desc      Verify that the search method works with *? non-greedy quantifier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1047", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1047';

      const str = "aaabbb";
      const result = str.search(/a*?b/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4700
     * @tc.name      StringSearchTest1048
     * @tc.desc      Verify that the search method works with +? non-greedy quantifier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1048", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1048';

      const str = "aaabbb";
      const result = str.search(/a+?b/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4800
     * @tc.name      StringSearchTest1049
     * @tc.desc      Verify that the search method works with ?? non-greedy quantifier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1049", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1049';

      const str = "ab";
      const result = str.search(/a??b/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_4900
     * @tc.name      StringSearchTest1050
     * @tc.desc      Verify that the search method works with capturing group ()
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1050", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1050';

      const str = "hello world";
      const result = str.search(/(world)/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5000
     * @tc.name      StringSearchTest1051
     * @tc.desc      Verify that the search method works with non-capturing group (?:)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1051", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1051';

      const str = "hello world";
      const result = str.search(/(?:world)/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5100
     * @tc.name      StringSearchTest1052
     * @tc.desc      Verify that the search method works with named capturing group (?<name>)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1052", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1052';

      const str = "hello world";
      const result = str.search(/(?<word>world)/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5200
     * @tc.name      StringSearchTest1053
     * @tc.desc      Verify that the search method works with backreference \\1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1053", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1053';

      const str = "abab";
      const result = str.search(/(a)b\1/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5300
     * @tc.name      StringSearchTest1054
     * @tc.desc      Verify that the search method works with named backreference \\k<name>
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1054", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1054';

      const str = "abab";
      const result = str.search(/(?<char>a)b\k<char>/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5400
     * @tc.name      StringSearchTest1055
     * @tc.desc      Verify that the search method works with simple alternation |
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1055", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1055';

      const str = "cat";
      const result = str.search(/cat|dog/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5500
     * @tc.name      StringSearchTest1056
     * @tc.desc      Verify that the search method works with multiple alternation options
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1056", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1056';

      const str = "bird";
      const result = str.search(/cat|dog|bird/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5600
     * @tc.name      StringSearchTest1057
     * @tc.desc      Verify that the search method works with alternation precedence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1057", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1057';

      const str = "ab";
      const result = str.search(/a|bc/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5700
     * @tc.name      StringSearchTest1058
     * @tc.desc      Verify that the search method works with positive lookahead (?=)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1058", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1058';

      const str = "hello world";
      const result = str.search(/hello(?= world)/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5800
     * @tc.name      StringSearchTest1059
     * @tc.desc      Verify that the search method works with negative lookahead (?!)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1059", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1059';

      const str = "hello there";
      const result = str.search(/hello(?! world)/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_5900
     * @tc.name      StringSearchTest1060
     * @tc.desc      Verify that the search method works with positive lookbehind (?<=)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1060", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1060';

      const str = "hello world";
      const result = str.search(/(?<=hello )world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6000
     * @tc.name      StringSearchTest1061
     * @tc.desc      Verify that the search method works with negative lookbehind (?<!)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1061", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1061';

      const str = "goodbye world";
      const result = str.search(/(?<!hello )world/);
      expect(result).assertEqual(8);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6100
     * @tc.name      StringSearchTest1062
     * @tc.desc      Verify that the search method works with g flag (global) - no effect on search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1062", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1062';

      const str = "hello hello";
      const regex = /hello/g;
      const result = str.search(regex);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6200
     * @tc.name      StringSearchTest1063
     * @tc.desc      Verify that the search method works with i flag (case-insensitive)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1063", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1063';

      const str = "HELLO";
      const result = str.search(/hello/i);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6300
     * @tc.name      StringSearchTest1064
     * @tc.desc      Verify that the search method works with m flag (multiline)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1064", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1064';

      const str = "hello\nworld";
      const result = str.search(/^world/m);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6400
     * @tc.name      StringSearchTest1065
     * @tc.desc      Verify that the search method works with s flag (dotAll) - dot matches newlines
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1065", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1065';

      const str = "hello\nworld";
      const result = str.search(/hello.world/s);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6500
     * @tc.name      StringSearchTest1066
     * @tc.desc      Verify that the search method works with u flag (Unicode)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1066", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1066';

      const str = "你好";
      const result = str.search(/\u{4F60}/u);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6600
     * @tc.name      StringSearchTest1067
     * @tc.desc      Verify that the search method works with combined flags
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1067", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1067';

      const str = "HELLO\nWORLD";
      const result = str.search(/^world/mi);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6700
     * @tc.name      StringSearchTest1068
     * @tc.desc      Verify that the search method works with dot . matching any character (except newline)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1068", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1068';

      const str = "hello";
      const result = str.search(/./);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6800
     * @tc.name      StringSearchTest1069
     * @tc.desc      Verify that the search method works with escaped special characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1069", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1069';

      const str = "hello.world";
      const result = str.search(/\./);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_6900
     * @tc.name      StringSearchTest1070
     * @tc.desc      Verify that the search method works with tab character \t
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1070", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1070';

      const str = "hello\tworld";
      const result = str.search(/\t/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7000
     * @tc.name      StringSearchTest1071
     * @tc.desc      Verify that the search method works with newline character \n
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1071", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1071';

      const str = "hello\nworld";
      const result = str.search(/\n/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7100
     * @tc.name      StringSearchTest1072
     * @tc.desc      Verify that the search method works with carriage return character \r
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1072", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1072';

      const str = "hello\rworld";
      const result = str.search(/\r/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7200
     * @tc.name      StringSearchTest1073
     * @tc.desc      Verify that the search method works with Unicode escape \u
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1073", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1073';

      const str = "你好";
      const result = str.search(/\u4F60/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7300
     * @tc.name      StringSearchTest1074
     * @tc.desc      Verify that the search method works with hexadecimal escape \x
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1074", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1074';

      const str = "hello";
      const result = str.search(/\x68/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7400
     * @tc.name      StringSearchTest1075
     * @tc.desc      Verify that the search method ignores RegExp lastIndex property
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1075", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1075';

      const str = "hello hello";
      const regex = /hello/g;
      regex.lastIndex = 6;
      const result = str.search(regex);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7500
     * @tc.name      StringSearchTest1076
     * @tc.desc      Verify that the search method does not modify RegExp lastIndex property
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1076", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1076';

      const str = "hello";
      const regex = /hello/g;
      regex.lastIndex = 3;
      str.search(regex);
      expect(regex.lastIndex).assertEqual(3);

    });

    //============================Boundary value test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7600
     * @tc.name      StringSearchTest1077
     * @tc.desc      Verify that the search method works with empty string searching any pattern
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1077", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1077';

      const str = "";
      const result = str.search(/a/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7700
     * @tc.name      StringSearchTest1078
     * @tc.desc      Verify that the search method works with empty string searching empty pattern
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1078", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1078';

      const str = "";
      const result = str.search(/(?:)/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7800
     * @tc.name      StringSearchTest1079
     * @tc.desc      Verify that the search method works with empty string searching start anchor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1079", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1079';

      const str = "";
      const result = str.search(/^/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_7900
     * @tc.name      StringSearchTest1080
     * @tc.desc      Verify that the search method works with empty string searching end anchor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1080", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1080';

      const str = "";
      const result = str.search(/$/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8000
     * @tc.name      StringSearchTest1081
     * @tc.desc      Verify that the search method works with single character string matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1081", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1081';

      const str = "a";
      const result = str.search(/a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8100
     * @tc.name      StringSearchTest1082
     * @tc.desc      Verify that the search method works with single character string not matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1082", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1082';

      const str = "a";
      const result = str.search(/b/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8200
     * @tc.name      StringSearchTest1083
     * @tc.desc      Verify that the search method works with single character string matching dot
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1083", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1083';

      const str = "a";
      const result = str.search(/./);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8300
     * @tc.name      StringSearchTest1084
     * @tc.desc      Verify that the search method works with long string matching at start
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1084", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1084';

      const str = "a".repeat(10000);
      const result = str.search(/^a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8400
     * @tc.name      StringSearchTest1085
     * @tc.desc      Verify that the search method works with long string matching at end
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1085", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1085';

      const str = "a".repeat(10000);
      const result = str.search(/a$/);
      expect(result).assertEqual(9999);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8500
     * @tc.name      StringSearchTest1086
     * @tc.desc      Verify that the search method works with long string matching in middle
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1086", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1086';

      const str = "a".repeat(5000) + "b" + "a".repeat(5000);
      const result = str.search(/b/);
      expect(result).assertEqual(5000);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8600
     * @tc.name      StringSearchTest1087
     * @tc.desc      Verify that the search method works with long string not matching
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1087", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1087';

      const str = "a".repeat(10000);
      const result = str.search(/b/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8700
     * @tc.name      StringSearchTest1088
     * @tc.desc      Verify that the search method returns index 0 when matching at start
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1088", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1088';

      const str = "hello";
      const result = str.search(/h/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8800
     * @tc.name      StringSearchTest1089
     * @tc.desc      Verify that the search method returns maximum index when matching at end
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1089", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1089';

      const str = "hello";
      const result = str.search(/o/);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_8900
     * @tc.name      StringSearchTest1090
     * @tc.desc      Verify that the search method returns -1 when no match found
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1090", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1090';

      const str = "hello";
      const result = str.search(/z/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9000
     * @tc.name      StringSearchTest1091
     * @tc.desc      Verify that the search method correctly distinguishes between 0 and -1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1091", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1091';

      const str1 = "hello";
      const str2 = "world";
      expect(str1.search(/h/)).assertEqual(0);
      expect(str2.search(/h/)).assertEqual(-1);

    });

    //============================Special Regex Characters Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9100
     * @tc.name      StringSearchTest1092
     * @tc.desc      Verify that the search method works with escaped dot character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1092", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1092';

      const str = "file.txt";
      const result = str.search(/\./);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9200
     * @tc.name      StringSearchTest1093
     * @tc.desc      Verify that the search method works with escaped asterisk character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1093", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1093';

      const str = "2*3=6";
      const result = str.search(/\*/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9300
     * @tc.name      StringSearchTest1094
     * @tc.desc      Verify that the search method works with escaped plus character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1094", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1094';

      const str = "1+2=3";
      const result = str.search(/\+/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9400
     * @tc.name      StringSearchTest1095
     * @tc.desc      Verify that the search method works with escaped question mark character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1095", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1095';

      const str = "yes?";
      const result = str.search(/\?/);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9500
     * @tc.name      StringSearchTest1096
     * @tc.desc      Verify that the search method works with escaped square bracket character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1096", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1096';

      const str = "array[0]";
      const result = str.search(/\[/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9600
     * @tc.name      StringSearchTest1097
     * @tc.desc      Verify that the search method works with escaped parenthesis character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1097", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1097';

      const str = "func()";
      const result = str.search(/\(/);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9700
     * @tc.name      StringSearchTest1098
     * @tc.desc      Verify that the search method works with escaped curly brace character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1098", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1098';

      const str = "{key: value}";
      const result = str.search(/\{/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9800
     * @tc.name      StringSearchTest1099
     * @tc.desc      Verify that the search method works with escaped pipe character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1099", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1099';

      const str = "a|b";
      const result = str.search(/\|/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCH_9900
     * @tc.name      StringSearchTest1100
     * @tc.desc      Verify that the search method works with escaped caret character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1100';

      const str = "2^3";
      const result = str.search(/\^/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0100
     * @tc.name      StringSearchTest1101
     * @tc.desc      Verify that the search method works with escaped dollar character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1101", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1101';

      const str = "$100";
      const result = str.search(/\$/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0200
     * @tc.name      StringSearchTest1102
     * @tc.desc      Verify that the search method works with escaped backslash character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1102", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1102';

      const str = "path\\to\\file";
      const result = str.search(/\\/);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0300
     * @tc.name      StringSearchTest1103
     * @tc.desc      Verify that the search method works with escaped forward slash character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1103", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1103';

      const str = "path/to/file";
      const result = str.search(/\//);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0400
     * @tc.name      StringSearchTest1104
     * @tc.desc      Verify that the search method works with space character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1104", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1104';

      const str = "hello world";
      const result = str.search(/ /);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0500
     * @tc.name      StringSearchTest1105
     * @tc.desc      Verify that the search method works with multiple spaces
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1105", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1105';

      const str = "hello  world";
      const result = str.search(/  /);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0600
     * @tc.name      StringSearchTest1106
     * @tc.desc      Verify that the search method works with tab character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1106", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1106';

      const str = "hello\tworld";
      const result = str.search(/\t/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0700
     * @tc.name      StringSearchTest1107
     * @tc.desc      Verify that the search method works with newline character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1107", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1107';

      const str = "hello\nworld";
      const result = str.search(/\n/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0800
     * @tc.name      StringSearchTest1108
     * @tc.desc      Verify that the search method works with carriage return character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1108", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1108';

      const str = "hello\rworld";
      const result = str.search(/\r/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_0900
     * @tc.name      StringSearchTest1109
     * @tc.desc      Verify that the search method works with CRLF combination
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1109", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1109';

      const str = "hello\r\nworld";
      const result = str.search(/\r\n/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_1000
     * @tc.name      StringSearchTest1110
     * @tc.desc      Verify that the search method works with mixed whitespace characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1110", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1110';

      const str = "hello \t\nworld";
      const result = str.search(/\s+/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHONE_1100
     * @tc.name      StringSearchTest1111
     * @tc.desc      Verify that the search method works with null character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1111", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1111';

      const str = "hello\0world";
      const result = str.search(/\0/);
      expect(result).assertEqual(5);

    });
  });
}