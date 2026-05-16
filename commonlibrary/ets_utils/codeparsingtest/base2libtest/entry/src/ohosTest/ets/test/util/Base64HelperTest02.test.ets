import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArrayList, JSON, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Base64Helper02Test() {
  describe('Base64Helper02Test', () => {
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
     * @tc.number    SUB_UTIL_BASE64HELPER02_0100
     * @tc.name      testEncodeSync02_0001
     * @tc.desc      [Padding] 1 byte input -> 4 bytes output (2 pads)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0001";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([65]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(61);
      expect(result[3]).assertEqual(61);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0200
     * @tc.name      testEncodeSync02_0002
     * @tc.desc      [Padding] 2 bytes input -> 4 bytes output (1 pad)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0002";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 'AB' (65, 66) -> "QUI="
      let array = new Uint8Array([65, 66]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(61);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0300
     * @tc.name      testEncodeSync02_0003
     * @tc.desc      [Padding] 3 bytes input -> 4 bytes output (0 pads)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0003";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([65, 66, 67]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result[3]).assertEqual(68);
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0400
     * @tc.name      testEncodeSync02_0004
     * @tc.desc      [Logic] 4 bytes input -> 8 bytes output
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0004";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 'AAAA' -> "QUFBQQ=="
      let array = new Uint8Array([65, 65, 65, 65]);
      let result = base64Helper.encodeSync(array);
      console.info("result length = " + result.length);
      expect(result.length).assertEqual(8);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0500
     * @tc.name      testEncodeSync02_0005
     * @tc.desc      [Logic] 5 bytes input -> 8 bytes output
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0005";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 'AAAAA' -> "QUFBQUE="
      let array = new Uint8Array([65, 65, 65, 65, 65]);
      let result = base64Helper.encodeSync(array);
      console.info("result length = " + result.length);
      expect(result.length).assertEqual(8);
      expect(result[7]).assertEqual(61); // Last is pad
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0600
     * @tc.name      testEncodeSync02_0006
     * @tc.desc      [Content] Verify Standard Base64 '+' character (0xFB input)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0006";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 0xFB (251) -> 11111011 -> " +w=="
      let array = new Uint8Array([251]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(43); // '+' (Standard)
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0700
     * @tc.name      testEncodeSync02_0007
     * @tc.desc      [Content] Verify Standard Base64 '/' character (0xFF input)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0007";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 0xFF (255) -> 11111111 -> "/w=="
      let array = new Uint8Array([255]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(47); // '/' (Standard)
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0800
     * @tc.name      testEncodeSync02_0008
     * @tc.desc      [Content] Verify Null byte (0x00) handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0008";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // [0] -> "AA=="
      let array = new Uint8Array([0]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // 'A'(65)
      expect(result[0]).assertEqual(65);
      expect(result[1]).assertEqual(65);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_0900
     * @tc.name      testEncodeSync02_0009
     * @tc.desc      [Content] Verify mixed bytes [0, 255, 127]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0009";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // [0, 255, 127] -> "AP9/"
      let array = new Uint8Array([0, 255, 127]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // 'A'(65), 'P'(80), '9'(57), '/'(47)
      expect(result[0]).assertEqual(65);
      expect(result[1]).assertEqual(80);
      expect(result[2]).assertEqual(57);
      expect(result[3]).assertEqual(47);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1000
     * @tc.name      testEncodeSync02_0010
     * @tc.desc      [Content] Verify specific user case 's13'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0010";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 's13' -> [115, 49, 51]
      let array = new Uint8Array([115, 49, 51]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // "czEz" -> 99, 122, 69, 122
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(122);
      expect(result[2]).assertEqual(69);
      expect(result[3]).assertEqual(122);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1100
     * @tc.name      testEncodeSync02_0011
     * @tc.desc      [Content] Verify control chars \n (10)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0011";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // [10] -> "Cg=="
      let array = new Uint8Array([10]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(67); // C
      expect(result[1]).assertEqual(103); // g
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1200
     * @tc.name      testEncodeSync02_0012
     * @tc.desc      [Content] Verify High ASCII [128]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0012";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // [128] -> "gA=="
      let array = new Uint8Array([128]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(103); // g
      expect(result[1]).assertEqual(65); // A
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1300
     * @tc.name      testEncodeSync02_0013
     * @tc.desc      [Content] Verify repeated bytes [65, 65, 65]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0013";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([65, 65, 65]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // "QUFB" -> 81, 85, 70, 66
      expect(result[0]).assertEqual(81);
      expect(result[1]).assertEqual(85);
      expect(result[2]).assertEqual(70);
      expect(result[3]).assertEqual(66);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1400
     * @tc.name      testEncodeSync02_0014
     * @tc.desc      [Performance] Verify large buffer (1024 bytes) output length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0014";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array(1024);
      let result = base64Helper.encodeSync(array);
      // ceil(1024/3)*4 = 342*4 = 1368
      console.info("result length = " + result.length);
      expect(result.length).assertEqual(1368);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1500
     * @tc.name      testEncodeSync02_0015
     * @tc.desc      [Memory] Verify Subarray view input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0015";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // [0, 65, 0] -> View of [65]
      let buffer = new Uint8Array([0, 65, 0]);
      let view = buffer.subarray(1, 2);
      let result = base64Helper.encodeSync(view);
      console.info("result = " + result);
      // "QQ=="
      expect(result[0]).assertEqual(81);
      expect(result[1]).assertEqual(81);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1600
     * @tc.name      testEncodeSync02_0016
     * @tc.desc      [Memory] Verify Offset ArrayBuffer input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0016";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let buffer = new ArrayBuffer(10);
      let view = new Uint8Array(buffer, 5, 1);
      view[0] = 65; // 'A'
      let result = base64Helper.encodeSync(view);
      console.info("result = " + result);
      // "QQ=="
      expect(result[0]).assertEqual(81);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1700
     * @tc.name      testEncodeSync02_0017
     * @tc.desc      [Logic] Verify multiple instances don't conflict
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0017";
      console.info(TAG + " start");
      let h1 = new util.Base64Helper();
      let h2 = new util.Base64Helper();
      let arr1 = new Uint8Array([65]);
      let arr2 = new Uint8Array([66]);

      let res1 = h1.encodeSync(arr1); // A -> QQ==
      let res2 = h2.encodeSync(arr2); // B -> Qg==

      expect(res1[0]).assertEqual(81);
      expect(res2[0]).assertEqual(81);
      expect(res1[1]).assertEqual(81);
      expect(res2[1]).assertEqual(103);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1800
     * @tc.name      testEncodeSync02_0018
     * @tc.desc      [Type] Verify return is Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0018";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([65]);
      let result = base64Helper.encodeSync(array);
      expect(result instanceof Uint8Array).assertTrue();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_1900
     * @tc.name      testEncodeSync02_0019
     * @tc.desc      [Content] Verify 0xAA (10101010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0019";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 0xAA -> "qg=="
      let array = new Uint8Array([0xAA]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // 'q'(113), 'g'(103)
      expect(result[0]).assertEqual(113);
      expect(result[1]).assertEqual(103);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2000
     * @tc.name      testEncodeSync02_0020
     * @tc.desc      [Content] Verify 0x55 (01010101)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0020";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 0x55 -> "VQ=="
      let array = new Uint8Array([0x55]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // 'V'(86), 'Q'(81)
      expect(result[0]).assertEqual(86);
      expect(result[1]).assertEqual(81);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2100
     * @tc.name      testEncodeSync02_0021
     * @tc.desc      [Content] Verify [0, 1, 2, 3] -> "AAECAw=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0021";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([0, 1, 2, 3]);
      let result = base64Helper.encodeSync(array);
      console.info("result = " + result);
      // A(65) A(65) E(69) C(67) A(65) w(119) =(61) =(61)
      expect(result[2]).assertEqual(69);
      expect(result[3]).assertEqual(67);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2200
     * @tc.name      testEncodeSync02_0022
     * @tc.desc      [Content] Verify '123' -> "MTIz"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0022";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // '123' [49, 50, 51]
      let array = new Uint8Array([49, 50, 51]);
      let result = base64Helper.encodeSync(array);
      // "MTIz" -> 77, 84, 73, 122
      expect(result[0]).assertEqual(77);
      expect(result[3]).assertEqual(122);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2300
     * @tc.name      testEncodeSync02_0023
     * @tc.desc      [Content] Verify 'abc' -> "YWJj"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0023";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 'abc'
      let array = new Uint8Array([97, 98, 99]);
      let result = base64Helper.encodeSync(array);
      // "YWJj" -> 89, 87, 74, 106
      expect(result[0]).assertEqual(89);
      expect(result[3]).assertEqual(106);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2400
     * @tc.name      testEncodeSync02_0024
     * @tc.desc      [Logic] Check standard output for potential URL safe chars (should be +/)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeSync02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testEncodeSync02_0024";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // Input 255 -> "/w=="
      let array = new Uint8Array([255]);
      let result = base64Helper.encodeSync(array);
      // Check for '/' (47), ensure it is NOT '_' (95)
      expect(result[0]).assertEqual(47);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2500
     * @tc.name      testDecodeSync02_0025
     * @tc.desc      [Logic] Verify decoding with 2 padding chars (1 byte output)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0025";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([81, 81, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(65);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2600
     * @tc.name      testDecodeSync02_0026
     * @tc.desc      [Logic] Verify decoding with 1 padding char (2 bytes output)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0026";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([81, 85, 73, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(65);
      expect(result[1]).assertEqual(66);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2700
     * @tc.name      testDecodeSync02_0027
     * @tc.desc      [Logic] Verify decoding with 0 padding chars (3 bytes output)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0027";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([81, 85, 74, 68]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(65);
      expect(result[1]).assertEqual(66);
      expect(result[2]).assertEqual(67);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2800
     * @tc.name      testDecodeSync02_0028
     * @tc.desc      [Content] Verify mixed alphanumeric decoding (Merges number/letter cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0028";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "YWJjMTIz" -> [89, 87, 74, 106, 77, 84, 73, 122]
      let array = new Uint8Array([89, 87, 74, 106, 77, 84, 73, 122]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      // 'a'(97), 'b'(98), 'c'(99), '1'(49), '2'(50), '3'(51)
      expect(result[0]).assertEqual(97);
      expect(result[3]).assertEqual(49);
      expect(result[5]).assertEqual(51);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_2900
     * @tc.name      testDecodeSync02_0029
     * @tc.desc      [Content] Verify control characters \n, \r, \t
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0029";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "Cg0J" -> 67, 103, 48, 74
      let array = new Uint8Array([67, 103, 48, 74]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(13);
      expect(result[2]).assertEqual(9);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3000
     * @tc.name      testDecodeSync02_0030
     * @tc.desc      [Content] Verify decoding Null byte (0x00)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0030";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "AA==" -> 65, 65, 61, 61
      let array = new Uint8Array([65, 65, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(0);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3100
     * @tc.name      testDecodeSync02_0031
     * @tc.desc      [Content] Verify decoding Max byte (0xFF)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0031";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "/w==" -> 47, 119, 61, 61
      let array = new Uint8Array([47, 119, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(255);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3200
     * @tc.name      testDecodeSync02_0032
     * @tc.desc      [Content] Verify decoding High ASCII (0x80)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0032";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "gA==" -> 103, 65, 61, 61
      let array = new Uint8Array([103, 65, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(128);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3300
     * @tc.name      testDecodeSync02_0033
     * @tc.desc      [Content] Verify Mixed Binary (0x00, 0xFF, 0x80)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0033";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "AP+A" -> 65, 80, 43, 65
      let array = new Uint8Array([65, 80, 43, 65]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(128);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3400
     * @tc.name      testDecodeSync02_0034
     * @tc.desc      [Symbol] Verify decoding Standard '+' symbol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0034";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "+w==" -> 43, 119, 61, 61
      let array = new Uint8Array([43, 119, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(251);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3500
     * @tc.name      testDecodeSync02_0035
     * @tc.desc      [Symbol] Verify decoding Standard '/' symbol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0035";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "/w==" -> 47, 119, 61, 61
      let array = new Uint8Array([47, 119, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(255);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3600
     * @tc.name      testDecodeSync02_0036
     * @tc.desc      [Unicode] Verify decoding Chinese UTF-8 bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0036";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "5Lit" -> 53, 76, 105, 116
      let array = new Uint8Array([53, 76, 105, 116]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(228);
      expect(result[1]).assertEqual(184);
      expect(result[2]).assertEqual(173);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3700
     * @tc.name      testDecodeSync02_0037
     * @tc.desc      [Unicode] Verify decoding Emoji UTF-8 bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0037";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "8J+agA==" -> 56, 74, 43, 97, 103, 65, 61, 61
      let array = new Uint8Array([56, 74, 43, 97, 103, 65, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(240);
      expect(result[1]).assertEqual(159);
      expect(result[3]).assertEqual(128);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3800
     * @tc.name      testDecodeSync02_0038
     * @tc.desc      [Unicode] Verify decoding mixed English and Chinese
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0038";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();

      let array = new Uint8Array([81, 101, 83, 52, 114, 101, 87, 98, 118, 81, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(65); // A
      expect(result[1]).assertEqual(228); // 中(start)
      expect(result[4]).assertEqual(229); // 国(start)
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_3900
     * @tc.name      testDecodeSync02_0039
     * @tc.desc      [Memory] Verify decoding from Subarray view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0039";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let buffer = new Uint8Array([0, 81, 81, 61, 61, 0]);
      let view = buffer.subarray(1, 5);
      let result = base64Helper.decodeSync(view);
      console.info("result = " + result);
      expect(result[0]).assertEqual(65); // A
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4000
     * @tc.name      testDecodeSync02_0040
     * @tc.desc      [Memory] Verify ArrayBuffer with offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0040";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let buffer = new ArrayBuffer(10);
      let view = new Uint8Array(buffer, 5, 4);
      view.set([81, 81, 61, 61]); // "QQ=="
      let result = base64Helper.decodeSync(view);
      console.info("result = " + result);
      expect(result[0]).assertEqual(65); // A
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4100
     * @tc.name      testDecodeSync02_0041
     * @tc.desc      [Performance] Verify decoding 1KB buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0041";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // 1024 'Q's -> 1024 / 4 * 3 = 768 bytes
      let array = new Uint8Array(1024).fill(81);
      let result = base64Helper.decodeSync(array);
      console.info("result length = " + result.length);
      expect(result.length).assertEqual(768);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4200
     * @tc.name      testDecodeSync02_0042
     * @tc.desc      [Bitwise] Verify 0xAA (10101010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0042";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "qg==" -> 113, 103, 61, 61
      let array = new Uint8Array([113, 103, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(170); // 0xAA
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4300
     * @tc.name      testDecodeSync02_0043
     * @tc.desc      [Bitwise] Verify 0x55 (01010101)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0043";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "VQ==" -> 86, 81, 61, 61
      let array = new Uint8Array([86, 81, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(85); // 0x55
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4400
     * @tc.name      testDecodeSync02_0044
     * @tc.desc      [UserCase] Verify 's13' example
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0044";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "czEz" -> 99, 122, 69, 122
      let array = new Uint8Array([99, 122, 69, 122]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(115);
      expect(result[1]).assertEqual(49);
      expect(result[2]).assertEqual(51);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4500
     * @tc.name      testDecodeSync02_0045
     * @tc.desc      [Logic] Verify multiple instances don't conflict
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0045";
      console.info(TAG + " start");
      let h1 = new util.Base64Helper();
      let h2 = new util.Base64Helper();
      let in1 = new Uint8Array([81, 81, 61, 61]); // A
      let in2 = new Uint8Array([81, 103, 61, 61]); // B

      let res1 = h1.decodeSync(in1);
      let res2 = h2.decodeSync(in2);

      expect(res1[0]).assertEqual(65);
      expect(res2[0]).assertEqual(66);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4600
     * @tc.name      testDecodeSync02_0046
     * @tc.desc      [Type] Verify return type is Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0046";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let array = new Uint8Array([81, 81, 61, 61]);
      let result = base64Helper.decodeSync(array);
      expect(result instanceof Uint8Array).assertTrue();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4700
     * @tc.name      testDecodeSync02_0047
     * @tc.desc      [Logic] Verify length logic (4 bytes -> 3 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0047";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "QUFB" -> AAA
      let array = new Uint8Array([81, 85, 70, 66]);
      let result = base64Helper.decodeSync(array);
      expect(result.length).assertEqual(3);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4800
     * @tc.name      testDecodeSync02_0048
     * @tc.desc      [Content] Verify sequential bytes [0,1,2,3]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDecodeSync02_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testDecodeSync02_0048";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // "AAECAw==" -> 65,65,69,67,65,119,61,61
      let array = new Uint8Array([65, 65, 69, 67, 65, 119, 61, 61]);
      let result = base64Helper.decodeSync(array);
      console.info("result = " + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
      console.info(TAG + " end");
    });
    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_4900
     * @tc.name      testEncode02_0049
     * @tc.desc      [Logic] Verify 1 byte input results in 2 padding chars ('==')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0049";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([65]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 81(Q), 81(Q), 61(=), 61(=)
        expect(result[0]).assertEqual(81);
        expect(result[2]).assertEqual(61);
        expect(result[3]).assertEqual(61);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5000
     * @tc.name      testEncode02_0050
     * @tc.desc      [Logic] Verify 2 bytes input results in 1 padding char ('=')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0050";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([65, 66]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 81(Q), 85(U), 73(I), 61(=)
        expect(result[3]).assertEqual(61);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5100
     * @tc.name      testEncode02_0051
     * @tc.desc      [Logic] Verify 3 bytes input results in 0 padding chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0051";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([65, 66, 67]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);

        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(68);
        done();
      } catch (e) {
        console.error(TAG + " failed: " + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5200
     * @tc.name      testEncode02_0052
     * @tc.desc      [Content] Verify the specific user example 's13' -> 'czEz'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0052";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 99(c), 122(z), 69(E), 122(z)
        expect(result[0]).assertEqual(99);
        expect(result[1]).assertEqual(122);
        expect(result[2]).assertEqual(69);
        expect(result[3]).assertEqual(122);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5300
     * @tc.name      testEncode02_0053
     * @tc.desc      [Content] Verify encoding Null bytes (0x00)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0053";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([0]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 65(A), 65(A), 61(=), 61(=)
        expect(result[0]).assertEqual(65);
        expect(result[1]).assertEqual(65);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5400
     * @tc.name      testEncode02_0054
     * @tc.desc      [Content] Verify encoding Max bytes (0xFF) -> '/'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0054";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([255]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 47(/), 119(w), 61(=), 61(=)
        expect(result[0]).assertEqual(47);
        expect(result[1]).assertEqual(119);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5500
     * @tc.name      testEncode02_0055
     * @tc.desc      [Content] Verify encoding to Standard Base64 '+' (0xFB)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = "testEncode02_0055";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let array = new Uint8Array([251]);
        let result = await base64Helper.encode(array);
        console.info("result = " + result);
        // 43(+), 119(w)
        expect(result[0]).assertEqual(43);
        expect(result[1]).assertEqual(119);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5600
     * @tc.name      testEncode02_0056
     * @tc.desc      [Content] Verify encoding control characters (\n, \r)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0056";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([10, 13]);
          let result = await base64Helper.encode(array);
          console.info("result = " + result);
          // 67(C), 103(g), 48(0), 61(=)
          expect(result[0]).assertEqual(67);
          expect(result[1]).assertEqual(103);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5700
     * @tc.name      testEncode02_0057
     * @tc.desc      [Content] Verify mixed binary input [0, 255]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0057";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([0, 255]);
          let result = await base64Helper.encode(array);
          console.info("result = " + result);
          // 65(A), 80(P), 56(8), 61(=)
          expect(result[0]).assertEqual(65);
          expect(result[1]).assertEqual(80);
          expect(result[2]).assertEqual(56);
          expect(result[3]).assertEqual(61);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5800
     * @tc.name      testEncode02_0058
     * @tc.desc      [Memory] Verify encoding a Subarray View
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0058";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let buffer = new Uint8Array([0, 65, 0]);
          let view = buffer.subarray(1, 2);
          let result = await base64Helper.encode(view);
          console.info("result = " + result);
          // "QQ==" -> 81, 81
          expect(result[0]).assertEqual(81);
          expect(result[1]).assertEqual(81);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_5900
     * @tc.name      testEncode02_0059
     * @tc.desc      [Memory] Verify encoding ArrayBuffer with offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0059";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let buffer = new ArrayBuffer(10);
          let view = new Uint8Array(buffer, 5, 1);
          view[0] = 65; // 'A'
          let result = await base64Helper.encode(view);
          // "QQ=="
          expect(result[0]).assertEqual(81);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6000
     * @tc.name      testEncode02_0060
     * @tc.desc      [Performance] Verify encoding 1KB buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0060";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array(1024);
          let result = await base64Helper.encode(array);
          // 1024 / 3 * 4 = 1368
          console.info("result length = " + result.length);
          expect(result.length).assertEqual(1368);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6100
     * @tc.name      testEncode02_0061
     * @tc.desc      [Content] Verify encoding High ASCII (0x80)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0061";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([128]);
          let result = await base64Helper.encode(array);
          // 103(g), 65(A)
          expect(result[0]).assertEqual(103);
          expect(result[1]).assertEqual(65);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6200
     * @tc.name      testEncode02_0062
     * @tc.desc      [Content] Verify 0xAA (10101010) -> "qg=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0062";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([0xAA]);
          let result = await base64Helper.encode(array);
          // 113(q), 103(g)
          expect(result[0]).assertEqual(113);
          expect(result[1]).assertEqual(103);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6300
     * @tc.name      testEncode02_0063
     * @tc.desc      [Content] Verify 0x55 (01010101) -> "VQ=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0063";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([0x55]);
          let result = await base64Helper.encode(array);
          // 86(V), 81(Q)
          expect(result[0]).assertEqual(86);
          expect(result[1]).assertEqual(81);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6400
     * @tc.name      testEncode02_0064
     * @tc.desc      [Content] Verify sequential bytes [0, 1, 2, 3] -> "AAECAw=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0064";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([0, 1, 2, 3]);
          let result = await base64Helper.encode(array);
          // A, A, E(69), C(67)
          expect(result[2]).assertEqual(69);
          expect(result[3]).assertEqual(67);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6500
     * @tc.name      testEncode02_0065
     * @tc.desc      [Content] Verify repeated bytes 'AAA' -> "QUFB"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0065";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([65, 65, 65]);
          let result = await base64Helper.encode(array);
          // 81, 85, 70, 66
          expect(result[0]).assertEqual(81);
          expect(result[1]).assertEqual(85);
          expect(result[2]).assertEqual(70);
          expect(result[3]).assertEqual(66);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6600
     * @tc.name      testEncode02_0066
     * @tc.desc      [Logic] Verify 4 bytes input -> 8 bytes output
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0066";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([65, 65, 65, 65]);
          let result = await base64Helper.encode(array);
          expect(result.length).assertEqual(8);
          expect(result[7]).assertEqual(61);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6700
     * @tc.name      testEncode02_0067
     * @tc.desc      [Logic] Verify 5 bytes input -> 8 bytes output
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0067";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([65, 65, 65, 65, 65]);
          let result = await base64Helper.encode(array);
          expect(result.length).assertEqual(8);
          expect(result[7]).assertEqual(61);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6800
     * @tc.name      testEncode02_0068
     * @tc.desc      [Type] Verify result is Uint8Array instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0068";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let result = await base64Helper.encode(new Uint8Array([65]));
          expect(result instanceof Uint8Array).assertTrue();
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_6900
     * @tc.name      testEncode02_0069
     * @tc.desc      [Logic] Verify double calls produce identical results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0069";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let input = new Uint8Array([65]);
          let r1 = await base64Helper.encode(input);
          let r2 = await base64Helper.encode(input);
          expect(r1[0]).assertEqual(r2[0]);
          expect(r1[1]).assertEqual(r2[1]);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7000
     * @tc.name      testEncode02_0070
     * @tc.desc      [Content] Mixed Complex: High ASCII + Null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0070";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([128, 0, 65]);
          let result = await base64Helper.encode(array);
          // 103(g), 65(A), 66(B), 66(B)
          expect(result[0]).assertEqual(103);
          expect(result[1]).assertEqual(65);
          expect(result[2]).assertEqual(66);
          expect(result[3]).assertEqual(66);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7100
     * @tc.name      testEncode02_0071
     * @tc.desc      [Content] Verify ASCII Numeric characters '123'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncode02_0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testEncode02_0071";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let array = new Uint8Array([49, 50, 51]);
          let result = await base64Helper.encode(array);
          // 77(M), 84(T), 73(I), 122(z)
          expect(result[0]).assertEqual(77);
          expect(result[3]).assertEqual(122);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7200
     * @tc.name      testBase64HelperDecoder02_0072
     * @tc.desc      [Padding] Verify decoding string with 2 padding chars "QQ==" -> 'A'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0072";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();

          let input = new Uint8Array([81, 81, 61, 61]);
          let result = await base64Helper.decode(input);
          console.info("result = " + result);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual(65); // 'A'
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7300
     * @tc.name      testBase64HelperDecoder02_0073
     * @tc.desc      [Padding] Verify decoding string with 1 padding char "QUI=" -> 'AB'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecode02_0073";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();

          let input = new Uint8Array([81, 85, 73, 61]);
          let result = await base64Helper.decode(input);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(65);
          expect(result[1]).assertEqual(66);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7400
     * @tc.name      testBase64HelperDecoder02_0074
     * @tc.desc      [Padding] Verify decoding string with 0 padding chars "QUJD" -> 'ABC'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0074";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let input = new Uint8Array([81, 85, 74, 68]);
          let result = await base64Helper.decode(input);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual(65);
          expect(result[1]).assertEqual(66);
          expect(result[2]).assertEqual(67);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7500
     * @tc.name      testBase64HelperDecoder02_0075
     * @tc.desc      [Content] Verify decoding standard Base64 symbols (+/) -> "+/w="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0075";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();

          let input = new Uint8Array([43, 47, 119, 61]);
          let result = await base64Helper.decode(input);
          expect(result[0]).assertEqual(251);
          expect(result[1]).assertEqual(252);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7600
     * @tc.name      testBase64HelperDecoder02_0076
     * @tc.desc      [Content] Verify decoding result is Null bytes "AA==" -> 0x00
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0076";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          // "AA==" -> [65, 65, 61, 61]
          let input = new Uint8Array([65, 65, 61, 61]);
          let result = await base64Helper.decode(input);
          expect(result[0]).assertEqual(0);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7700
     * @tc.name      testBase64HelperDecoder02_0077
     * @tc.desc      [Content] Verify decoding result is Max bytes "////" -> 0xFF, 0xFF, 0xFF
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0077";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          // "////" -> [47, 47, 47, 47]
          let input = new Uint8Array([47, 47, 47, 47]);
          let result = await base64Helper.decode(input);
          expect(result[0]).assertEqual(255);
          expect(result[1]).assertEqual(255);
          expect(result[2]).assertEqual(255);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7800
     * @tc.name      testBase64HelperDecoder02_0078
     * @tc.desc      [Memory] Verify decoding from a Subarray view (Buffer Offset)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0078";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          // Buffer: [0, 81, 81, 61, 61, 0] -> View "QQ==" at offset 1
          let buffer = new Uint8Array([0, 81, 81, 61, 61, 0]);
          let view = buffer.subarray(1, 5);
          let result = await base64Helper.decode(view);
          expect(result[0]).assertEqual(65); // A
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_7900
     * @tc.name      testBase64HelperDecoder02_0079
     * @tc.desc      [Performance] Verify decoding a larger buffer (1KB Base64)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0079";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();

          let input = new Uint8Array(1024).fill(81);
          let result = await base64Helper.decode(input);
          expect(result.length).assertEqual(768);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8000
     * @tc.name      testBase64HelperDecoder02_0080
     * @tc.desc      [Type] Verify return type is Uint8Array instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0080";
        console.info(TAG + " start");
        try {
          let base64Helper = new util.Base64Helper();
          let input = new Uint8Array([81, 81, 61, 61]);
          let result = await base64Helper.decode(input);
          expect(result instanceof Uint8Array).assertTrue();
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8100
     * @tc.name      testBase64HelperDecoder02_0081
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const TAG = "testBase64HelperDecoder02_0081";
        console.info(TAG + " start");
        try {
          let helper = new util.Base64Helper();
          let in1 = new Uint8Array([81, 81, 61, 61]); // A
          let in2 = new Uint8Array([81, 103, 61, 61]); // B

          let res1 = await helper.decode(in1);
          let res2 = await helper.decode(in2);

          expect(res1[0]).assertEqual(65);
          expect(res2[0]).assertEqual(66);
          done();
        } catch (e) {
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8200
     * @tc.name      testBase64HelperDecoder02_0082
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>
      let array = '\udc04 kilu';
      await baseHelper.decode(array, util.Type.MIME).then((val) => {
        arraylist.add(val);
      })
      expect(JSON.stringify(arraylist)).assertEqual('{"0":{"0":0,"1":0,"2":0,"3":146,"4":41,"5":110}}');
    });


    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8300
     * @tc.name      testBase64HelperDecoder02_0083
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>;
      let array = '\ud83c\udf85';
      await baseHelper.decode(array, util.Type.MIME).then((val) => {
        arraylist.add(val);
      })
      expect(JSON.stringify(arraylist)).assertEqual('{"0":{"0":0,"1":0,"2":0}}');
    });


    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8400
     * @tc.name      testBase64HelperDecoder02_0084
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>;
      await baseHelper.decode(init(3), util.Type.MIME).then((val) => {
        arraylist.add(val);
      })
      expect(JSON.stringify(arraylist))
        .assertEqual('{"0":{"0":0,"1":0,"2":26,"3":0,"4":13,"5":64,"6":0,"7":0,"8":26,"9":0,"10":13,"11":64}}');
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8500
     * @tc.name      testBase64HelperDecoder02_0085
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>;
      let str = "{k1:value1,k2:value2}"
      let result = str.substring(0, str.length - 2);
      await baseHelper.decode(result, util.Type.MIME).then((val) => {
        arraylist.add(val);
      })
      expect(JSON.stringify(arraylist))
        .assertEqual('{"0":{"0":2,"1":77,"2":64,"3":189,"4":169,"5":110,"6":123,"7":80,"8":36,"9":216,"10":11,"11":218}}');
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8600
     * @tc.name      testBase64HelperDecoder02_0086
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>;
      let str = '\n \\';
      try {
        await baseHelper.decode(str, util.Type.MIME).then((val) => {
          arraylist.add(val);
        })
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });


    /**
     * @tc.number    SUB_UTIL_BASE64HELPER02_8700
     * @tc.name      testBase64HelperDecoder02_0087
     * @tc.desc      [Logic] Verify reusing same instance for sequential calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder02_0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let baseHelper = new util.Base64Helper();
      let arraylist = new ArrayList<string | number | Uint8Array>;
      let str = '\\';
      try {
        await baseHelper.decode(str, util.Type.MIME).then((val) => {
          arraylist.add(val);
        })
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      expect(JSON.stringify(arraylist)).assertEqual('{}');
    });
  });
}


function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}