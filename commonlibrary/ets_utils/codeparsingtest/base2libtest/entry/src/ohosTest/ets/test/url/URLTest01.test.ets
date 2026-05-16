import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { url } from '@kit.ArkTS';

const URL = url.URL

export default function URL01Test() {
  describe('URL01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
    // =============== hash ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0100
     * @tc.name testURL01Chapter0001
     * @tc.desc Test setting hash with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let meme = URL.parseURL('https://example.com/path#frag');
      meme.hash = '';
      expect(meme.hash).assertEqual('');
      expect(meme.href).assertEqual('https://example.com/path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0200
     * @tc.name testURL01Chapter0002
     * @tc.desc Test setting hash with string "undefined" and "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      url.hash = 'undefined';
      expect(url.hash).assertEqual('#undefined');
      url.hash = 'null';
      expect(url.hash).assertEqual('#null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0300
     * @tc.name testURL01Chapter0003
     * @tc.desc Test setting hash with all ASCII special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      url.hash = specialChars;

      const expectedHash: string = '#!%22#$%&\'()*+,-./:;%3C=%3E?@[%5C]%5E_`{|}~';

      expect(url.hash).assertEqual(expectedHash);
      expect(url.href).assertEqual('https://example.com/' + expectedHash);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0400
     * @tc.name testURL01Chapter0004
     * @tc.desc Test setting hash with full ASCII printable characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      let asciiFull: string = '';
      for (let i: number = 32; i <= 126; i++) {
        asciiFull += String.fromCharCode(i);
      }
      url.hash = asciiFull;

      const expectedHash: string =
        '#%20!%22#$%&\'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[%5C]%5E_`abcdefghijklmnopqrstuvwxyz{|}~';

      expect(url.hash).assertEqual(expectedHash);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0500
     * @tc.name testURL01Chapter0005
     * @tc.desc Test setting hash with repeated special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const repeated: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      url.hash = repeated;

      const expectedHash: string =
        '#!!%22%22##$$%%&&\'\'(())**++,,--..//::;;%3C%3C==%3E%3E??@@[[%5C%5C]]%5E%5E__``{{||}}~~';

      expect(url.hash).assertEqual(expectedHash);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0600
     * @tc.name testURL01Chapter0006
     * @tc.desc Test setting hash with escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      const escapes: string = '\\\'\"?\0';
      url.hash = escapes;

      const expectedHash: string = '#%5C\'%22?%00';
      expect(url.hash).assertEqual(expectedHash);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0700
     * @tc.name testURL01Chapter0007
     * @tc.desc Test setting hash with octal and hex escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url= URL.parseURL('https://example.com');
      const octalHex: string = String.fromCharCode(parseInt('141', 8)) + '\x61';
      url.hash = octalHex;
      expect(url.hash).assertEqual('#aa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0800
     * @tc.name testURL01Chapter0008
     * @tc.desc Test setting hash with emoji and Unicode escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      const emoji: string = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const unicodeEscapes: string =
        '\uD83D\uDC46\uD83D\uDC7F\uD83D\uDC40\uD83D\uDCAF\uD83C\uDF85\uD83D\uDE3C\uD83D\uDD27\uD83D\uDC87\uD83E\uDD3C\u200D\u2642\uFE0F\uD83D\uDEE2\uD83C\uDC04\uD83C\uDFF4';

      const expectedHash: string =
        '#%F0%9F%91%86%F0%9F%91%BF%F0%9F%91%80%F0%9F%92%AF%F0%9F%8E%85%F0%9F%98%BC%F0%9F%94%A7%F0%9F%92%87%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F%F0%9F%9B%A2%F0%9F%80%84%F0%9F%8F%B4';

      url.hash = emoji;
      expect(url.hash).assertEqual(expectedHash);

      url.hash = unicodeEscapes;
      expect(url.hash).assertEqual(expectedHash);
      expect(emoji).assertEqual(unicodeEscapes);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_0900
     * @tc.name testURL01Chapter0009
     * @tc.desc Test setting hash with invalid Unicode surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      const invalid: string = '\uD83D\uDC46\uD83D';
      url.hash = invalid;

      const expectedHash: string = '#%F0%9F%91%86%EF%BF%BD';

      expect(url.hash).assertEqual(expectedHash);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1000
     * @tc.name testURL01Chapter0010
     * @tc.desc Test setting hash with numeric strings like "0", "NaN", "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      url.hash = '0';
      expect(url.hash).assertEqual('#0');
      url.hash = 'NaN';
      expect(url.hash).assertEqual('#NaN');
      url.hash = 'Infinity';
      expect(url.hash).assertEqual('#Infinity');
      url.hash = '-Infinity';
      expect(url.hash).assertEqual('#-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1100
     * @tc.name testURL01Chapter0011
     * @tc.desc Test setting hash with very large string (10k chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const large: string = 'a'.repeat(10000);
      url.hash = large;
      expect(url.hash.length).assertEqual(10001);
      expect(url.hash.substring(1)).assertEqual(large);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1200
     * @tc.name testURL01Chapter0012
     * @tc.desc Test setting hash with treeString-like JSON array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      let treeStr: string = '[';
      for (let i: number = 0; i < 100; i++) {
        treeStr += '{"a":1},';
      }
      treeStr += '{"a":1}]';
      url.hash = treeStr;

      let expectedTreeStr: string = '[';
      for (let i: number = 0; i < 100; i++) {
        expectedTreeStr += '{%22a%22:1},';
      }
      expectedTreeStr += '{%22a%22:1}]';

      expect(url.hash).assertEqual('#' + expectedTreeStr);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1300
     * @tc.name testURL01Chapter0013
     * @tc.desc Test setting hash with substring operation (sliceString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      let base: string = '{k1:value1,k2:value2}';
      let sliced: string = base.substring(0, base.length - 2);
      url.hash = sliced;
      expect(url.hash).assertEqual('#' + sliced);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1400
     * @tc.name testURL01Chapter0014
     * @tc.desc Test setting host with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://user:pass@example.com:8080/path');

      url.host = '';

      expect(url.host).assertEqual('example.com:8080');
      expect(url.hostname).assertEqual('example.com');
      expect(url.port).assertEqual('8080');
      expect(url.href).assertEqual('https://user:pass@example.com:8080/path');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1500
     * @tc.name testURL01Chapter0015
     * @tc.desc Test setting host with valid domain and port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      url.host = 'sub.example.com:3000';
      expect(url.host).assertEqual('sub.example.com:3000');
      expect(url.hostname).assertEqual('sub.example.com');
      expect(url.port).assertEqual('3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1600
     * @tc.name testURL01Chapter0016
     * @tc.desc Test setting host with IPv4 address
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      url.host = '192.168.1.1';
      expect(url.host).assertEqual('192.168.1.1');
      expect(url.hostname).assertEqual('192.168.1.1');
      expect(url.port).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1700
     * @tc.name testURL01Chapter0017
     * @tc.desc Test setting host with IPv6 address (requires brackets)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let url = URL.parseURL('https://[::1]/path');

      expect(url.host).assertEqual('[::1]');
      expect(url.hostname).assertEqual('[::1]');
      expect(url.port).assertEqual('');
      expect(url.href).assertEqual('https://[::1]/path');

      let urlWithPort = URL.parseURL('https://[::1]:8080/path');
      expect(urlWithPort.host).assertEqual('[::1]:8080');
      expect(urlWithPort.hostname).assertEqual('[::1]');
      expect(urlWithPort.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1800
     * @tc.name testURL01Chapter0018
     * @tc.desc Test setting host with IPv6 and port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let url = URL.parseURL('https://[::1]:8080/path');

      expect(url.host).assertEqual('[::1]:8080');
      expect(url.hostname).assertEqual('[::1]');
      expect(url.port).assertEqual('8080');
      expect(url.href).assertEqual('https://[::1]:8080/path');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_1900
     * @tc.name testURL01Chapter0019
     * @tc.desc Test setting host with special characters (should be encoded?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const specialHost: string = 'example!.com';
      url.host = specialHost;

      expect(url.host).assertEqual(specialHost);
      expect(url.hostname).assertEqual(specialHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2000
     * @tc.name testURL01Chapter0020
     * @tc.desc Test setting host with port out of range (reverse case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      url.host = 'example.com:70000';

      expect(url.host).assertEqual('example.com');
      expect(url.hostname).assertEqual('example.com');
      expect(url.port).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2100
     * @tc.name testURL01Chapter0021
     * @tc.desc Test setting host with non-numeric port (reverse case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      const invalidPorts = ['abc', '12ab', 'http', 'port', '123abc'];

      invalidPorts.forEach(port => {
        url.host = 'example.com:' + port;
        expect(url.host).assertEqual('example.com');
        expect(url.hostname).assertEqual('example.com');
        expect(url.port).assertEqual('');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2200
     * @tc.name testURL01Chapter0022
     * @tc.desc Test setting host with emoji (should be punycode encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const emojiHost: string = '👆.com';
      url.host = emojiHost;

      expect(url.host).assertEqual('%F0%9F%91%86.com');
      expect(url.hostname).assertEqual('%F0%9F%91%86.com');

      expect(url.href).assertEqual('https://%F0%9F%91%86.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2300
     * @tc.name testURL01Chapter0023
     * @tc.desc Test setting host with very long string (10k chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');
      const longHost: string = 'a'.repeat(10000) + '.com';
      url.host = longHost;
      expect(url.host).assertEqual(longHost);
      expect(url.hostname).assertEqual(longHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2400
     * @tc.name testURL01Chapter0024
     * @tc.desc Test setting host with string containing colon but no port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url = URL.parseURL('https://example.com');

      url.host = 'example.com:';

      expect(url.host).assertEqual('example.com');
      expect(url.hostname).assertEqual('example.com');
      expect(url.port).assertEqual('');
    });
    // =============== host ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2500
     * @tc.name testURL01Chapter0025
     * @tc.desc Test setting host with empty string (host should remain unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user:pass@example.com:8080/path');
      const originalHost = myUrl.host;

      myUrl.host = '';

      expect(myUrl.host).assertEqual(originalHost);
      expect(myUrl.hostname).assertEqual('example.com');
      expect(myUrl.port).assertEqual('8080');
      expect(myUrl.href).assertEqual('https://user:pass@example.com:8080/path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2600
     * @tc.name testURL01Chapter0026
     * @tc.desc Test setting host with valid domain and port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.host = 'sub.example.com:3000';
      expect(myUrl.host).assertEqual('sub.example.com:3000');
      expect(myUrl.hostname).assertEqual('sub.example.com');
      expect(myUrl.port).assertEqual('3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2700
     * @tc.name testURL01Chapter0027
     * @tc.desc Test setting host with IPv4 address
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.host = '192.168.1.1';
      expect(myUrl.host).assertEqual('192.168.1.1');
      expect(myUrl.hostname).assertEqual('192.168.1.1');
      expect(myUrl.port).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2800
     * @tc.name testURL01Chapter0028
     * @tc.desc Test setting host with IPv6 address (should fail gracefully)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHost = myUrl.host;

      myUrl.host = '[::1]';

      expect(myUrl.host).assertEqual(originalHost);
      expect(myUrl.hostname).assertEqual('example.com');
      expect(myUrl.port).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_2900
     * @tc.name testURL01Chapter0029
     * @tc.desc Test setting host with IPv6 and port (should fail gracefully)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHost = myUrl.host;

      myUrl.host = '[::1]:8080';

      expect(myUrl.host).assertEqual(originalHost);
      expect(myUrl.hostname).assertEqual('example.com');
      expect(myUrl.port).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3000
     * @tc.name testURL01Chapter0030
     * @tc.desc Test setting host with special characters (should be allowed in host)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const specialHost: string = 'example!.com';
      myUrl.host = specialHost;
      expect(myUrl.host).assertEqual(specialHost);
      expect(myUrl.hostname).assertEqual(specialHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3100
     * @tc.name testURL01Chapter0031
     * @tc.desc Test setting host with port out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.host = 'example.com:70000';

      expect(myUrl.host).assertEqual('example.com');

      expect(myUrl.hostname).assertEqual('example.com');

      if (myUrl.port !== '') {
        const portNum = parseInt(myUrl.port, 10);
        expect(portNum >= 0 && portNum <= 65535).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3200
     * @tc.name testURL01Chapter0032
     * @tc.desc Test setting host with non-numeric port (invalid port ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHost = myUrl.host;

      myUrl.host = 'example.com:abc';

      expect(myUrl.host).assertEqual(originalHost);
      expect(myUrl.hostname).assertEqual('example.com');
      expect(myUrl.port).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3300
     * @tc.name testURL01Chapter0033
     * @tc.desc Test setting host with emoji (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const emojiHost: string = '👆.com';

      myUrl.host = emojiHost;

      expect(myUrl.host).assertEqual('%F0%9F%91%86.com');

      expect(myUrl.hostname).assertEqual('%F0%9F%91%86.com');

      expect(myUrl.port).assertEqual('');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3400
     * @tc.name testURL01Chapter0034
     * @tc.desc Test setting host with very long string (10k chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const longHost: string = 'a'.repeat(10000) + '.com';
      myUrl.host = longHost;
      expect(myUrl.host).assertEqual(longHost);
      expect(myUrl.hostname).assertEqual(longHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3500
     * @tc.name testURL01Chapter0035
     * @tc.desc Test setting host with string containing colon but no port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.host = 'example.com:';

      expect(myUrl.host).assertEqual('example.com');

      expect(myUrl.hostname).assertEqual('example.com');

      expect(myUrl.port).assertEqual('');
    });

    // =============== hostname ======================
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3600
     * @tc.name testURL01Chapter0036
     * @tc.desc Test setting hostname with empty string (should remain unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user:pass@example.com:8080/path');
      const originalHostname = myUrl.hostname;

      myUrl.hostname = '';

      expect(myUrl.hostname).assertEqual(originalHostname);

      expect(myUrl.host).assertEqual('example.com:8080');

      expect(myUrl.href).assertEqual('https://user:pass@example.com:8080/path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3700
     * @tc.name testURL01Chapter0037
     * @tc.desc Test setting hostname with valid domain (should update host)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com:8080');
      const originalHost = myUrl.host;
      const originalHostname = myUrl.hostname;

      myUrl.hostname = 'sub.example.com';
      expect(myUrl.hostname !== originalHostname).assertTrue();
      expect(myUrl.host).assertEqual(originalHost);
      expect(myUrl.port).assertEqual('8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3800
     * @tc.name testURL01Chapter0038
     * @tc.desc Test setting hostname with IPv4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.hostname = '192.168.1.1';

      expect(myUrl.hostname).assertEqual('192.168.1.1');

      expect(myUrl.host !== myUrl.hostname).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_3900
     * @tc.name testURL01Chapter0039
     * @tc.desc Test setting hostname with IPv6 (without brackets) - should not change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHostname = myUrl.hostname;
      const originalHost = myUrl.host;

      myUrl.hostname = '::1';

      expect(myUrl.hostname).assertEqual(originalHostname);

      expect(myUrl.host).assertEqual(originalHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4000
     * @tc.name testURL01Chapter0040
     * @tc.desc Test setting hostname with special characters (should be allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const specialHostname: string = 'example!.com';
      myUrl.hostname = specialHostname;
      expect(myUrl.hostname).assertEqual(specialHostname);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4100
     * @tc.name testURL01Chapter0041
     * @tc.desc Test setting hostname with emoji (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.hostname = '👆.com';
      expect(myUrl.hostname).assertEqual('%F0%9F%91%86.com');
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4200
     * @tc.name testURL01Chapter0042
     * @tc.desc Test setting hostname with very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const longHostname: string = 'a'.repeat(10000) + '.com';
      myUrl.hostname = longHostname;
      expect(myUrl.hostname).assertEqual(longHostname);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4300
     * @tc.name testURL01Chapter0043
     * @tc.desc Test setting hostname with leading dot (should be allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.hostname = '.example.com';
      expect(myUrl.hostname).assertEqual('.example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4400
     * @tc.name testURL01Chapter0044
     * @tc.desc Test setting hostname with trailing dot (should be removed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.hostname = 'example.com.';

      expect(myUrl.hostname).assertEqual('example.com');
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4500
     * @tc.name testURL01Chapter0045
     * @tc.desc Test setting hostname with port in string (port should be ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com:8080');
      const originalPort = myUrl.port;

      myUrl.hostname = 'sub.example.com:3000';

      expect(myUrl.hostname).assertEqual('sub.example.com');
      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual('example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4600
     * @tc.name testURL01Chapter0046
     * @tc.desc Test setting href with absolute URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.href = 'http://example.org:8080/path?query#frag';
      expect(myUrl.href).assertEqual('http://example.org:8080/path?query#frag');
      expect(myUrl.protocol).assertEqual('http:');
      expect(myUrl.host).assertEqual('example.org:8080');
      expect(myUrl.pathname).assertEqual('/path');
      expect(myUrl.search).assertEqual('?query');
      expect(myUrl.hash).assertEqual('#frag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4700
     * @tc.name testURL01Chapter0047
     * @tc.desc Test setting href with relative URL (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com/path/to/page');
      const originalHref = myUrl.href;
      const originalPathname = myUrl.pathname;

      myUrl.href = '/relative/path';

      expect(myUrl.href).assertEqual(originalHref);
      expect(myUrl.pathname).assertEqual(originalPathname);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4800
     * @tc.name testURL01Chapter0048
     * @tc.desc Test setting href with empty string (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHref = myUrl.href;

      myUrl.href = '';

      expect(myUrl.href).assertEqual(originalHref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_4900
     * @tc.name testURL01Chapter0049
     * @tc.desc Test setting href with invalid URL (missing protocol)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalHref = myUrl.href;

      myUrl.href = 'example.com';

      expect(myUrl.href).assertEqual(originalHref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5000
     * @tc.name testURL01Chapter0050
     * @tc.desc Test setting href with special characters in path (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.href = 'https://example.com/!@#$%^&*()_+{}:"<>?';

      expect(myUrl.href).assertEqual('https://example.com/!@#$%%5E&*()_+{}:%22%3C%3E?');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5100
     * @tc.name testURL01Chapter0051
     * @tc.desc Test setting href with special characters in path (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.href = 'https://example.com/!@#$%^&*()_+{}:"<>?';

      expect(myUrl.href).assertEqual('https://example.com/!@#$%%5E&*()_+{}:%22%3C%3E?');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5200
     * @tc.name testURL01Chapter0052
     * @tc.desc Test setting href with very long URL (10k chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const longPath: string = 'a'.repeat(10000);
      const longUrl: string = 'https://example.com/' + longPath;
      myUrl.href = longUrl;
      expect(myUrl.href).assertEqual(longUrl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5300
     * @tc.name testURL01Chapter0053
     * @tc.desc Test origin getter for standard URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user:pass@example.com:8080/path?query#frag');
      expect(myUrl.origin).assertEqual('https://example.com:8080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5400
     * @tc.name testURL01Chapter0054
     * @tc.desc Test origin getter for default port (should omit port)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com/path');
      expect(myUrl.origin).assertEqual('https://example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5500
     * @tc.name testURL01Chapter0055
     * @tc.desc Test origin getter for file protocol (opaque origin)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('file:///etc/passwd');

      expect(myUrl.origin).assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5600
     * @tc.name testURL01Chapter0056
     * @tc.desc Test origin getter for blob URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('blob:https://example.com/1234-5678');

      expect(myUrl.origin).assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5700
     * @tc.name testURL01Chapter0057
     * @tc.desc Test setting password with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user:pass@example.com');
      myUrl.password = '';
      expect(myUrl.password).assertEqual('');
      expect(myUrl.href).assertEqual('https://user@example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5800
     * @tc.name testURL01Chapter0058
     * @tc.desc Test setting password with special characters (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user@example.com');
      const specialPass: string = '!@#$%^&*()_+{}:"<>?';

      myUrl.password = specialPass;

      expect(myUrl.password).assertEqual('!%40%23$%%5E&*()_+%7B%7D%3A%22%3C%3E%3F');
      expect(myUrl.href).assertEqual('https://user:!%40%23$%%5E&*()_+%7B%7D%3A%22%3C%3E%3F@example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_5900
     * @tc.name testURL01Chapter0059
     * @tc.desc Test setting password with emoji (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user@example.com');
      const emojiPass: string = '👆👿';

      myUrl.password = emojiPass;

      expect(myUrl.password).assertEqual('%F0%9F%91%86%F0%9F%91%BF');
      expect(myUrl.href).assertEqual('https://user:%F0%9F%91%86%F0%9F%91%BF@example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6000
     * @tc.name testURL01Chapter0060
     * @tc.desc Test setting password with very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user@example.com');
      const longPass: string = 'a'.repeat(10000);

      myUrl.password = longPass;

      expect(myUrl.password).assertEqual(longPass);
      expect(myUrl.href.startsWith('https://user:' + longPass + '@example.com/')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6100
     * @tc.name testURL01Chapter0061
     * @tc.desc Test setting password with colon (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://user@example.com');

      myUrl.password = 'pass:word';

      expect(myUrl.password).assertEqual('pass%3Aword');
      expect(myUrl.href).assertEqual('https://user:pass%3Aword@example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6200
     * @tc.name testURL01Chapter0062
     * @tc.desc Test setting pathname with empty string (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com/path/to/resource');
      const originalPathname = myUrl.pathname;
      const originalHref = myUrl.href;

      myUrl.pathname = '';

      expect(myUrl.pathname).assertEqual(originalPathname);
      expect(myUrl.href).assertEqual(originalHref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6300
     * @tc.name testURL01Chapter0063
     * @tc.desc Test setting pathname with root path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.pathname = '/';
      expect(myUrl.pathname).assertEqual('/');
      expect(myUrl.href).assertEqual('https://example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6400
     * @tc.name testURL01Chapter0064
     * @tc.desc Test setting pathname with multiple segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.pathname = '/a/b/c';
      expect(myUrl.pathname).assertEqual('/a/b/c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6500
     * @tc.name testURL01Chapter0065
     * @tc.desc Test setting pathname with special characters (should be percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.pathname = '/!@#$%^&*()_+{}:"<>?';

      expect(myUrl.pathname).assertEqual('/!@#$%%5E&*()_+%7B%7D:%22%3C%3E?');
      expect(myUrl.href).assertEqual('https://example.com/!@#$%%5E&*()_+%7B%7D:%22%3C%3E?');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6600
     * @tc.name testURL01Chapter0066
     * @tc.desc Test setting pathname with emoji (should be percent-encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.pathname = '/👆/👿';

      expect(myUrl.pathname).assertEqual('/%F0%9F%91%86/%F0%9F%91%BF');
      expect(myUrl.href).assertEqual('https://example.com/%F0%9F%91%86/%F0%9F%91%BF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6700
     * @tc.name testURL01Chapter0067
     * @tc.desc Test setting pathname with very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const longPath: string = '/' + 'a'.repeat(10000);
      myUrl.pathname = longPath;
      expect(myUrl.pathname).assertEqual(longPath);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6800
     * @tc.name testURL01Chapter0068
     * @tc.desc Test setting pathname with double slash (should normalize to single?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.pathname = '//a//b';
      expect(myUrl.pathname).assertEqual('//a//b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_6900
     * @tc.name testURL01Chapter0069
     * @tc.desc Test setting port with empty string (should not remove port)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com:8080');
      const originalPort = myUrl.port;
      const originalHost = myUrl.host;

      myUrl.port = '';

      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual(originalHost);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7000
     * @tc.name testURL01Chapter0070
     * @tc.desc Test setting port with valid number (port changes but host may not include it)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.port = '3000';

      expect(myUrl.port).assertEqual('3000');
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7100
     * @tc.name testURL01Chapter0071
     * @tc.desc Test setting port with 0 (valid)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.port = '0';

      expect(myUrl.port).assertEqual('0');
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7200
     * @tc.name testURL01Chapter0072
     * @tc.desc Test setting port with min valid 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.port = '1';
      expect(myUrl.port).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7300
     * @tc.name testURL01Chapter0073
     * @tc.desc Test setting port with max valid 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.port = '65535';
      expect(myUrl.port).assertEqual('65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7400
     * @tc.name testURL01Chapter0074
     * @tc.desc Test setting port with out of range (should be ignored or truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalPort = myUrl.port;

      myUrl.port = '65536';

      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7500
     * @tc.name testURL01Chapter0075
     * @tc.desc Test setting port with negative (should be ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalPort = myUrl.port;

      myUrl.port = '-1';

      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7600
     * @tc.name testURL01Chapter0076
     * @tc.desc Test setting port with non-numeric (should be ignored)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalPort = myUrl.port;

      myUrl.port = 'abc';

      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7700
     * @tc.name testURL01Chapter0077
     * @tc.desc Test setting port with leading zeros (should be normalized)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.port = '0080';

      expect(myUrl.port).assertEqual('80');
      expect(myUrl.host).assertEqual('example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7800
     * @tc.name testURL01Chapter0078
     * @tc.desc Test setting protocol with valid protocol (including colon)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.protocol = 'http:';
      expect(myUrl.protocol).assertEqual('http:');
      expect(myUrl.href).assertEqual('http://example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_7900
     * @tc.name testURL01Chapter0079
     * @tc.desc Test setting protocol without colon (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalProtocol = myUrl.protocol;

      myUrl.protocol = 'ftp';

      expect(myUrl.protocol).assertEqual(originalProtocol);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8000
     * @tc.name testURL01Chapter0080
     * @tc.desc Test setting protocol with invalid protocol (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalProtocol = myUrl.protocol;

      myUrl.protocol = '123:';

      expect(myUrl.protocol).assertEqual(originalProtocol);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8100
     * @tc.name testURL01Chapter0081
     * @tc.desc Test setting protocol with special characters (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalProtocol = myUrl.protocol;

      myUrl.protocol = 'http@:';

      expect(myUrl.protocol).assertEqual(originalProtocol);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8200
     * @tc.name testURL01Chapter0082
     * @tc.desc Test setting protocol with empty string (should not change)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const originalProtocol = myUrl.protocol;

      myUrl.protocol = '';

      expect(myUrl.protocol).assertEqual(originalProtocol);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8300
     * @tc.name testURL01Chapter0083
     * @tc.desc Test setting protocol with file: (special)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.protocol = 'file:';

      expect(myUrl.protocol).assertEqual('file:');
      expect(myUrl.host).assertEqual('example.com');
      expect(myUrl.href).assertEqual('file://example.com/');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8400
     * @tc.name testURL01Chapter0084
     * @tc.desc Test setting search with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com/path?query=1');
      myUrl.search = '';
      expect(myUrl.search).assertEqual('');
      expect(myUrl.href).assertEqual('https://example.com/path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8500
     * @tc.name testURL01Chapter0085
     * @tc.desc Test setting search with query string (including ?)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.search = '?a=1&b=2';
      expect(myUrl.search).assertEqual('?a=1&b=2');
      expect(myUrl.href).assertEqual('https://example.com/?a=1&b=2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8600
     * @tc.name testURL01Chapter0086
     * @tc.desc Test setting search without leading ? (should auto-add)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      myUrl.search = 'a=1';
      expect(myUrl.search).assertEqual('?a=1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8700
     * @tc.name testURL01Chapter0087
     * @tc.desc Test setting search with special characters (should be percent-encoded? maybe not)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const specialSearch: string = '?!@#$%^&*()_+{}:"<>?';
      myUrl.search = specialSearch;
      expect(myUrl.search.startsWith('?')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8800
     * @tc.name testURL01Chapter0088
     * @tc.desc Test setting search with emoji (should be encoded)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');

      myUrl.search = '?👆=👿';

      expect(myUrl.search).assertEqual('?%F0%9F%91%86=%F0%9F%91%BF');
      expect(myUrl.href).assertEqual('https://example.com/?%F0%9F%91%86=%F0%9F%91%BF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_URLTestONE_8900
     * @tc.name testURL01Chapter0089
     * @tc.desc Test setting search with very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testURL01Chapter0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myUrl = URL.parseURL('https://example.com');
      const longSearch: string = '?' + 'a'.repeat(10000);
      myUrl.search = longSearch;
      expect(myUrl.search).assertEqual(longSearch);
    });
  });
}
