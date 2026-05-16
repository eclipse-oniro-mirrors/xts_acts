import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamDuplex05Test() {
  describe('StreamDuplex05Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0100
     * @tc.name      testStreamDuplex05Chapter0001
     * @tc.desc      Test uncork method of Duplex stream, write null and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let dataWritten = '';

        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            dataWritten += chunk;
            callback();
          }
        }

        let duplexStream = new TestDuplex();
        duplexStream.cork();
        duplexStream.uncork();
        expect(dataWritten).assertEqual('');
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0200
     * @tc.name      testStreamDuplex05Chapter0002
     * @tc.desc      Test uncork method of Duplex stream, write undefined and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let dataWritten = '';

        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            dataWritten += chunk;
            callback();
          }
        }

        let duplexStream = new TestDuplex();
        duplexStream.cork();
        duplexStream.uncork();
        expect(dataWritten).assertEqual('');
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0300
     * @tc.name      testStreamDuplex05Chapter0003
     * @tc.desc      Test uncork method of Duplex stream, write special characters and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      duplexStream.write('!@#$%^&*()_+');
      duplexStream.uncork();
      expect(dataWritten).assertEqual('!@#$%^&*()_+');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0400
     * @tc.name      testStreamDuplex05Chapter0004
     * @tc.desc      Test uncork method of Duplex stream, write escape characters and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      duplexStream.write('\n\r\t\\\'\"');
      duplexStream.uncork();
      expect(dataWritten).assertEqual('\n\r\t\\\'\"');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0500
     * @tc.name      testStreamDuplex05Chapter0005
     * @tc.desc      Test uncork method of Duplex stream, write emoji characters and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      duplexStream.write('👆👿👀💯');
      duplexStream.uncork();
      expect(dataWritten).assertEqual('👆👿👀💯');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0600
     * @tc.name      testStreamDuplex05Chapter0006
     * @tc.desc      Test uncork method of Duplex stream, write large data and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let largeString = 'a'.repeat(10000);
      duplexStream.write(largeString);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(10000);
      expect(dataWritten).assertEqual(largeString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0700
     * @tc.name      testStreamDuplex05Chapter0007
     * @tc.desc      Test uncork method of Duplex stream, write different typed arrays and uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let int8Array = new Int8Array([-128, 0, 127]);
      let uint8Array = new Uint8Array([0, 128, 255]);
      let int16Array = new Int16Array([-32768, 0, 32767]);
      let uint16Array = new Uint16Array([0, 32768, 65535]);
      duplexStream.write(new Uint8Array(int8Array.buffer));
      duplexStream.write(uint8Array);
      duplexStream.write(new Uint8Array(int16Array.buffer));
      duplexStream.write(new Uint8Array(uint16Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0800
     * @tc.name      testStreamDuplex05Chapter0008
     * @tc.desc      Test uncork method of Duplex stream, check writableCorked never goes negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let initialCorked = duplexStream.writableCorked;
      for (let i = 0; i < 10; i++) {
        duplexStream.uncork();
      }
      let finalCorked = duplexStream.writableCorked;
      expect(finalCorked).assertEqual(0);
      expect(finalCorked).assertLargerOrEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_0900
     * @tc.name      testStreamDuplex05Chapter0009
     * @tc.desc      Test uncork method of Duplex stream, interleaved cork and uncork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(1);
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(2);
      duplexStream.uncork();
      expect(duplexStream.writableCorked).assertEqual(1);
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(2);
      duplexStream.uncork();
      expect(duplexStream.writableCorked).assertEqual(1);
      duplexStream.uncork();
      expect(duplexStream.writableCorked).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1000
     * @tc.name      testStreamDuplex05Chapter0010
     * @tc.desc      Test uncork method with Int8Array boundary values (-128, 127, -129, 128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Int8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(new Int8Array(chunk.buffer));
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let int8Array1 = new Int8Array([-128]);
      let int8Array2 = new Int8Array([127]);
      let int8Array3 = new Int8Array([-129]);
      let int8Array4 = new Int8Array([128]);
      duplexStream.write(new Uint8Array(int8Array1.buffer));
      duplexStream.write(new Uint8Array(int8Array2.buffer));
      duplexStream.write(new Uint8Array(int8Array3.buffer));
      duplexStream.write(new Uint8Array(int8Array4.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1100
     * @tc.name      testStreamDuplex05Chapter0011
     * @tc.desc      Test uncork method with Uint8Array boundary values (0, 255, -1, 256)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let uint8Array1 = new Uint8Array([0]);
      let uint8Array2 = new Uint8Array([255]);
      let uint8Array3 = new Uint8Array([-1 & 0xFF]);
      let uint8Array4 = new Uint8Array([256 & 0xFF]);
      duplexStream.write(uint8Array1);
      duplexStream.write(uint8Array2);
      duplexStream.write(uint8Array3);
      duplexStream.write(uint8Array4);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1200
     * @tc.name      testStreamDuplex05Chapter0012
     * @tc.desc      Test uncork method with Uint8ClampedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let clampedArray = new Uint8ClampedArray([0, 255, -1, 256, 300, -100]);
      duplexStream.write(new Uint8Array(clampedArray.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1300
     * @tc.name      testStreamDuplex05Chapter0013
     * @tc.desc      Test uncork method with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let int16Array = new Int16Array([-32768, 32767, -32769, 32768]);
      duplexStream.write(new Uint8Array(int16Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1400
     * @tc.name      testStreamDuplex05Chapter0014
     * @tc.desc      Test uncork method with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let uint16Array = new Uint16Array([0, 65535, -1, 65536]);
      duplexStream.write(new Uint8Array(uint16Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1500
     * @tc.name      testStreamDuplex05Chapter0015
     * @tc.desc      Test uncork method with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let int32Array = new Int32Array([-2147483648, 2147483647, -2147483649, 2147483648]);
      duplexStream.write(new Uint8Array(int32Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1600
     * @tc.name      testStreamDuplex05Chapter0016
     * @tc.desc      Test uncork method with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let uint32Array = new Uint32Array([0, 4294967295, -1, 4294967296]);
      duplexStream.write(new Uint8Array(uint32Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1700
     * @tc.name      testStreamDuplex05Chapter0017
     * @tc.desc      Test uncork method with Float32Array special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let float32Array = new Float32Array([Infinity, -Infinity, NaN, 0, 1.5, -3.5e38]);
      duplexStream.write(new Uint8Array(float32Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1800
     * @tc.name      testStreamDuplex05Chapter0018
     * @tc.desc      Test uncork method with Float64Array special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten: Uint8Array[] = [];

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            dataWritten.push(chunk);
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let float64Array = new Float64Array([
        Infinity,
        -Infinity,
        NaN,
        0,
        1.5,
        -1.7976931348623157e308,
        1.7976931348623157e308,
        -1.8e308,
        1.8e308
      ]);
      duplexStream.write(new Uint8Array(float64Array.buffer));
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_1900
     * @tc.name      testStreamDuplex05Chapter0019
     * @tc.desc      Test uncork method with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let dataWritten: Uint8Array[] = [];

        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            if (chunk instanceof Uint8Array) {
              dataWritten.push(chunk);
            }
            callback();
          }
        }

        let duplexStream = new TestDuplex();
        duplexStream.cork();
        let bigInt64Array = new BigInt64Array([
          BigInt(-9223372036854775808n),
          BigInt(9223372036854775807n)
        ]);
        duplexStream.write(new Uint8Array(bigInt64Array.buffer));
        duplexStream.uncork();
        expect(dataWritten.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2000
     * @tc.name      testStreamDuplex05Chapter0020
     * @tc.desc      Test uncork method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let dataWritten: Uint8Array[] = [];

        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            if (chunk instanceof Uint8Array) {
              dataWritten.push(chunk);
            }
            callback();
          }
        }

        let duplexStream = new TestDuplex();
        duplexStream.cork();
        let bigUint64Array = new BigUint64Array([
          BigInt(0n),
          BigInt(18446744073709551615n)
        ]);
        duplexStream.write(new Uint8Array(bigUint64Array.buffer));
        duplexStream.uncork();
        expect(dataWritten.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2100
     * @tc.name      testStreamDuplex05Chapter0021
     * @tc.desc      Test uncork method with string containing all ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let asciiChars =
        '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      duplexStream.write(asciiChars);
      duplexStream.uncork();
      expect(dataWritten).assertEqual(asciiChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2200
     * @tc.name      testStreamDuplex05Chapter0022
     * @tc.desc      Test uncork method with repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let repeatedChars = ' !!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      duplexStream.write(repeatedChars);
      duplexStream.uncork();
      expect(dataWritten).assertEqual(repeatedChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2300
     * @tc.name      testStreamDuplex05Chapter0023
     * @tc.desc      Test uncork method with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let escapeStr = '\a\b\f\n\r\t\v\\\'\"\?';
      duplexStream.write(escapeStr);
      duplexStream.uncork();
      expect(dataWritten).assertEqual(escapeStr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2400
     * @tc.name      testStreamDuplex05Chapter0024
     * @tc.desc      Test uncork method with illegal Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let illegalUnicode = '\udc04\ud83d\udff4';
      duplexStream.write(illegalUnicode);
      duplexStream.uncork();
      expect(dataWritten).assertEqual(illegalUnicode);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2500
     * @tc.name      testStreamDuplex05Chapter0025
     * @tc.desc      Test uncork method with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let keywords = ['0', 'NaN', 'undefined', 'null', 'true', 'false'];
      for (let keyword of keywords) {
        duplexStream.write(keyword);
      }
      duplexStream.uncork();
      expect(dataWritten).assertEqual('0NaNundefinednulltruefalse');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2600
     * @tc.name      testStreamDuplex05Chapter0026
     * @tc.desc      Test uncork method with treeString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let init: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      let treeString = init(10000);
      duplexStream.write(treeString);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(treeString.length);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2700
     * @tc.name      testStreamDuplex05Chapter0027
     * @tc.desc      Test uncork method with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let str = "{k1:value1,k2:value2}";
      let sliceStr = str.substring(0, str.length - 2);
      duplexStream.write(sliceStr);
      duplexStream.uncork();
      expect(dataWritten).assertEqual(sliceStr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2800
     * @tc.name      testStreamDuplex05Chapter0028
     * @tc.desc      Test uncork method with very large string (memory test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let hugeString = 'a'.repeat(1000000);
      duplexStream.write(hugeString);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(hugeString.length);
      expect(dataWritten).assertEqual(hugeString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_2900
     * @tc.name      testStreamDuplex05Chapter0029
     * @tc.desc      Test uncork method with number type strings (various formats)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let numbers = [
        '0',
        'NaN',
        '-0',
        'Infinity',
        '-Infinity',
        '1.7976931348623157e+308',
        '5e-324',
        '2.220446049250313e-16',
        '9007199254740991',
        '123.456',
        '0xdecafafecacefade',
        '0x0102',
        '0x01020304',
        '0o3',
        '1e3',
        '2.5e-2'
      ];
      for (let num of numbers) {
        duplexStream.write(num + '|');
      }
      duplexStream.uncork();
      expect(dataWritten.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3000
     * @tc.name      testStreamDuplex05Chapter0030
     * @tc.desc      Test uncork method with boolean type strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let booleans = [
        'true',
        'false',
        '0',
        'NaN',
        '',
        'null',
        'undefined'
      ];
      for (let bool of booleans) {
        duplexStream.write(bool + ',');
      }
      duplexStream.uncork();
      expect(dataWritten).assertEqual('true,false,0,NaN,,null,undefined,');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3100
     * @tc.name      testStreamDuplex05Chapter0031
     * @tc.desc      Test uncork method with array type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let arrays = [
        [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63],
        [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63],
        [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63],
        [],
        [256, 65536, 32768]
      ];
      for (let arr of arrays) {
        duplexStream.write(JSON.stringify(arr) + '\n');
      }
      duplexStream.uncork();
      expect(dataWritten.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3200
     * @tc.name      testStreamDuplex05Chapter0032
     * @tc.desc      Test uncork method with object type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();

      interface NestedD {
        e: number;
      }

      interface NestedB {
        c: number;
        d: NestedD;
      }

      interface Object1 {
        a: number;
        b: string;
        c: number[];
      }

      interface Object2 {
        a: number;
        b: NestedB;
      }

      interface Object3 {
        b: number;
      }

      interface Object4 {
        a: null;
        b: number;
      }

      interface Object5 {}

      type TestObject = Object1 | Object2 | Object3 | Object4 | Object5;
      const objects: TestObject[] = [
        { a: 1, b: "test", c: [1, 2, 3] } as Object1,
        { a: 1, b: { c: 2, d: { e: 3 } } } as Object2,
        { b: 1 } as Object3,
        { a: null, b: 1 } as Object4,
        { b: 1 } as Object3,
        { b: 1 } as Object3,
        {} as Object5
      ];
      for (let obj of objects) {
        duplexStream.write(JSON.stringify(obj) + '\n');
      }
      duplexStream.uncork();
      expect(dataWritten.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3300
     * @tc.name      testStreamDuplex05Chapter0033
     * @tc.desc      Test uncork method with special arrays containing NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let specialArrays = [
        [72, 101, NaN, Infinity, 108, 111],
        [72, "abc", true, null, undefined, 108],
        [Infinity, -Infinity, NaN, 0]
      ];
      for (let arr of specialArrays) {
        duplexStream.write(JSON.stringify(arr) + '\n');
      }
      duplexStream.uncork();
      expect(dataWritten.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3400
     * @tc.name      testStreamDuplex05Chapter0034
     * @tc.desc      Test uncork method in async context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          duplexStream.write('async data');
          duplexStream.uncork();
          resolve();
        }, 10);
      });
      expect(dataWritten).assertEqual('async data');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3500
     * @tc.name      testStreamDuplex05Chapter0035
     * @tc.desc      Test uncork method with multiple async writes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let promises: Promise<void>[] = [];
      for (let i = 0; i < 5; i++) {
        promises.push(new Promise<void>((resolve) => {
          setTimeout(() => {
            duplexStream.write(`data${i}`);
            resolve();
          }, i * 10);
        }));
      }
      await Promise.all(promises);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(25);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3600
     * @tc.name      testStreamDuplex05Chapter0036
     * @tc.desc      Test uncork method with object property manipulation scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();

      interface TestObject {
        a: number;
        b: number;
      }

      interface TestObject2 {
        b: number;
      }

      let obj1: TestObject = { a: 1, b: 2 };
      let obj2: TestObject2 = { b: 2 };
      duplexStream.cork();
      let result = duplexStream.uncork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3700
     * @tc.name      testStreamDuplex05Chapter0037
     * @tc.desc      Test uncork method with performance timing for multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let startTime = Date.now();
      let callCount = 1000;
      for (let i = 0; i < callCount; i++) {
        duplexStream.cork();
        duplexStream.uncork();
      }
      let endTime = Date.now();
      let duration = endTime - startTime;
      expect(duplexStream.writableCorked).assertEqual(0);
      console.log(`${callCount} cork/uncork pairs took ${duration}ms`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3800
     * @tc.name      testStreamDuplex05Chapter0038
     * @tc.desc      Test uncork method with large data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();
      let largeData = 'x'.repeat(5000000);
      duplexStream.write(largeData);
      duplexStream.uncork();
      expect(dataWritten.length).assertEqual(largeData.length);
      expect(dataWritten).assertEqual(largeData);
      console.log(`Successfully wrote ${largeData.length} bytes of data`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_3900
     * @tc.name      testStreamDuplex05Chapter0039
     * @tc.desc      Test uncork method with large data creation and release scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dataWritten = '';

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          dataWritten += chunk;
          callback();
        }
      }

      let createLargeData = (): number => {
        let duplexStream = new TestDuplex();
        duplexStream.cork();
        let hugeString = 'z'.repeat(10000000);
        duplexStream.write(hugeString);
        duplexStream.uncork();
        return dataWritten.length;
      };
      let writtenLength = createLargeData();
      expect(writtenLength).assertEqual(10000000);
      console.log(`Successfully wrote ${writtenLength} bytes of data`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4000
     * @tc.name      testStreamDuplex05Chapter0040
     * @tc.desc      Test uncork method with try-catch error handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let errorCaught = false;
      try {
        duplexStream.cork();
        let result = duplexStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
        errorCaught = true;
        expect(err.code).assertEqual(undefined);
      }
      expect(errorCaught).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4100
     * @tc.name      testStreamDuplex05Chapter0041
     * @tc.desc      Test uncork method with finally block cleanup
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();
      let finallyExecuted = false;
      try {
        duplexStream.cork();
        duplexStream.uncork();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4200
     * @tc.name      testStreamDuplex05Chapter0042
     * @tc.desc      Test uncork method in strict mode context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      'use strict';
      let duplexStream = new stream.Duplex();
      duplexStream.cork();
      let result = duplexStream.uncork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4300
     * @tc.name      testStreamDuplex05Chapter0043
     * @tc.desc      Test uncork method with stream immutability scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let duplexStream = new stream.Duplex();

      interface ReadonlyStreamView {
        readonly cork: () => void;
        readonly uncork: () => boolean;
        readonly writableCorked: number;
      }

      const readonlyStream: ReadonlyStreamView = {
        cork: () => duplexStream.cork(),
        uncork: () => duplexStream.uncork(),
        writableCorked: duplexStream.writableCorked
      };
      readonlyStream.cork();
      let result = readonlyStream.uncork();
      expect(result).assertEqual(true);
      expect(duplexStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4400
     * @tc.name      testStreamDuplex05Chapter0044
     * @tc.desc      Test uncork method basic functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: stream.Duplex = new stream.Duplex();
      duplexStream.cork();
      let result: boolean = duplexStream.uncork();
      expect(result).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(0);
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTFIVE_4500
     * @tc.name      testStreamDuplex05Chapter0045
     * @tc.desc      Test uncork method with multiple cork and uncork operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamDuplex05Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplexStream: stream.Duplex = new stream.Duplex();
      duplexStream.cork();
      duplexStream.cork();
      duplexStream.cork();
      expect(duplexStream.writableCorked).assertEqual(3);
      let result1: boolean = duplexStream.uncork();
      expect(result1).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(2);
      let result2: boolean = duplexStream.uncork();
      expect(result2).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(1);
      let result3: boolean = duplexStream.uncork();
      expect(result3).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(0);
      let result4: boolean = duplexStream.uncork();
      expect(result4).assertTrue();
      expect(duplexStream.writableCorked).assertEqual(0);
    });
  })
}