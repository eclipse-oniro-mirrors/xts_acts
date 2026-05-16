import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamReadable05Test() {
  describe('StreamReadable05Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0100
     * @tc.name      testStreamReadable05Chapter0001
     * @tc.desc      Push a normal string with default encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = 'Hello world';
      let result = readable.push(testData);
      expect(result).assertTrue();
      expect(readable.readableLength).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0200
     * @tc.name      testStreamReadable05Chapter0002
     * @tc.desc      Push string with utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = 'Hello world';
      let result = readable.push(testData, 'utf8');
      expect(result).assertTrue();
      expect(readable.readableLength).assertEqual(11);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0300
     * @tc.name      testStreamReadable05Chapter0003
     * @tc.desc      Push string with gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = 'Hello world';
      let result = readable.push(testData, 'gb18030');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0400
     * @tc.name      testStreamReadable05Chapter0004
     * @tc.desc      Push string with gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = 'Hello world';
      let result = readable.push(testData, 'gbk');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0500
     * @tc.name      testStreamReadable05Chapter0005
     * @tc.desc      Push string with gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = 'Hello world';
      let result = readable.push(testData, 'gb2312');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0600
     * @tc.name      testStreamReadable05Chapter0006
     * @tc.desc      Push undefined chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result = readable.push(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0700
     * @tc.name      testStreamReadable05Chapter0007
     * @tc.desc      Push null chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result = readable.push(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0800
     * @tc.name      testStreamReadable05Chapter0008
     * @tc.desc      Push empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();

      try {
        let result = readable.push("");
        expect(result).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_0900
     * @tc.name      testStreamReadable05Chapter0009
     * @tc.desc      Push string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1000
     * @tc.name      testStreamReadable05Chapter0010
     * @tc.desc      Push string with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1100
     * @tc.name      testStreamReadable05Chapter0011
     * @tc.desc      Push string with repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1200
     * @tc.name      testStreamReadable05Chapter0012
     * @tc.desc      Push string with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "\a\b\f\n\r\t\v\\\'\"\?";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1300
     * @tc.name      testStreamReadable05Chapter0013
     * @tc.desc      Push string with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1400
     * @tc.name      testStreamReadable05Chapter0014
     * @tc.desc      Push string with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData =
        "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1500
     * @tc.name      testStreamReadable05Chapter0015
     * @tc.desc      Push string with illegal Unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "\udc04\ud83d\udff4";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1600
     * @tc.name      testStreamReadable05Chapter0016
     * @tc.desc      Push string with keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "0 NaN";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1700
     * @tc.name      testStreamReadable05Chapter0017
     * @tc.desc      Push Uint8Array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1800
     * @tc.name      testStreamReadable05Chapter0018
     * @tc.desc      Push Uint8Array with boundary values (0 and 255)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([0, 255]);
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_1900
     * @tc.name      testStreamReadable05Chapter0019
     * @tc.desc      Push Uint8Array with out of range values (should be clamped)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let array = new Uint8Array(2);
      array[0] = 256;
      array[1] = -1;
      let result = readable.push(array);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2000
     * @tc.name      testStreamReadable05Chapter0020
     * @tc.desc      Push Uint8Array with multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2100
     * @tc.name      testStreamReadable05Chapter0021
     * @tc.desc      Push Uint8Array with negative numbers (should be wrapped)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([72, 101, 108, 108, 111, 87, 145, 114, 108, 100, 207, 50, 51, 193]);
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2200
     * @tc.name      testStreamReadable05Chapter0022
     * @tc.desc      Push Uint8Array with NaN and Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let array = new Uint8Array(3);
      array[0] = 72;
      array[1] = NaN as number;
      array[2] = Infinity as number;
      let result = readable.push(array);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2300
     * @tc.name      testStreamReadable05Chapter0023
     * @tc.desc      Push empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([]);
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2400
     * @tc.name      testStreamReadable05Chapter0024
     * @tc.desc      Push large Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let array = new Uint8Array(10000);
      for (let i = 0; i < array.length; i++) {
        array[i] = i % 256;
      }
      let result = readable.push(array);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2500
     * @tc.name      testStreamReadable05Chapter0025
     * @tc.desc      Push string then Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result1 = readable.push("Hello");
      let result2 = readable.push(new Uint8Array([32, 87, 111, 114, 108, 100]));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2600
     * @tc.name      testStreamReadable05Chapter0026
     * @tc.desc      Test buffer full scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        highWaterMark: number;

        constructor() {
          super();
          this.highWaterMark = 10;
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let largeData = "12345678901234567890";
      let result = readable.push(largeData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2700
     * @tc.name      testStreamReadable05Chapter0027
     * @tc.desc      Test push with invalid encoding (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "Hello world";
      let pushSucceeded = false;

      try {
        readable.push(testData, 'invalid_encoding');
        pushSucceeded = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(pushSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2800
     * @tc.name      testStreamReadable05Chapter0028
     * @tc.desc      Test push with Uint8Array from string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();

      let testData = new Uint8Array([49, 50, 51]);
      let result = readable.push(testData);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_2900
     * @tc.name      testStreamReadable05Chapter0029
     * @tc.desc      Test push with Uint8Array containing boolean representation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = new Uint8Array([116, 114, 117, 101]);
      let result = readable.push(testData);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3000
     * @tc.name      testStreamReadable05Chapter0030
     * @tc.desc      Test push with JSON string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = JSON.stringify({});
      let result = readable.push(testData);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3100
     * @tc.name      testStreamReadable05Chapter0031
     * @tc.desc      Test push with JSON array string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = JSON.stringify([1, 2, 3]);
      let result = readable.push(testData);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3200
     * @tc.name      testStreamReadable05Chapter0032
     * @tc.desc      Test push with default encoding (null means default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "Hello world";
      let result = readable.push(testData);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3300
     * @tc.name      testStreamReadable05Chapter0033
     * @tc.desc      Test push with undefined encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "Hello world";
      let result = readable.push(testData, undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3400
     * @tc.name      testStreamReadable05Chapter0034
     * @tc.desc      Test push with valid encoding string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "Hello world";
      let result = readable.push(testData, 'utf8');
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3500
     * @tc.name      testStreamReadable05Chapter0035
     * @tc.desc      Test multiple pushes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result1 = readable.push("12345");
      let result2 = readable.push("67890");
      let result3 = readable.push("ABCDE");
      let result4 = readable.push("FGHIJ");
      let result5 = readable.push("KLMNO");
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3600
     * @tc.name      testStreamReadable05Chapter0036
     * @tc.desc      Test push after null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result1 = readable.push(null);
      let result2 = readable.push("test");
      expect(result1).assertFalse();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3700
     * @tc.name      testStreamReadable05Chapter0037
     * @tc.desc      Test push after undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let result1 = readable.push(undefined);
      let result2 = readable.push("test");
      expect(result1).assertFalse();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3800
     * @tc.name      testStreamReadable05Chapter0038
     * @tc.desc      Test push with large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let largeString = "a".repeat(1000);
      let result = readable.push(largeString);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_3900
     * @tc.name      testStreamReadable05Chapter0039
     * @tc.desc      Test push with treeString-like structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let ans = '[';
      while (ans.length < 1000) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}]';
      let result = readable.push(ans);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4000
     * @tc.name      testStreamReadable05Chapter0040
     * @tc.desc      Test push with sliceString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let str = "{k1:value1,k2:value2}";
      let resultStr = str.substring(0, str.length - 2);
      let result = readable.push(resultStr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4100
     * @tc.name      testStreamReadable05Chapter0041
     * @tc.desc      Test push with number-like string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "123.456";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4200
     * @tc.name      testStreamReadable05Chapter0042
     * @tc.desc      Test push with scientific notation string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "1e3";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4300
     * @tc.name      testStreamReadable05Chapter0043
     * @tc.desc      Test push with hex string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "0x0102";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4400
     * @tc.name      testStreamReadable05Chapter0044
     * @tc.desc      Test push with octal string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "0o377";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFIVE_4500
     * @tc.name      testStreamReadable05Chapter0045
     * @tc.desc      Test push with binary string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(_: number) {
        }
      }

      let readable = new TestReadable();
      let testData = "0b1010";
      let result = readable.push(testData);
      expect(result).assertTrue();
    });
  })
}