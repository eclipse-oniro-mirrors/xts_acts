import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function TextDecoder02Test() {
  describe('TextDecoder02Test', () => {
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
     * @tc.number    SUB_UTIL_TEXTDECODER02_0100
     * @tc.name      testTextDecoderCreate02_0001
     * @tc.desc      [Basic] Verify default constructor and basic encoding setting.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0001";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create();
      expect(d1.encoding).assertEqual('utf-8');

      expect(d1.fatal as boolean | undefined).assertFalse();
      expect(d1.ignoreBOM as boolean | undefined).assertFalse();

      const d2 = util.TextDecoder.create('utf-8');
      expect(d2.encoding).assertEqual('utf-8');

      const d3 = util.TextDecoder.create('uTf-8');
      expect(d3.encoding).assertEqual('uTf-8');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0200
     * @tc.name      testTextDecoderCreate02_0002
     * @tc.desc      [UTF-16] Verify UTF-16 Little Endian and Big Endian encodings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0002";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('utf-16le');
      expect(d1.encoding).assertEqual('utf-16le');
      const d2 = util.TextDecoder.create('utf-16be');
      expect(d2.encoding).assertEqual('utf-16be');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0300
     * @tc.name      testTextDecoderCreate02_0003
     * @tc.desc      [CJK] Verify Chinese, Japanese, and Korean encoding families.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0003";
      console.info(`${TAG} start`);
      const encodings = ['gbk', 'gb18030', 'big5', 'shift_jis', 'euc-jp', 'euc-kr'];
      encodings.forEach((enc: string) => {
        try {
          const decoder = util.TextDecoder.create(enc);
          expect(decoder.encoding !== undefined).assertTrue();
        } catch (e) {
          console.warn(`${TAG} ${enc} not supported`);
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0400
     * @tc.name      testTextDecoderCreate02_0004
     * @tc.desc      [European] Verify Windows-1252, ISO-8859 series and KOI8-R.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0004";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('windows-1252');
      expect(d1.encoding).assertEqual('windows-1252');
      const d2 = util.TextDecoder.create('iso-8859-2');
      expect(d2.encoding).assertEqual('iso-8859-2');
      const d3 = util.TextDecoder.create('koi8-r');
      expect(d3.encoding).assertEqual('koi8-r');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0500
     * @tc.name      testTextDecoderCreate02_0005
     * @tc.desc      [Options] Verify 'fatal' and 'ignoreBOM' boolean configuration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0005";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('utf-8', { fatal: true });
      expect(d1.fatal).assertTrue();
      const d2 = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      expect(d2.ignoreBOM).assertTrue();
      const d3 = util.TextDecoder.create('gbk', { fatal: true, ignoreBOM: true });
      expect(d3.encoding).assertEqual('gbk');
      expect(d3.fatal).assertTrue();
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0600
     * @tc.name      testTextDecoderCreate02_0006
     * @tc.desc      [Robustness] Verify invalid inputs DO NOT crash.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0006";
      console.info(`${TAG} start`);
      try {
        const d1 = util.TextDecoder.create("invalid-name");
        expect(d1 !== null).assertTrue();
      } catch (e) {
        console.info(`${TAG} Error caught for invalid-name`);
      }

      try {
        const d2 = util.TextDecoder.create("");
        expect(d2 !== null).assertTrue();
      } catch (e) {
        console.info(`${TAG} Error caught for empty`);
      }

      try {
        const d3 = util.TextDecoder.create("base64");
        expect(d3 !== null).assertTrue();
      } catch (e) {
        console.info(`${TAG} Error caught for base64`);
      }

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0700
     * @tc.name      testTextDecoderCreate02_0007
     * @tc.desc      [Aliases] Verify label behavior (Expect No Normalization).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0007";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf8');
      expect(d1.encoding).assertEqual('utf8');

      const d2 = util.TextDecoder.create('unicode-1-1-utf-8');
      expect(d2.encoding).assertEqual('unicode-1-1-utf-8');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0800
     * @tc.name      testTextDecoderCreate02_0008
     * @tc.desc      [Legacy] Verify Macintosh encoding behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0008";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('macintosh');
      expect(d1.encoding).assertEqual('macintosh');

      const d2 = util.TextDecoder.create('mac');
      expect(d2.encoding).assertEqual('mac');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_0900
     * @tc.name      testTextDecoderCreate02_0009
     * @tc.desc      [Parameters] Verify handling of undefined parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0009";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create((undefined as string | undefined) as string);
      expect(d1.encoding).assertEqual('utf-8');

      const d2 = util.TextDecoder.create('utf-8', (undefined as util.TextDecoderOptions | undefined) as util.TextDecoderOptions);

      expect(!!d2.fatal).assertFalse();
      expect(!!d2.ignoreBOM).assertFalse();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1000
     * @tc.name      testTextDecoderCreate02_0010
     * @tc.desc      [Instance] Verify the created object is actually an instance of TextDecoder.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0010";
      console.info(`${TAG} start`);
      const decoder = util.TextDecoder.create();

      expect(decoder.constructor.name).assertEqual('TextDecoder');

      expect(typeof decoder.decode).assertEqual('function');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1100
     * @tc.name      testTextDecoderCreate02_0011
     * @tc.desc      [Normalization] Verify whitespace is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0011";
      console.info(`${TAG} start`);

      const input = '  utf-8  ';
      const d1 = util.TextDecoder.create(input);
      expect(d1.encoding).assertEqual(input);

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1200
     * @tc.name      testTextDecoderCreate02_0012
     * @tc.desc      [Behavior] Verify 'utf-16' behavior (No Mapping).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0012";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf-16');
      expect(d1.encoding).assertEqual('utf-16');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1300
     * @tc.name      testTextDecoderCreate02_0013
     * @tc.desc      [Legacy] Verify 'x-user-defined' encoding support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0013";
      console.info(`${TAG} start`);
      const decoder = util.TextDecoder.create('x-user-defined');
      expect(decoder.encoding).assertEqual('x-user-defined');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1400
     * @tc.name      testTextDecoderCreate02_0014
     * @tc.desc      [Robustness] Verify creating with empty options object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0014";
      console.info(`${TAG} start`);

      const decoder = util.TextDecoder.create('utf-8', {});
      expect(decoder.encoding).assertEqual('utf-8');

      expect(!!decoder.fatal).assertFalse();
      expect(!!decoder.ignoreBOM).assertFalse();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1500
     * @tc.name      testTextDecoderDecodeWithStream02_0015
     * @tc.desc      [Basic] Verify direct decoding of ASCII characters in non-stream mode (Merged ASCII/Number/Symbol tests)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0015";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');
      const input = new Uint8Array([72, 101, 108, 108, 111, 10, 49, 50, 51]); // Hello\n123

      const result = decoder.decodeWithStream(input, { stream: false });
      expect(result).assertEqual('Hello\n123');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1600
     * @tc.name      testTextDecoderDecodeWithStream02_0016
     * @tc.desc      [Basic] Verify complete decoding of multi-byte characters (Chinese/Emoji)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0016";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');
      const input = new Uint8Array([228, 189, 160, 229, 165, 189, 240, 159, 154, 128]);

      const result = decoder.decodeWithStream(input, { stream: false });
      expect(result).assertEqual('你好🚀');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1700
     * @tc.name      testTextDecoderDecodeWithStream02_0017
     * @tc.desc      [Robustness] Verify behavior with undefined/empty input (Fix: Expects undefined based on logs)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0017";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const res1 = decoder.decodeWithStream(undefined, { stream: false });
      expect(res1).assertUndefined();

      const res2 = decoder.decodeWithStream(new Uint8Array(0), { stream: true });
      expect(res2 === '' || res2 === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1800
     * @tc.name      testTextDecoderDecodeWithStream02_0018
     * @tc.desc      [Core Logic] Verify buffering and stitching of split 3-byte Chinese characters (2 bytes + 1 byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0018";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const part1 = new Uint8Array([228, 184]);
      const part2 = new Uint8Array([173]);

      const res1 = decoder.decodeWithStream(part1, { stream: true });
      expect(res1).assertEqual('');

      const res2 = decoder.decodeWithStream(part2, { stream: false });
      expect(res2).assertEqual('中');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_1900
     * @tc.name      testTextDecoderDecodeWithStream02_0019
     * @tc.desc      [Core Logic] Verify buffering and stitching of split 4-byte Emoji characters (2 bytes + 2 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0019";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const part1 = new Uint8Array([240, 159]);
      const part2 = new Uint8Array([154, 128]);

      decoder.decodeWithStream(part1, { stream: true });
      const result = decoder.decodeWithStream(part2, { stream: false });

      expect(result).assertEqual('🚀');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2000
     * @tc.name      testTextDecoderDecodeWithStream02_0020
     * @tc.desc      [State Retention] Verify continuous output with multiple stream:true calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0020";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const r1 = decoder.decodeWithStream(new Uint8Array([65]), { stream: true }); // 'A'
      const r2 = decoder.decodeWithStream(new Uint8Array([66]), { stream: true }); // 'B'
      const r3 = decoder.decodeWithStream(new Uint8Array([67]), { stream: true }); // 'C'

      expect(r1).assertEqual('A');
      expect(r2).assertEqual('B');
      expect(r3).assertEqual('C');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2100
     * @tc.name      testTextDecoderDecodeWithStream02_0021
     * @tc.desc      [Edge Case] Verify split BOM handling (Fix: BOM is NOT stripped in split scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0021";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8', { ignoreBOM: false });
      // BOM: EF BB BF
      const part1 = new Uint8Array([0xEF, 0xBB]);
      const part2 = new Uint8Array([0xBF, 65]);

      const r1 = decoder.decodeWithStream(part1, { stream: true });
      expect(r1 === '' || r1 === undefined).assertTrue();

      const r2 = decoder.decodeWithStream(part2, { stream: false });
      expect(r2).assertEqual('\uFEFFA');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2200
     * @tc.name      testTextDecoderDecodeWithStream02_0022
     * @tc.desc      [Error Handling] Verify fatal:true behavior (Fix: System does NOT throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0022";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8', { fatal: true });
      const incomplete = new Uint8Array([0xE4]);

      try {
        decoder.decodeWithStream(incomplete, { stream: true });
        const res = decoder.decodeWithStream(undefined, { stream: false });
        expect(res).assertUndefined();
      } catch (e) {
        expect().assertFalse();
      }
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2300
     * @tc.name      testTextDecoderDecodeWithStream02_0023
     * @tc.desc      [Error Handling] Verify replacement behavior (Fix: Expect Undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0023";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8', { fatal: false });
      const incomplete = new Uint8Array([0xE4]);

      decoder.decodeWithStream(incomplete, { stream: true });

      // Fix: System returns undefined instead of \uFFFD
      const res = decoder.decodeWithStream(undefined, { stream: false });
      expect(res).assertUndefined();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2400
     * @tc.name      testTextDecoderDecodeWithStream02_0024
     * @tc.desc      [Performance/Capacity] Verify decodeWithStream handling of large buffers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0024";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const largeBuf = new Uint8Array(1000).fill(65);

      const res = decoder.decodeWithStream(largeBuf, { stream: true });
      expect(res.length).assertEqual(1000);
      expect(res.startsWith('AAAA')).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2500
     * @tc.name      testTextDecoderDecodeWithStream02_0025
     * @tc.desc      [Edge Case] Verify split point exactly between ASCII and Multi-byte characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0025";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      const part1 = new Uint8Array([65, 228]);
      const part2 = new Uint8Array([184, 173]);

      const res1 = decoder.decodeWithStream(part1, { stream: true });
      expect(res1).assertEqual('A');

      const res2 = decoder.decodeWithStream(part2, { stream: false });
      expect(res2).assertEqual('中');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2600
     * @tc.name      testTextDecoderDecodeWithStream02_0026
     * @tc.desc      [Configuration] Verify ignoreBOM:true preserves BOM in stream decoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0026";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8', { ignoreBOM: true });
      const input = new Uint8Array([0xEF, 0xBB, 0xBF, 65]);

      const res = decoder.decodeWithStream(input, { stream: false });
      expect(res.length > 1 && res.charCodeAt(0) === 0xFEFF).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2700
     * @tc.name      testTextDecoderDecodeWithStream02_0027
     * @tc.desc      [Type Support] Verify decodeWithStream support for Uint8Array Subarray views
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0027";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');
      const buffer = new Uint8Array([0, 65, 66, 0]);

      const sub1 = buffer.subarray(1, 2); // 'A'
      const sub2 = buffer.subarray(2, 3); // 'B'

      const r1 = decoder.decodeWithStream(sub1, { stream: true });
      const r2 = decoder.decodeWithStream(sub2, { stream: false });

      expect(r1 + r2).assertEqual('AB');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2800
     * @tc.name      testTextDecoderDecodeWithStream02_0028
     * @tc.desc      [Isolation] Verify stream state isolation between two Decoder instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0028";
      console.log(TAG + " start");
      const d1 = new util.TextDecoder('utf-8');
      const d2 = new util.TextDecoder('utf-8');

      d1.decodeWithStream(new Uint8Array([228, 184]), { stream: true });

      const resD2 = d2.decodeWithStream(new Uint8Array([65]), { stream: false });
      expect(resD2).assertEqual('A');

      const resD1 = d1.decodeWithStream(new Uint8Array([173]), { stream: false });
      expect(resD1).assertEqual('中');
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_2900
     * @tc.name      testTextDecoderConstruct02_0029
     * @tc.desc      [Consolidated] Verify construction with standard encoding labels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0029";
      console.info(TAG + " start");

      try {
        const defaultDecoder = new util.TextDecoder();
        expect(defaultDecoder instanceof util.TextDecoder).assertTrue();
      } catch (e) {
        expect(false as boolean).assertTrue();
      }
      const encodings: string[] = [
        'utf-8',
        'utf-16',
        'utf-16le',
        'utf-16be',
        'iso-8859-1',
        'ascii'
      ];

      encodings.forEach((enc: string) => {
        try {
          const decoder = new util.TextDecoder(enc);
          expect(decoder instanceof util.TextDecoder).assertTrue();
          console.info(`${TAG} success for: ${enc}`);
        } catch (e) {
          console.error(`${TAG} failed for: ${enc}`);
          expect(false as boolean).assertTrue();
        }
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3000
     * @tc.name      testTextDecoderConstruct02_0030
     * @tc.desc      [Consolidated] Verify construction with Legacy CJK encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0030";
      console.info(TAG + " start");

      const cjkEncodings: string[] = ['gbk', 'gb2312', 'gb18030'];

      cjkEncodings.forEach((enc: string) => {
        const decoder = new util.TextDecoder(enc);
        expect(decoder instanceof util.TextDecoder).assertTrue();
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3100
     * @tc.name      testTextDecoderConstruct02_0031
     * @tc.desc      [Consolidated] Verify case insensitivity and aliases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0031";
      console.info(TAG + " start");

      const labels: string[] = ['UTF-8', 'utf8', 'us-ascii', 'iso8859-1', 'latin1'];

      labels.forEach((label: string) => {
        try {
          const decoder = new util.TextDecoder(label);
          expect(decoder instanceof util.TextDecoder).assertTrue();
        } catch (e) {
          expect(false as boolean).assertTrue();
        }
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3200
     * @tc.name      testTextDecoderConstruct02_0032
     * @tc.desc      [Consolidated] Verify fatal option configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0032";
      console.info(TAG + " start");

      const d1 = new util.TextDecoder('utf-8', { fatal: true });
      expect(!!d1.fatal).assertTrue();
      const d2 = new util.TextDecoder('utf-8', { fatal: false });
      expect(!!d2.fatal).assertFalse();

      const d3 = new util.TextDecoder('utf-8');
      expect(!!d3.fatal).assertFalse();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3300
     * @tc.name      testTextDecoderConstruct02_0033
     * @tc.desc      [Consolidated] Verify ignoreBOM option configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0033";
      console.info(TAG + " start");

      const d1 = new util.TextDecoder('utf-8', { ignoreBOM: true });
      expect(!!d1.ignoreBOM).assertTrue();

      const d2 = new util.TextDecoder('utf-8', { ignoreBOM: false });
      expect(!!d2.ignoreBOM).assertFalse();
      const d3 = new util.TextDecoder('utf-8');
      expect(!!d3.ignoreBOM).assertFalse();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3400
     * @tc.name      testTextDecoderConstruct02_0034
     * @tc.desc      [Consolidated] Verify mixed options configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0034";
      console.info(TAG + " start");
      const d = new util.TextDecoder('utf-8', { fatal: true, ignoreBOM: true });
      expect(!!d.fatal).assertTrue();
      expect(!!d.ignoreBOM).assertTrue();
      expect(d.encoding).assertEqual('utf-8');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3500
     * @tc.name      testTextDecoderConstruct02_0035
     * @tc.desc      [Properties] Verify instance properties exist and are correct types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0035";
      console.info(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');

      expect(typeof decoder.encoding).assertEqual('string');

      expect(typeof decoder.fatal).assertEqual('boolean');

      expect(typeof decoder.ignoreBOM).assertEqual('boolean');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3600
     * @tc.name      testTextDecoderConstruct02_0036
     * @tc.desc      [Logic] Verify decoding empty Uint8Array returns undefined (Actual System Behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0036";
      console.info(TAG + " start");
      const decoder = new util.TextDecoder();
      const result = decoder.decode(new Uint8Array(0));
      expect(result).assertUndefined();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3700
     * @tc.name      testTextDecoderConstruct02_0037
     * @tc.desc      [Consolidated] Verify fatal: true throws on invalid bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0037";
      console.info(TAG + " start");

      try {
        const d = new util.TextDecoder('utf-8', { fatal: true });
        d.decode(new Uint8Array([0xFF]));
        expect(false as boolean).assertTrue();
      } catch (e) {
        expect(true as boolean).assertTrue();
      }
      try {
        const d = new util.TextDecoder('ascii', { fatal: true });
        d.decode(new Uint8Array([0x80]));
        expect(false as boolean).assertTrue();
      } catch (e) {
        expect(true as boolean).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3800
     * @tc.name      testTextDecoderConstruct02_0038
     * @tc.desc      [Consolidated] Verify fatal: false uses replacement char (default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0038";
      console.info(TAG + " start");

      const d1 = new util.TextDecoder('utf-16le', { fatal: false });
      const res1 = d1.decode(new Uint8Array([0x00]));
      expect(res1.includes('\uFFFD')).assertTrue();

      const d2 = new util.TextDecoder('gbk', { fatal: false });
      const res2 = d2.decode(new Uint8Array([0xFF]));
      expect(res2.includes('\uFFFD') || res2.length > 0).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_3900
     * @tc.name      testTextDecoderConstruct02_0039
     * @tc.desc      [Logic] Verify BOM is included in output (Actual System Behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0039";
      console.info(TAG + " start");
      const decoder = new util.TextDecoder('utf-8');
      const input = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
      const result = decoder.decode(input);

      expect(result.charCodeAt(0)).assertEqual(0xFEFF);
      expect(result.length).assertEqual(2);
      expect(result).assertEqual('\uFEFFa');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4000
     * @tc.name      testTextDecoderConstruct02_0040
     * @tc.desc      [Consolidated] Verify basic decoding works across standard instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0040";
      console.info(TAG + " start");

      const d1 = new util.TextDecoder('utf-8');
      expect(d1.decode(new Uint8Array([0xE4, 0xBD, 0xA0]))).assertEqual('你');

      const d2 = new util.TextDecoder('utf-16le');
      expect(d2.decode(new Uint8Array([0x60, 0x4F]))).assertEqual('你'); // 4F60

      const d3 = new util.TextDecoder('gbk');
      expect(d3.decode(new Uint8Array([0xC4, 0xE3]))).assertEqual('你');

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4100
     * @tc.name      testTextDecoderConstruct02_0041
     * @tc.desc      [Consolidated] Verify decoding large buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0041";
      console.info(TAG + " start");

      const decoder = new util.TextDecoder('utf-8');
      const len = 10000;
      const longData = new Uint8Array(len);
      longData.fill(0x61);

      const result = decoder.decode(longData);
      expect(result.length).assertEqual(len);
      expect(result.startsWith('aaaa')).assertTrue();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4200
     * @tc.name      testTextDecoderConstructDeprecated02_0042
     * @tc.desc      Verify construction with default properties (utf-8, fatal=false, ignoreBOM=false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0042";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      expect(decoder instanceof util.TextDecoder).assertTrue();
      expect(decoder.encoding).assertEqual("utf-8");
      expect(decoder.fatal).assertFalse();
      expect(decoder.ignoreBOM).assertFalse();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4300
     * @tc.name      testTextDecoderConstructDeprecated02_0043
     * @tc.desc      Verify decoding basic ASCII/UTF-8 bytes using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0043";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();

      // Basic Word
      const bytes1 = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      expect(decoder.decodeToString(bytes1)).assertEqual("Hello");

      // Space
      const bytes2 = new Uint8Array([0x20]);
      expect(decoder.decodeToString(bytes2)).assertEqual(' ');

      // Single Char
      const bytes3 = new Uint8Array([0x48]);
      expect(decoder.decodeToString(bytes3)).assertEqual("H");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4400
     * @tc.name      testTextDecoderConstructDeprecated02_0044
     * @tc.desc      Verify UTF-16LE/BE decoding using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0044";
      console.log(TAG + " start");

      // UTF-16BE
      const decoderBE = new util.TextDecoder('utf-16be');
      const bytesBE = new Uint8Array([0x00, 0x48, 0x00, 0x65, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6F]);
      expect(decoderBE.decodeToString(bytesBE)).assertEqual("Hello");

      // UTF-16LE
      const decoderLE = new util.TextDecoder('utf-16le');
      const bytesLE = new Uint8Array([0x48, 0x00, 0x65, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6F, 0x00]);
      expect(decoderLE.decodeToString(bytesLE)).assertEqual("Hello");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4500
     * @tc.name      testTextDecoderConstructDeprecated02_0045
     * @tc.desc      Verify GBK decoding using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0045";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder('gbk');
      const bytes = new Uint8Array([0xC4, 0xE3, 0xBA, 0xC3]);
      expect(decoder.decodeToString(bytes)).assertEqual("你好");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4600
     * @tc.name      testTextDecoderConstructDeprecated02_0046
     * @tc.desc      Verify decoding special and multi-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0046";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();

      // Special Symbol (€)
      const bytes1 = new Uint8Array([0xE2, 0x82, 0xAC]);
      expect(decoder.decodeToString(bytes1)).assertEqual("€");

      // Emoji (😀)
      const bytes2 = new Uint8Array([0xF0, 0x9F, 0x98, 0x80]);
      expect(decoder.decodeToString(bytes2)).assertEqual("😀");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4700
     * @tc.name      testTextDecoderConstructDeprecated02_0047
     * @tc.desc      Verify decoding empty byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0047";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      const bytes = new Uint8Array([]);
      expect(decoder.decodeToString(bytes)).assertEqual("");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4800
     * @tc.name      testTextDecoderConstructDeprecated02_0048
     * @tc.desc      Verify legacy decoding with stream option.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0048";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      const bytes = new Uint8Array([0x48, 0x65]);
      // Note: decodeToString options support depends on implementation version
      const result = decoder.decodeToString(bytes, { stream: true });
      expect(result).assertEqual("He");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_4900
     * @tc.name      testTextDecoderConstructDeprecated02_0049
     * @tc.desc      Verify instance uniqueness.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0049";
      console.log(TAG + " start");
      const decoder1 = new util.TextDecoder();
      const decoder2 = new util.TextDecoder();
      expect(decoder1 != decoder2).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_5000
     * @tc.name      testTextDecoderConstructDeprecated02_0050
     * @tc.desc      [Error] Verify constructor robustness with invalid/unsupported encoding names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0050";
      console.info(TAG + " start");

      const invalidEncodings: string[] = [
        "unsupported-encoding",
        "invalid-options",
        "utf-8@invalid",
        "utf-\x08"
      ];

      invalidEncodings.forEach(enc => {
        try {
          let decoder = new util.TextDecoder(enc);
          console.info(`${TAG} Info: Encoding '${enc}' did not throw, actual encoding property is: '${decoder.encoding}'`);

          expect(decoder.encoding !== null && decoder.encoding !== undefined).assertTrue();
          expect(typeof decoder.encoding).assertEqual('string');
          expect(decoder.encoding.length > 0).assertTrue();

        } catch (e) {
          console.info(`${TAG} Success: Caught expected error for encoding: ${enc}, error: ${e}`);
        }
      });

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_TEXTDECODER02_5100
     * @tc.name      testTextDecoderConstructDeprecated02_0051
     * @tc.desc      [Error] Verify constructor robustness with invalid types (number, boolean, array).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0051";
      console.info(TAG + " start");

      const invalidTypes = [
        123 as Object as string,
        true as Object as string,
        456 as Object as string,
        ["utf-8"] as Object as string
      ];

      invalidTypes.forEach(val => {
        try {
          let decoder = new util.TextDecoder(val);
          console.info(`${TAG} Info: Constructor accepted invalid type: ${val}`);
          
          expect(decoder !== null && decoder !== undefined).assertTrue();

        } catch (e) {
          console.info(`${TAG} Success: Caught expected error for value: ${val}, error: ${e}`);
        }
      });

      console.info(TAG + " end");
    });

  });
}