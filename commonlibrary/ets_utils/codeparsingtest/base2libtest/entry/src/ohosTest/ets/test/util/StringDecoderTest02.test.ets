import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import util from '@ohos.util';

export default function StringDecoder02Test(): void {
  describe('StringDecoder02Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
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

    const UTF8 = 'utf-8';
    const UTF16 = 'utf-16';
    const UTF16LE = 'utf-16le';
    const UTF16BE = 'utf-16be';

    const strToUint8Array = (str: string, encoding: string = UTF8): Uint8Array => {
      const encoder: util.TextEncoder = new util.TextEncoder(encoding);
      return encoder.encode(str);
    };

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0100
     * @tc.name      testWriteUtf8BasicString0001
     * @tc.desc      Decode basic string with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8BasicString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8BasicString0001";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = strToUint8Array('hello world');
        const result: string = decoder.write(input);
        expect(result).assertEqual('hello world');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0200
     * @tc.name      testWriteUtf8ChineseString0002
     * @tc.desc      Decode Chinese string with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8ChineseString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8ChineseString0002";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = strToUint8Array('鸿蒙系统');
        const result: string = decoder.write(input);
        expect(result).assertEqual('鸿蒙系统');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1800
     * @tc.name      testWriteUtf16leBasicString0018
     * @tc.desc      Decode basic string with UTF-16LE encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf16leBasicString0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf16leBasicString0018";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF16LE);
        const input: Uint8Array = strToUint8Array('world', UTF16LE);
        const result: string = decoder.write(input);
        expect(result).assertEqual('world');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1900
     * @tc.name      testWriteUtf16beBasicString0019
     * @tc.desc      Decode basic string with UTF-16BE encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf16beBasicString0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf16beBasicString0019";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF16BE);
        const input: Uint8Array = strToUint8Array('test', UTF16BE);
        const result: string = decoder.write(input);
        expect(result).assertEqual('test');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_2000
     * @tc.name      testWriteUtf8SplitChunks0020
     * @tc.desc      Decode split chunks with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8SplitChunks0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8SplitChunks0020";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input1: Uint8Array = strToUint8Array('hello ');
        const input2: Uint8Array = strToUint8Array('world');

        const result1: string = decoder.write(input1);
        const result2: string = decoder.write(input2);

        expect(result1).assertEqual('hello ');
        expect(result2).assertEqual('world');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_2100
     * @tc.name      testWriteUtf8PartialChar0021
     * @tc.desc      Decode partial character with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8PartialChar0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8PartialChar0021";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const part1: Uint8Array = new Uint8Array([0xE9, 0xB8]);
        const part2: Uint8Array = new Uint8Array([0xBF]);
        const result1: string = decoder.write(part1);
        const result2: string = decoder.write(part2);
        expect(result1).assertEqual('');
        expect(result2).assertEqual('鸿');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_2200
     * @tc.name      testWriteUtf8SpecialCharacters0022
     * @tc.desc      Decode special characters with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8SpecialCharacters0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8SpecialCharacters0022";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = strToUint8Array('!@#$%^&*()_+-=[]{}|;:,.<>?`~');
        const result: string = decoder.write(input);
        expect(result).assertEqual('!@#$%^&*()_+-=[]{}|;:,.<>?`~');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_2300
     * @tc.name      testWriteUtf8EmojiCharacters0023
     * @tc.desc      Decode emoji characters with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8EmojiCharacters0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8EmojiCharacters0023";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = strToUint8Array('😀😂🤣😜😝');
        const result: string = decoder.write(input);
        expect(result).assertEqual('😀😂🤣😜😝');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_0900
     * @tc.name      testWriteUtf8LongString0009
     * @tc.desc      Decode long string with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8LongString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8LongString0009";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const longStr: string = 'a'.repeat(10000);
        const input: Uint8Array = strToUint8Array(longStr)
        const result: string = decoder.write(input);
        expect(result).assertEqual(longStr);

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1000
     * @tc.name      testWriteUtf8MixedLanguage0010
     * @tc.desc      Decode mixed language string with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8MixedLanguage0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8MixedLanguage0010";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = strToUint8Array('Hello 鸿蒙 こんにちは 안녕하세요');
        const result: string = decoder.write(input);
        expect(result).assertEqual('Hello 鸿蒙 こんにちは 안녕하세요');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1100
     * @tc.name      testWriteUtf8ControlCharacters0011
     * @tc.desc      Decode control characters with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8ControlCharacters0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8ControlCharacters0011";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = new Uint8Array([0x00, 0x01, 0x02, 0x03, 0x04, 0x05]);
        const result: string = decoder.write(input);
        expect(result).assertEqual('\x00\x01\x02\x03\x04\x05');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1200
     * @tc.name      testWriteUtf8InvalidBytes0012
     * @tc.desc      Decode invalid bytes with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8InvalidBytes0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8InvalidBytes0012";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const input: Uint8Array = new Uint8Array([0xFF, 0xFE, 0xFD]);
        const result: string = decoder.write(input);
        expect(result.length).assertEqual(3);

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1300
     * @tc.name      testWriteMultipleCalls0013
     * @tc.desc      Multiple calls to write method for decoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteMultipleCalls0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteMultipleCalls0013";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const parts: string[] = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'];

        let fullResult: string = '';
        for (const part of parts) {
          const input: Uint8Array = strToUint8Array(part);
          fullResult += decoder.write(input);
        }

        expect(fullResult).assertEqual('hello world');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1400
     * @tc.name      testWriteUtf8WithBom0014
     * @tc.desc      Decode with BOM in UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf8WithBom0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf8WithBom0014";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);
        const bom: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF]);
        const content: Uint8Array = strToUint8Array('test');
        const input: Uint8Array = new Uint8Array([...bom, ...content]);

        const result: string = decoder.write(input);
        expect(result).assertEqual('\uFEFFtest');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1500
     * @tc.name      testWriteUtf16leWithBom0015
     * @tc.desc      Decode with BOM in UTF-16LE encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf16leWithBom0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf16leWithBom0015";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF16LE);
        const bom: Uint8Array = new Uint8Array([0xFF, 0xFE]);
        const content: Uint8Array = strToUint8Array('test', UTF16LE);
        const input: Uint8Array = new Uint8Array([...bom, ...content]);

        const result: string = decoder.write(input);
        expect(result).assertEqual('\uFEFFtest');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1600
     * @tc.name      testWriteUtf16beWithBom0016
     * @tc.desc      Decode with BOM in UTF-16BE encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteUtf16beWithBom0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteUtf16beWithBom0016";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF16BE);
        const bom: Uint8Array = new Uint8Array([0xFE, 0xFF]);
        const content: Uint8Array = strToUint8Array('test', UTF16BE);
        const input: Uint8Array = new Uint8Array([...bom, ...content]);

        const result: string = decoder.write(input);
        expect(result).assertEqual('\uFEFFtest');

      });

    /**
     * @tc.number    SUB_UTIL_STRINGDECODER_WRITE_1700
     * @tc.name      testWriteReuseDecoderInstance0017
     * @tc.desc      Reuse decoder instance for multiple write operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testWriteReuseDecoderInstance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testWriteReuseDecoderInstance0017";
        console.log(TAG + " start");
        const decoder: util.StringDecoder = new util.StringDecoder(UTF8);

        const result1: string = decoder.write(strToUint8Array('hello'));
        const result2: string = decoder.write(strToUint8Array(' '));
        const result3: string = decoder.write(strToUint8Array('world'));

        expect(result1).assertEqual('hello');
        expect(result2).assertEqual(' ');
        expect(result3).assertEqual('world');

      });
  });
}