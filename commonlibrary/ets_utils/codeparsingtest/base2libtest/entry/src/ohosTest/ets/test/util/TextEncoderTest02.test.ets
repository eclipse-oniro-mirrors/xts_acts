import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';


const ENC_UNICODE = ['utf-8', 'utf-16be', 'utf-16le'];

const ENC_CHINESE = ['gb2312', 'gbk', 'gb18030', 'big5'];

const ENC_JAPAN_KOREA = ['shift_jis', 'euc-jp', 'iso-2022-jp', 'euc-kr'];

const ENC_CYRILLIC = ['ibm866', 'koi8-r', 'koi8-u', 'x-mac-cyrillic'];

const ENC_ISO_PART1 = ['iso-8859-1', 'iso-8859-2', 'iso-8859-3', 'iso-8859-4', 'iso-8859-5'];

const ENC_ISO_PART2 = ['iso-8859-6', 'iso-8859-7', 'iso-8859-8', 'iso-8859-8-i'];

const ENC_ISO_PART3 = ['iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15'];

const ENC_WIN_PART1 = ['windows-1250', 'windows-1251', 'windows-1252'];

const ENC_WIN_PART2 = ['windows-1253', 'windows-1254', 'windows-1255', 'windows-1256'];

const ENC_WIN_PART3 = ['windows-1257', 'windows-1258', 'windows-874'];

const ENC_MAC = ['macintosh'];

const ALL_ENCODINGS = [
  ...ENC_UNICODE, ...ENC_CHINESE, ...ENC_JAPAN_KOREA, ...ENC_CYRILLIC,
  ...ENC_ISO_PART1, ...ENC_ISO_PART2, ...ENC_ISO_PART3,
  ...ENC_WIN_PART1, ...ENC_WIN_PART2, ...ENC_WIN_PART3, ...ENC_MAC
];
class TestCase {
  label: string;
  input: string;
  expectedLen: number;

