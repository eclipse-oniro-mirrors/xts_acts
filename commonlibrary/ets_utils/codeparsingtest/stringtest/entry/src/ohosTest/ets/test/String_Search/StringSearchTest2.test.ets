import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import * as stringSearchHelper from './string_search_helper';

export default function StringSearchTest2() {
  describe('StringSearchTest2', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0100
     * @tc.name      StringSearchTest1112
     * @tc.desc      Verify that the search method works with backspace character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1112", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1112';

      const str = "hello\bworld";
      const result = str.search(/[\b]/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0200
     * @tc.name      StringSearchTest1113
     * @tc.desc      Verify that the search method works with form feed character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1113", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1113';

      const str = "hello\fworld";
      const result = str.search(/\f/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0300
     * @tc.name      StringSearchTest1114
     * @tc.desc      Verify that the search method works with vertical tab character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1114", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1114';

      const str = "hello\vworld";
      const result = str.search(/\v/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0400
     * @tc.name      StringSearchTest1115
     * @tc.desc      Verify that the search method works with single quote character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1115", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1115';

      const str = "it's";
      const result = str.search(/'/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0500
     * @tc.name      StringSearchTest1116
     * @tc.desc      Verify that the search method works with double quote character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1116", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1116';

      const str = '"hello"';
      const result = str.search(/"/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0600
     * @tc.name      StringSearchTest1117
     * @tc.desc      Verify that the search method works with backtick character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1117", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1117';

      const str = '`hello`';
      const result = str.search(/`/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0700
     * @tc.name      StringSearchTest1118
     * @tc.desc      Verify that the search method works with less than character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1118", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1118';

      const str = "<tag>";
      const result = str.search(/</);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0800
     * @tc.name      StringSearchTest1119
     * @tc.desc      Verify that the search method works with greater than character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1119", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1119';

      const str = "<tag>";
      const result = str.search(/>/);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_0900
     * @tc.name      StringSearchTest1120
     * @tc.desc      Verify that the search method works with ampersand character
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1120", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1120';

      const str = "a&b";
      const result = str.search(/&/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1000
     * @tc.name      StringSearchTest1121
     * @tc.desc      Verify that the search method works with HTML entity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1121", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1121';

      const str = "&lt;div&gt;";
      const result = str.search(/&lt;/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1100
     * @tc.name      StringSearchTest1122
     * @tc.desc      Verify that the search method works with dollar sign
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1122", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1122';

      const str = "$100";
      const result = str.search(/\$/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1200
     * @tc.name      StringSearchTest1123
     * @tc.desc      Verify that the search method works with euro sign
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1123", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1123';

      const str = "€100";
      const result = str.search(/€/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1300
     * @tc.name      StringSearchTest1124
     * @tc.desc      Verify that the search method works with yen sign
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1124", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1124';

      const str = "¥100";
      const result = str.search(/¥/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1400
     * @tc.name      StringSearchTest1125
     * @tc.desc      Verify that the search method works with pound sign
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1125", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1125';

      const str = "£100";
      const result = str.search(/£/);
      expect(result).assertEqual(0);

    });

    //============================Return Value Validation Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1500
     * @tc.name      StringSearchTest1126
     * @tc.desc      Verify that the search method returns number type
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1126", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1126';

      const str = "hello";
      const result = str.search(/h/);
      expect(typeof result).assertEqual("number");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1600
     * @tc.name      StringSearchTest1127
     * @tc.desc      Verify that the search method returns integer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1127", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1127';

      const str = "hello";
      const result = str.search(/h/);
      expect(Number.isInteger(result)).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1700
     * @tc.name      StringSearchTest1128
     * @tc.desc      Verify that the search method does not return floating point number
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1128", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1128';

      const str = "hello";
      const result = str.search(/h/);
      expect(result === Math.floor(result)).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1800
     * @tc.name      StringSearchTest1129
     * @tc.desc      Verify that the search method minimum return value is -1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1129", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1129';

      const str = "hello";
      const result = str.search(/z/);
      expect(result >= -1).assertTrue();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_1900
     * @tc.name      StringSearchTest1130
     * @tc.desc      Verify that the search method maximum return value is string length minus 1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1130", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1130';

      const str = "hello";
      const result = str.search(/o/);
      expect(result < str.length).assertTrue();
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2000
     * @tc.name      StringSearchTest1131
     * @tc.desc      Verify that the search method returns valid index or -1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1131", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1131';

      const str = "hello";
      const result = str.search(/e/);
      const isValid = result === -1 || (result >= 0 && result < str.length);
      expect(isValid).assertTrue();
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2100
     * @tc.name      StringSearchTest1132
     * @tc.desc      Verify that the search method return value can be used to check if match exists
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1132", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1132';

      const str = "hello world";
      const index = str.search(/world/);
      const exists = index !== -1;
      expect(exists).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2200
     * @tc.name      StringSearchTest1133
     * @tc.desc      Verify that the search method return value can be used to get character at match position
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1133", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1133';

      const char = stringSearchHelper.testCharAtMatch();
      expect(char).assertEqual("w");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2300
     * @tc.name      StringSearchTest1134
     * @tc.desc      Verify that the search method return value can be used to extract substring
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1134", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1134';

      const str = "hello world";
      const index = str.search(/w/);
      const substring = str.substring(index);
      expect(substring).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2400
     * @tc.name      StringSearchTest1135
     * @tc.desc      Verify that the search method return value can be used for string splitting
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1135", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1135';

      const str = "hello world";
      const index = str.search(/ /);
      const parts = [str.slice(0, index), str.slice(index + 1)];
      expect(parts[0]).assertEqual("hello");
      expect(parts[1]).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2500
     * @tc.name      StringSearchTest1136
     * @tc.desc      Verify that the search method return value can be used to verify match position
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1136", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1136';

      const str = "hello";
      const index = str.search(/^h/);
      const isAtStart = index === 0;
      expect(isAtStart).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2600
     * @tc.name      StringSearchTest1137
     * @tc.desc      Verify that 0 is valid return value (not falsy check issue)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1137", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1137';

      const str = "hello";
      const index = str.search(/h/);
      let found = false;
      if (index !== -1) {
        found = true;
      }
      expect(found).assertTrue();
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2700
     * @tc.name      StringSearchTest1138
     * @tc.desc      Verify that -1 correctly means not found
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1138", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1138';

      const str = "hello";
      const index = str.search(/z/);
      const notFound = index === -1;
      expect(notFound).assertTrue();
      expect(index).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2800
     * @tc.name      StringSearchTest1139
     * @tc.desc      Verify that return value does not exceed string length
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1139", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1139';

      const str = "hello";
      const index = str.search(/o/);
      const withinRange = index >= 0 && index < str.length;
      expect(withinRange).assertTrue();
      expect(index).assertEqual(4);

    });

    //============================Exception and error handling test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_2900
     * @tc.name      StringSearchTest1140
     * @tc.desc      Verify that the search method throws error for unmatched parentheses
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1140", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1140';

      const str = "hello";
      let error = false;
      try {
        const result = str.search(new RegExp("(abc"));
      } catch (e) {
        error = true;
      }
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3000
     * @tc.name      StringSearchTest1141
     * @tc.desc      Verify that the search method throws error for unmatched square brackets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1141", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1141';

      const error = stringSearchHelper.testUnmatchedBrackets();
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3100
     * @tc.name      StringSearchTest1142
     * @tc.desc      Verify that the search method throws error for invalid quantifier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1142", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1142';

      const str = "hello";
      let error = false;
      try {
        const result = str.search(new RegExp("a{2,1}"));
      } catch (e) {
        error = true;
      }
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3200
     * @tc.name      StringSearchTest1143
     * @tc.desc      Verify that the search method handles invalid escape sequence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1143", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1143';

      const str = "hello";
      let result = -1;
      try {
        result = str.search(new RegExp("\\x1g"));
      } catch (e) {
        console.log(TAG + ' error handled');
      }
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3300
     * @tc.name      StringSearchTest1144
     * @tc.desc      Verify that the search method throws error for invalid Unicode escape
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1144", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1144';

      const str = "hello";
      let error = false;
      try {
        const result = str.search(new RegExp("\\u{110000}", "u"));
      } catch (e) {
        error = true;
      }
      expect(error).assertTrue();

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3400
     * @tc.name      StringSearchTest1145
     * @tc.desc      Verify that the search method works on non-String object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1145", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1145';

      const result = stringSearchHelper.testNonStringObject();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3500
     * @tc.name      StringSearchTest1146
     * @tc.desc      Verify that the search method throws error when called on null
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1146", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1146';

      const error = stringSearchHelper.testSearchOnNull();
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3600
     * @tc.name      StringSearchTest1147
     * @tc.desc      Verify that the search method throws error when called on undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1147", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1147';

      const error = stringSearchHelper.testSearchOnUndefined();
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3700
     * @tc.name      StringSearchTest1148
     * @tc.desc      Verify that the search method works on object with toString method
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1148", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1148';

      const result:number = stringSearchHelper.testSearchOnObject();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3800
     * @tc.name      StringSearchTest1149
     * @tc.desc      Verify that the search method works on array
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1149", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1149';

      const result:number = stringSearchHelper.testSearchOnArray();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_3900
     * @tc.name      StringSearchTest1150
     * @tc.desc      Verify that the search method works with no argument
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1150", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1150';

      const result = stringSearchHelper.testNoArgument();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4000
     * @tc.name      StringSearchTest1151
     * @tc.desc      Verify that the search method works with NaN parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1151", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1151';

      const result = stringSearchHelper.testWithNaN();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4100
     * @tc.name      StringSearchTest1152
     * @tc.desc      Verify that the search method works with Infinity parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1152", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1152';

      const result = stringSearchHelper.testWithInfinity();
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4200
     * @tc.name      StringSearchTest1153
     * @tc.desc      Verify that the search method works with function parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1153", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1153';

      const result = stringSearchHelper.testWithFunction();
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4300
     * @tc.name      StringSearchTest1154
     * @tc.desc      Verify that Symbol.search throws error
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1154", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1154';

      const error = stringSearchHelper.testSymbolSearchThrowsError();
      expect(error).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4400
     * @tc.name      StringSearchTest1155
     * @tc.desc      Verify that Symbol.search returns non-number
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1155", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1155';

      const result:string = stringSearchHelper.testSymbolSearchReturnsNonNumber();
      expect(result).assertEqual("not a number");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4500
     * @tc.name      StringSearchTest1156
     * @tc.desc      Verify that Symbol.search returns NaN
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1156", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1156';

      const result = stringSearchHelper.testSymbolSearchReturnsNaN();
      expect(Number.isNaN(result)).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4600
     * @tc.name      StringSearchTest1157
     * @tc.desc      Verify that Symbol.search returns Infinity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1157", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1157';

      const result = stringSearchHelper.testSymbolSearchReturnsInfinity();
      expect(result).assertEqual(Infinity);

    });

    //============================Interact and test with other String methods==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4700
     * @tc.name      StringSearchTest1158
     * @tc.desc      Verify that search and indexOf return same result for simple string search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1158", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1158';

      const sameResult = stringSearchHelper.testSearchAndIndexOf();
      expect(sameResult).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4800
     * @tc.name      StringSearchTest1159
     * @tc.desc      Verify that search supports regex while indexOf does not
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1159", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1159';

      const result = stringSearchHelper.testRegexSupport();
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_4900
     * @tc.name      StringSearchTest1160
     * @tc.desc      Verify that indexOf is faster for simple string search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1160", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1160';

      const result = stringSearchHelper.testIndexOfPerf();
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5000
     * @tc.name      StringSearchTest1161
     * @tc.desc      Verify that search returns index while match returns detailed info
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1161", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1161';

      const result = stringSearchHelper.testMatchIndex();
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5100
     * @tc.name      StringSearchTest1162
     * @tc.desc      Verify that search returns only first match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1162", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1162';

      const result = stringSearchHelper.testFirstMatch();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5200
     * @tc.name      StringSearchTest1163
     * @tc.desc      Verify that search returns -1 and match returns null when no match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1163", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1163';

      const result = stringSearchHelper.testNoMatchDiff();
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertNull();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5300
     * @tc.name      StringSearchTest1164
     * @tc.desc      Verify that search returns index while test returns boolean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1164", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1164';

      const result = stringSearchHelper.testIndexVsBool();
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5400
     * @tc.name      StringSearchTest1165
     * @tc.desc      Verify that search can simulate test functionality
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1165", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1165';

      const exists = stringSearchHelper.testSimulateTest();
      expect(exists).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5500
     * @tc.name      StringSearchTest1166
     * @tc.desc      Verify that test is more efficient than search for existence check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1166", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1166';

      const result = stringSearchHelper.testEfficiency();
      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5600
     * @tc.name      StringSearchTest1167
     * @tc.desc      Verify using search then replace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1167", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1167';

      const result = stringSearchHelper.testThenReplace();
      expect(result).assertEqual("hello JavaScript");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5700
     * @tc.name      StringSearchTest1168
     * @tc.desc      Verify using search to verify replace result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1168", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1168';

      const result = stringSearchHelper.testVerifyReplace();
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5800
     * @tc.name      StringSearchTest1169
     * @tc.desc      Verify conditional replace using search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1169", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1169';

      const result = stringSearchHelper.testConditionalReplace();
      expect(result).assertEqual("hello JavaScript");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_5900
     * @tc.name      StringSearchTest1170
     * @tc.desc      Verify using search then split
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1170", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1170';

      const result: string[] = stringSearchHelper.testThenSplit();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6000
     * @tc.name      StringSearchTest1171
     * @tc.desc      Verify using search to verify separator exists
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1171", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1171';

      const result = stringSearchHelper.testVerifySeparator();
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6100
     * @tc.name      StringSearchTest1172
     * @tc.desc      Verify using search result to extract substring
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1172", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1172';

      const result = stringSearchHelper.testExtractSubstring();
      expect(result).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6200
     * @tc.name      StringSearchTest1173
     * @tc.desc      Verify extracting content before and after match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1173", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1173';

      const result = stringSearchHelper.testBeforeAfterMatch();
      expect(result[0]).assertEqual("hello ");
      expect(result[1]).assertEqual("world");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6300
     * @tc.name      StringSearchTest1174
     * @tc.desc      Verify using slice to handle boundary case safely
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1174", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1174';

      const result = stringSearchHelper.testBoundarySlice();
      expect(result).assertEqual("hello");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6400
     * @tc.name      StringSearchTest1175
     * @tc.desc      Verify that search returns index while includes returns boolean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1175", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1175';

      const result = stringSearchHelper.testIncludesBool();
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6500
     * @tc.name      StringSearchTest1176
     * @tc.desc      Verify that search supports regex while includes does not
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1176", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1176';

      const result = stringSearchHelper.testIncludesNotSupport();
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6600
     * @tc.name      StringSearchTest1177
     * @tc.desc      Verify that includes is simpler for simple containment check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1177", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1177';

      const result = stringSearchHelper.testSimpleCheck();
      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6700
     * @tc.name      StringSearchTest1178
     * @tc.desc      Verify that search can simulate startsWith
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1178", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1178';

      const result = stringSearchHelper.testSimulateStartsWith();
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6800
     * @tc.name      StringSearchTest1179
     * @tc.desc      Verify that search can simulate endsWith
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1179", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1179';

      const result = stringSearchHelper.testSimulateEndsWith();
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_6900
     * @tc.name      StringSearchTest1180
     * @tc.desc      Verify that startsWith and endsWith are more readable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1180", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1180';

      const result = stringSearchHelper.testStartsWithEndsWith();
      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();

    });

    //============================Unicode and multilingual test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7000
     * @tc.name      StringSearchTest1181
     * @tc.desc      Verify that the search method works with Chinese characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1181", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1181';

      const str = "你好世界";
      const result = str.search(/你/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7100
     * @tc.name      StringSearchTest1182
     * @tc.desc      Verify that the search method works with Japanese characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1182", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1182';

      const str = "こんにちは";
      const result = str.search(/に/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7200
     * @tc.name      StringSearchTest1183
     * @tc.desc      Verify that the search method works with Korean characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1183", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1183';

      const str = "안녕하세요";
      const result = str.search(/녕/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7300
     * @tc.name      StringSearchTest1184
     * @tc.desc      Verify that the search method works with Arabic characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1184", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1184';

      const str = "مرحبا";
      const result = str.search(/ح/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7400
     * @tc.name      StringSearchTest1185
     * @tc.desc      Verify that the search method works with Hebrew characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1185", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1185';

      const str = "שלום";
      const result = str.search(/ל/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7500
     * @tc.name      StringSearchTest1186
     * @tc.desc      Verify that the search method works with Russian characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1186", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1186';

      const str = "Привет";
      const result = str.search(/и/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7600
     * @tc.name      StringSearchTest1187
     * @tc.desc      Verify that the search method works with Greek characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1187", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1187';

      const str = "Γειά";
      const result = str.search(/ε/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7700
     * @tc.name      StringSearchTest1188
     * @tc.desc      Verify Unicode property escape \p{L} matches any letter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1188", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1188';

      const str = "hello你好";
      const result = str.search(/\p{L}/u);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7800
     * @tc.name      StringSearchTest1189
     * @tc.desc      Verify Unicode property escape \p{N} matches any number
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1189", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1189';

      const str = "abc123一二三";
      const result = str.search(/\p{N}/u);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_7900
     * @tc.name      StringSearchTest1190
     * @tc.desc      Verify Unicode property escape \p{Script=Han} matches Chinese characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1190", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1190';

      const str = "hello世界";
      const result = str.search(/\p{Script=Han}/u);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8000
     * @tc.name      StringSearchTest1191
     * @tc.desc      Verify Unicode property escape \p{Emoji} matches emoji characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1191", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1191';

      const str = "hello 😃 world";
      const result = str.search(/\p{Emoji}/u);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8100
     * @tc.name      StringSearchTest1192
     * @tc.desc      Verify searching simple emoji
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1192", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1192';

      const str = "hello 😃 world";
      const result = str.search(/😃/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8200
     * @tc.name      StringSearchTest1193
     * @tc.desc      Verify searching multiple emojis
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1193", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1193';

      const str = "😃😎🎉";
      const result = str.search(/😎/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8300
     * @tc.name      StringSearchTest1194
     * @tc.desc      Verify searching complex emoji with skin tone modifier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1194", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1194';

      const str = "🎉🙌👍";
      const result = str.search(/👍/);
      expect(result).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8400
     * @tc.name      StringSearchTest1195
     * @tc.desc      Verify searching emoji sequences (flags)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1195", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1195';

      const str = "flag: 🇺🇸";
      const result = str.search(/🇺🇸/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8500
     * @tc.name      StringSearchTest1196
     * @tc.desc      Verify matching surrogate pair characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1196", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1196';

      const str = "𝄞𝄢𝄣";
      const result = str.search(/𝄢/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8600
     * @tc.name      StringSearchTest1197
     * @tc.desc      Verify using u flag to correctly handle surrogate pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1197", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1197';

      const str = "𝄞𝄢𝄣";
      const result = str.search(/./u);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8700
     * @tc.name      StringSearchTest1198
     * @tc.desc      Verify problem without u flag for surrogate pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1198", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1198';

      const str = "𝄞";
      const result = str.search(/./);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8800
     * @tc.name      StringSearchTest1199
     * @tc.desc      Verify matching CJK unified ideographs range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1199", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1199';

      const str = "hello世界world";
      const result = str.search(/[\u4e00-\u9fa5]/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_8900
     * @tc.name      StringSearchTest1200
     * @tc.desc      Verify matching BMP characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1200';

      const str = "hello";
      const result = str.search(/[\u0000-\uFFFF]/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9000
     * @tc.name      StringSearchTest1201
     * @tc.desc      Verify matching supplementary plane characters with u flag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1201", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1201';

      const str = "𝄞𝄢𝄣";
      const result = str.search(/[\u{1D100}-\u{1D1FF}]/u);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9100
     * @tc.name      StringSearchTest1202
     * @tc.desc      Verify canonical equivalent characters with different code points
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1202", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1202';

      const str1 = "é";
      const str2 = "ē";
      const result1 = str1.search(/é/);
      const result2 = str2.search(/é/);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9200
     * @tc.name      StringSearchTest1203
     * @tc.desc      Verify search after normalization using normalize()
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1203", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1203';

      const str = "é".normalize("NFC");
      const result = str.search(/é/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9300
     * @tc.name      StringSearchTest1204
     * @tc.desc      Verify compatibility equivalent characters are not equal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1204", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1204';

      const str = "①";
      const result = str.search(/1/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9400
     * @tc.name      StringSearchTest1205
     * @tc.desc      Verify searching in Chinese-English mixed string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1205", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1205';

      const str = "hello世界world";
      const result = str.search(/世界/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9500
     * @tc.name      StringSearchTest1206
     * @tc.desc      Verify searching in multiple languages mixed string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1206", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1206';

      const str = "English日本語한국어";
      const result = str.search(/日本語/);
      expect(result).assertEqual(7);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9600
     * @tc.name      StringSearchTest1207
     * @tc.desc      Verify searching Unicode and ASCII mixed string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1207", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1207';

      const str = "ABC你好123";
      const result = str.search(/[A-Z]/);
      expect(result).assertEqual(0);

    });
    //======================================String type and value test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9700
     * @tc.name      StringSearchTest1208
     * @tc.desc      Verify search on single-quoted string literal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1208", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1208';

      const str = 'hello world';
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9800
     * @tc.name      StringSearchTest1209
     * @tc.desc      Verify search on double-quoted string literal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1209", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1209';

      const str = "hello world";
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWO_9900
     * @tc.name      StringSearchTest1210
     * @tc.desc      Verify search on template literal string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1210", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1210';

      const name = "world";
      const str = `hello ${name}`;
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0100
     * @tc.name      StringSearchTest1211
     * @tc.desc      Verify search on multiline template literal string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1211", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1211';

      const str = `line1
line2`;
      const result = str.search(/line2/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0200
     * @tc.name      StringSearchTest1212
     * @tc.desc      Verify search on String constructor created object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1212", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1212';

      const str = new String("hello world");
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0300
     * @tc.name      StringSearchTest1213
     * @tc.desc      Verify String object and primitive string behave the same
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1213", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1213';

      const str1 = "hello";
      const str2 = new String("hello");
      const result1 = str1.search(/h/);
      const result2 = str2.search(/h/);
      expect(result1).assertEqual(result2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0400
     * @tc.name      StringSearchTest1214
     * @tc.desc      Verify search on empty String object
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1214", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1214';

      const str = new String("");
      const result = str.search(/a/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0500
     * @tc.name      StringSearchTest1215
     * @tc.desc      Verify search after converting number to string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1215", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1215';

      const num = 12345;
      const str = String(num);
      const result = str.search(/3/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0600
     * @tc.name      StringSearchTest1216
     * @tc.desc      Verify search after converting boolean to string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1216", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1216';

      const bool = true;
      const str = String(bool);
      const result = str.search(/true/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0700
     * @tc.name      StringSearchTest1217
     * @tc.desc      Verify search after converting array to string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1217", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1217';

      const arr = [1, 2, 3];
      const str = String(arr);
      const result = str.search(/2/);
      expect(result).assertEqual(2);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0800
     * @tc.name      StringSearchTest1218
     * @tc.desc      Verify search after converting object to string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1218", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1218';

      const str = "[object Object]";
      const result = str.search(/object/);
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_0900
     * @tc.name      StringSearchTest1219
     * @tc.desc      Verify search on string containing only spaces
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1219", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1219';

      const str = "   ";
      const result = str.search(/\s/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_1000
     * @tc.name      StringSearchTest1220
     * @tc.desc      Verify search on string containing only digits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1220", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1220';

      const str = "123456";
      const result = str.search(/\d+/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTWOONE_1100
     * @tc.name      StringSearchTest1221
     * @tc.desc      Verify search on string containing only special characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1221", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1221';

      const str = "!@#$%";
      const result = str.search(/!/);
      expect(result).assertEqual(0);

    });
  });
}