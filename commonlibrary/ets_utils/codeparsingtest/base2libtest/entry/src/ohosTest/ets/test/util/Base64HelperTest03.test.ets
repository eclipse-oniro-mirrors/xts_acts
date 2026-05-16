import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function Base64Helper03Test() {
  describe('Base64Helper03Test', () => {
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
     * @tc.number    SUB_UTIL_BASE64HELPER03_0100
     * @tc.name      testBase64HelperDecoder03_0001
     * @tc.desc      [Content] Verify decoding numeric string "MTIz" -> '123'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0001";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "MTIz" -> [77, 84, 73, 122]
        let input = new Uint8Array([77, 84, 73, 122]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(49); // '1'
        expect(result[1]).assertEqual(50); // '2'
        expect(result[2]).assertEqual(51); // '3'
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0200
     * @tc.name      testBase64HelperDecoder03_0002
     * @tc.desc      [Content] Verify alternating bits 0xAA -> "qg=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0002";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "qg==" -> [113, 103, 61, 61]
        let input = new Uint8Array([113, 103, 61, 61]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(170); // 0xAA
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0300
     * @tc.name      testBase64HelperDecoder03_0003
     * @tc.desc      [Content] Verify decoding control chars "Cg==" -> \n (10)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0003";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "Cg==" -> [67, 103, 61, 61]
        let input = new Uint8Array([67, 103, 61, 61]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(10);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0400
     * @tc.name      testBase64HelperEncodeToString03_0004
     * @tc.desc      [Padding] Verify 1 byte input results in 2 padding chars (==)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0004";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0500
     * @tc.name      testBase64HelperEncodeToString03_0005
     * @tc.desc      [Padding] Verify 2 bytes input results in 1 padding char (=)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0005";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65, 66]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QUI=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0600
     * @tc.name      testBase64HelperEncodeToString03_0006
     * @tc.desc      [Padding] Verify 3 bytes input results in 0 padding chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0006";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65, 66, 67]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QUJD");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0700
     * @tc.name      testBase64HelperEncodeToString03_0007
     * @tc.desc      [Content] Verify encoding standard word "Hello"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0007";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([72, 101, 108, 108, 111]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("SGVsbG8=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0800
     * @tc.name      testBase64HelperEncodeToString03_0008
     * @tc.desc      [Content] Verify RFC 4648 test vector "foobar"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0008";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([102, 111, 111, 98, 97, 114]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("Zm9vYmFy");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0900
     * @tc.name      testBase64HelperEncodeToString03_0009
     * @tc.desc      [Content] Verify encoding ASCII numbers "123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0009";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([49, 50, 51]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("MTIz");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1000
     * @tc.name      testBase64HelperEncodeToString03_0010
     * @tc.desc      [Content] Verify encoding ASCII special chars "!@#"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0010";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([33, 64, 35]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("IUAj");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1100
     * @tc.name      testBase64HelperEncodeToString03_0011
     * @tc.desc      [Content] Verify encoding control chars \n\r (10, 13) -> "Cg0="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0011";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([10, 13]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("Cg0=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1200
     * @tc.name      testBase64HelperEncodeToString03_0012
     * @tc.desc      [Content] Verify encoding Null byte [0] -> "AA=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0012";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("AA==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1300
     * @tc.name      testBase64HelperEncodeToString03_0013
     * @tc.desc      [Content] Verify encoding Max byte [255] -> "/w=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0013";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([255]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("/w==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1400
     * @tc.name      testBase64HelperEncodeToString03_0014
     * @tc.desc      [Content] Verify encoding Chinese bytes (Simulated UTF-8 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0014";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("5L2g");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1500
     * @tc.name      testBase64HelperEncodeToString03_0015
     * @tc.desc      [Content] Verify encoding Emoji bytes (Simulated UTF-8 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0015";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xF0, 0x9F, 0x98, 0x80]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("8J+YgA==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1600
     * @tc.name      testBase64HelperEncodeToString03_0016
     * @tc.desc      [Memory] Verify encoding from a Subarray View
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0016";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let buffer = new Uint8Array([0, 65, 0]);
        let view = buffer.subarray(1, 2);
        let result = await base64Helper.encodeToString(view);
        expect(result).assertEqual("QQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1700
     * @tc.name      testBase64HelperEncodeToString03_0017
     * @tc.desc      [Performance] Verify encoding a large buffer (1KB)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0017";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array(1024).fill(0);
        let result = await base64Helper.encodeToString(input);
        // Length = ceil(1024/3)*4 = 342*4 = 1368
        expect(result.length).assertEqual(1368);
        expect(result.substring(0, 4)).assertEqual("AAAA");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1800
     * @tc.name      testBase64HelperEncodeToString03_0018
     * @tc.desc      [Content] Verify pattern 0xAA (10101010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0018";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xAA]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("qg==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1900
     * @tc.name      testBase64HelperEncodeToString03_0019
     * @tc.desc      [Content] Verify pattern 0x55 (01010101)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0019";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0x55]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("VQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2000
     * @tc.name      testBase64HelperEncodeToString03_0020
     * @tc.desc      [Content] Verify sequential bytes [0, 1, 2, 3] -> "AAECAw=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0020";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0, 1, 2, 3]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("AAECAw==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2100
     * @tc.name      testBase64HelperEncodeToString03_0021
     * @tc.desc      [Type] Verify return type is actually a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0021";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65]);
        let result = await base64Helper.encodeToString(input);
        expect(typeof result).assertEqual('string');
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2200
     * @tc.name      testBase64HelperConstruct03_0022
     * @tc.desc      Verify default constructor (no args) creates a valid instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0022";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2300
     * @tc.name      testBase64HelperConstruct03_0023
     * @tc.desc      Verify constructor consistency (Repeated check 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0023";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2400
     * @tc.name      testBase64HelperConstruct03_0024
     * @tc.desc      Verify constructor consistency (Repeated check 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0024";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2500
     * @tc.name      testBase64HelperConstruct03_0025
     * @tc.desc      Verify constructor consistency (Repeated check 3).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0025";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2600
     * @tc.name      testBase64HelperConstruct03_0026
     * @tc.desc      Verify instance behaves as Standard Base64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0026";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        let input = new Uint8Array([251]);
        let result = helper.encodeToStringSync(input);
        expect(result).assertEqual("+w==");
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2700
     * @tc.name      testBase64HelperConstruct03_0027
     * @tc.desc      Verify instance uses Standard slash character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0027";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        let input = new Uint8Array([255]);
        let result = helper.encodeToStringSync(input);
        expect(result).assertEqual("/w==");
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2800
     * @tc.name      testBase64HelperConstruct03_0028
     * @tc.desc      Verify multiple instances work independently and consistently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0028";
      console.info(TAG + " start");
      try {
        let helper1 = new util.Base64Helper();
        let helper2 = new util.Base64Helper();

        let input = new Uint8Array([255]);

        let res1 = helper1.encodeToStringSync(input);
        let res2 = helper2.encodeToStringSync(input);

        expect(res1).assertEqual("/w==");
        expect(res2).assertEqual("/w==");
        expect(res1).assertEqual(res2);
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2900
     * @tc.name      testBase64HelperConstruct03_0029
     * @tc.desc      Verify strictly no arguments are passed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0029";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        let input = new Uint8Array([251]);
        let result = helper.encodeToStringSync(input);
        expect(result).assertEqual("+w==");
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_3000
     * @tc.name      testBase64HelperConstruct03_0030
     * @tc.desc      Verify new instance does not reuse previous state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0030";
      console.info(TAG + " start");
      try {
        let helper1 = new util.Base64Helper();
        helper1.encodeToStringSync(new Uint8Array([65]));

        let helper2 = new util.Base64Helper();
        let res = helper2.encodeToStringSync(new Uint8Array([66]));

        expect(res).assertEqual("Qg==");
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_3100
     * @tc.name      testBase64HelperConstruct03_0031
     * @tc.desc      Verify rapid creation of multiple instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstruct03_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstruct03_0031";
      console.info(TAG + " start");
      try {
        for (let i = 0; i < 100; i++) {
          let helper = new util.Base64Helper();
          expect(helper instanceof util.Base64Helper).assertTrue();
        }
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });
  })
}