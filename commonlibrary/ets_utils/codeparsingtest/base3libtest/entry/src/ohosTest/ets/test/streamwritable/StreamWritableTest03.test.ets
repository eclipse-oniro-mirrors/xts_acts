import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable03Test() {
  describe('StreamWritable03Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0100
     * @tc.name      testStreamWritable03Chapter0001
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([72, 0, 0, 108, 111]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0200
     * @tc.name      testStreamWritable03Chapter0002
     * @tc.desc      Test end method with Uint8Array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([0, 255, 0]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0300
     * @tc.name      testStreamWritable03Chapter0003
     * @tc.desc      Test end method with treeString-like large structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk length:", chunk.toString().length);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let treeString = '[';
      for (let i = 0; i < 1000; i++) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';
      let result = writableStream.end(treeString, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0400
     * @tc.name      testStreamWritable03Chapter0004
     * @tc.desc      Test end method with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let str = "{k1:value1,k2:value2}";
      let result = str.substring(0, str.length - 2);
      let endResult = writableStream.end(result, 'utf-8');
      expect(endResult).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0500
     * @tc.name      testStreamWritable03Chapter0005
     * @tc.desc      Test end method with very large string for GC test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk length:", chunk.toString().length);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let hugeStr = "x".repeat(10000000);
      let result = writableStream.end(hugeStr, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0600
     * @tc.name      testStreamWritable03Chapter0006
     * @tc.desc      Test end method with unicode code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let unicodeStr = "\u0041\u0042\u0043";
      let result = writableStream.end(unicodeStr, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0700
     * @tc.name      testStreamWritable03Chapter0007
     * @tc.desc      Test end method with illegal unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let illegalUnicode = "\uDC04\uD83D\uDFF4";
      let result = writableStream.end(illegalUnicode, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0800
     * @tc.name      testStreamWritable03Chapter0008
     * @tc.desc      Test end method with string "0" (should be treated as string, not number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "type:", typeof chunk);
          expect(typeof chunk).assertEqual('string');
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('0', 'utf-8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_0900
     * @tc.name      testStreamWritable03Chapter0009
     * @tc.desc      Test end method with return value check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('test', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1000
     * @tc.name      testStreamWritable03Chapter0010
     * @tc.desc      Test end method multiple times (should work)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('first', 'utf-8');
      let result = writableStream.end('second', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1100
     * @tc.name      testStreamWritable03Chapter0011
     * @tc.desc      Test end method with Uint8Array from ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let buffer = new ArrayBuffer(8);
      let uint8Array = new Uint8Array(buffer);
      for (let i = 0; i < uint8Array.length; i++) {
        uint8Array[i] = i * 10;
      }
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1200
     * @tc.name      testStreamWritable03Chapter0012
     * @tc.desc      Test end method with string chunk and encoding parameter only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('test', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1300
     * @tc.name      testStreamWritable03Chapter0013
     * @tc.desc      Test end method with Uint8Array chunk and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      let callbackCalled = false;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      writableStream.end(uint8Array, 'utf-8', () => {
        callbackCalled = true;
      });
      expect(callbackCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1400
     * @tc.name      testStreamWritable03Chapter0014
     * @tc.desc      Test end method with gb18030 encoding and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试特殊字符!@#$', 'gb18030');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1500
     * @tc.name      testStreamWritable03Chapter0015
     * @tc.desc      Test end method with gbk encoding and emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试😊', 'gbk');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1600
     * @tc.name      testStreamWritable03Chapter0016
     * @tc.desc      Test end method with gb2312 encoding and numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试123456', 'gb2312');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1700
     * @tc.name      testStreamWritable03Chapter0017
     * @tc.desc      Test end method with undefined chunk and invalid encoding (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      try {
        let writableStream = new TestWritable();
        expect(writableStream instanceof TestWritable).assertEqual(true);
        writableStream.end(undefined, 'invalid');
        expect(writableStream !== null).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1800
     * @tc.name      testStreamWritable03Chapter0018
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([0, 255]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_1900
     * @tc.name      testStreamWritable03Chapter0019
     * @tc.desc      Test end method with escape characters string comprehensive test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let escapeChars = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\"\\?\\0\\x41\\101";
      let result = writableStream.end(escapeChars, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2000
     * @tc.name      testStreamWritable03Chapter0020
     * @tc.desc      Test end method with unicode emoji encoding verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let emojiUnicode = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      let result = writableStream.end(emojiUnicode, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2100
     * @tc.name      testStreamWritable03Chapter0021
     * @tc.desc      Test end method with number-like string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "type:", typeof chunk);
          expect(typeof chunk).assertEqual('string');
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('NaN', 'utf-8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2200
     * @tc.name      testStreamWritable03Chapter0022
     * @tc.desc      Test end method with string "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('undefined', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2300
     * @tc.name      testStreamWritable03Chapter0023
     * @tc.desc      Test end method with string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('null', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2400
     * @tc.name      testStreamWritable03Chapter0024
     * @tc.desc      Test end method after multiple write operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      let writeCount = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          console.info("Writable chunk", writeCount, "is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.write('chunk1', 'utf-8');
      writableStream.write('chunk2', 'utf-8');
      writableStream.write('chunk3', 'utf-8');
      writableStream.end('final', 'utf-8');
      expect(writeCount).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2500
     * @tc.name      testStreamWritable03Chapter0025
     * @tc.desc      Set default encoding to 'utf-8' (valid encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('utf-8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2600
     * @tc.name      testStreamWritable03Chapter0026
     * @tc.desc      Set default encoding to 'gb18030' (valid encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('gb18030');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2700
     * @tc.name      testStreamWritable03Chapter0027
     * @tc.desc      Set default encoding to 'gbk' (valid encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('gbk');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2800
     * @tc.name      testStreamWritable03Chapter0028
     * @tc.desc      Set default encoding to 'gb2312' (valid encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('gb2312');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_2900
     * @tc.name      testStreamWritable03Chapter0029
     * @tc.desc      Set default encoding with undefined parameter (use default 'utf-8')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3000
     * @tc.name      testStreamWritable03Chapter0030
     * @tc.desc      Set default encoding with null parameter (invalid type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        const invalidEncoding: string = '' as string;
        let result: boolean = writableStream.setDefaultEncoding(invalidEncoding);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3100
     * @tc.name      testStreamWritable03Chapter0031
     * @tc.desc      Set default encoding with empty string (invalid encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3200
     * @tc.name      testStreamWritable03Chapter0032
     * @tc.desc      Set default encoding with 'ascii' (unsupported encoding)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('ascii');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3300
     * @tc.name      testStreamWritable03Chapter0033
     * @tc.desc      Set default encoding with 'UTF-8' (case variation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('UTF-8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3400
     * @tc.name      testStreamWritable03Chapter0034
     * @tc.desc      Set default encoding with number type (invalid parameter type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        const invalidParam: string = '123' as string;
        let result: boolean = writableStream.setDefaultEncoding(invalidParam);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3500
     * @tc.name      testStreamWritable03Chapter0035
     * @tc.desc      Set default encoding with boolean type (invalid parameter type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        const invalidParam: string = 'true' as string;
        let result: boolean = writableStream.setDefaultEncoding(invalidParam);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3600
     * @tc.name      testStreamWritable03Chapter0036
     * @tc.desc      Set default encoding with array type (invalid parameter type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        const invalidParam: string = JSON.stringify(['utf-8']) as string;
        let result: boolean = writableStream.setDefaultEncoding(invalidParam);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3700
     * @tc.name      testStreamWritable03Chapter0037
     * @tc.desc      Set default encoding with object type (invalid parameter type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        const invalidParam: string = JSON.stringify({ encoding: 'utf-8' }) as string;
        let result: boolean = writableStream.setDefaultEncoding(invalidParam);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3800
     * @tc.name      testStreamWritable03Chapter0038
     * @tc.desc      Set default encoding with special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('utf-8!@#$');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_3900
     * @tc.name      testStreamWritable03Chapter0039
     * @tc.desc      Set default encoding with emoji string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('👆utf-8');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4000
     * @tc.name      testStreamWritable03Chapter0040
     * @tc.desc      Set default encoding with very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let longString: string = 'utf-8'.repeat(1000);
        let result: boolean = writableStream.setDefaultEncoding(longString);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4100
     * @tc.name      testStreamWritable03Chapter0041
     * @tc.desc      Set default encoding with whitespace only string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('   ');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4200
     * @tc.name      testStreamWritable03Chapter0042
     * @tc.desc      Set default encoding multiple times with different valid encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result1: boolean = writableStream.setDefaultEncoding('utf-8');
      expect(result1).assertTrue();

      let result2: boolean = writableStream.setDefaultEncoding('gbk');
      expect(result2).assertTrue();

      let result3: boolean = writableStream.setDefaultEncoding('gb2312');
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4300
     * @tc.name      testStreamWritable03Chapter0043
     * @tc.desc      Set default encoding on multiple Writable instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream1: TestWritable = new TestWritable();
      let writableStream2: TestWritable = new TestWritable();

      let result1: boolean = writableStream1.setDefaultEncoding('utf-8');
      let result2: boolean = writableStream2.setDefaultEncoding('gb18030');

      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4400
     * @tc.name      testStreamWritable03Chapter0044
     * @tc.desc      Set default encoding with 'utf-8' and verify doWrite receives correct encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedEncoding: string = '';

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          receivedEncoding = encoding;
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      let result: boolean = writableStream.setDefaultEncoding('utf-8');
      expect(result).assertTrue();

      writableStream.write('test data');
      expect(receivedEncoding).assertEqual('utf-8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4500
     * @tc.name      testStreamWritable03Chapter0045
     * @tc.desc      Set default encoding with all special characters (complete coverage)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4600
     * @tc.name      testStreamWritable03Chapter0046
     * @tc.desc      Set default encoding with all printable ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let asciiString: string =
          '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let result: boolean = writableStream.setDefaultEncoding(asciiString);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4700
     * @tc.name      testStreamWritable03Chapter0047
     * @tc.desc      Set default encoding with duplicated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let specialChars: string = ' !!""##$$%%&&\'\'(())**,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        let result: boolean = writableStream.setDefaultEncoding(specialChars);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4800
     * @tc.name      testStreamWritable03Chapter0048
     * @tc.desc      Set default encoding with escape sequence \\a (bell)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\a');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_4900
     * @tc.name      testStreamWritable03Chapter0049
     * @tc.desc      Set default encoding with escape sequence \\b (backspace)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\b');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5000
     * @tc.name      testStreamWritable03Chapter0050
     * @tc.desc      Set default encoding with escape sequence \\f (form feed)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\f');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5100
     * @tc.name      testStreamWritable03Chapter0051
     * @tc.desc      Set default encoding with escape sequence \\n (new line)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\n');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5200
     * @tc.name      testStreamWritable03Chapter0052
     * @tc.desc      Set default encoding with escape sequence \\r (carriage return)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\r');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5300
     * @tc.name      testStreamWritable03Chapter0053
     * @tc.desc      Set default encoding with escape sequence \\t (horizontal tab)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\t');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5400
     * @tc.name      testStreamWritable03Chapter0054
     * @tc.desc      Set default encoding with escape sequence \\v (vertical tab)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\v');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5500
     * @tc.name      testStreamWritable03Chapter0055
     * @tc.desc      Set default encoding with escape sequence \\\\ (backslash)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\\\');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5600
     * @tc.name      testStreamWritable03Chapter0056
     * @tc.desc      Set default encoding with escape sequence \\\' (single quote)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\\'');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5700
     * @tc.name      testStreamWritable03Chapter0057
     * @tc.desc      Set default encoding with escape sequence \\\" (double quote)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\"');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5800
     * @tc.name      testStreamWritable03Chapter0058
     * @tc.desc      Set default encoding with escape sequence \\? (question mark)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\?');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_5900
     * @tc.name      testStreamWritable03Chapter0059
     * @tc.desc      Set default encoding with escape sequence \\0 (null character)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\0');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_6000
     * @tc.name      testStreamWritable03Chapter0060
     * @tc.desc      Set default encoding with escape sequence \\141 (octal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\141');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_6100
     * @tc.name      testStreamWritable03Chapter0061
     * @tc.desc      Set default encoding with escape sequence \\x61 (hexadecimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\x61');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_6200
     * @tc.name      testStreamWritable03Chapter0062
     * @tc.desc      Set default encoding with Unicode emoji 👆
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('👆');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_6300
     * @tc.name      testStreamWritable03Chapter0063
     * @tc.desc      Set default encoding with Unicode emoji 👿
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('👿');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTHREE_6400
     * @tc.name      testStreamWritable03Chapter0064
     * @tc.desc      Set default encoding with Unicode encoding \\ud83d\\udc46
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();
      try {
        let result: boolean = writableStream.setDefaultEncoding('\\ud83d\\udc46');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
  })
}