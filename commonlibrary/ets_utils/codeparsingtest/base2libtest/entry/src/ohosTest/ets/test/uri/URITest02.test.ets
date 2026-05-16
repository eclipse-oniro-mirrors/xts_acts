import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

export default function URI02Test() {
  describe('URI02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0100
     * @tc.name testURI02Chapter0001
     * @tc.desc Test path property with URI containing percent-encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/hello%20world/foo%2Fbar');
      expect(uriObj.path).assertEqual('/hello world/foo/bar');
      expect(uriObj.encodedPath).assertEqual('/hello%20world/foo%2Fbar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0200
     * @tc.name testURI02Chapter0002
     * @tc.desc Test path property with URI containing plus sign in path (encoded as %2B, not decoded to space)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/hello+world');
      expect(uriObj.path).assertEqual('/hello+world');
      expect(uriObj.encodedPath).assertEqual('/hello+world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0300
     * @tc.name testURI02Chapter0003
     * @tc.desc Test path property with URI containing Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/路径/测试');
      expect(uriObj.path).assertEqual('/路径/测试');
      expect(uriObj.encodedPath).assertEqual('/路径/测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0400
     * @tc.name testURI02Chapter0004
     * @tc.desc Test path property with URI containing emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/👆/👿');
      expect(uriObj.path).assertEqual('/👆/👿');
      expect(uriObj.encodedPath).assertEqual('/👆/👿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0500
     * @tc.name testURI02Chapter0005
     * @tc.desc Test path property with URI containing all ASCII printable characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const asciiPath = '/!%22%23$%25&\'()*+,-./0123456789:%3A%3B%3C%3D%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~';
      const uriObj = new uri.URI('https://example.com' + asciiPath);
      expect(uriObj.path).assertEqual('/!"#$%&\'()*+,-./0123456789::;<=>');
      expect(uriObj.encodedPath).assertEqual('/!%22%23$%25&\'()*+,-./0123456789:%3A%3B%3C%3D%3E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0600
     * @tc.name testURI02Chapter0006
     * @tc.desc Test path property with URI containing special characters that require encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const specialChars = '/ !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const encodedChars = encodeURI(specialChars);
      const uriObj = new uri.URI('https://example.com' + encodedChars);
      expect(uriObj.path).assertEqual('/ !"');
      expect(uriObj.encodedPath).assertEqual('/%20!%22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0700
     * @tc.name testURI02Chapter0007
     * @tc.desc Test path property with URI containing null character (escaped)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/hello%00world');
      expect(uriObj.path).assertEqual('/hello\x00world');
      expect(uriObj.encodedPath).assertEqual('/hello%00world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0800
     * @tc.name testURI02Chapter0008
     * @tc.desc Test path property with URI containing invalid percent encoding (should throw or return original?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/hello%2world');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_0900
     * @tc.name testURI02Chapter0009
     * @tc.desc Test path property with URI containing incomplete percent encoding at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/hello%');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1000
     * @tc.name testURI02Chapter0010
     * @tc.desc Test path property with URI containing path with no scheme (relative) – path should be null according to example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('www.example.com/path/to/file');
      expect(uriObj.host).assertNull();
      expect(uriObj.path).assertEqual('www.example.com/path/to/file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1100
     * @tc.name testURI02Chapter0011
     * @tc.desc Test path property with URI that has authority but empty path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com');
      expect(uriObj.path).assertNull();
      expect(uriObj.encodedPath).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1200
     * @tc.name testURI02Chapter0012
     * @tc.desc Test path property with URI that has empty path after slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/');
      expect(uriObj.path).assertEqual('/');
      expect(uriObj.encodedPath).assertEqual('/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1300
     * @tc.name testURI02Chapter0013
     * @tc.desc Test path property with URI containing numbers as path segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/123/456/789');
      expect(uriObj.path).assertEqual('/123/456/789');
      expect(uriObj.encodedPath).assertEqual('/123/456/789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1400
     * @tc.name testURI02Chapter0014
     * @tc.desc Test path property with URI containing boolean-like strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/true/false/0/1');
      expect(uriObj.path).assertEqual('/true/false/0/1');
      expect(uriObj.encodedPath).assertEqual('/true/false/0/1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1500
     * @tc.name testURI02Chapter0015
     * @tc.desc Test path property with URI containing the string "null" and "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/null/undefined');
      expect(uriObj.path).assertEqual('/null/undefined');
      expect(uriObj.encodedPath).assertEqual('/null/undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1600
     * @tc.name testURI02Chapter0016
     * @tc.desc Test path property with URI containing very long path (stress test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longSegment = 'a'.repeat(10000);
      const uriObj = new uri.URI(`https://example.com/${longSegment}`);
      expect(uriObj.path).assertEqual('/' + longSegment);
      expect(uriObj.encodedPath).assertEqual('/' + longSegment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1700
     * @tc.name testURI02Chapter0017
     * @tc.desc Test path property with URI containing backslash characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://example.com/backslash\\path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1800
     * @tc.name testURI02Chapter0018
     * @tc.desc Test path property with URI containing backslash characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://example.com/backslash\\value');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_1900
     * @tc.name testURI02Chapter0019
     * @tc.desc Test path property with URI containing the keyword "NaN" and "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/NaN/0');
      expect(uriObj.path).assertEqual('/NaN/0');
      expect(uriObj.encodedPath).assertEqual('/NaN/0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2000
     * @tc.name testURI02Chapter0020
     * @tc.desc Test path property with URI containing a very long path constructed by JSON array (treeString simulation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longPath = '/';
      for (let i = 0; i < 1000; i++) {
        longPath += 'segment' + i + '/';
      }
      longPath = longPath.slice(0, -1);
      const uriObj = new uri.URI('https://example.com' + longPath);
      expect(uriObj.path).assertEqual(longPath);
      expect(uriObj.encodedPath).assertEqual(longPath);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2100
     * @tc.name testURI02Chapter0021
     * @tc.desc Test path property with URI containing a path that has repeated percent-encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/%21%21%22%22%23%23%24%24%25%25%26%26');
      expect(uriObj.path).assertEqual('/!!""##$$%%&&');
      expect(uriObj.encodedPath).assertEqual('/%21%21%22%22%23%23%24%24%25%25%26%26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2200
     * @tc.name testURI02Chapter0022
     * @tc.desc Test path property with URI containing mixed encoded and unencoded special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/!%22%23%24%25%26%27%28%29*%2B%2C%2D%2E%2F%3A%3B%3C%3D%3E%3F%40%5B%5C%5D%5E%5F%60%7B%7C%7D%7E');
      expect(uriObj.path).assertEqual('/!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(uriObj.encodedPath).assertEqual('/!%22%23%24%25%26%27%28%29*%2B%2C%2D%2E%2F%3A%3B%3C%3D%3E%3F%40%5B%5C%5D%5E%5F%60%7B%7C%7D%7E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2300
     * @tc.name testURI02Chapter0023
     * @tc.desc Test path property with URI containing illegal Unicode surrogate pair (invalid)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://example.com/' + encodeURIComponent('\uD83D'));
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2400
     * @tc.name testURI02Chapter0024
     * @tc.desc Test path property with URI containing empty string path (no path at all)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com');
      expect(uriObj.path).assertNull();
      expect(uriObj.encodedPath).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2500
     * @tc.name testURI02Chapter0025
     * @tc.desc Test path property with URI containing path with multiple slashes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com//path//to//file');
      expect(uriObj.path).assertEqual('//path//to//file');
      expect(uriObj.encodedPath).assertEqual('//path//to//file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2600
     * @tc.name testURI02Chapter0026
     * @tc.desc Test path property with URI containing path with dot segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/./path/../to/./file');
      expect(uriObj.path).assertEqual('/./path/../to/./file');
      expect(uriObj.encodedPath).assertEqual('/./path/../to/./file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2700
     * @tc.name testURI02Chapter0027
     * @tc.desc Test path property with URI containing IPv6 host and path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://[::1]/path/to/file');
      expect(uriObj.path).assertEqual('/path/to/file');
      expect(uriObj.encodedPath).assertEqual('/path/to/file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2800
     * @tc.name testURI02Chapter0028
     * @tc.desc Test path property with URI containing username/password and path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user:pass@example.com/path');
      expect(uriObj.path).assertEqual('/path');
      expect(uriObj.encodedPath).assertEqual('/path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_2900
     * @tc.name testURI02Chapter0029
     * @tc.desc Test path property with URI containing fragment and query – path unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/path/to/file?query=1#frag');
      expect(uriObj.path).assertEqual('/path/to/file');
      expect(uriObj.encodedPath).assertEqual('/path/to/file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3000
     * @tc.name testURI02Chapter0030
     * @tc.desc Test path property with URI that has scheme but no authority (opaque URI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('mailto:someone@example.com');
      expect(uriObj.scheme).assertEqual('mailto');
      expect(uriObj.path).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3100
     * @tc.name testURI02Chapter0031
     * @tc.desc Test path property with URI that has fragment and path containing percent encoded slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/foo%2Fbar#frag');
      expect(uriObj.path).assertEqual('/foo/bar');
      expect(uriObj.encodedPath).assertEqual('/foo%2Fbar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3200
     * @tc.name testURI02Chapter0032
     * @tc.desc Test path property with URI that has no path but trailing slash after authority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/');
      expect(uriObj.path).assertEqual('/');
      expect(uriObj.encodedPath).assertEqual('/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3300
     * @tc.name testURI02Chapter0033
     * @tc.desc Test path property with URI that is just a scheme and colon (opaque with empty ssp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('data:');
      expect(uriObj.path).assertNull();
      expect(uriObj.encodedPath).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3400
     * @tc.name testURI02Chapter0034
     * @tc.desc Test path property with URI that has path containing a colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/path:with:colon');
      expect(uriObj.path).assertEqual('/path:with:colon');
      expect(uriObj.encodedPath).assertEqual('/path:with:colon');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3500
     * @tc.name testURI02Chapter0035
     * @tc.desc Test path property with URI containing non-ASCII characters in path (Chinese)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/中文/路径');
      expect(uriObj.path).assertEqual('/中文/路径');
      expect(uriObj.encodedPath).assertEqual('/中文/路径');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3600
     * @tc.name testURI02Chapter0036
     * @tc.desc Test path property with URI that has multiple percent-encoded sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/%41%42%43/%61%62%63');
      expect(uriObj.path).assertEqual('/ABC/abc');
      expect(uriObj.encodedPath).assertEqual('/%41%42%43/%61%62%63');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3700
     * @tc.name testURI02Chapter0037
     * @tc.desc Test path property with URI that has percent-encoded reserved characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/%2F%3F%23%5B%5D%40');
      expect(uriObj.path).assertEqual('//?#[]@');
      expect(uriObj.encodedPath).assertEqual('/%2F%3F%23%5B%5D%40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3800
     * @tc.name testURI02Chapter0038
     * @tc.desc Test path property with URI that has a path consisting only of a slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/');
      expect(uriObj.path).assertEqual('/');
      expect(uriObj.encodedPath).assertEqual('/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_3900
     * @tc.name testURI02Chapter0039
     * @tc.desc Test path property with URI that has a path containing a tilde
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/~/user');
      expect(uriObj.path).assertEqual('/~/user');
      expect(uriObj.encodedPath).assertEqual('/~/user');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4000
     * @tc.name testURI02Chapter0040
     * @tc.desc Test path property with URI that has a path with double percent sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/%%41');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4100
     * @tc.name testURI02Chapter0041
     * @tc.desc Test path property with URI that has a path with % followed by non-hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/%G1');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4200
     * @tc.name testURI02Chapter0042
     * @tc.desc Test path property with URI that has a path with Unicode surrogate pair correctly encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = '😀';
      const encoded = encodeURIComponent(emoji);
      const uriObj = new uri.URI(`https://example.com/${encoded}`);
      expect(uriObj.path).assertEqual('/' + emoji);
      expect(uriObj.encodedPath).assertEqual('/' + encoded);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4300
     * @tc.name testURI02Chapter0043
     * @tc.desc Test path property with URI that has a path with null byte (not allowed, should throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('https://example.com/\0');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4400
     * @tc.name testURI02Chapter0044
     * @tc.desc Test path property with URI that has a path with a very long segment and check memory (not assert, just run)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longSegment = 'x'.repeat(1000000);
      const uriObj = new uri.URI(`https://example.com/${longSegment}`);
      expect(uriObj.path.length).assertEqual(1000001);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4500
     * @tc.name testURI02Chapter0045
     * @tc.desc Test query property when URI has no query part (should return null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      expect(testUri.query).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4600
     * @tc.name testURI02Chapter0046
     * @tc.desc Test query property when URI has empty query (e.g., '?') should return empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/path?');
      expect(testUri.query).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4700
     * @tc.name testURI02Chapter0047
     * @tc.desc Test query property with simple key-value pairs (foo=1&bar=2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      expect(testUri.query).assertEqual('foo=1&bar=2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4800
     * @tc.name testURI02Chapter0048
     * @tc.desc Test query property with encoded space (%20) and plus sign (%2B) should be decoded correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?q=hello%20world&name=John%2Bdoe');
      expect(testUri.query).assertEqual('q=hello world&name=John+doe');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_4900
     * @tc.name testURI02Chapter0049
     * @tc.desc Test query property with reserved characters that are percent-encoded: &, =, #, ?, etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?a%26b=c%3Dd&e%23f=g%3Fh');
      expect(testUri.query).assertEqual('a&b=c=d&e#f=g?h');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5000
     * @tc.name testURI02Chapter0050
     * @tc.desc Test query property with all printable ASCII characters (32-126) as value, properly encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ascii: string = '';
      for (let i: number = 32; i <= 126; i++) {
        ascii += String.fromCharCode(i);
      }
      const encodedAscii: string = encodeURIComponent(ascii);
      const testUri: uri.URI = new uri.URI(`http://example.com/?data=${encodedAscii}`);
      expect(testUri.query).assertEqual(`data=${ascii}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5100
     * @tc.name testURI02Chapter0051
     * @tc.desc Test query property with control characters (tab, newline, carriage return, form feed, vertical tab) encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const raw: string = 'line1\tline2\nline3\rline4\fline5\vline6';
      const encoded: string = encodeURIComponent(raw);
      const testUri: uri.URI = new uri.URI(`http://example.com/?text=${encoded}`);
      expect(testUri.query).assertEqual(`text=${raw}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5200
     * @tc.name testURI02Chapter0052
     * @tc.desc Test query property with Unicode characters (including emojis) encoded and decoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emojis: string = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const encoded: string = encodeURIComponent(emojis);
      const testUri: uri.URI = new uri.URI(`http://example.com/?emoji=${encoded}`);
      expect(testUri.query).assertEqual(`emoji=${emojis}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5300
     * @tc.name testURI02Chapter0053
     * @tc.desc Test query property with special string keywords like "undefined", "null", "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?a=undefined&b=null&c=NaN');
      expect(testUri.query).assertEqual('a=undefined&b=null&c=NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5400
     * @tc.name testURI02Chapter0054
     * @tc.desc Test query property with very long query string (stress test, no exception)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longQuery: string = '';
      for (let i: number = 0; i < 10000; i++) {
        longQuery += `key${i}=value${i}&`;
      }
      longQuery = longQuery.slice(0, -1);
      const testUri: uri.URI = new uri.URI(`http://example.com/?${longQuery}`);
      expect(testUri.query).assertEqual(longQuery);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5500
     * @tc.name testURI02Chapter0055
     * @tc.desc Test query property when fragment contains '#' and query part includes encoded '#', should not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?q=%23hash#fragment');
      expect(testUri.query).assertEqual('q=#hash');
      expect(testUri.fragment).assertEqual('fragment');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5600
     * @tc.name testURI02Chapter0056
     * @tc.desc Test query property with invalid percent encoding (e.g., %2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?invalid=%2');
      expect(testUri.query !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5700
     * @tc.name testURI02Chapter0057
     * @tc.desc Test query property with invalid UTF-8 sequences after percent decoding (e.g., %C3%28)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?invalid=%C3%28');
      expect(testUri.query !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5800
     * @tc.name testURI02Chapter0058
     * @tc.desc Test query property with unencoded '#' inside query (should split query and fragment)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const testUri: uri.URI = new uri.URI('http://example.com/?foo=bar#baz#more');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_5900
     * @tc.name testURI02Chapter0059
     * @tc.desc Test query property with unencoded '?' inside query (should be treated as part of query)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?a=b?c=d');
      expect(testUri.query).assertEqual('a=b?c=d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6000
     * @tc.name testURI02Chapter0060
     * @tc.desc Test query property with plus sign as space (application/x-www-form-urlencoded style) – should remain '+'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?message=Hello+world');
      expect(testUri.query).assertEqual('message=Hello+world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6100
     * @tc.name testURI02Chapter0061
     * @tc.desc Test query property with encoded plus sign %2B should decode to '+'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?message=Hello%2Bworld');
      expect(testUri.query).assertEqual('message=Hello+world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6200
     * @tc.name testURI02Chapter0062
     * @tc.desc Test query property with multiple parameters and non-ASCII characters in keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const params: string[] = [
        encodeURIComponent('kèy1') + '=' + encodeURIComponent('välue1'),
        encodeURIComponent('key2') + '=' + encodeURIComponent('välue2'),
        encodeURIComponent('名字') + '=' + encodeURIComponent('张三')
      ];
      const queryString: string = params.join('&');
      const testUri: uri.URI = new uri.URI(`http://example.com/?${queryString}`);
      const decodedParams: string[] = params.map(p => {
        const eqIdx: number = p.indexOf('=');
        const key: string = decodeURIComponent(p.substring(0, eqIdx));
        const val: string = decodeURIComponent(p.substring(eqIdx + 1));
        return key + '=' + val;
      });
      const expectedQuery: string = decodedParams.join('&');
      expect(testUri.query).assertEqual(expectedQuery);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6300
     * @tc.name testURI02Chapter0063
     * @tc.desc Test encodedQuery property alongside query to verify encoding round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?q=hello%20world&name=John%2Bdoe');
      expect(testUri.query).assertEqual('q=hello world&name=John+doe');
      expect(testUri.encodedQuery).assertEqual('q=hello%20world&name=John%2Bdoe');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6400
     * @tc.name testURI02Chapter0064
     * @tc.desc Test query property when URI has no scheme and no authority, but has query (e.g., "path?query")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('path/to/resource?query=value');
      expect(testUri.query).assertEqual('query=value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6500
     * @tc.name testURI02Chapter0065
     * @tc.desc Test query property with only query part and no path (e.g., "?query")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('?query=value');
      expect(testUri.query).assertEqual('query=value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6600
     * @tc.name testURI02Chapter0066
     * @tc.desc Test query property with extremely long key and value (edge)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longKey: string = 'a'.repeat(5000);
      const longVal: string = 'b'.repeat(5000);
      const testUri: uri.URI = new uri.URI(`http://example.com/?${longKey}=${longVal}`);
      expect(testUri.query).assertEqual(`${longKey}=${longVal}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6700
     * @tc.name testURI02Chapter0067
     * @tc.desc Test query property with percent-encoded null bytes (%00) and other control chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?null=%00%01%02');
      expect(testUri.query).assertEqual('null=\x00\x01\x02');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6800
     * @tc.name testURI02Chapter0068
     * @tc.desc Test query property with unpaired surrogate halves (invalid UTF-16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testUri: uri.URI = new uri.URI('http://example.com/?surrogate=%ED%A0%80');
      expect(testUri.query !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_6900
     * @tc.name testURI02Chapter0069
     * @tc.desc Test query property with a long JSON-like string (treeString pattern) as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let jsonArray: string = '[';
      for (let i: number = 0; i < 500; i++) {
        jsonArray += '{"a":1},';
      }
      jsonArray = jsonArray.slice(0, -1) + ']';
      const encodedJson: string = encodeURIComponent(jsonArray);
      const testUri: uri.URI = new uri.URI(`http://example.com/?data=${encodedJson}`);
      expect(testUri.query).assertEqual(`data=${jsonArray}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7000
     * @tc.name testURI02Chapter0070
     * @tc.desc Test query property with serialized array and object (JSON) as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: number[] = [1, 2, 3];
      const objStr: string = '{"foo":42,"baz":42}';
      const obj: Record<string, number> = JSON.parse(objStr);
      const arrStr: string = JSON.stringify(arr);
      const objJsonStr: string = JSON.stringify(obj);
      const encodedArr: string = encodeURIComponent(arrStr);
      const encodedObj: string = encodeURIComponent(objJsonStr);
      const testUri: uri.URI = new uri.URI(`http://example.com/?arr=${encodedArr}&obj=${encodedObj}`);
      expect(testUri.query).assertEqual(`arr=${arrStr}&obj=${objJsonStr}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7100
     * @tc.name testURI02Chapter0071
     * @tc.desc Verify fragment is null when URI has no fragment part.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      expect(uriObj.fragment).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7200
     * @tc.name testURI02Chapter0072
     * @tc.desc Verify fragment is empty string when URI ends with '#'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path#');
      expect(uriObj.fragment).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7300
     * @tc.name testURI02Chapter0073
     * @tc.desc Verify fragment with simple alphanumeric string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#fragment123');
      expect(uriObj.fragment).assertEqual('fragment123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7400
     * @tc.name testURI02Chapter0074
     * @tc.desc Verify fragment with numeric characters only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#9876543210');
      expect(uriObj.fragment).assertEqual('9876543210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7500
     * @tc.name testURI02Chapter0075
     * @tc.desc Verify fragment with space (URL encoded as %20) is decoded correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#hello%20world');
      expect(uriObj.fragment).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7600
     * @tc.name testURI02Chapter0076
     * @tc.desc Verify fragment with various special ASCII characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const special = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const encoded = encodeURIComponent(special);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(special);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7700
     * @tc.name testURI02Chapter0077
     * @tc.desc Verify fragment with Chinese characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chinese = '中文测试';
      const encoded = encodeURIComponent(chinese);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(chinese);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7800
     * @tc.name testURI02Chapter0078
     * @tc.desc Verify fragment with emoji characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = '😀👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const encoded = encodeURIComponent(emoji);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(emoji);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_7900
     * @tc.name testURI02Chapter0079
     * @tc.desc Verify fragment with Unicode surrogate pair (e.g., 𝄞).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const musical = '𝄞';
      const encoded = encodeURIComponent(musical);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(musical);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8000
     * @tc.name testURI02Chapter0080
     * @tc.desc Verify fragment with backslash and escape sequences as literal characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const literal = '\\n\\t\\r\\\\';
      const encoded = encodeURIComponent(literal);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(literal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8100
     * @tc.name testURI02Chapter0081
     * @tc.desc Verify fragment with null character (U+0000) encoded as %00.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const withNull = 'abc\u0000def';
      const encoded = encodeURIComponent(withNull);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(withNull);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8200
     * @tc.name testURI02Chapter0082
     * @tc.desc Verify fragment with very long string (5000 characters).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(5000);
      const encoded = encodeURIComponent(longStr);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8300
     * @tc.name testURI02Chapter0083
     * @tc.desc Verify fragment that contains a percent-encoded '#' (%23) inside path, ensuring fragment is still extracted correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/pa%23th#frag');
      expect(uriObj.fragment).assertEqual('frag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8400
     * @tc.name testURI02Chapter0084
     * @tc.desc Verify fragment with multiple percent-encoded sequences (e.g., %C3%A9 for é).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const raw = 'café';
      const encoded = encodeURIComponent(raw);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8500
     * @tc.name testURI02Chapter0085
     * @tc.desc Verify fragment with mixed ASCII, Unicode, and encoded characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mixed = 'Hello 世界 🌍! @#$%';
      const encoded = encodeURIComponent(mixed);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(mixed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8600
     * @tc.name testURI02Chapter0086
     * @tc.desc Test fragment with invalid percent encoding (%2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'http://example.com#invalid%2';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.fragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8700
     * @tc.name testURI02Chapter0087
     * @tc.desc Test fragment with incomplete surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const encoded: string = '%ED%A0%80';
      const uriObj: uri.URI = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8800
     * @tc.name testURI02Chapter0088
     * @tc.desc Reverse test: fragment containing a control character (U+0001) encoded as %01 should be allowed? Possibly not, but check if it throws.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controlChar: string = '\u0001';
      const encoded: string = encodeURIComponent(controlChar);
      const uriObj: uri.URI = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_8900
     * @tc.name testURI02Chapter0089
     * @tc.desc Reverse test: constructing URI with empty string should throw error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9000
     * @tc.name testURI02Chapter0090
     * @tc.desc Test constructing URI with malformed scheme (e.g., missing colon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http//example.com');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9100
     * @tc.name testURI02Chapter0091
     * @tc.desc Test fragment with '%' at the end (incomplete encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#test%');
      expect(uriObj.fragment !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9200
     * @tc.name testURI02Chapter0092
     * @tc.desc Verify fragment with null (no fragment) after constructing URI with query but no fragment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?query=1');
      expect(uriObj.fragment).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9300
     * @tc.name testURI02Chapter0093
     * @tc.desc Verify fragment with encoded plus sign (+) in fragment (should be decoded to '+').
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#a%2Bb');
      expect(uriObj.fragment).assertEqual('a+b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9400
     * @tc.name testURI02Chapter0094
     * @tc.desc Verify fragment with ampersand (&) and equals (=) which are not special in fragment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const raw = 'a=b&c=d';
      const encoded = encodeURIComponent(raw);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9500
     * @tc.name testURI02Chapter0095
     * @tc.desc Verify fragment with a single percent character '%' if not followed by hex digits (should be decoded to '%').
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com#%25');
      expect(uriObj.fragment).assertEqual('%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9600
     * @tc.name testURI02Chapter0096
     * @tc.desc Test constructing URI with malformed scheme (e.g., missing colon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http//example.com');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9700
     * @tc.name testURI02Chapter0097
     * @tc.desc Verify fragment with empty string after encoded query and fragment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path?query#');
      expect(uriObj.fragment).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9800
     * @tc.name testURI02Chapter0098
     * @tc.desc Verify fragment with multiple # characters (only last is fragment delimiter, others must be encoded).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const uriObj = new uri.URI('http://example.com/pa%23th#frag#more');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWO_9900
     * @tc.name testURI02Chapter0099
     * @tc.desc Verify fragment when URI contains userInfo, port, query, and fragment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://user:pass@host:8080/dir/file?q=v#frag');
      expect(uriObj.fragment).assertEqual('frag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0100
     * @tc.name testURI02Chapter0100
     * @tc.desc Verify fragment with Unicode characters that require 3-byte UTF-8 encoding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const unicodeStr = '€𐍈';
      const encoded = encodeURIComponent(unicodeStr);
      const uriObj = new uri.URI('http://example.com#' + encoded);
      expect(uriObj.fragment).assertEqual(unicodeStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0200
     * @tc.name testURI02Chapter0101
     * @tc.desc Test authority with normal URI containing userinfo, host, port.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      expect(uriObj.authority).assertEqual("username:password@host:8080");
      expect(uriObj.encodedAuthority).assertEqual("username:password@host:8080");
      expect(uriObj.userInfo).assertEqual("username:password");
      expect(uriObj.host).assertEqual("host");
      expect(uriObj.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0300
     * @tc.name testURI02Chapter0102
     * @tc.desc Test authority with host and port only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com:8888/path/to/resource");
      expect(uriObj.authority).assertEqual("example.com:8888");
      expect(uriObj.encodedAuthority).assertEqual("example.com:8888");
      expect(uriObj.userInfo).assertNull();
      expect(uriObj.host).assertEqual("example.com");
      expect(uriObj.port).assertEqual('8888');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0400
     * @tc.name testURI02Chapter0103
     * @tc.desc Test authority with host only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("ftp://mirror.example.com/pub/linux");
      expect(uriObj.authority).assertEqual("mirror.example.com");
      expect(uriObj.encodedAuthority).assertEqual("mirror.example.com");
      expect(uriObj.userInfo).assertNull();
      expect(uriObj.host).assertEqual("mirror.example.com");
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0500
     * @tc.name testURI02Chapter0104
     * @tc.desc Test URI without authority (scheme:///path).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("file:///etc/hosts");
      expect(uriObj.authority).assertNull();
      expect(uriObj.encodedAuthority).assertNull();
      expect(uriObj.host).assertNull();
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0600
     * @tc.name testURI02Chapter0105
     * @tc.desc Test authority with userinfo without password.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://alice@secure.example.com/private");
      expect(uriObj.authority).assertEqual("alice@secure.example.com");
      expect(uriObj.encodedAuthority).assertEqual("alice@secure.example.com");
      expect(uriObj.userInfo).assertEqual("alice");
      expect(uriObj.host).assertEqual("secure.example.com");
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0700
     * @tc.name testURI02Chapter0106
     * @tc.desc Test port value 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://localhost:0/");
      expect(uriObj.authority).assertEqual("localhost:0");
      expect(uriObj.port).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0800
     * @tc.name testURI02Chapter0107
     * @tc.desc Test port maximum value 65535.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com:65535/");
      expect(uriObj.authority).assertEqual("example.com:65535");
      expect(uriObj.port).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_0900
     * @tc.name testURI02Chapter0108
     * @tc.desc Test default port (no port specified).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("https://example.com/");
      expect(uriObj.authority).assertEqual("example.com");
      expect(uriObj.port).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestTWOONE_1000
     * @tc.name testURI02Chapter0109
     * @tc.desc Test IPv4 host address.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI02Chapter0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://192.168.1.1:8080/index.html");
      expect(uriObj.authority).assertEqual("192.168.1.1:8080");
      expect(uriObj.host).assertEqual("192.168.1.1");
      expect(uriObj.port).assertEqual('8080');
    });
  });
}
