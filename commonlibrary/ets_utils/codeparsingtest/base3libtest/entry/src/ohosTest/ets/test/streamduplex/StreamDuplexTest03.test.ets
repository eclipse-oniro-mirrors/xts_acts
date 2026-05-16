import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamDuplex03Test() {
  describe('StreamDuplex03Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0100
     * @tc.name      testStreamDuplex03Chapter0001
     * @tc.desc      Test doFlush with composite data structure (final comprehensive test)
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let result = duplexStream.setDefaultEncoding('utf8');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0200
     * @tc.name      testStreamDuplex03Chapter0002
     * @tc.desc      Test setDefaultEncoding with valid encoding
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let result = duplexStream.setDefaultEncoding('utf8');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0300
     * @tc.name      testStreamDuplex03Chapter0003
     * @tc.desc      Test setDefaultEncoding with valid encoding 'gb18030'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let result = duplexStream.setDefaultEncoding('gb18030');
        expect(result).assertEqual(true);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0400
     * @tc.name      testStreamDuplex03Chapter0004
     * @tc.desc      Test setDefaultEncoding with valid encoding 'gbk'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let result = duplexStream.setDefaultEncoding('gbk');
        expect(result).assertEqual(true);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0500
     * @tc.name      testStreamDuplex03Chapter0005
     * @tc.desc      Test setDefaultEncoding with valid encoding 'gb2312'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let result = duplexStream.setDefaultEncoding('gb2312');
        expect(result).assertEqual(true);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0600
     * @tc.name      testStreamDuplex03Chapter0006
     * @tc.desc      Test setDefaultEncoding with default parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let result = duplexStream.setDefaultEncoding();
        expect(result).assertEqual(false);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0700
     * @tc.name      testStreamDuplex03Chapter0007
     * @tc.desc      Test setDefaultEncoding with empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        try {
          let result = duplexStream.setDefaultEncoding('');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0800
     * @tc.name      testStreamDuplex03Chapter0008
     * @tc.desc      Test setDefaultEncoding with special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
        try {
          let result = duplexStream.setDefaultEncoding(specialChars);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_0900
     * @tc.name      testStreamDuplex03Chapter0009
     * @tc.desc      Test setDefaultEncoding with ASCII characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let asciiChars =
          '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        try {
          let result = duplexStream.setDefaultEncoding(asciiChars);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1000
     * @tc.name      testStreamDuplex03Chapter0010
     * @tc.desc      Test setDefaultEncoding with repeated special characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let repeatedChars = ' !!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        try {
          let result = duplexStream.setDefaultEncoding(repeatedChars);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1100
     * @tc.name      testStreamDuplex03Chapter0011
     * @tc.desc      Test setDefaultEncoding with escape characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let escapeStr = '\a\b\f\n\r\t\v\\\'\"\?';
        try {
          let result = duplexStream.setDefaultEncoding(escapeStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1200
     * @tc.name      testStreamDuplex03Chapter0012
     * @tc.desc      Test setDefaultEncoding with emoji characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let emojiStr = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
        try {
          let result = duplexStream.setDefaultEncoding(emojiStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1300
     * @tc.name      testStreamDuplex03Chapter0013
     * @tc.desc      Test setDefaultEncoding with invalid Unicode encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        try {
          let result = duplexStream.setDefaultEncoding('\udc04');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1400
     * @tc.name      testStreamDuplex03Chapter0014
     * @tc.desc      Test setDefaultEncoding with keyword-like strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let keywords = ['0', 'NaN', 'undefined', 'null', 'true', 'false'];
        for (let keyword of keywords) {
          try {
            let result = duplexStream.setDefaultEncoding(keyword);
            expect(result).assertEqual(false);
          } catch (err) {
            expect(err.code).assertEqual(401);
          }
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1500
     * @tc.name      testStreamDuplex03Chapter0015
     * @tc.desc      Test setDefaultEncoding with very long string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let longStr = 'a'.repeat(1000000);
        try {
          let result = duplexStream.setDefaultEncoding(longStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1600
     * @tc.name      testStreamDuplex03Chapter0016
     * @tc.desc      Test setDefaultEncoding with number parameter (should fail at runtime).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        try {
          let result = duplexStream.setDefaultEncoding('123');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1700
     * @tc.name      testStreamDuplex03Chapter0017
     * @tc.desc      Test setDefaultEncoding with boolean parameter as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        try {
          let result = duplexStream.setDefaultEncoding('true');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1800
     * @tc.name      testStreamDuplex03Chapter0018
     * @tc.desc      Test setDefaultEncoding with null as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        try {
          let result = duplexStream.setDefaultEncoding('null');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_1900
     * @tc.name      testStreamDuplex03Chapter0019
     * @tc.desc      Test setDefaultEncoding with mixed valid and invalid encodings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let mixedEncodings = ['utf8extra', 'gbk-plus', 'gb2312ext'];
        for (let enc of mixedEncodings) {
          try {
            let result = duplexStream.setDefaultEncoding(enc);
            expect(result).assertEqual(false);
          } catch (err) {
            expect(err.code).assertEqual(401);
          }
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2000
     * @tc.name      testStreamDuplex03Chapter0020
     * @tc.desc      Test setDefaultEncoding with case-sensitive encoding names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let caseVariants = ['UTF8', 'Utf8', 'GBK', 'Gb2312'];
        for (let enc of caseVariants) {
          try {
            let result = duplexStream.setDefaultEncoding(enc);
          } catch (err) {
            expect(err.code).assertEqual(401);
          }
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2100
     * @tc.name      testStreamDuplex03Chapter0021
     * @tc.desc      Test setDefaultEncoding with whitespace characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let whitespaceStr = '  utf8  ';
        try {
          let result = duplexStream.setDefaultEncoding(whitespaceStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2200
     * @tc.name      testStreamDuplex03Chapter0022
     * @tc.desc      Test setDefaultEncoding with control characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let controlChars = '\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0A\x0B\x0C\x0D\x0E\x0F';
        try {
          let result = duplexStream.setDefaultEncoding(controlChars);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2300
     * @tc.name      testStreamDuplex03Chapter0023
     * @tc.desc      Test setDefaultEncoding with octal escape sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let octalStr = 'ABC';
        try {
          let result = duplexStream.setDefaultEncoding(octalStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2400
     * @tc.name      testStreamDuplex03Chapter0024
     * @tc.desc      Test setDefaultEncoding with hexadecimal escape sequences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let hexStr = '\x41\x42\x43';
        try {
          let result = duplexStream.setDefaultEncoding(hexStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2500
     * @tc.name      testStreamDuplex03Chapter0025
     * @tc.desc      Test setDefaultEncoding with string containing only numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let numberStrings = ['0', '123', '1.23', '1e3', '0x10'];
        for (let numStr of numberStrings) {
          try {
            let result = duplexStream.setDefaultEncoding(numStr);
            expect(result).assertEqual(false);
          } catch (err) {
            expect(err.code).assertEqual(401);
          }
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2600
     * @tc.name      testStreamDuplex03Chapter0026
     * @tc.desc      Test setDefaultEncoding with string containing valid encoding as part of larger string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let embeddedStrings = ['utf8-gbk', 'encoding:utf8', 'gbk;gb2312'];
        for (let str of embeddedStrings) {
          try {
            let result = duplexStream.setDefaultEncoding(str);
            expect(result).assertEqual(false);
          } catch (err) {
            expect(err.code).assertEqual(401);
          }
        }
      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2700
     * @tc.name      testStreamDuplex03Chapter0027
     * @tc.desc      Test setDefaultEncoding with string containing all supported encodings concatenated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let allEncodings = 'utf8gb18030gbkgb2312';
        try {
          let result = duplexStream.setDefaultEncoding(allEncodings);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2800
     * @tc.name      testStreamDuplex03Chapter0028
     * @tc.desc      Test setDefaultEncoding with very short valid encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let shortStr = 'u';
        try {
          let result = duplexStream.setDefaultEncoding(shortStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_2900
     * @tc.name      testStreamDuplex03Chapter0029
     * @tc.desc      Test setDefaultEncoding with string containing only delimiter characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let delimiterStr = '.,;:!?';
        try {
          let result = duplexStream.setDefaultEncoding(delimiterStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3000
     * @tc.name      testStreamDuplex03Chapter0030
     * @tc.desc      Test setDefaultEncoding multiple times with different valid encodings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let encodings = ['utf8', 'gbk', 'gb2312', 'gb18030'];
        for (let enc of encodings) {
          let result = duplexStream.setDefaultEncoding(enc);
          expect(result).assertEqual(true);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3100
     * @tc.name      testStreamDuplex03Chapter0031
     * @tc.desc      Test setDefaultEncoding with string containing null character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }
          doRead(size: number) {
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }
        }
        let duplexStream = new TestDuplex();
        let nullCharStr = 'utf8\0';
        try {
          let result = duplexStream.setDefaultEncoding(nullCharStr);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3200
     * @tc.name      testStreamDuplex03Chapter0032
     * @tc.desc      Test setDefaultEncoding with null parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(null));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3300
     * @tc.name      testStreamDuplex03Chapter0033
     * @tc.desc      Test setDefaultEncoding with undefined parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(undefined));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3400
     * @tc.name      testStreamDuplex03Chapter0034
     * @tc.desc      Test setDefaultEncoding with number parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(123));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3500
     * @tc.name      testStreamDuplex03Chapter0035
     * @tc.desc      Test setDefaultEncoding with boolean true parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(true));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3600
     * @tc.name      testStreamDuplex03Chapter0036
     * @tc.desc      Test setDefaultEncoding with boolean false parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(false));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3700
     * @tc.name      testStreamDuplex03Chapter0037
     * @tc.desc      Test setDefaultEncoding with array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(['utf8', 'gbk']));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3800
     * @tc.name      testStreamDuplex03Chapter0038
     * @tc.desc      Test setDefaultEncoding with object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String({ encoding: 'utf8' }));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_3900
     * @tc.name      testStreamDuplex03Chapter0039
     * @tc.desc      Test setDefaultEncoding with Symbol parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding('Symbol(utf8)');
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4000
     * @tc.name      testStreamDuplex03Chapter0040
     * @tc.desc      Test setDefaultEncoding with function parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
          let result = duplexStream.setDefaultEncoding(String(() => 'utf8'));
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4100
     * @tc.name      testStreamDuplex03Chapter0041
     * @tc.desc      Test setDefaultEncoding with regular expression parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(/utf8/));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4200
     * @tc.name      testStreamDuplex03Chapter0042
     * @tc.desc      Test setDefaultEncoding with Date parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(new Date()));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4300
     * @tc.name      testStreamDuplex03Chapter0043
     * @tc.desc      Test setDefaultEncoding with Map parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let map = new Map<string, string>();
        map.set('encoding', 'utf8');
        let result = duplexStream.setDefaultEncoding(String(map));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4400
     * @tc.name      testStreamDuplex03Chapter0044
     * @tc.desc      Test setDefaultEncoding with Set parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let set = new Set(['utf8', 'gbk']);
        let result = duplexStream.setDefaultEncoding(String(set));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4500
     * @tc.name      testStreamDuplex03Chapter0045
     * @tc.desc      Test setDefaultEncoding with Promise parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let promise = Promise.resolve('utf8');
        let result = duplexStream.setDefaultEncoding(String(promise));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4600
     * @tc.name      testStreamDuplex03Chapter0046
     * @tc.desc      Test setDefaultEncoding with BigInt parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(123n));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4700
     * @tc.name      testStreamDuplex03Chapter0047
     * @tc.desc      Test setDefaultEncoding with TypedArray parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let typedArray = new Uint8Array([117, 116, 102, 56]);
        let result = duplexStream.setDefaultEncoding(String(typedArray));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4800
     * @tc.name      testStreamDuplex03Chapter0048
     * @tc.desc      Test setDefaultEncoding with NaN parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(NaN));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_4900
     * @tc.name      testStreamDuplex03Chapter0049
     * @tc.desc      Test setDefaultEncoding with Infinity parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(Infinity));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5000
     * @tc.name      testStreamDuplex03Chapter0050
     * @tc.desc      Test setDefaultEncoding with -Infinity parameter directly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number): void {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      try {
        let result = duplexStream.setDefaultEncoding(String(-Infinity));
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5100
     * @tc.name      testStreamDuplex03Chapter0051
     * @tc.desc      Test setDefaultEncoding with very large string (memory test).
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let hugeString = 'a'.repeat(1000);
      try {
        let result = duplexStream.setDefaultEncoding(hugeString);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5200
     * @tc.name      testStreamDuplex03Chapter0052
     * @tc.desc      Test setDefaultEncoding with treeString type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let treeString = '[';
      while (treeString.length < 1000) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';
      try {
        let result = duplexStream.setDefaultEncoding(treeString);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5300
     * @tc.name      testStreamDuplex03Chapter0053
     * @tc.desc      Test setDefaultEncoding with sliceString type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let str = "{k1:value1,k2:value2}";
      let sliceStr = str.substring(0, str.length - 2);
      try {
        let result = duplexStream.setDefaultEncoding(sliceStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5400
     * @tc.name      testStreamDuplex03Chapter0054
     * @tc.desc      Test setDefaultEncoding with number.MAX_VALUE as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let maxValueStr = Number.MAX_VALUE.toString();
      try {
        let result = duplexStream.setDefaultEncoding(maxValueStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5500
     * @tc.name      testStreamDuplex03Chapter0055
     * @tc.desc      Test setDefaultEncoding with number.MIN_VALUE as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let minValueStr = Number.MIN_VALUE.toString();
      try {
        let result = duplexStream.setDefaultEncoding(minValueStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5600
     * @tc.name      testStreamDuplex03Chapter0056
     * @tc.desc      Test setDefaultEncoding with number.EPSILON as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let epsilonStr = Number.EPSILON.toString();
      try {
        let result = duplexStream.setDefaultEncoding(epsilonStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5700
     * @tc.name      testStreamDuplex03Chapter0057
     * @tc.desc      Test setDefaultEncoding with Number.MAX_SAFE_INTEGER as string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let maxSafeIntStr = Number.MAX_SAFE_INTEGER.toString();
      try {
        let result = duplexStream.setDefaultEncoding(maxSafeIntStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5800
     * @tc.name      testStreamDuplex03Chapter0058
     * @tc.desc      Test setDefaultEncoding with scientific notation string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let sciNotation = ['1e3', '2.5e-2', '1.23e+10'];
      for (let str of sciNotation) {
        try {
          let result = duplexStream.setDefaultEncoding(str);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_5900
     * @tc.name      testStreamDuplex03Chapter0059
     * @tc.desc      Test setDefaultEncoding with hexadecimal string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let hexStrings = ['0x0102', '0x01020304', '0x3'];
      for (let str of hexStrings) {
        try {
          let result = duplexStream.setDefaultEncoding(str);
          expect(result).assertEqual(false);
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_6000
     * @tc.name      testStreamDuplex03Chapter0060
     * @tc.desc      Test setDefaultEncoding with exponent operator string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let exponentStr = '2**3';
      try {
        let result = duplexStream.setDefaultEncoding(exponentStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTHREE_6100
     * @tc.name      testStreamDuplex03Chapter0061
     * @tc.desc      Test setDefaultEncoding with BigInt string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex03Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }
        doRead(size: number) {
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let duplexStream = new TestDuplex();
      let bigIntStr = BigInt(0xdecafafecacefade).toString();
      try {
        let result = duplexStream.setDefaultEncoding(bigIntStr);
        expect(result).assertEqual(false);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
  })
}
