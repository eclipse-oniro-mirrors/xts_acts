/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { url } from '@kit.ArkTS';

export default function URL01Test(): void {
  describe('URL01Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
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
      let urlObj = url.URL.parseURL('https://example.com/path#frag');
      urlObj.hash = '';
      expect(urlObj.hash).assertEqual('');
      expect(urlObj.href).assertEqual('https://example.com/path');
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
      let urlObj = url.URL.parseURL('https://example.com');
      urlObj.hash = 'undefined';
      expect(urlObj.hash).assertEqual('#undefined');
      urlObj.hash = 'null';
      expect(urlObj.hash).assertEqual('#null');
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
      let urlObj = url.URL.parseURL('https://example.com');
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      urlObj.hash = specialChars;

      const expectedHash: string = '#!%22#$%&\'()*+,-./:;%3C=%3E?@[%5C]%5E_`{|}~';

      expect(urlObj.hash).assertEqual(expectedHash);
      expect(urlObj.href).assertEqual('https://example.com/' + expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');
      let asciiFull: string = '';
      for (let i: int = 32; i <= 126; i++) {
        asciiFull += String.fromCharCode(i);
      }
      urlObj.hash = asciiFull;

      const expectedHash: string =
        '#%20!%22#$%&\'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[%5C]%5E_`abcdefghijklmnopqrstuvwxyz{|}~';

      expect(urlObj.hash).assertEqual(expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');
      const repeated: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      urlObj.hash = repeated;

      const expectedHash: string =
        '#!!%22%22##$$%%&&\'\'(())**++,,--..//::;;%3C%3C==%3E%3E??@@[[%5C%5C]]%5E%5E__``{{||}}~~';

      expect(urlObj.hash).assertEqual(expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');

      const escapes: string = '\\\'\"?\0';
      urlObj.hash = escapes;

      const expectedHash: string = '#%5C\'%22?%00';
      expect(urlObj.hash).assertEqual(expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');
      const octalHex: string = '\x61\x61';
      urlObj.hash = octalHex;
      expect(urlObj.hash).assertEqual('#aa');
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
      let urlObj = url.URL.parseURL('https://example.com');

      const emoji: string = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const unicodeEscapes: string =
        '\uD83D\uDC46\uD83D\uDC7F\uD83D\uDC40\uD83D\uDCAF\uD83C\uDF85\uD83D\uDE3C\uD83D\uDD27\uD83D\uDC87\uD83E\uDD3C\u200D\u2642\uFE0F\uD83D\uDEE2\uD83C\uDC04\uD83C\uDFF4';

      const expectedHash: string =
        '#%F0%9F%91%86%F0%9F%91%BF%F0%9F%91%80%F0%9F%92%AF%F0%9F%8E%85%F0%9F%98%BC%F0%9F%94%A7%F0%9F%92%87%F0%9F%A4%BC%E2%80%8D%E2%99%82%EF%B8%8F%F0%9F%9B%A2%F0%9F%80%84%F0%9F%8F%B4';

      urlObj.hash = emoji;
      expect(urlObj.hash).assertEqual(expectedHash);

      urlObj.hash = unicodeEscapes;
      expect(urlObj.hash).assertEqual(expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');

      const invalid: string = '\uD83D\uDC46\uD83D';
      urlObj.hash = invalid;

      const expectedHash: string = '#%F0%9F%91%86%EF%BF%BD';

      expect(urlObj.hash).assertEqual(expectedHash);
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
      let urlObj = url.URL.parseURL('https://example.com');
      urlObj.hash = '0';
      expect(urlObj.hash).assertEqual('#0');
      urlObj.hash = 'NaN';
      expect(urlObj.hash).assertEqual('#NaN');
      urlObj.hash = 'Infinity';
      expect(urlObj.hash).assertEqual('#Infinity');
      urlObj.hash = '-Infinity';
      expect(urlObj.hash).assertEqual('#-Infinity');
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
      let urlObj = url.URL.parseURL('https://example.com');
      const large: string = 'a'.repeat(10000);
      urlObj.hash = large;
      expect(urlObj.hash.length).assertEqual(10001);
      expect(urlObj.hash.substring(1)).assertEqual(large);
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
      let urlObj = url.URL.parseURL('https://example.com');

      let treeStr: string = '[';
      for (let i: int = 0; i < 100; i++) {
        treeStr += '{"a":1},';
      }
      treeStr += '{"a":1}]';
      urlObj.hash = treeStr;

      let expectedTreeStr: string = '[';
      for (let i: int = 0; i < 100; i++) {
        expectedTreeStr += '{%22a%22:1},';
      }
      expectedTreeStr += '{%22a%22:1}]';

      expect(urlObj.hash).assertEqual('#' + expectedTreeStr);
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
      let urlObj = url.URL.parseURL('https://example.com');
      let base: string = '{k1:value1,k2:value2}';
      let sliced: string = base.substring(0, base.length - 2);
      urlObj.hash = sliced;
      expect(urlObj.hash).assertEqual('#' + sliced);
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
      let urlObj = url.URL.parseURL('https://user:pass@example.com:8080/path');

      urlObj.host = '';

      expect(urlObj.host).assertEqual('example.com:8080');
      expect(urlObj.hostname).assertEqual('example.com');
      expect(urlObj.port).assertEqual('8080');
      expect(urlObj.href).assertEqual('https://user:pass@example.com:8080/path');
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
      let urlObj = url.URL.parseURL('https://example.com');
      urlObj.host = 'sub.example.com:3000';
      expect(urlObj.host).assertEqual('sub.example.com:3000');
      expect(urlObj.hostname).assertEqual('sub.example.com');
      expect(urlObj.port).assertEqual('3000');
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
      let urlObj = url.URL.parseURL('https://example.com');
      urlObj.host = '192.168.1.1';
      expect(urlObj.host).assertEqual('192.168.1.1');
      expect(urlObj.hostname).assertEqual('192.168.1.1');
      expect(urlObj.port).assertEqual('');
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

      let urlObj = url.URL.parseURL('https://[::1]/path');

      expect(urlObj.host).assertEqual('[::1]');
      expect(urlObj.hostname).assertEqual('[::1]');
      expect(urlObj.port).assertEqual('');
      expect(urlObj.href).assertEqual('https://[::1]/path');

      let urlWithPort = url.URL.parseURL('https://[::1]:8080/path');
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

      let urlObj = url.URL.parseURL('https://[::1]:8080/path');

      expect(urlObj.host).assertEqual('[::1]:8080');
      expect(urlObj.hostname).assertEqual('[::1]');
      expect(urlObj.port).assertEqual('8080');
      expect(urlObj.href).assertEqual('https://[::1]:8080/path');
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
      let urlObj = url.URL.parseURL('https://example.com');
      const specialHost: string = 'example!.com';
      urlObj.host = specialHost;

      expect(urlObj.host).assertEqual(specialHost);
      expect(urlObj.hostname).assertEqual(specialHost);
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
      let urlObj = url.URL.parseURL('https://example.com');

      urlObj.host = 'example.com:70000';

      expect(urlObj.host).assertEqual('example.com');
      expect(urlObj.hostname).assertEqual('example.com');
      expect(urlObj.port).assertEqual('');
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
      let urlObj = url.URL.parseURL('https://example.com');

      const invalidPorts = ['abc', '12ab', 'http', 'port', '123abc'];

      invalidPorts.forEach(port => {
        urlObj.host = 'example.com:' + port;
        expect(urlObj.host).assertEqual('example.com');
        expect(urlObj.hostname).assertEqual('example.com');
        expect(urlObj.port).assertEqual('');
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
      let urlObj = url.URL.parseURL('https://example.com');
      const emojiHost: string = '👆.com';
      urlObj.host = emojiHost;

      expect(urlObj.host).assertEqual('%F0%9F%91%86.com');
      expect(urlObj.hostname).assertEqual('%F0%9F%91%86.com');

      expect(urlObj.href).assertEqual('https://%F0%9F%91%86.com/');
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
      let urlObj = url.URL.parseURL('https://example.com');
      const longHost: string = 'a'.repeat(10000) + '.com';
      urlObj.host = longHost;
      expect(urlObj.host).assertEqual(longHost);
      expect(urlObj.hostname).assertEqual(longHost);
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
      let urlObj = url.URL.parseURL('https://example.com');

      urlObj.host = 'example.com:';

      expect(urlObj.host).assertEqual('example.com');
      expect(urlObj.hostname).assertEqual('example.com');
      expect(urlObj.port).assertEqual('');
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
      let myUrl = url.URL.parseURL('https://user:pass@example.com:8080/path');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.host = 'example.com:70000';

      expect(myUrl.host).assertEqual('example.com');

      expect(myUrl.hostname).assertEqual('example.com');

      if (myUrl.port !== '') {
        const portNum = parseInt(myUrl.port, 10);
        expect(portNum >= 0 && portNum <= 65535).assertFalse();
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://user:pass@example.com:8080/path');
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
      let myUrl = url.URL.parseURL('https://example.com:8080');
      const originalHost = myUrl.host;
      const originalHostname = myUrl.hostname;

      myUrl.hostname = 'sub.example.com';
      expect(myUrl.hostname !== originalHostname).assertTrue();
      expect(myUrl.host).assertEqual('sub.example.com:8080');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.hostname = '192.168.1.1';

      expect(myUrl.hostname).assertEqual('192.168.1.1');

      expect(myUrl.host).assertEqual('192.168.1.1');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.hostname = '👆.com';
      expect(myUrl.hostname).assertEqual('%F0%9F%91%86.com');
      expect(myUrl.host).assertEqual('%F0%9F%91%86.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com:8080');
      const originalPort = myUrl.port;

      myUrl.hostname = 'sub.example.com:3000';

      expect(myUrl.hostname).assertEqual('sub.example.com');
      expect(myUrl.port).assertEqual(originalPort);
      expect(myUrl.host).assertEqual('sub.example.com:8080');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com/path/to/page');
      const originalHref = myUrl.href;
      const originalPathname = myUrl.pathname;

      try {
        myUrl.href = '/relative/path';
      } catch (e) {
      }
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
      let myUrl = url.URL.parseURL('https://example.com');
      const originalHref = myUrl.href;

      try {
        myUrl.href = '';
      } catch (e) {
      }
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
      let myUrl = url.URL.parseURL('https://example.com');
      const originalHref = myUrl.href;

      try {
        myUrl.href = 'example.com';
      } catch (e) {
      }
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://user:pass@example.com:8080/path?query#frag');
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
      let myUrl = url.URL.parseURL('https://example.com/path');
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
      let myUrl = url.URL.parseURL('file:///etc/passwd');

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
      let myUrl = url.URL.parseURL('blob:https://example.com/1234-5678');

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
      let myUrl = url.URL.parseURL('https://user:pass@example.com');
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
      let myUrl = url.URL.parseURL('https://user@example.com');
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
      let myUrl = url.URL.parseURL('https://user@example.com');
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
      let myUrl = url.URL.parseURL('https://user@example.com');
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
      let myUrl = url.URL.parseURL('https://user@example.com');

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
      let myUrl = url.URL.parseURL('https://example.com/path/to/resource');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com:8080');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.port = '3000';

      expect(myUrl.port).assertEqual('3000');
      expect(myUrl.host).assertEqual('example.com:3000');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.port = '0';

      expect(myUrl.port).assertEqual('0');
      expect(myUrl.host).assertEqual('example.com:0');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

      myUrl.port = '0080';

      expect(myUrl.port).assertEqual('80');
      expect(myUrl.host).assertEqual('example.com:80');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com/path?query=1');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');
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
      let myUrl = url.URL.parseURL('https://example.com');

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
      let myUrl = url.URL.parseURL('https://example.com');
      const longSearch: string = '?' + 'a'.repeat(10000);
      myUrl.search = longSearch;
      expect(myUrl.search).assertEqual(longSearch);
    });
  });
}
