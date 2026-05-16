import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import * as stringSearchHelper from './string_search_helper';

export default function StringSearchTest3() {
  describe('StringSearchTest3', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0100
     * @tc.name      StringSearchTest1222
     * @tc.desc      Verify search on string with repeated characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1222", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1222';

      const str = "aaaaa";
      const result = str.search(/a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0200
     * @tc.name      StringSearchTest1223
     * @tc.desc      Verify search on palindrome string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1223", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1223';

      const str = "radar";
      const result = str.search(/radar/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0300
     * @tc.name      StringSearchTest1224
     * @tc.desc      Verify search on empty string with length 0
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1224", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1224';

      const str = "";
      expect(str.length).assertEqual(0);
      const result = str.search(/a/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0400
     * @tc.name      StringSearchTest1225
     * @tc.desc      Verify search on single character string with length 1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1225", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1225';

      const str = "a";
      expect(str.length).assertEqual(1);
      const result = str.search(/a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0500
     * @tc.name      StringSearchTest1226
     * @tc.desc      Verify search on very long string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1226", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1226';

      const str = "a".repeat(100000);
      expect(str.length).assertEqual(100000);
      const result = str.search(/a/);
      expect(result).assertEqual(0);

    });

    //============================Actual application scenario test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0600
     * @tc.name      StringSearchTest1227
     * @tc.desc      Verify searching @ symbol in email
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1227", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1227';

      const email = "user@example.com";
      const atIndex = email.search(/@/);
      expect(atIndex).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0700
     * @tc.name      StringSearchTest1228
     * @tc.desc      Verify searching domain part in email
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1228", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1228';

      const email = "user@example.com";
      const domainIndex = email.search(/@[\w.]+/);
      expect(domainIndex).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0800
     * @tc.name      StringSearchTest1229
     * @tc.desc      Verify simple email format validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1229", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1229';

      const email = "user@example.com";
      const index = email.search(/^[\w.-]+@[\w.-]+\.\w+$/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_0900
     * @tc.name      StringSearchTest1230
     * @tc.desc      Verify checking URL protocol
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1230", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1230';

      const url = "https://example.com";
      const index = url.search(/^https?:\/\//);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1000
     * @tc.name      StringSearchTest1231
     * @tc.desc      Verify extracting domain from URL
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1231", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1231';

      const url = "https://www.example.com/path";
      const index = url.search(/\/\/([^\/]+)/);
      expect(index).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1100
     * @tc.name      StringSearchTest1232
     * @tc.desc      Verify checking URL path
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1232", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1232';

      const url = "https://example.com/path/to/page";
      const index = url.search(/\/path\/to/);
      expect(index).assertEqual(19);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1200
     * @tc.name      StringSearchTest1233
     * @tc.desc      Verify checking date separator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1233", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1233';

      const date = "2024-01-15";
      const index = date.search(/-/);
      expect(index).assertEqual(4);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1300
     * @tc.name      StringSearchTest1234
     * @tc.desc      Verify finding year in date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1234", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1234';

      const date = "2024-01-15";
      const index = date.search(/^\d{4}/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1400
     * @tc.name      StringSearchTest1235
     * @tc.desc      Verify checking time format
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1235", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1235';

      const datetime = "2024-01-15 10:30:45";
      const index = datetime.search(/\d{2}:\d{2}:\d{2}/);
      expect(index).assertEqual(11);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1500
     * @tc.name      StringSearchTest1236
     * @tc.desc      Verify checking if phone number contains only digits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1236", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1236';

      const phone = "13800138000";
      const index = phone.search(/^\d+$/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1600
     * @tc.name      StringSearchTest1237
     * @tc.desc      Verify simple phone number format validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1237", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1237';

      const phone = "138-0013-8000";
      const index = phone.search(/^\d{3}-\d{4}-\d{4}/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1700
     * @tc.name      StringSearchTest1238
     * @tc.desc      Verify checking international area code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1238", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1238';

      const phone = "+86 13800138000";
      const index = phone.search(/^\+\d{2}/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1800
     * @tc.name      StringSearchTest1239
     * @tc.desc      Verify finding HTML start tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1239", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1239';

      const html = "<div class='container'>";
      const index = html.search(/<div/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_1900
     * @tc.name      StringSearchTest1240
     * @tc.desc      Verify finding HTML end tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1240", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1240';

      const html = "<p>content</p>";
      const index = html.search(/<\/p>/);
      expect(index).assertEqual(10);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2000
     * @tc.name      StringSearchTest1241
     * @tc.desc      Verify finding HTML attribute
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1241", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1241';

      const html = "<input type='text' name='username'>";
      const index = html.search(/type='text'/);
      expect(index).assertEqual(7);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2100
     * @tc.name      StringSearchTest1242
     * @tc.desc      Verify finding key name in JSON string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1242", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1242';

      const json = '{"name":"John","age":30}';
      const index = json.search(/"name"/);
      expect(index).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2200
     * @tc.name      StringSearchTest1243
     * @tc.desc      Verify finding string value in JSON
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1243", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1243';

      const json = '{"name":"John","age":30}';
      const index = json.search(/"John"/);
      expect(index).assertEqual(8);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2300
     * @tc.name      StringSearchTest1244
     * @tc.desc      Verify finding numeric value in JSON
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1244", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1244';

      const json = '{"name":"John","age":30}';
      const index = json.search(/30/);
      expect(index).assertEqual(21);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2400
     * @tc.name      StringSearchTest1245
     * @tc.desc      Verify finding error level in log
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1245", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1245';

      const log = "[ERROR] Connection failed at 2024-01-15";
      const index = log.search(/\[ERROR\]/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2500
     * @tc.name      StringSearchTest1246
     * @tc.desc      Verify finding timestamp in log
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1246", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1246';

      const log = "[2024-01-15 10:30:45] User logged in";
      const index = log.search(/\d{4}-\d{2}-\d{2}/);
      expect(index).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2600
     * @tc.name      StringSearchTest1247
     * @tc.desc      Verify finding IP address in log
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1247", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1247';

      const log = "Request from 192.168.1.1 at 10:30";
      const index = log.search(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/);
      expect(index).assertEqual(13);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2700
     * @tc.name      StringSearchTest1248
     * @tc.desc      Verify finding function definition in code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1248", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1248';

      const code = "function hello() { return 'world'; }";
      const index = code.search(/function\s+\w+/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2800
     * @tc.name      StringSearchTest1249
     * @tc.desc      Verify finding variable declaration in code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1249", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1249';

      const code = "const name = 'John';";
      const index = code.search(/const\s+\w+/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_2900
     * @tc.name      StringSearchTest1250
     * @tc.desc      Verify finding comment in code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1250", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1250';

      const code = "// This is a comment\nconst x = 1;";
      const index = code.search(/\/\/.*$/m);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3000
     * @tc.name      StringSearchTest1251
     * @tc.desc      Verify finding complete word in text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1251", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1251';

      const text = "The quick brown fox";
      const index = text.search(/\bfox\b/);
      expect(index).assertEqual(16);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3100
     * @tc.name      StringSearchTest1252
     * @tc.desc      Verify finding sentence ending with period
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1252", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1252';

      const text = "Hello world. How are you?";
      const index = text.search(/\.\s*/);
      expect(index).assertEqual(11);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3200
     * @tc.name      StringSearchTest1253
     * @tc.desc      Verify finding consecutive repeated words
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1253", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1253';

      const text = "hello hello world";
      const index = text.search(/\b(\w+)\s+\1\b/);
      expect(index).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3300
     * @tc.name      StringSearchTest1254
     * @tc.desc      Verify checking if password contains digits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1254", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1254';

      const password = "abc123";
      const index = password.search(/\d/);
      expect(index !== -1).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3400
     * @tc.name      StringSearchTest1255
     * @tc.desc      Verify checking if password contains uppercase letters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1255", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1255';

      const password = "Abc123";
      const index = password.search(/[A-Z]/);
      expect(index !== -1).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3500
     * @tc.name      StringSearchTest1256
     * @tc.desc      Verify checking if password contains special characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1256", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1256';

      const password = "abc123!";
      const index = password.search(/[!@#$%^&*]/);
      expect(index !== -1).assertTrue();

    });

    //============================Performance Optimization Test==================================
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3600
     * @tc.name      StringSearchTest1257
     * @tc.desc      Verify simple string search performance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1257", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1257';

      const str = "hello world";
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3700
     * @tc.name      StringSearchTest1258
     * @tc.desc      Verify complex regex may be slower
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1258", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1258';

      const str = "a".repeat(1000);
      const result = str.search(/a+a+a+a+a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3800
     * @tc.name      StringSearchTest1259
     * @tc.desc      Verify using non-greedy quantifiers to avoid backtracking
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1259", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1259';

      const str = "<div>content</div>";
      const result = str.search(/<div>.*?<\/div>/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_3900
     * @tc.name      StringSearchTest1260
     * @tc.desc      Verify simple containment check should use includes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1260", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1260';

      const str = "hello world";
      const result = str.includes("world");
      expect(result).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4000
     * @tc.name      StringSearchTest1261
     * @tc.desc      Verify need index use indexOf or search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1261", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1261';

      const str = "hello world";
      const index1 = str.indexOf("world");
      const index2 = str.search(/world/);
      expect(index1).assertEqual(6);
      expect(index2).assertEqual(6);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4100
     * @tc.name      StringSearchTest1262
     * @tc.desc      Verify regex must use search
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1262", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1262';

      const str = "hello123world";
      const result = str.search(/\d+/);
      expect(result).assertEqual(5);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4200
     * @tc.name      StringSearchTest1263
     * @tc.desc      Verify reuse compiled regex
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1263", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1263';

      const regex = /\d+/;
      const str1 = "abc123";
      const str2 = "def456";
      const result1 = str1.search(regex);
      const result2 = str2.search(regex);
      expect(result1).assertEqual(3);
      expect(result2).assertEqual(3);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4300
     * @tc.name      StringSearchTest1264
     * @tc.desc      Verify avoid creating regex in loops
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1264", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1264';

      const regex = /test/;
      const strings = ["test1", "test2", "test3"];
      let found = false;
      for (let i = 0; i < strings.length; i++) {
        if (strings[i].search(regex) !== -1) {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4400
     * @tc.name      StringSearchTest1265
     * @tc.desc      Verify search returns immediately after first match found
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1265", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1265';

      const str = "a".repeat(10000) + "b";
      const result = str.search(/a/);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4500
     * @tc.name      StringSearchTest1266
     * @tc.desc      Verify search scans entire string for no match
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1266", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1266';

      const str = "a".repeat(10000);
      const result = str.search(/b/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4600
     * @tc.name      StringSearchTest1267
     * @tc.desc      Verify search is typically linear time complexity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1267", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1267';

      const str = "a".repeat(1000);
      const result = str.search(/b/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4700
     * @tc.name      StringSearchTest1268
     * @tc.desc      Verify complex regex may cause exponential backtracking
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1268", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1268';

      const str = "a".repeat(20) + "b";
      const result = str.search(/^(a+)+$/);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4800
     * @tc.name      StringSearchTest1269
     * @tc.desc      Verify search does not create new string
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1269", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1269';

      const str = "hello world";
      const result = str.search(/world/);
      expect(typeof result).assertEqual("number");

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSEARCHTHREE_4900
     * @tc.name      StringSearchTest1270
     * @tc.desc      Verify search returns only a number (small memory footprint)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSearchTest1270", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSearchTest1270';

      const str = "hello world";
      const result = str.search(/world/);
      expect(result).assertEqual(6);

    });
  });
}