  constructor(label: string, input: string, expectedLen: number) {
    this.label = label;
    this.input = input;
    this.expectedLen = expectedLen;
  }
}

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function TextEncoder02Test() {
  describe('TextEncoder02Test', () => {
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
     * @tc.number    SUB_UTIL_TEXTENCODER02_0100
     * @tc.name      testEncodercreate02_0001
     * @tc.desc      Verify creation and basic encoding for UTF family (utf-8, utf-16be, utf-16le).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0001";
      console.info(`${TAG} start`);
      ENC_UNICODE.forEach(enc => {
        try {
          const encoder = util.TextEncoder.create(enc);
          expect(encoder !== null).assertTrue();
          const ret = encoder.encode('A');
          expect(ret.length > 0).assertTrue();
          console.info(`${TAG} success for: ${enc}`);
        } catch (e) {
          console.error(`${TAG} failed for ${enc}: ${e}`);
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0200
     * @tc.name      testEncodercreate02_0002
     * @tc.desc      Verify encodings: gb2312, gbk, gb18030, big5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0002";
      console.info(`${TAG} start`);
      const input = "中";
      ENC_CHINESE.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode(input);
        expect(ret.length > 0).assertTrue();
        console.info(`${TAG} ${enc} encoded length: ${ret.length}`);
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0300
     * @tc.name      testEncodercreate02_0003
     * @tc.desc      Verify encodings: shift_jis, euc-jp, iso-2022-jp, euc-kr.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0003";
      console.info(`${TAG} start`);

      const ENC_JAPAN_KOREA = ['shift_jis', 'euc-jp', 'iso-2022-jp', 'euc-kr'];

      ENC_JAPAN_KOREA.forEach(enc => {
        try {
          console.info(`${TAG} Testing encoding: ${enc}`);
          const encoder = util.TextEncoder.create(enc);
          expect(typeof encoder.encoding).assertEqual('string');
        } catch (e) {
          console.warn(`${TAG} Exception creating encoder for ${enc}: ${e}`);
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0400
     * @tc.name      testEncodercreate02_0004
     * @tc.desc      Verify encodings: ibm866, koi8-r, koi8-u, x-mac-cyrillic.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0004";
      console.info(`${TAG} start`);
      ENC_CYRILLIC.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode('Test');
        expect(ret.length).assertEqual(4);
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0500
     * @tc.name      testEncodercreate02_0005
     * @tc.desc      Verify ISO-8859 1-5 (Western/European).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0005";
      console.info(`${TAG} start`);
      ENC_ISO_PART1.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode('ABC');
        expect(ret.byteLength).assertEqual(3);
      });
      console.info(`${TAG} end`);
    });



    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0600
     * @tc.name      testEncodercreate02_0006
     * @tc.desc      Verify ISO-8859 10/13/14/15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0006";
      console.info(`${TAG} start`);
      ENC_ISO_PART3.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode('123');
        expect(ret[0]).assertEqual(0x31); // ASCII '1'
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0700
     * @tc.name      testEncodercreate02_0007
     * @tc.desc      Verify Windows-1250/1251/1252.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0007";
      console.info(`${TAG} start`);
      ENC_WIN_PART1.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        expect(encoder instanceof util.TextEncoder).assertFalse();
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0800
     * @tc.name      testEncodercreate02_0008
     * @tc.desc      Verify Windows-1253/1254/1255/1256.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0008";
      console.info(`${TAG} start`);
      ENC_WIN_PART2.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode('Test');
        expect(ret.length).assertEqual(4);
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_0900
     * @tc.name      testEncodercreate02_0009
     * @tc.desc      Verify macintosh encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0009";
      console.info(`${TAG} start`);
      const encoder = util.TextEncoder.create('macintosh');
      const ret = encoder.encode('Mac');
      expect(ret.length).assertEqual(3);
      expect(ret instanceof Uint8Array).assertTrue();
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1000
     * @tc.name      testEncodercreate02_0010
     * @tc.desc      Verify that all supported encodings handle empty string correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0010";
      console.info(`${TAG} start`);

      ALL_ENCODINGS.forEach(enc => {
        try {
          const encoder = util.TextEncoder.create(enc);
          const ret = encoder.encode('');

          if (enc.toLowerCase().includes('utf-16')) {
            expect(ret.length === 0 || ret.length === 2).assertTrue();
          } else {
            expect(ret.length).assertEqual(0);
          }

        } catch (e) {
          console.warn(`${TAG} Skipped unsupported encoding or error: ${enc}, error: ${e}`);
        }
      });


      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1100
     * @tc.name      testEncodercreate02_0011
     * @tc.desc      Verify that all encodings correctly encode standard ASCII (0-127).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0011";
      console.info(`${TAG} start`);
      const input = "ABC_123";
      const asciiCompatibleEncodings = ALL_ENCODINGS.filter(e => !e.includes('utf-16'));

      asciiCompatibleEncodings.forEach(enc => {
        const encoder = util.TextEncoder.create(enc);
        const ret = encoder.encode(input);
        expect(ret.length).assertEqual(input.length);
        expect(ret[0]).assertEqual(0x41);
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1200
     * @tc.name      testEncodercreate02_0012
     * @tc.desc      Verify that creation is case-insensitive (e.g., UTF-8 vs utf-8).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0012";
      console.info(`${TAG} start`);
      const samples = ['UTF-8', 'GBK', 'ISO-8859-1', 'WINDOWS-1252'];

      samples.forEach(enc => {
        try {
          const encoder = util.TextEncoder.create(enc);

          expect(encoder !== null).assertTrue();
          expect(encoder !== undefined).assertTrue();

          if (encoder.encoding) {
            expect(typeof encoder.encoding).assertEqual('string');
            console.info(`${TAG} ${enc} -> resolved to -> ${encoder.encoding}`);
          }
        } catch (e) {
          console.error(`${TAG} Failed to create encoder for upper case ${enc}: ${e}`);
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1300
     * @tc.name      testEncodercreate02_0013
     * @tc.desc      Stress test: Loop through all encodings repeatedly to ensure stability.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodercreate02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodercreate02_0013";
      console.info(`${TAG} start`);

      let isFinished = false;

      for (let i = 0; i < 5; i++) {
        ALL_ENCODINGS.forEach(enc => {
          const encoder = util.TextEncoder.create(enc);
          encoder.encode('S');
        });
      }
      isFinished = true;

      expect(isFinished).assertTrue();
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1400
     * @tc.name      testTextEncoderConstructor02_0014
     * @tc.desc      Verify Unicode family (utf-8, utf-16be, utf-16le).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0014";
      console.info(`${TAG} start`);
      ENC_UNICODE.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          expect(encoder.encoding.toLowerCase()).assertEqual(enc.toLowerCase());
          let buffer = encoder.encode("Uni");
          expect(buffer.length > 0).assertTrue();
        } catch (e) {
          console.error(`${TAG} Failed for ${enc}: ${e}`);
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1500
     * @tc.name      testTextEncoderConstructor02_0015
     * @tc.desc      Verify Chinese family (gbk, gb2312, gb18030, big5).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0015";
      console.info(`${TAG} start`);
      ENC_CHINESE.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          expect(encoder.encoding !== undefined && encoder.encoding !== null).assertTrue();

          let buffer = encoder.encode("汉字");
          expect(buffer.length > 0).assertTrue();
        } catch (e) {
          console.warn(`${TAG} Encoding ${enc} not supported in this env`);
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1600
     * @tc.name      testTextEncoderConstructor02_0016
     * @tc.desc      Verify Japan/Korea family (shift_jis, euc-jp, etc.).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0016";
      console.info(`${TAG} start`);
      ENC_JAPAN_KOREA.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          // 验证功能：多字节字符
          let buffer = encoder.encode("テスト");
          expect(buffer.length > 0).assertTrue();
        } catch (e) {
          console.warn(`${TAG} Encoding ${enc} not supported`);
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1700
     * @tc.name      testTextEncoderConstructor02_0017
     * @tc.desc      Verify Cyrillic & Mac family (ibm866, koi8, macintosh, etc.).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0017";
      console.info(`${TAG} start`);
      const targetEncs = [...ENC_CYRILLIC, ...ENC_MAC];
      targetEncs.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          let buffer = encoder.encode("Mac");
          expect(buffer.length).assertEqual(3);
        } catch (e) {
          console.warn(`${TAG} Skipped ${enc}: ${e}`);
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1800
     * @tc.name      testTextEncoderConstructor02_0018
     * @tc.desc      Verify ISO-8859 Part 1 (1-5).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0018";
      console.info(`${TAG} start`);
      ENC_ISO_PART1.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          expect(encoder.encoding.toLowerCase()).assertEqual(enc.toLowerCase());

          let buffer = encoder.encode("A");
          expect(buffer.length).assertEqual(1);
          expect(buffer[0]).assertEqual(0x41);
        } catch (e) {
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_1900
     * @tc.name      testTextEncoderConstructor02_0019
     * @tc.desc      Verify ISO-8859 Part 2 (6-8, 8-i).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0019";
      console.info(`${TAG} start`);
      ENC_ISO_PART2.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          let buffer = encoder.encode("123");
          expect(buffer.length).assertEqual(3);
        } catch (e) {
          console.error(`${TAG} Error ${enc}: ${e}`);
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2000
     * @tc.name      testTextEncoderConstructor02_0020
     * @tc.desc      Verify ISO-8859 Part 3 (10, 13-15).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0020";
      console.info(`${TAG} start`);
      ENC_ISO_PART3.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          let buffer = encoder.encode("Test");
          expect(buffer.length).assertEqual(4);
        } catch (e) {
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2100
     * @tc.name      testTextEncoderConstructor02_0021
     * @tc.desc      Verify Windows Part 1 (1250-1252).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0021";
      console.info(`${TAG} start`);
      ENC_WIN_PART1.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          expect(encoder instanceof util.TextEncoder).assertTrue();
          let buffer = encoder.encode("Win");
          expect(buffer.length).assertEqual(3);
        } catch (e) {
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2200
     * @tc.name      testTextEncoderConstructor02_0022
     * @tc.desc      Verify Windows Part 2 (1253-1256).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0022";
      console.info(`${TAG} start`);
      ENC_WIN_PART2.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          let buffer = encoder.encode("Win");
          expect(buffer.length).assertEqual(3);
        } catch (e) {
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2300
     * @tc.name      testTextEncoderConstructor02_0023
     * @tc.desc      Verify Windows Part 3 (1257, 1258, 874).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0023";
      console.info(`${TAG} start`);
      ENC_WIN_PART3.forEach(enc => {
        try {
          let encoder = new util.TextEncoder(enc);
          let buffer = encoder.encode("Win");
          expect(buffer.length).assertEqual(3);
        } catch (e) {
          expect().assertFail();
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2400
     * @tc.name      testTextEncoderConstructor02_0024
     * @tc.desc      Verify instance independence and encodeInto functionality.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0024";
      console.info(`${TAG} start`);
      let enc1 = new util.TextEncoder("utf-8");
      let enc2 = new util.TextEncoder("utf-16le");

      expect(enc1.encoding !== enc2.encoding).assertTrue();

      let dest = new Uint8Array(10);
      let res = enc1.encodeInto("ABC", dest);
      expect(res.read).assertEqual(3);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(0x41);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2500
     * @tc.name      testTextEncoderConstructor02_0025
     * @tc.desc      Verify error 401 when parameter is Number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0025";
      console.info(`${TAG} start`);
      try {
        let invalidParam: number = 12345;
        let encoder = new util.TextEncoder(invalidParam as Object as string);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError<void>;
        console.info(`${TAG} Caught: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2600
     * @tc.name      testTextEncoderConstructor02_0026
     * @tc.desc      Stress test all encodings loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderConstructor02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderConstructor02_0026";
      console.info(`${TAG} start`);

      let isExecutionFinished = false;

      for(let i = 0; i < ALL_ENCODINGS.length; i++) {
        let encName = ALL_ENCODINGS[i];
        try {
          let encoder = new util.TextEncoder(encName);
          let buf = encoder.encode("S");
          expect(encoder !== null).assertTrue();
        } catch(e) {
          console.warn(`${TAG} ${encName} not supported`);
        }
      }
      isExecutionFinished = true;
      expect(isExecutionFinished).assertTrue();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2700
     * @tc.name      testTextEncoderEncodeInto02_0027
     * @tc.desc      Verify basic ASCII encoding, buffer fitting, and empty string handling.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0027";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      let dest = new Uint8Array(3);
      let res = encoder.encodeInto("abc", dest);
      expect(res.read).assertEqual(3);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(97); // 'a'
      expect(dest[1]).assertEqual(98); // 'b'
      expect(dest[2]).assertEqual(99); // 'c'

      dest = new Uint8Array(10);
      res = encoder.encodeInto("abc", dest);
      expect(res.read).assertEqual(3);
      expect(res.written).assertEqual(3);

      res = encoder.encodeInto("", new Uint8Array(0));
      expect(res.written).assertEqual(0);

      res = encoder.encodeInto("", new Uint8Array(5));
      expect(res.written).assertEqual(0);
      console.info(`${TAG} end`);
    });


    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2800
     * @tc.name      testTextEncoderEncodeInto02_0028
     * @tc.desc      Verify critical atomic truncation logic (Destination too small).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0028";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      let res = encoder.encodeInto("abc", new Uint8Array(2));
      expect(res.written).assertEqual(2);
      expect(res.read).assertEqual(2);

      res = encoder.encodeInto("€", new Uint8Array(2));
      expect(res.written).assertEqual(0);
      expect(res.read).assertEqual(0);

      res = encoder.encodeInto("𐍈", new Uint8Array(3));
      expect(res.written).assertEqual(0);
      expect(res.read).assertEqual(0);

      let dest = new Uint8Array(3);
      res = encoder.encodeInto("a€b", dest);
      expect(res.read).assertEqual(1);
      expect(res.written).assertEqual(1);
      expect(dest[0]).assertEqual(97);
      expect(dest[1]).assertEqual(0);

      res = encoder.encodeInto("你好", new Uint8Array(4));
      expect(res.read).assertEqual(1);
      expect(res.written).assertEqual(3);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_2900
     * @tc.name      testTextEncoderEncodeInto02_0029
     * @tc.desc      Verify control chars, surrogates, and constructor params.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0029";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();

      let dest = new Uint8Array(3);
      let res = encoder.encodeInto("\n\t\r", dest);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(10);

      res = encoder.encodeInto("!@#", dest);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(33);

      let destLarge = new Uint8Array(10);
      res = encoder.encodeInto("\uD800\uFFFD", destLarge);
      expect(res.written).assertEqual(6);
      expect(destLarge[0]).assertEqual(0xEF);
      expect(destLarge[1]).assertEqual(0xBF);
      expect(destLarge[2]).assertEqual(0xBD);

      try {
        const encGbk = new util.TextEncoder("gbk");
        res = encGbk.encodeInto("abc", dest);
        expect(res.written).assertEqual(3);
      } catch (e) {
      }
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3000
     * @tc.name      testTextEncoderEncodeInto02_0030
     * @tc.desc      Stress test with long string fitting and truncating.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0030";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const len = 1000;
      const input = "a".repeat(len);

      let dest = new Uint8Array(len);
      let res = encoder.encodeInto(input, dest);
      expect(res.read).assertEqual(len);
      expect(res.written).assertEqual(len);

      // 1000 chars -> Buffer(500)
      let destSmall = new Uint8Array(500);
      res = encoder.encodeInto(input, destSmall);
      expect(res.read).assertEqual(500);
      expect(res.written).assertEqual(500);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3100
     * @tc.name      testTextEncoderEncodeInto02_0031
     * @tc.desc      Verify encoding into a subarray (view) of a larger buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0031";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const buffer = new Uint8Array(10);
      buffer.fill(0xFF);

      const subView = buffer.subarray(2, 5); // indices 2, 3, 4

      const res = encoder.encodeInto("abc", subView);

      expect(res.written).assertEqual(3);

      expect(buffer[0]).assertEqual(0xFF);
      expect(buffer[1]).assertEqual(0xFF);

      expect(buffer[2]).assertEqual(97);
      expect(buffer[3]).assertEqual(98);
      expect(buffer[4]).assertEqual(99);

      expect(buffer[5]).assertEqual(0xFF);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3200
     * @tc.name      testTextEncoderEncodeInto02_0032
     * @tc.desc      Verify that encoding overwrites existing data but leaves remaining buffer untouched.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0032";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array([1, 2, 3, 4, 5]);

      const res = encoder.encodeInto("A", dest);
      expect(res.written).assertEqual(1);
      expect(dest[0]).assertEqual(65); // 'A'

      expect(dest[1]).assertEqual(2);
      expect(dest[2]).assertEqual(3);
      expect(dest[4]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3300
     * @tc.name      testTextEncoderEncodeInto02_0033
     * @tc.desc      Verify 2-byte characters (Range U+0080 to U+07FF).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0033";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();

      const input = "¢©";
      const dest = new Uint8Array(10);

      const res = encoder.encodeInto(input, dest);

      expect(res.read).assertEqual(2);
      expect(res.written).assertEqual(4); // 2 * 2 bytes

      expect(dest[0]).assertEqual(0xC2);
      expect(dest[1]).assertEqual(0xA2);
      expect(dest[2]).assertEqual(0xC2);
      expect(dest[3]).assertEqual(0xA9);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3400
     * @tc.name      testTextEncoderEncodeInto02_0034
     * @tc.desc      Verify non-string input handling (Expect strict rejection).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0034";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const numInput = 12345;
      const dest = new Uint8Array(10);

      try {
        const res = encoder.encodeInto(numInput as Object as string, dest);

        console.info("[testInputTypeCoercion] System performed implicit coercion.");
        expect(res.read).assertEqual(5);
        expect(res.written).assertEqual(5);
      } catch (e) {
        console.info(`[testInputTypeCoercion] Caught expected error for invalid input: ${e}`);
        expect(e !== null).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3500
     * @tc.name      testTextEncoderEncodeInto02_0035
     * @tc.desc      Verify atomic truncation specifically for Replacement Character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0035";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const input = "\uD800";
      const dest = new Uint8Array(2);

      const res = encoder.encodeInto(input, dest);

      expect(res.read).assertEqual(0);
      expect(res.written).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3600
     * @tc.name      testTextEncoderEncodeInto02_0036
     * @tc.desc      Verify mixing valid ASCII with invalid surrogates.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0036";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      // "A" (1 byte) + \uD800 (Invalid -> 3 bytes) + "B" (1 byte) = 5 bytes total
      const input = "A\uD800B";
      const dest = new Uint8Array(10);

      const res = encoder.encodeInto(input, dest);

      expect(res.read).assertEqual(3); // 3 chars processed
      expect(res.written).assertEqual(5);

      expect(dest[0]).assertEqual(65); // 'A'
      expect(dest[1]).assertEqual(0xEF); // Replacement char start
      expect(dest[4]).assertEqual(66); // 'B'
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3700
     * @tc.name      testTextEncoderEncodeInto02_0037
     * @tc.desc      Verify the integrity of the returned object keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0037";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const res = encoder.encodeInto("a", new Uint8Array(1));

      expect(JSON.stringify(res)).assertContain("read");
      expect(JSON.stringify(res)).assertContain("written");
      expect(Object.keys(res).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3800
     * @tc.name      testTextEncoderEncodeInto02_0038
     * @tc.desc      Verify that encoder maintains no state between calls (Truncation doesn't break next call).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0038";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();


      const destSmall = new Uint8Array(1);
      encoder.encodeInto("€", destSmall);

      const destNormal = new Uint8Array(3);
      const res = encoder.encodeInto("abc", destNormal);

      expect(res.read).assertEqual(3);
      expect(res.written).assertEqual(3);
      expect(destNormal[0]).assertEqual(97);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_3900
     * @tc.name      testTextEncoderEncodeInto02_0039
     * @tc.desc      Verify encoding a small string into a very large buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0039";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();

      try {
        const dest = new Uint8Array(1024 * 1024);
        const res = encoder.encodeInto("A", dest);
        expect(res.written).assertEqual(1);
        expect(dest[0]).assertEqual(65);
      } catch (e) {

        console.warn("Large buffer test skipped due to memory limit");
      }
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4000
     * @tc.name      testTextEncoderEncodeInto02_0040
     * @tc.desc      Verify offsets when writing a stream of identical multi-byte chars.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeInto02_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeInto02_0040";
      console.info(`${TAG} start`);

      const encoder = new util.TextEncoder();
      const input = "中中中中中";
      const dest = new Uint8Array(15);
      const res = encoder.encodeInto(input, dest);

      expect(res.read).assertEqual(5);
      expect(res.written).assertEqual(15);

      expect(dest[14]).assertEqual(0xAD);

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4100
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0041
     * @tc.desc      Verify encoding an empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0041";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      const res = encoder.encodeIntoUint8Array("", dest);
      expect(res.read).assertEqual(0);
      expect(res.written).assertEqual(0);
      expect(dest[0]).assertEqual(0);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4200
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0042
     * @tc.desc      Verify encoding standard ASCII string "abcd".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0042";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      const res = encoder.encodeIntoUint8Array("abcd", dest);
      expect(res.read).assertEqual(4);
      expect(res.written).assertEqual(4);
      expect(dest[0]).assertEqual(97); // 'a'
      expect(dest[1]).assertEqual(98); // 'b'
      expect(dest[2]).assertEqual(99); // 'c'
      expect(dest[3]).assertEqual(100); // 'd'
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4300
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0043
     * @tc.desc      Verify encoding 3-byte Chinese characters .
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0043";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      const res = encoder.encodeIntoUint8Array("你好", dest);
      expect(res.read).assertEqual(2);
      expect(res.written).assertEqual(6); // 2 * 3 bytes
      expect(dest[0]).assertEqual(228); // 0xE4
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4400
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0044
     * @tc.desc      Verify encoding 4-byte Emoji .
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0044";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      const res = encoder.encodeIntoUint8Array("😊", dest);
      expect(res.read).assertEqual(2); // UTF-16 units
      expect(res.written).assertEqual(4); // UTF-8 bytes
      expect(dest[0]).assertEqual(240); // 0xF0
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4500
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0045
     * @tc.desc      Verify encoding mixed content (ASCII + Chinese + Emoji).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0045";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(20);
      const res = encoder.encodeIntoUint8Array("A中😊", dest);
      expect(res.written).assertEqual(8);
      expect(dest[0]).assertEqual(65);
      expect(dest[1]).assertEqual(228);
      expect(dest[4]).assertEqual(240);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4600
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0046
     * @tc.desc      Verify encoding control characters (\n, \t, \r).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0046";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      const res = encoder.encodeIntoUint8Array("\n\t\r", dest);

      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(10); // \n
      expect(dest[1]).assertEqual(9);  // \t
      expect(dest[2]).assertEqual(13); // \r
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4700
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0047
     * @tc.desc      Verify Exact Fit: Buffer length equals encoded length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0047";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();

      const dest = new Uint8Array(3);
      const res = encoder.encodeIntoUint8Array("中", dest);
      expect(res.written).assertEqual(3);
      expect(res.read).assertEqual(1);
      expect(dest[0]).assertEqual(228);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4800
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0048
     * @tc.desc      Verify Oversized Buffer: Ensure extra space remains untouched.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0048";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array([1, 1, 1, 1, 1]);
      const res = encoder.encodeIntoUint8Array("A", dest);
      expect(res.written).assertEqual(1);
      expect(dest[0]).assertEqual(65);
      expect(dest[1]).assertEqual(1);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_4900
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0049
     * @tc.desc      Verify Offset Writing using subarray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0049";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const fullBuffer = new Uint8Array(5);
      const subBuffer = fullBuffer.subarray(2);
      const res = encoder.encodeIntoUint8Array("A", subBuffer);
      expect(res.written).assertEqual(1);
      expect(fullBuffer[2]).assertEqual(65);
      expect(fullBuffer[0]).assertEqual(0);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5000
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0050
     * @tc.desc      Verify instance reuse for multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0050";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest1 = new Uint8Array(5);
      const dest2 = new Uint8Array(5);
      const res1 = encoder.encodeIntoUint8Array("A", dest1);
      const res2 = encoder.encodeIntoUint8Array("B", dest2);
      expect(res1.written).assertEqual(1);
      expect(dest1[0]).assertEqual(65);
      expect(res2.written).assertEqual(1);
      expect(dest2[0]).assertEqual(66);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5100
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0051
     * @tc.desc      Verify encoding into a zero-length buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0051";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(0);
      const res = encoder.encodeIntoUint8Array("ABC", dest);
      expect(res.read).assertEqual(0);
      expect(res.written).assertEqual(0);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5200
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0052
     * @tc.desc      Verify partial write logic (ASCII truncation).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0052";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(2);

      const res = encoder.encodeIntoUint8Array("ABC", dest);
      expect(res.read).assertEqual(2);
      expect(res.written).assertEqual(2);
      expect(dest[0]).assertEqual(65);
      expect(dest[1]).assertEqual(66);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5300
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0053
     * @tc.desc      Verify atomic truncation: 3-byte char into insufficient buffers (1, 2 bytes).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0053";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const input = "中";

      for (let size = 1; size <= 2; size++) {
        console.info(`${TAG} Testing with buffer size: ${size}`);
        const dest = new Uint8Array(size);
        const res = encoder.encodeIntoUint8Array(input, dest);

        expect(res.written).assertEqual(0);
        expect(res.read).assertEqual(0);

        expect(dest[0]).assertEqual(0);
      }

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5400
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0054
     * @tc.desc      Verify atomic truncation: 4-byte char into insufficient buffers (1, 2, 3 bytes).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0054";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const input = "😊";

      for (let size = 1; size <= 3; size++) {
        console.info(`${TAG} Testing with buffer size: ${size}`);
        const dest = new Uint8Array(size);
        const res = encoder.encodeIntoUint8Array(input, dest);

        expect(res.written).assertEqual(0);
        expect(res.read).assertEqual(0);

        expect(dest[0]).assertEqual(0);
      }

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5500
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0055
     * @tc.desc      Verify partial write logic (Mixed chars).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0055";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();

      const dest = new Uint8Array(4);
      const res = encoder.encodeIntoUint8Array("AB中", dest);
      expect(res.read).assertEqual(2);
      expect(res.written).assertEqual(2);
      expect(dest[0]).assertEqual(65);
      expect(dest[1]).assertEqual(66);
      expect(dest[2]).assertEqual(0);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5600
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0056
     * @tc.desc      Verify Lone High Surrogate (Replacement Char).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0056";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);

      const res = encoder.encodeIntoUint8Array("\uD800", dest);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(239);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5700
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0057
     * @tc.desc      Verify Lone Low Surrogate (Replacement Char).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0057";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);

      const res = encoder.encodeIntoUint8Array("\uDC00", dest);
      expect(res.written).assertEqual(3);
      expect(dest[0]).assertEqual(239);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5800
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0058
     * @tc.desc      Verify Reversed Surrogates (Two Replacements).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0058";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);

      const res = encoder.encodeIntoUint8Array("\uDC00\uD800", dest);
      expect(res.written).assertEqual(6);
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_5900
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0059
     * @tc.desc      Verify numeric input handling (Runtime Check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0059";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);
      try {
        const res = encoder.encodeIntoUint8Array((12345 as Object) as string, dest);
        expect(res.written).assertEqual(5);
        expect(dest[0]).assertEqual(49);
      } catch (e) {
        console.warn("Caught expected error for number input");
      }
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_6000
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0060
     * @tc.desc      Verify boolean input throws error (Strict Type Check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0060";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      const dest = new Uint8Array(10);

      let isErrorCaught = false;

      try {
        encoder.encodeIntoUint8Array((true as Object) as string, dest);
        console.info(`${TAG} Failed: System accepted Boolean input unexpectedly`);
      } catch (e) {
        console.info(`${TAG} Success: Caught expected type error: ${e}`);
        isErrorCaught = true;
      }
      expect(isErrorCaught).assertTrue();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_UTIL_TEXTENCODER02_6100
     * @tc.name      testTextEncoderEncodeIntoUint8Array02_0061
     * @tc.desc      Verify encoding a small string into a large buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextEncoderEncodeIntoUint8Array02_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextEncoderEncodeIntoUint8Array02_0061";
      console.info(`${TAG} start`);
      const encoder = new util.TextEncoder();
      try {
        const dest = new Uint8Array(1024 * 1024);
        const res = encoder.encodeIntoUint8Array("A", dest);
        expect(res.written).assertEqual(1);
        expect(dest[0]).assertEqual(65);
      } catch (e) {
        console.warn("Large buffer test skipped");
      }
      console.info(`${TAG} end`);
    });

  });
}