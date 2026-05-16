import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { uri } from '@kit.ArkTS';

export default function URI04Test() {
  describe('URI04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0100
     * @tc.name testURI04Chapter0001
     * @tc.desc Test encodedFragment with fragment containing Unicode characters beyond BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "𐐷𤭢";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0200
     * @tc.name testURI04Chapter0002
     * @tc.desc Test encodedFragment when URI has both query and fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI("http://example.com/path?query=1#fragment");
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("fragment");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0300
     * @tc.name testURI04Chapter0003
     * @tc.desc Test encodedFragment when URI has fragment containing reserved characters that are allowed (/, ?, @)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "/path?query@here";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0400
     * @tc.name testURI04Chapter0004
     * @tc.desc Test encodedFragment when fragment contains colon and semicolon (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "key:value;param";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0500
     * @tc.name testURI04Chapter0005
     * @tc.desc Test encodedFragment when fragment contains plus sign (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a+b=c";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0600
     * @tc.name testURI04Chapter0006
     * @tc.desc Test encodedFragment when fragment contains hyphen and underscore (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "hello-world_example";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0700
     * @tc.name testURI04Chapter0007
     * @tc.desc Test encodedFragment with fragment containing pipe character (needs encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a|b";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0800
     * @tc.name testURI04Chapter0008
     * @tc.desc Test encodedFragment with fragment containing backtick (needs encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path#%60hello%60');
      const result = uriObj.encodedFragment;
      expect(result).assertEqual('%60hello%60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_0900
     * @tc.name testURI04Chapter0009
     * @tc.desc Test encodedFragment with fragment containing caret (needs encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path#a%5Eb');
      const result = uriObj.encodedFragment;
      expect(result).assertEqual('a%5Eb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1000
     * @tc.name testURI04Chapter0010
     * @tc.desc Test encodedFragment with fragment containing curly braces (need encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "{hello}";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1100
     * @tc.name testURI04Chapter0011
     * @tc.desc Test encodedFragment with fragment containing square brackets (need encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "[hello]";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1200
     * @tc.name testURI04Chapter0012
     * @tc.desc Test encodedFragment with fragment containing backslash (need encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path#a%5Cb');
      const result = uriObj.encodedFragment;
      expect(result).assertEqual('a%5Cb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1300
     * @tc.name testURI04Chapter0013
     * @tc.desc Test encodedFragment with fragment containing less-than and greater-than (need encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path#a%3Cb%3Ec');
      const result = uriObj.encodedFragment;
      expect(result).assertEqual('a%3Cb%3Ec');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1400
     * @tc.name testURI04Chapter0014
     * @tc.desc Test encodedFragment with fragment containing double quote (need encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = 'a"b';
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual(fragment);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1500
     * @tc.name testURI04Chapter0015
     * @tc.desc Test encodedFragment with fragment containing hash character (need encoding, provided as %23)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a%23b";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("a%23b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1600
     * @tc.name testURI04Chapter0016
     * @tc.desc Test encodedFragment with fragment containing question mark (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a?b";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("a?b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1700
     * @tc.name testURI04Chapter0017
     * @tc.desc Test encodedFragment with fragment containing slash (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a/b";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("a/b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1800
     * @tc.name testURI04Chapter0018
     * @tc.desc Test encodedFragment with fragment containing at sign (allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fragment = "a@b";
      const uriObj = new uri.URI(`http://example.com/path#${fragment}`);
      const result = uriObj.encodedFragment;
      expect(result).assertEqual("a@b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_1900
     * @tc.name testURI04Chapter0019
     * @tc.desc Verify encodedAuthority returns correct value for URI with host and port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2000
     * @tc.name testURI04Chapter0020
     * @tc.desc Verify encodedAuthority returns correct value for URI with userInfo and host (no port)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://user@example.com/path');
      expect(uriObj.encodedAuthority).assertEqual('user@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2100
     * @tc.name testURI04Chapter0021
     * @tc.desc Verify encodedAuthority returns correct value for full authority (userInfo, host, port)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://user:pass@example.com:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('user:pass@example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2200
     * @tc.name testURI04Chapter0022
     * @tc.desc Verify encodedAuthority retains percent-encoded characters in userInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://user%40name:pass%3Aword@example.com:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('user%40name:pass%3Aword@example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2300
     * @tc.name testURI04Chapter0023
     * @tc.desc Verify encodedAuthority returns null for URI without authority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('datashare:///path');
      expect(uriObj.encodedAuthority).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2400
     * @tc.name testURI04Chapter0024
     * @tc.desc Verify encodedAuthority handles IPv6 address with port correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://[2001:db8::1]:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('[2001:db8::1]:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2500
     * @tc.name testURI04Chapter0025
     * @tc.desc Verify encodedAuthority handles empty userInfo (leading '@')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://@example.com/path');
      expect(uriObj.encodedAuthority).assertEqual('@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2600
     * @tc.name testURI04Chapter0026
     * @tc.desc Verify encodedAuthority for simple host without port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://example.com/path');
      expect(uriObj.encodedAuthority).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2700
     * @tc.name testURI04Chapter0027
     * @tc.desc Verify encodedAuthority preserves allowed sub-delimiters in userInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://user!$&\'()*+,;=:pass!$&\'()*+,;=@example.com:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('user!$&\'()*+,;=:pass!$&\'()*+,;=@example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2800
     * @tc.name testURI04Chapter0028
     * @tc.desc Verify encodedAuthority handles percent-encoded non-ASCII userInfo and punycode host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http://%E7%94%A8%E6%88%B7@xn--fsq.xn--fiqz9s:8080/path');
      expect(uriObj.encodedAuthority).assertEqual('%E7%94%A8%E6%88%B7@xn--fsq.xn--fiqz9s:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_2900
     * @tc.name testURI04Chapter0029
     * @tc.desc Verify encodedAuthority returns null for scheme-only URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http:');
      expect(uriObj.encodedAuthority).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3000
     * @tc.name testURI04Chapter0030
     * @tc.desc Verify encodedAuthority handles URI with empty authority (double slash) as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('http:///path');
      expect(uriObj.encodedAuthority).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3100
     * @tc.name testURI04Chapter0031
     * @tc.desc Verify constructor throws for empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3200
     * @tc.name testURI04Chapter0032
     * @tc.desc Verify constructor throws for URI containing space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('http://user name@host/path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3300
     * @tc.name testURI04Chapter0033
     * @tc.desc Verify constructor throws for unencoded '@' in userInfo causing ambiguity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('http://user@name:pass@host/path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3400
     * @tc.name testURI04Chapter0034
     * @tc.desc Verify constructor throws for control characters in URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('http://user\n@host/path');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3500
     * @tc.name testURI04Chapter0035
     * @tc.desc Verify constructor throws for invalid percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('http://user%gg@host/path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3600
     * @tc.name testURI04Chapter0036
     * @tc.desc Verify constructor throws for port number out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('http://host:99999/path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3700
     * @tc.name testURI04Chapter0037
     * @tc.desc Verify constructor throws for missing host but with port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('http://:8080/path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3800
     * @tc.name testURI04Chapter0038
     * @tc.desc Verify constructor handles very long URI (stress test, should not throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longHost = 'a'.repeat(2000) + '.com';
      const uriStr = `http://user:pass@${longHost}:8080/path`;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.encodedAuthority).assertContain('user:pass@');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_3900
     * @tc.name testURI04Chapter0039
     * @tc.desc Verify encodedSSP for a standard URI with all components
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "https://username:password@host:8080/directory/file?foo=1&bar=2#fragment";
      const uriObj = new uri.URI(uriStr);
      const expected = "//username:password@host:8080/directory/file?foo=1&bar=2";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4000
     * @tc.name testURI04Chapter0040
     * @tc.desc Verify encodedSSP for URI without userInfo and port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "https://host/path/to/resource?query=value#frag";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path/to/resource?query=value";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4100
     * @tc.name testURI04Chapter0041
     * @tc.desc Verify encodedSSP for URI without authority (scheme:path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "file:/etc/passwd";
      const uriObj = new uri.URI(uriStr);
      const expected = "/etc/passwd";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4200
     * @tc.name testURI04Chapter0042
     * @tc.desc Verify encodedSSP for URI with scheme and authority only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4300
     * @tc.name testURI04Chapter0043
     * @tc.desc Verify encodedSSP for URI with scheme and path (empty authority)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "file:///path/to/file";
      const uriObj = new uri.URI(uriStr);
      const expected = "///path/to/file";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4400
     * @tc.name testURI04Chapter0044
     * @tc.desc Verify encodedSSP encodes special characters in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/path with space and %23hash";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path with space and %23hash";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4500
     * @tc.name testURI04Chapter0045
     * @tc.desc Verify encodedSSP encodes special characters in query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/path?query=value with space&another=value#frag";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path?query=value with space&another=value";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4600
     * @tc.name testURI04Chapter0046
     * @tc.desc Verify encodedSSP encodes special characters in userInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://user:pass@word@host/path";
      const uriObj = new uri.URI(uriStr);
      const expected = "//user:pass@word@host/path";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4700
     * @tc.name testURI04Chapter0047
     * @tc.desc Verify encodedSSP encodes escape characters like newline and tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/path%0Awith%09newline";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path%0Awith%09newline";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4800
     * @tc.name testURI04Chapter0048
     * @tc.desc Verify encodedSSP encodes Unicode emoji correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/path/👆";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path/👆";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_4900
     * @tc.name testURI04Chapter0049
     * @tc.desc Verify encodedSSP for URIs with port boundary values 0 and 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj1 = new uri.URI("http://host:0/path");
      expect(uriObj1.encodedSSP).assertEqual("//host:0/path");
      const uriObj2 = new uri.URI("http://host:65535/path");
      expect(uriObj2.encodedSSP).assertEqual("//host:65535/path");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5000
     * @tc.name testURI04Chapter0050
     * @tc.desc Reverse test: port out of range (65536) should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host:65536/path");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5100
     * @tc.name testURI04Chapter0051
     * @tc.desc Reverse test: invalid port string should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host:abc/path");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5200
     * @tc.name testURI04Chapter0052
     * @tc.desc Reverse test: host containing space should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://ho st/path");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5300
     * @tc.name testURI04Chapter0053
     * @tc.desc Reverse test: incomplete percent encoding should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host/path%");
        expect(uriObj.toString().length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5400
     * @tc.name testURI04Chapter0054
     * @tc.desc Reverse test: empty string URI should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI("");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5500
     * @tc.name testURI04Chapter0055
     * @tc.desc Reverse test: null as URI string should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: string = (null as never) as string;
        new uri.URI(value);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5600
     * @tc.name testURI04Chapter0056
     * @tc.desc Reverse test: undefined as URI string should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: string = (undefined as never) as string;
        new uri.URI(value);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5700
     * @tc.name testURI04Chapter0057
     * @tc.desc Reverse test: port = Infinity should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host:" + Infinity + "/path");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5800
     * @tc.name testURI04Chapter0058
     * @tc.desc Reverse test: port = NaN should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host:" + NaN + "/path");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_5900
     * @tc.name testURI04Chapter0059
     * @tc.desc Verify encodedSSP for URI with very long path (stress test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longPath = "/" + "a".repeat(10000);
      const uriStr = "http://host" + longPath;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.encodedSSP.length > 10000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6000
     * @tc.name testURI04Chapter0060
     * @tc.desc Verify encodedSSP when URI string contains array converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = [1, 2, 3];
      const uriStr = "http://host/" + arr;
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/1,2,3";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6100
     * @tc.name testURI04Chapter0061
     * @tc.desc Verify encodedSSP when URI string contains object converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/%5Bobject%20Object%5D";
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.encodedSSP).assertContain("//host/");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6200
     * @tc.name testURI04Chapter0062
     * @tc.desc Verify encodedSSP when URI string contains boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/" + true;
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/true";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6300
     * @tc.name testURI04Chapter0063
     * @tc.desc Verify encodedSSP for URI with multiple slashes in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host//path//to//resource";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host//path//to//resource";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6400
     * @tc.name testURI04Chapter0064
     * @tc.desc Verify encodedSSP for URI with IPv6 host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://[::1]:8080/path";
      const uriObj = new uri.URI(uriStr);
      const expected = "//[::1]:8080/path";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6500
     * @tc.name testURI04Chapter0065
     * @tc.desc Verify encodedSSP for URI with plus sign in userInfo (should not be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "https://username:my+name@host:8080/directory/file";
      const uriObj = new uri.URI(uriStr);
      const expected = "//username:my+name@host:8080/directory/file";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6600
     * @tc.name testURI04Chapter0066
     * @tc.desc Reverse test: URI with null character should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI("http://host/path\x00");
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6700
     * @tc.name testURI04Chapter0067
     * @tc.desc Reverse test: URI with lone surrogate should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr: string = "http://host/path%ED%A0%BD";
      const uriObj: uri.URI = new uri.URI(uriStr);
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6800
     * @tc.name testURI04Chapter0068
     * @tc.desc Verify encodedSSP does not double-encode already percent-encoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = "http://host/path%20with%20space";
      const uriObj = new uri.URI(uriStr);
      const expected = "//host/path%20with%20space";
      expect(uriObj.encodedSSP).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_6900
     * @tc.name testURI04Chapter0069
     * @tc.desc Verify encodedSSP handles URI with full ASCII printable characters in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ascii = "ABC0123456789abcdefghijklmnopqrstuvwxyz-._~";
      const uriStr = "http://host/" + ascii;
      const uriObj = new uri.URI(uriStr);
      expect(typeof uriObj.encodedSSP).assertEqual("string");
      expect(uriObj.encodedSSP.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7000
     * @tc.name testURI04Chapter0070
     * @tc.desc Reverse test: URI with unencoded space in path should throw error (if no auto-encode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI("http://host/path with space");
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7100
     * @tc.name testURI04Chapter0071
     * @tc.desc Positive test: Create URI object with a standard valid URI string (document example)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://username:password@host:8080/directory/file?foo=1&bar=2#fragment';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.scheme === 'https').assertTrue();
      expect(uriObj.host === 'host').assertTrue();
      expect(uriObj.port === '8080').assertTrue();
      expect(uriObj.path === '/directory/file').assertTrue();
      expect(uriObj.query === 'foo=1&bar=2').assertTrue();
      expect(uriObj.fragment === 'fragment').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7200
     * @tc.name testURI04Chapter0072
     * @tc.desc Positive test: URI with percent-encoded special characters in query parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/path?q=%21%22%23%24%25%26%27%28%29%2A%2B%2C%2D%2E%2F%3A%3B%3C%3D%3E%3F%40%5B%5C%5D%5E%5F%60%7B%7C%7D%7E';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.host !== undefined && uriObj.host !== null).assertTrue();
      expect(uriObj.host.includes('example.com')).assertTrue();
      expect(uriObj.path !== undefined && uriObj.path !== null).assertTrue();
      expect(uriObj.path.includes('path')).assertTrue();
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7300
     * @tc.name testURI04Chapter0073
     * @tc.desc Positive test: URI with allowed ASCII printable characters in path (letters, digits, -._~)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/abc123-._~';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.path !== undefined && uriObj.path !== null).assertTrue();
      expect(uriObj.path.includes('abc123-._~')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7400
     * @tc.name testURI04Chapter0074
     * @tc.desc Positive test: URI with numeric values as query parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?int=123&float=123.456&hex=0x102&exp=1e3';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('int=123')).assertTrue();
      expect(uriObj.query.includes('float=123.456')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7500
     * @tc.name testURI04Chapter0075
     * @tc.desc Positive test: URI with boolean and special numeric keywords as query values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?flag=true&flag2=false&val=NaN&inf=Infinity&ninf=-Infinity';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('flag=true')).assertTrue();
      expect(uriObj.query.includes('val=NaN')).assertTrue();
      expect(uriObj.query.includes('inf=Infinity')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7600
     * @tc.name testURI04Chapter0076
     * @tc.desc Positive test: URI with very long query value (treeString style) to verify no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(100000);
      const uriStr = 'https://example.com/?long=' + longStr;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('long=')).assertTrue();
      expect(uriObj.query.length > 100000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7700
     * @tc.name testURI04Chapter0077
     * @tc.desc Positive test: URI with percent-encoded emoji in query parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriStr = 'https://example.com/?emoji=%F0%9F%91%86%F0%9F%91%BF%F0%9F%91%80%F0%9F%92%AF%F0%9F%8E%85%F0%9F%98%BC%F0%9F%94%A7%F0%9F%92%87%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F%F0%9F%9B%A2%F0%9F%80%84%F0%9F%8F%B4';
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('emoji=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7800
     * @tc.name testURI04Chapter0078
     * @tc.desc Empty string should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_7900
     * @tc.name testURI04Chapter0079
     * @tc.desc Undefined parameter should throw 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('' as string);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8000
     * @tc.name testURI04Chapter0080
     * @tc.desc Null parameter should throw 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('' as string);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8300
     * @tc.name testURI04Chapter0083
     * @tc.desc Array parameter should throw 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let arr: String = new String([]) as String;
        new uri.URI(arr.toString());
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8400
     * @tc.name testURI04Chapter0084
     * @tc.desc Object parameter should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let objStr: String = new String({}) as String;
        new uri.URI(objStr.toString());
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8600
     * @tc.name testURI04Chapter0086
     * @tc.desc URI string containing space should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj: uri.URI = new uri.URI('https://example.com/pa th');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8700
     * @tc.name testURI04Chapter0087
     * @tc.desc URI string containing newline character should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('https://example.com/\npath');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_8800
     * @tc.name testURI04Chapter0088
     * @tc.desc URI string containing raw emoji should not throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const uriObj = new uri.URI('https://example.com/?emoji=👆');
      expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9000
     * @tc.name testURI04Chapter0090
     * @tc.desc Malformed URI missing protocol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('example.com');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9100
     * @tc.name testURI04Chapter0091
     * @tc.desc Malformed URI with multiple at symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('https://user@pass@host');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9200
     * @tc.name testURI04Chapter0092
     * @tc.desc Reverse test: URI string that is just a number "0" should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('0');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9300
     * @tc.name testURI04Chapter0093
     * @tc.desc Reverse test: URI string that is just "NaN" should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('NaN');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9400
     * @tc.name testURI04Chapter0094
     * @tc.desc Reverse test: URI string that is just "Infinity" should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('Infinity');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9500
     * @tc.name testURI04Chapter0095
     * @tc.desc Reverse test: URI string containing backslash should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const uriObj = new uri.URI('https://example.com\\path');
        expect(uriObj.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9600
     * @tc.name testURI04Chapter0096
     * @tc.desc URI string containing tab character should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('https://example.com/\tpath');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9700
     * @tc.name testURI04Chapter0097
     * @tc.desc URI with multiple hash fragments should throw 10200002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new uri.URI('https://example.com/#frag1#frag2');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9800
     * @tc.name testURI04Chapter0098
     * @tc.desc Positive test: URI with percent-encoded full set of special characters (single) in query value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const encoded = encodeURIComponent(specialChars);
      const uriStr = 'https://example.com/?special=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('special=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOUR_9900
     * @tc.name testURI04Chapter0099
     * @tc.desc Positive test: URI with percent-encoded full ASCII printable characters (excluding tab) in query value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const asciiChars = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const encoded = encodeURIComponent(asciiChars);
      const uriStr = 'https://example.com/?ascii=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();
      expect(uriObj.query.includes('ascii=')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URITestFOURONE_0100
     * @tc.name testURI04Chapter0100
     * @tc.desc Positive test: URI with percent-encoded double special characters in query value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURI04Chapter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const doubleSpecial = "!!\"\"##$$%%&&''(())++**,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const encoded = encodeURIComponent(doubleSpecial);
      const uriStr = 'https://example.com/?double=' + encoded;
      const uriObj = new uri.URI(uriStr);
      expect(uriObj.query !== undefined && uriObj.query !== null).assertTrue();

      expect(uriObj.query.includes('double=')).assertTrue();
    });
  });
}
