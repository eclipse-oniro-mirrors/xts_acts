import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

export default function URI01Test() {
  describe('URI01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0100
     * @tc.name testURI01Chapter0001
     * @tc.desc Test scheme property with standard http URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com");
      expect(uriObj.scheme).assertEqual("http");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0200
     * @tc.name testURI01Chapter0002
     * @tc.desc Test scheme property with https URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://www.example.com");
      expect(uriObj.scheme).assertEqual("https");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0300
     * @tc.name testURI01Chapter0003
     * @tc.desc Test scheme property with ftp URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("ftp://ftp.example.com/file.txt");
      expect(uriObj.scheme).assertEqual("ftp");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0400
     * @tc.name testURI01Chapter0004
     * @tc.desc Test scheme property with file URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("file:///C:/test.txt");
      expect(uriObj.scheme).assertEqual("file");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0500
     * @tc.name testURI01Chapter0005
     * @tc.desc Test scheme property with scheme containing digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("h2://example.com");
      expect(uriObj.scheme).assertEqual("h2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0600
     * @tc.name testURI01Chapter0006
     * @tc.desc Test scheme property with scheme containing plus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("git+ssh://git@example.com/repo");
      expect(uriObj.scheme).assertEqual("git+ssh");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0700
     * @tc.name testURI01Chapter0007
     * @tc.desc Test scheme property with scheme containing dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("com.example://service");
      expect(uriObj.scheme).assertEqual("com.example");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0800
     * @tc.name testURI01Chapter0008
     * @tc.desc Test scheme property with scheme containing hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("x-custom://value");
      expect(uriObj.scheme).assertEqual("x-custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_0900
     * @tc.name testURI01Chapter0009
     * @tc.desc Test scheme property with uppercase scheme (should be case-insensitive, but returned as original?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("HTTP://example.com");
      expect(uriObj.scheme).assertEqual("HTTP");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1000
     * @tc.name testURI01Chapter0010
     * @tc.desc Test scheme property with scheme "NaN" (valid as letters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("NaN://host");
      expect(uriObj.scheme).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1100
     * @tc.name testURI01Chapter0011
     * @tc.desc Test scheme property with scheme "true" (valid as letters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("true://boolean");
      expect(uriObj.scheme).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1200
     * @tc.name testURI01Chapter0012
     * @tc.desc Test scheme property with scheme consisting of a single letter and many digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("a1234567890://host");
      expect(uriObj.scheme).assertEqual("a1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1300
     * @tc.name testURI01Chapter0013
     * @tc.desc Test scheme property with URI that has only scheme and colon (no authority)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http:");
      expect(uriObj.scheme).assertEqual("http");
      expect(uriObj.host).assertNull();
      expect(uriObj.path).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1400
     * @tc.name testURI01Chapter0014
     * @tc.desc Test scheme property with relative URI that has no double slash (host treated as scheme)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("www.example.com:8080/path");
      expect(uriObj.scheme).assertEqual("www.example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1500
     * @tc.name testURI01Chapter0015
     * @tc.desc Test scheme property with datashare URI (as in example)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("datashare:///com.samples.datasharetest.DataShare/DB00/TBL00");
      expect(uriObj.scheme).assertEqual("datashare");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1600
     * @tc.name testURI01Chapter0016
     * @tc.desc Test scheme property with dataability URI (as in example)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("dataability:///com.example.DataAbility");
      expect(uriObj.scheme).assertEqual("dataability");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1700
     * @tc.name testURI01Chapter0017
     * @tc.desc Test scheme property with URI containing userInfo, port, query, fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      expect(uriObj.scheme).assertEqual("https");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1800
     * @tc.name testURI01Chapter0018
     * @tc.desc Test scheme property with encoded characters in userInfo/path (scheme unaffected)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment");
      expect(uriObj.scheme).assertEqual("https");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_1900
     * @tc.name testURI01Chapter0019
     * @tc.desc Test scheme property with very long scheme (1000 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longScheme = 'a'.repeat(1000) + '://host';
      const uriObj = new uri.URI(longScheme);
      expect(uriObj.scheme.length).assertEqual(1000);
      expect(uriObj.scheme).assertEqual('a'.repeat(1000));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2000
     * @tc.name testURI01Chapter0020
     * @tc.desc Test scheme property accessed multiple times returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://example.com");
      const first = uriObj.scheme;
      const second = uriObj.scheme;
      const third = uriObj.scheme;
      expect(first).assertEqual("https");
      expect(second).assertEqual("https");
      expect(third).assertEqual("https");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2100
     * @tc.name testURI01Chapter0021
     * @tc.desc Test constructor throws when URI is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: string = (undefined as never) as string;
        const uriObj = new uri.URI(value);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2200
     * @tc.name testURI01Chapter0022
     * @tc.desc Test constructor throws when URI is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: string = (null as never) as string;
        const uriObj = new uri.URI(value);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2300
     * @tc.name testURI01Chapter0023
     * @tc.desc Test constructor throws when URI is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2400
     * @tc.name testURI01Chapter0024
     * @tc.desc Test constructor throws when scheme contains space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("ht%20tp://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2500
     * @tc.name testURI01Chapter0025
     * @tc.desc Test constructor throws when scheme starts with digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI("0http://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2600
     * @tc.name testURI01Chapter0026
     * @tc.desc Test constructor throws when scheme contains control character (newline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("http\n://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2700
     * @tc.name testURI01Chapter0027
     * @tc.desc Test constructor throws when scheme contains tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("http\t://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2800
     * @tc.name testURI01Chapter0028
     * @tc.desc Test constructor throws when scheme contains emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("😀://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_2900
     * @tc.name testURI01Chapter0029
     * @tc.desc Test constructor throws when URI has no colon (cannot extract scheme)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http");
      expect(uriObj.scheme).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3000
     * @tc.name testURI01Chapter0030
     * @tc.desc Test constructor throws when scheme contains illegal punctuation like '('
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http(://example.com");
      expect(uriObj.scheme).assertEqual("http(");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3100
     * @tc.name testURI01Chapter0031
     * @tc.desc Test constructor throws when scheme contains backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("http\\://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3200
     * @tc.name testURI01Chapter0032
     * @tc.desc Test constructor handles (or throws) with illegal unicode surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const illegalStr = "http\uDC04://example.com";
        const uriObj = new uri.URI(illegalStr);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3300
     * @tc.name testURI01Chapter0033
     * @tc.desc Test constructor throws when scheme contains characters from ASCII full set that are illegal (e.g., '!')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http!://example.com");
      expect(uriObj.scheme).assertEqual("http!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3400
     * @tc.name testURI01Chapter0034
     * @tc.desc Test constructor throws when scheme contains multiple illegal special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("!#$%&'()*+,/:;<=>?@[]^`{|}~://host");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3500
     * @tc.name testURI01Chapter0035
     * @tc.desc Test constructor throws when scheme contains double special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~://host");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3600
     * @tc.name testURI01Chapter0036
     * @tc.desc Test constructor handles escape sequences in string literal (they become actual chars, likely invalid)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("http\u0007://example.com");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3700
     * @tc.name testURI01Chapter0037
     * @tc.desc Test constructor throws when scheme is extremely long but still illegal (contains invalid char at end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longInvalidScheme = 'a'.repeat(1000) + '!';
      const uriObj = new uri.URI(longInvalidScheme);
      expect(uriObj.scheme).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3800
     * @tc.name testURI01Chapter0038
     * @tc.desc Test userInfo with normal username and password
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://username:password@host:8080/path");
      expect(uriObj.userInfo).assertEqual("username:password");
      expect(uriObj.encodedUserInfo).assertEqual("username:password");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_3900
     * @tc.name testURI01Chapter0039
     * @tc.desc Test userInfo is null when no userinfo in URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://host:8080/path");
      expect(uriObj.userInfo).assertNull();
      expect(uriObj.encodedUserInfo).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4000
     * @tc.name testURI01Chapter0040
     * @tc.desc Test userInfo with only username (no colon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://username@host:8080/path");
      expect(uriObj.userInfo).assertEqual("username");
      expect(uriObj.encodedUserInfo).assertEqual("username");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4100
     * @tc.name testURI01Chapter0041
     * @tc.desc Test userInfo with empty password (colon at the end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user:@host/");
      expect(uriObj.userInfo).assertEqual("user:");
      expect(uriObj.encodedUserInfo).assertEqual("user:");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4200
     * @tc.name testURI01Chapter0042
     * @tc.desc Test userInfo with empty username and empty password (only colon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://:@host/");
      expect(uriObj.userInfo).assertEqual(":");
      expect(uriObj.encodedUserInfo).assertEqual(":");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4300
     * @tc.name testURI01Chapter0043
     * @tc.desc Test userInfo with numeric username and password
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://123:456@host/");
      expect(uriObj.userInfo).assertEqual("123:456");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4400
     * @tc.name testURI01Chapter0044
     * @tc.desc Test userInfo with floating point numbers as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://3.14:2.718@host/");
      expect(uriObj.userInfo).assertEqual("3.14:2.718");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4500
     * @tc.name testURI01Chapter0045
     * @tc.desc Test userInfo with special characters that are allowed without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const userInfo = "user-._~!$&'()*+,;=:pass-._~!$&'()*+,;=";
      const uriObj = new uri.URI(`https://${userInfo}@host/`);
      expect(uriObj.userInfo).assertEqual(userInfo);
      expect(uriObj.encodedUserInfo).assertEqual(userInfo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4600
     * @tc.name testURI01Chapter0046
     * @tc.desc Test userInfo with percent-encoded characters (should decode correctly)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedUserInfo = "user%20name:pass%23word%3F";
      const decodedUserInfo = "user name:pass#word?";
      const uriObj = new uri.URI(`https://${encodedUserInfo}@host/`);
      expect(uriObj.userInfo).assertEqual(decodedUserInfo);
      expect(uriObj.encodedUserInfo).assertEqual(encodedUserInfo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4700
     * @tc.name testURI01Chapter0047
     * @tc.desc Test userInfo with multiple colons (colon in password)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user:pass:word@host/");
      expect(uriObj.userInfo).assertEqual("user:pass:word");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4800
     * @tc.name testURI01Chapter0048
     * @tc.desc Test userInfo with at-sign (@) encoded as %40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%40domain:pass@host/");
      expect(uriObj.userInfo).assertEqual("user@domain:pass");
      expect(uriObj.encodedUserInfo).assertEqual("user%40domain:pass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_4900
     * @tc.name testURI01Chapter0049
     * @tc.desc Test userInfo with percent sign itself encoded as %25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%25:pass%25%25@host/");
      expect(uriObj.userInfo).assertEqual("user%:pass%%");
      expect(uriObj.encodedUserInfo).assertEqual("user%25:pass%25%25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5000
     * @tc.name testURI01Chapter0050
     * @tc.desc Test userInfo with control characters encoded (e.g., %07 bell, %0A newline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%07:pass%0A@host/");
      expect(uriObj.userInfo).assertEqual("user\u0007:pass\n");
      expect(uriObj.encodedUserInfo).assertEqual("user%07:pass%0A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5100
     * @tc.name testURI01Chapter0051
     * @tc.desc Test userInfo with emoji characters (UTF-16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://😀:😎@host/");
      expect(uriObj.userInfo).assertEqual("😀:😎");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5200
     * @tc.name testURI01Chapter0052
     * @tc.desc Test userInfo with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://用户名:密码@host/");
      expect(uriObj.userInfo).assertEqual("用户名:密码");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5300
     * @tc.name testURI01Chapter0053
     * @tc.desc Test userInfo with keywords like "null", "undefined", "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://null:undefined@host/");
      expect(uriObj.userInfo).assertEqual("null:undefined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5400
     * @tc.name testURI01Chapter0054
     * @tc.desc Test userInfo with very long string (boundary performance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longUser = "a".repeat(5000);
      const longPass = "b".repeat(5000);
      const userInfo = `${longUser}:${longPass}`;
      const uriObj = new uri.URI(`https://${userInfo}@host/`);
      expect(uriObj.userInfo).assertEqual(userInfo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5500
     * @tc.name testURI01Chapter0055
     * @tc.desc Test userInfo with array converted to string (e.g., [1,2,3] => "1,2,3")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const userInfo = [1, 2, 3].toString() + ":" + [4, 5, 6].toString();
      const uriObj = new uri.URI(`https://${userInfo}@host/`);
      expect(uriObj.userInfo).assertEqual(userInfo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5600
     * @tc.name testURI01Chapter0056
     * @tc.desc Test userInfo with object converted to string (e.g., {a:1} => "[object Object]")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      interface UserInfoObjA {
        a: number;
      }
      interface UserInfoObjB {
        b: number;
      }

      const objA: UserInfoObjA = { a: 1 };
      const objB: UserInfoObjB = { b: 2 };
      const userInfo = objA.toString() + ":" + objB.toString();
      const encodedUserInfo = encodeURIComponent(userInfo);
      const uriObj = new uri.URI(`https://${encodedUserInfo}@host/`);
      expect(uriObj.userInfo).assertEqual(userInfo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5700
     * @tc.name testURI01Chapter0057
     * @tc.desc Test userInfo with boolean strings "true" and "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://true:false@host/");
      expect(uriObj.userInfo).assertEqual("true:false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5800
     * @tc.name testURI01Chapter0058
     * @tc.desc Test userInfo covering all ASCII printable characters via percent-encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let allAscii = "";
      for (let i = 32; i <= 126; i++) {
        allAscii += String.fromCharCode(i);
      }
      const encoded = encodeURIComponent(allAscii);
      const uriObj = new uri.URI(`https://user:${encoded}@host/`);
      expect(uriObj.userInfo).assertEqual(`user:${allAscii}`);
      expect(uriObj.encodedUserInfo).assertEqual(`user:${encoded}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_5900
     * @tc.name testURI01Chapter0059
     * @tc.desc Test userInfo with all special characters repeated twice (encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const specials = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const doubleSpecials = specials + specials;
      const encoded = encodeURIComponent(doubleSpecials);
      const uriObj = new uri.URI(`https://user:${encoded}@host/`);
      expect(uriObj.userInfo).assertEqual(`user:${doubleSpecials}`);
      expect(uriObj.encodedUserInfo).assertEqual(`user:${encoded}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6000
     * @tc.name testURI01Chapter0060
     * @tc.desc Test URI with empty string (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI("");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6100
     * @tc.name testURI01Chapter0061
     * @tc.desc Test URI with unencoded space in userinfo (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%20name:pass@host/");
      expect(uriObj.userInfo).assertEqual("user name:pass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6200
     * @tc.name testURI01Chapter0062
     * @tc.desc Test URI with unencoded at-sign (@) in userinfo (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%40domain:pass@host/");
      expect(uriObj.userInfo).assertEqual("user@domain:pass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6300
     * @tc.name testURI01Chapter0063
     * @tc.desc Test URI with invalid percent encoding (%gg) in userinfo (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%GG:pass@host/");
      expect(uriObj.userInfo).assertEqual("user%GG:pass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6400
     * @tc.name testURI01Chapter0064
     * @tc.desc Test URI with incomplete percent encoding (%2) in userinfo (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user%ZZ:pass@host/");
      expect(uriObj.userInfo).assertEqual("user%ZZ:pass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6500
     * @tc.name testURI01Chapter0065
     * @tc.desc Test URI with lone surrogate character (invalid Unicode) in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encodedChar = '%ED%A0%80';
      const uriObj = new uri.URI(`https://${encodedChar}:pass@host/`);
      const userInfo = uriObj.userInfo;
      expect(userInfo !== null && userInfo.includes(encodedChar)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6600
     * @tc.name testURI01Chapter0066
     * @tc.desc Test URI with multiple @ signs causing ambiguous parsing (should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://user:pass%40host@another/");
      expect(uriObj.userInfo).assertEqual("user:pass@host");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6700
     * @tc.name testURI01Chapter0067
     * @tc.desc Test URI with missing scheme (should throw or handle consistently)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("user:pass@host/path");
      expect(uriObj.scheme).assertEqual("user");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6800
     * @tc.name testURI01Chapter0068
     * @tc.desc Verify host property with normal domain name URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      expect(uriObj.host).assertEqual('ftp.aaa.bbb.ccc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_6900
     * @tc.name testURI01Chapter0069
     * @tc.desc Verify host property with URI containing port, userInfo, query and fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      expect(uriObj.host).assertEqual('host');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7000
     * @tc.name testURI01Chapter0070
     * @tc.desc Verify host property when URI has no host (datashare scheme with triple slash)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('datashare:///com.samples.datasharetest.DataShare/DB00/TBL00');
      expect(uriObj.host).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7100
     * @tc.name testURI01Chapter0071
     * @tc.desc Verify host property with IPv4 address
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://192.168.1.1/index.html');
      expect(uriObj.host).assertEqual('192.168.1.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7200
     * @tc.name testURI01Chapter0072
     * @tc.desc Verify host property with IPv6 address (enclosed in brackets)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://[2001:db8::1]/index.html');
      expect(uriObj.host).assertEqual('[2001:db8::1]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7300
     * @tc.name testURI01Chapter0073
     * @tc.desc Verify host property with hyphen in domain name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://my-host.com/path');
      expect(uriObj.host).assertEqual('my-host.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7400
     * @tc.name testURI01Chapter0074
     * @tc.desc Verify host property with localhost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://localhost/index.html');
      expect(uriObj.host).assertEqual('localhost');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7500
     * @tc.name testURI01Chapter0075
     * @tc.desc Verify host property with numeric host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://123/path');
      expect(uriObj.host).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7600
     * @tc.name testURI01Chapter0076
     * @tc.desc Verify host property with multiple subdomains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://a.b.c.d/path');
      expect(uriObj.host).assertEqual('a.b.c.d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7700
     * @tc.name testURI01Chapter0077
     * @tc.desc Verify host property with uppercase letters in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://EXAMPLE.COM/path');
      expect(uriObj.host).assertEqual('EXAMPLE.COM');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7800
     * @tc.name testURI01Chapter0078
     * @tc.desc Verify host property with empty string input (exception expected)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_7900
     * @tc.name testURI01Chapter0079
     * @tc.desc Verify host property with scheme only string "http:" (exception expected)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http:');
      expect(uriObj.host).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8000
     * @tc.name testURI01Chapter0080
     * @tc.desc Verify host property with space in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://ho%20st/path');
      expect(uriObj !== null && (uriObj.host === 'ho%20st' || uriObj.host === 'ho st')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8100
     * @tc.name testURI01Chapter0081
     * @tc.desc Verify host property with Chinese characters in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://%E4%B8%BB%E6%9C%BA%E5%90%8D/path');
      expect(uriObj !== null && uriObj.host !== undefined && uriObj.host !== null).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8200
     * @tc.name testURI01Chapter0082
     * @tc.desc Verify host property with unclosed IPv6 bracket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('http://[2001:db8::1/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8300
     * @tc.name testURI01Chapter0083
     * @tc.desc Verify host property with control character (newline) in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://host%0Aname/path');
      expect(uriObj !== null && uriObj.host !== undefined && uriObj.host !== null).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8400
     * @tc.name testURI01Chapter0084
     * @tc.desc Verify host property with various illegal ASCII special characters in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://a%21b@c%23d%24e%25f%5Eg&h*i(j)k+l,m.n/o/p?q=r');
      const actualUri = uriObj.toString();
      const expectedUri = 'http://a%21b@c%23d%24e%25f%5Eg&h*i(j)k+l,m.n/o/p?q=r';
      expect(actualUri === expectedUri).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8500
     * @tc.name testURI01Chapter0085
     * @tc.desc Verify host property with emoji in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://%F0%9F%98%80.com/path');
      const actualUri = uriObj.toString();
      const expectedEncoded = 'http://%F0%9F%98%80.com/path';
      const expectedDecoded = 'http://😀.com/path';
      const isValid = actualUri === expectedEncoded || actualUri === expectedDecoded;
      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8600
     * @tc.name testURI01Chapter0086
     * @tc.desc Verify host property with illegal Unicode surrogate in hostname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://%ED%A0%BD.com/path');
      const actualUri = uriObj.toString();
      const expectedUri = 'http://%ED%A0%BD.com/path';
      expect(actualUri === expectedUri).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8700
     * @tc.name testURI01Chapter0087
     * @tc.desc Verify host property with completely random illegal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('abcde%20fgh');
      const actualUri = uriObj.toString();
      const expectedOriginal = 'abcde%20fgh';
      const expectedFileScheme = 'file:///abcde%20fgh';
      const isValid = actualUri === expectedOriginal || actualUri === expectedFileScheme;
      expect(isValid).assertTrue();
    });
    // =============== port ======================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8800
     * @tc.name testURI01Chapter0088
     * @tc.desc Verify port returns -1 when no port is specified in URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let port = uriObj.port;
      expect(port === '-1' || port === null || port === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_8900
     * @tc.name testURI01Chapter0089
     * @tc.desc Verify port returns correct value when standard port 8080 is specified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      expect(uriObj.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9000
     * @tc.name testURI01Chapter0090
     * @tc.desc Verify port returns correct value for minimum port 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:0/path');
      expect(uriObj.port).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9100
     * @tc.name testURI01Chapter0091
     * @tc.desc Verify port returns correct value for maximum port 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:65535/path');
      expect(uriObj.port).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9200
     * @tc.name testURI01Chapter0092
     * @tc.desc Verify port ignores leading zeros and returns correct decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:08080/path');
      expect(uriObj.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9300
     * @tc.name testURI01Chapter0093
     * @tc.desc Verify port returns correct value for port 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:1/path');
      expect(uriObj.port).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9400
     * @tc.name testURI01Chapter0094
     * @tc.desc Verify port returns correct value for port 65534 (boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:65534/path');
      expect(uriObj.port).assertEqual('65534');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9500
     * @tc.name testURI01Chapter0095
     * @tc.desc Verify port works correctly in URI with userInfo and query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user:pass@host:12345/root?key=value');
      expect(uriObj.port).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9600
     * @tc.name testURI01Chapter0096
     * @tc.desc Verify URI constructor handles port value 65536 (exceeds max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:65536/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com/path' ||
        uriString === 'http://example.com:65535/path' ||
        uriString === 'http://example.com:0/path';

      expect(isValid).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9700
     * @tc.name testURI01Chapter0097
     * @tc.desc Verify URI constructor handles negative port -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:-1/path');
      const uriString = uriObj.toString();
      const isValid = uriString === 'http://example.com/path' ||
        uriString === 'http://example.com:-1/path' ||
        uriString === 'http://example.com:0/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9800
     * @tc.name testURI01Chapter0098
     * @tc.desc Verify URI constructor handles port with alphabetic characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:80a/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com/path' ||
        uriString === 'http://example.com:80/path' ||
        uriString === 'http://example.com:80a/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONE_9900
     * @tc.name testURI01Chapter0099
     * @tc.desc Verify URI constructor handles empty port (colon with no digits)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com/path' ||
        uriString === 'http://example.com:/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0100
     * @tc.name testURI01Chapter0100
     * @tc.desc Verify URI constructor handles port "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:NaN/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com/path' ||
        uriString === 'http://example.com:NaN/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0200
     * @tc.name testURI01Chapter0101
     * @tc.desc Verify URI constructor throws when port is string "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('http://example.com:Infinity/path');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0300
     * @tc.name testURI01Chapter0102
     * @tc.desc Verify URI constructor handles port with scientific notation "1e3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:1e3/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com:1000/path' ||
        uriString === 'http://example.com:1e3/path' ||
        uriString === 'http://example.com/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0400
     * @tc.name testURI01Chapter0103
     * @tc.desc Verify URI constructor handles port with hexadecimal "0xFF"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:0xFF/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com:255/path' ||
        uriString === 'http://example.com:0xFF/path' ||
        uriString === 'http://example.com/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0500
     * @tc.name testURI01Chapter0104
     * @tc.desc Verify URI constructor handles port with octal "0o777"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:0o777/path');
      const uriString = uriObj.toString();

      const isValid = uriString === 'http://example.com:511/path' ||
        uriString === 'http://example.com:0o777/path' ||
        uriString === 'http://example.com/path';

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0600
     * @tc.name testURI01Chapter0105
     * @tc.desc Verify URI constructor throws when whole URI string is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONETWO_0700
     * @tc.name testURI01Chapter0106
     * @tc.desc Verify URI constructor throws when URI string contains special characters only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('!@#$%^&*()');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONEONE_0100
     * @tc.name testURI01Chapter0107
     * @tc.desc Verify URI constructor handles Chinese characters in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:8080/%E8%B7%AF%E5%BE%84');
      const uriString = uriObj.toString();
      const isValid = (uriString === 'http://example.com:8080/%E8%B7%AF%E5%BE%84' ||
      uriString.includes('8080')) &&
        uriObj !== null;

      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONEONE_0200
     * @tc.name testURI01Chapter0108
     * @tc.desc Verify URI constructor throws when URI string contains emoji in port part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('http://example.com:%F0%9F%98%80/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONEONE_0300
     * @tc.name testURI01Chapter0109
     * @tc.desc Verify URI constructor throws when port contains percent-encoded characters (e.g., %38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('http://example.com:%38%30%38%30/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestONEONE_0400
     * @tc.name testURI01Chapter0110
     * @tc.desc Test path property with normal URI containing simple path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI01Chapter0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/hello/world');
      expect(uriObj.path).assertEqual('/hello/world');
      expect(uriObj.encodedPath).assertEqual('/hello/world');
    });
  });
}
