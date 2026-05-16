import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import stream from '@ohos.util.stream';

interface GeneratedTypeLiteralInterface_1 {
  code?: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamDuplex02Test() {
  describe('StreamDuplex02Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0100
     * @tc.name      testStreamDuplex02Chapter0001
     * @tc.desc      Call end without any parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end();
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0200
     * @tc.name      testStreamDuplex02Chapter0002
     * @tc.desc      Call end with empty string chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("");
          expect(encoding).assertEqual("utf8");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0300
     * @tc.name      testStreamDuplex02Chapter0003
     * @tc.desc      Call end with normal string chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("utf8");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0400
     * @tc.name      testStreamDuplex02Chapter0004
     * @tc.desc      Call end with string chunk and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("utf8");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "utf8");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0500
     * @tc.name      testStreamDuplex02Chapter0005
     * @tc.desc      Call end with string chunk and gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("gb18030");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "gb18030");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0600
     * @tc.name      testStreamDuplex02Chapter0006
     * @tc.desc      Call end with string chunk and gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("gbk");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "gbk");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0700
     * @tc.name      testStreamDuplex02Chapter0007
     * @tc.desc      Call end with string chunk and gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("gb2312");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "gb2312");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0800
     * @tc.name      testStreamDuplex02Chapter0008
     * @tc.desc      Call end with string chunk and callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          expect(encoding).assertEqual("utf8");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "utf8", () => {
      });
      expect(result instanceof stream.Writable).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_0900
     * @tc.name      testStreamDuplex02Chapter0009
     * @tc.desc      Call end with Uint8Array chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          expect((chunk as Uint8Array)[0]).assertEqual(72);
          expect(encoding).assertEqual("utf8");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1000
     * @tc.name      testStreamDuplex02Chapter0010
     * @tc.desc      Call end with Uint8Array chunk containing zero values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          const arr: Uint8Array = chunk as Uint8Array;
          expect(arr.length).assertEqual(15);
          expect(arr[5]).assertEqual(0);
          expect(arr[6]).assertEqual(0);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1100
     * @tc.name      testStreamDuplex02Chapter0011
     * @tc.desc      Call end with Uint8Array chunk and encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          expect(encoding).assertEqual("gbk");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array, "gbk");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1200
     * @tc.name      testStreamDuplex02Chapter0012
     * @tc.desc      Call end with Uint8Array chunk and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result: stream.Writable = duplexStream.end(uint8Array, "utf8", () => {
      });
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1300
     * @tc.name      testStreamDuplex02Chapter0013
     * @tc.desc      Call end with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1400
     * @tc.name      testStreamDuplex02Chapter0014
     * @tc.desc      Call end with string containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk)
            .assertEqual("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const asciiString: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const result: stream.Writable = duplexStream.end(asciiString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1500
     * @tc.name      testStreamDuplex02Chapter0015
     * @tc.desc      Call end with string containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("\x07\x08\x0C\x0A\x0D\x09\x0B\x5C\x27\x22\x3F\x00\x77\x78");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const escapeString: string = "\x07\x08\x0C\x0A\x0D\x09\x0B\x5C\x27\x22\x3F\x00\x77\x78";
      const result: stream.Writable = duplexStream.end(escapeString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1600
     * @tc.name      testStreamDuplex02Chapter0016
     * @tc.desc      Call end with string containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const emojiString: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const result: stream.Writable = duplexStream.end(emojiString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1700
     * @tc.name      testStreamDuplex02Chapter0017
     * @tc.desc      Call end with large string to check memory behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk.length).assertEqual(1000);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const largeString: string = "a".repeat(1000);
      const result: stream.Writable = duplexStream.end(largeString);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1800
     * @tc.name      testStreamDuplex02Chapter0018
     * @tc.desc      Call end with Uint8Array boundary values (0 and 255)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          const arr: Uint8Array = chunk as Uint8Array;
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(255);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([0, 255]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_1900
     * @tc.name      testStreamDuplex02Chapter0019
     * @tc.desc      Call end with Uint8ClampedArray containing out of range values (clamped)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          const arr: Uint8Array = chunk as Uint8Array;
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(255);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const clampedArray: Uint8ClampedArray = new Uint8ClampedArray([-1, 256]);
      const uint8Array: Uint8Array = new Uint8Array(clampedArray);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2000
     * @tc.name      testStreamDuplex02Chapter0020
     * @tc.desc      Call end with Uint8Array containing NaN and Infinity (converted to 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          const arr: Uint8Array = chunk as Uint8Array;
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(0);
          expect(arr[2]).assertEqual(0);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const sourceArray: number[] = [NaN, Infinity, -Infinity];
      const uint8Array: Uint8Array = new Uint8Array(sourceArray);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2100
     * @tc.name      testStreamDuplex02Chapter0021
     * @tc.desc      Call end when writableCorked > 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("test");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      duplexStream.cork();
      const result: stream.Writable = duplexStream.end("test");
      expect(result instanceof stream.Writable).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2200
     * @tc.name      testStreamDuplex02Chapter0022
     * @tc.desc      Call end with unsupported encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("test", "unsupported");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2300
     * @tc.name      testStreamDuplex02Chapter0023
     * @tc.desc      Call end with doWrite throwing error
     * @tc.size      MediumTest
     *tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          throw new Error("doWrite error");
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      let endSucceeded = false;

      try {
        duplexStream.end("test");
        endSucceeded = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(endSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2400
     * @tc.name      testStreamDuplex02Chapter0024
     * @tc.desc      Call end with BigInt64Array converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const bigIntArray: BigInt64Array = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      const uint8Array: Uint8Array = new Uint8Array(bigIntArray.buffer);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2500
     * @tc.name      testStreamDuplex02Chapter0025
     * @tc.desc      Call end with empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          expect((chunk as Uint8Array).length).assertEqual(0);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint8Array: Uint8Array = new Uint8Array([]);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2600
     * @tc.name      testStreamDuplex02Chapter0026
     * @tc.desc      Call end with string "0" as chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("0");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const result: stream.Writable = duplexStream.end("0");
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2700
     * @tc.name      testStreamDuplex02Chapter0027
     * @tc.desc      Call end with string containing repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk).assertEqual("!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const repeatedSpecial: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const result: stream.Writable = duplexStream.end(repeatedSpecial);
      expect(result instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTTWO_2800
     * @tc.name      testStreamDuplex02Chapter0028
     * @tc.desc      Call end with Uint16Array converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          expect(chunk instanceof Uint8Array).assertTrue();
          const arr: Uint8Array = chunk as Uint8Array;
          expect(arr.length).assertEqual(4);
          callback();
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      const uint16Array: Uint16Array = new Uint16Array([0, 65535]);
      const uint8Array: Uint8Array = new Uint8Array(uint16Array.buffer);
      const result: stream.Writable = duplexStream.end(uint8Array);
      expect(result instanceof stream.Writable).assertTrue();
    });
  });
}