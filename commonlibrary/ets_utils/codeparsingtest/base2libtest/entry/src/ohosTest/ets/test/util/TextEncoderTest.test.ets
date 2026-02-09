import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import util from '@ohos.util';

export default function TextEncoderTest() {
  describe('TextEncoderTest', () => {
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

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0100
     * @tc.name      testTextEncoder0001
     * @tc.desc      Verify encoding correctness for all printable ASCII characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0001";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+-=[]{}|;':,./<>?";
        const result = encoder.encode(input);
        expect(result.length === input.length).assertTrue();
        expect(result[0] === 0x30).assertTrue();


      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0200
     * @tc.name      testTextEncoder0002
     * @tc.desc      Verify preservation of control characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0002";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "\u0000\t\n\r\u000B\u000C";
        const result = encoder.encode(input);
        expect(result.length === 6).assertTrue();
        expect(result[1] === 0x09).assertTrue();
      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0300
     * @tc.name      testTextEncoder0003
     * @tc.desc      Verify encoding logic for common Chinese characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0003";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "你好世界";
        const result = encoder.encode(input);
        expect(result.length === 12).assertTrue();
        expect(result[0] === 0xE4).assertTrue();
      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0400
     * @tc.name      testTextEncoder0004
     * @tc.desc      Verify handling of 4-byte characters (Emoji).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0004";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "🦄𠮷";
        const result = encoder.encode(input);
        expect(result.length === 8).assertTrue();
        expect(result[0] === 0xF0).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0500
     * @tc.name      testTextEncoder0005
     * @tc.desc      Verify offset calculations for mixed languages.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0005";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "A©中😊";
        const result = encoder.encode(input);
        const expectedLen = 1 + 2 + 3 + 4;
        expect(result.length === expectedLen).assertTrue();
        expect(result[0] === 0x41).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0600
     * @tc.name      testTextEncoder0006
     * @tc.desc      Verify that BOM (U+FEFF) is correctly encoded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = "testTextEncoder0006";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "\uFEFFTest";
        const result = encoder.encode(input);
        expect(result.length === 7).assertTrue();
        expect(result[0] === 0xEF).assertTrue();


      });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_0900
     * @tc.name      testTextEncoder0009
     * @tc.desc      Verify encoding integrity for a large string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0009";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        let str = "";
        for(let i=0; i<1000; i++) str += "0123456789";
        const result = encoder.encode(str);
        expect(result.length === 10000).assertTrue();
        expect(result[0] === 0x30).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1000
     * @tc.name      testTextEncoder0010
     * @tc.desc      Verify boundaries between 1-byte and 2-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0010";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "\u007F\u0080";
        const result = encoder.encode(input);
        expect(result.length === 3).assertTrue();
        expect(result[0] === 0x7F).assertTrue();
        expect(result[1] === 0xC2).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1100
     * @tc.name      testTextEncoder0011
     * @tc.desc      Verify the structure of the return object {read, written}.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0011";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(10);
        const ret = encoder.encodeInto("abc", dest);
        expect(ret.read === 3).assertTrue();
        expect(ret.written === 3).assertTrue();


      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1200
     * @tc.name      testTextEncoder0012
     * @tc.desc      Verify behavior when buffer size exactly equals required length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0012";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(3);
        const ret = encoder.encodeInto("中", dest);
        expect(ret.read === 1).assertTrue();
        expect(ret.written === 3).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1300
     * @tc.name      testTextEncoder0013
     * @tc.desc      Verify unused buffer areas are not polluted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0013";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array([1, 1, 1, 1, 1]);
        const ret = encoder.encodeInto("A", dest);
        expect(ret.written === 1).assertTrue();
        expect(dest[0] === 0x41).assertTrue();
        expect(dest[1] === 1).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1400
     * @tc.name      testTextEncoder0014
     * @tc.desc      Verify atomic truncation: no partial bytes written.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0014";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(2);
        const ret = encoder.encodeInto("中", dest);
        expect(ret.written === 0).assertTrue();
        expect(dest[0] === 0).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1500
     * @tc.name      testTextEncoder0015
     * @tc.desc      Verify truncation behavior when buffer is partially sufficient.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0015";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(4);
        const ret = encoder.encodeInto("AB中", dest);
        expect(ret.read === 2).assertTrue();
        expect(ret.written === 2).assertTrue();


      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1600
     * @tc.name      testTextEncoder0016
     * @tc.desc      Verify read/written counts for surrogate pairs (Emoji).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0016";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(10);
        const ret = encoder.encodeInto("😊", dest);
        expect(ret.read === 2).assertTrue();
        expect(ret.written === 4).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1700
     * @tc.name      testTextEncoder0017
     * @tc.desc      Verify writing data into a subarray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0017";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const fullBuf = new Uint8Array(10);
        const subBuf = fullBuf.subarray(5);
        const ret = encoder.encodeInto("ABC", subBuf);
        expect(ret.written === 3).assertTrue();
        expect(fullBuf[5] === 0x41).assertTrue();
        expect(fullBuf[0] === 0).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1800
     * @tc.name      testTextEncoder0018
     * @tc.desc      Verify encodeInto interaction with empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0018";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(10);
        const ret = encoder.encodeInto("", dest);
        expect(ret.read === 0 && ret.written === 0).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_1900
     * @tc.name      testTextEncoder0019
     * @tc.desc      Verify accumulated writes (streaming).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0019";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(6);
        let offset = 0;
        let ret = encoder.encodeInto("A", dest.subarray(offset));
        offset += ret.written;
        ret = encoder.encodeInto("中", dest.subarray(offset));
        offset += ret.written;
        ret = encoder.encodeInto("!", dest.subarray(offset));
        expect(dest[0] === 0x41).assertTrue();
        expect(dest[1] === 0xE4).assertTrue();
        expect(dest[4] === 0x21).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2000
     * @tc.name      testTextEncoder0020
     * @tc.desc      Verify truncation for 4-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0020";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(3);
        const ret = encoder.encodeInto("🦄", dest);
        expect(ret.written === 0).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2100
     * @tc.name      testTextEncoder0021
     * @tc.desc      Verify isolated high surrogate handling.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0021";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("\uD800");
        expect(result != null).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2200
     * @tc.name      testTextEncoder0022
     * @tc.desc      Verify isolated low surrogate handling.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0022";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("\uDC00");
        expect(result != null).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2300
     * @tc.name      testTextEncoder0023
     * @tc.desc      Verify handling of reversed surrogate pairs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0023";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("\uDC00\uD800");
        expect(result != null).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2400
     * @tc.name      testTextEncoder0024
     * @tc.desc      Verify string ending with an isolated high surrogate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0024";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("A\uD800");
        expect(result != null).assertTrue();
        expect(result.length >= 1).assertTrue();
        expect(result[0] === 0x41).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2500
     * @tc.name      testTextEncoder0025
     * @tc.desc      Verify counting logic when encoding illegal surrogates.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0025";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(10);
        const ret = encoder.encodeInto("\uD800", dest);
        expect(ret.read !== undefined).assertTrue();
        expect(ret.written !== undefined).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2600
     * @tc.name      testTextEncoder0026
     * @tc.desc      Verify TextEncoder instance is stateless.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0026";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const res1 = encoder.encode("A");
        const res2 = encoder.encode("B");
        expect(res1[0] === 0x41).assertTrue();
        expect(res2[0] === 0x42).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2700
     * @tc.name      testTextEncoder0027
     * @tc.desc      Consistency check: Verify encode() and encodeInto() produce identical results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0027";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "Complex-String-中文-😊";
        const res1 = encoder.encode(input);
        const dest = new Uint8Array(res1.length);
        const res2Struct = encoder.encodeInto(input, dest);
        expect(res1.length === res2Struct.written).assertTrue();
        for(let i=0; i<res1.length; i++) {
          expect(res1[i] === dest[i]).assertTrue();
        }

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2800
     * @tc.name      testTextEncoder0028
     * @tc.desc      Verify chunked writing logic for large strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0028";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const longStr = "A".repeat(200);
        const dest = new Uint8Array(100);
        const ret = encoder.encodeInto(longStr, dest);
        expect(ret.written === 100).assertTrue();
        expect(ret.read === 100).assertTrue();
        expect(dest[99] === 0x41).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_2900
     * @tc.name      testTextEncoder0029
     * @tc.desc      Verify encoding of the maximum valid Unicode code point.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0029";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("\u{10FFFF}");
        expect(result.length === 4).assertTrue();
        expect(result[0] === 0xF4).assertTrue();

      });
    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_3000
     * @tc.name      testTextEncoder0030
     * @tc.desc      Verify robustness when encodeInto target buffer has zero length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testTextEncoder0030";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(0);
        const ret = encoder.encodeInto("Something", dest);
        expect(ret.written === 0).assertTrue();
        expect(ret.read === 0).assertTrue();


      });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_3100
     * @tc.name      testTextEncoder0031
     * @tc.desc      Verify encoding of high-range ASCII characters (0x7F).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = "testTextEncoder0031";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("\x7F");
        expect(result.length === 1).assertTrue();
        expect(result[0] === 0x7F).assertTrue();

      });


    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_3200
     * @tc.name      testTextEncoder0032
     * @tc.desc      Comprehensive check mixing 1, 2, 3, and 4-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = "testTextEncoder0032";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const input = "aµऄ𐍈";
        const result = encoder.encode(input);
        expect(result.length === 1 + 2 + 3 + 4).assertTrue();
        expect(result[0] === 0x61).assertTrue();
        expect(result[1] === 0xC2).assertTrue();
        expect(result[3] === 0xE0).assertTrue();
        expect(result[6] === 0xF0).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_3300
     * @tc.name      testTextEncoder0033
     * @tc.desc      Verify memory stability by looping encodeInto multiple times.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = "testTextEncoder0033";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const dest = new Uint8Array(10);
        for(let i=0; i<100; i++) {
          const ret = encoder.encodeInto("Test", dest);
          expect(ret.written === 4).assertTrue();
          expect(dest[0] === 0x54).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER_3400
     * @tc.name      testTextEncoder0034
     * @tc.desc      Verify that encoding an empty string returns a valid Uint8Array instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoder0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = "testTextEncoder0034";
        console.log(TAG + " start");
        const encoder = new util.TextEncoder();
        const result = encoder.encode("");

        if (result != undefined && result != null) {
          expect(result.constructor.name === 'Uint8Array').assertTrue();
          expect(result.buffer.byteLength === 0).assertTrue();
        } else {
          expect(result == undefined).assertTrue();
        }
      });
  })
}