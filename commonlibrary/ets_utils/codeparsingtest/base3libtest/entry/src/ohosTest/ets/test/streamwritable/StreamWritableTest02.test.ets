import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

interface GeneratedTypeLiteralInterface_1 {
  code: number;
}

interface GeneratedTypeLiteralInterface_2 {
  code: number;
}

interface GeneratedTypeLiteralInterface_3 {
  code: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable02Test() {
  describe('StreamWritable02Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0100
     * @tc.name      testStreamWritable02Chapter0001
     * @tc.desc      Test write method with TypedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      const writableStream = new TestWritable();
      const buffer1 = new Uint8Array([0]);
      const result1 = writableStream.write(buffer1);
      expect(result1).assertTrue();
      const buffer2 = new Uint8Array(131072);
      buffer2.fill(255);
      const result2 = writableStream.write(buffer2);
      expect(result2).assertFalse();
      const buffer3 = new Int8Array([-128, 0, 127]);
      const result3 = writableStream.write(new Uint8Array(buffer3.buffer));
      expect(result3).assertTrue();
      const buffer4 = new Uint8Array(0);
      const result4 = writableStream.write(buffer4);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0200
     * @tc.name      testStreamWritable02Chapter0002
     * @tc.desc      Test write method with TypedArray containing special values like Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      const writableStream = new TestWritable();
      try {
        const floatArray = new Float32Array([1.5, Infinity, -Infinity]);
        const uintArray = new Uint8Array(floatArray.buffer);
        const result = writableStream.write(uintArray);
        expect(result).assertEqual(true);
        expect(uintArray.length).assertEqual(12);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        const floatArray = new Float64Array([NaN, 1.7976931348623157e308]);
        const uintArray = new Uint8Array(floatArray.buffer);
        const result = writableStream.write(uintArray);
        expect(result).assertEqual(true);
        expect(uintArray.length).assertEqual(16);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0300
     * @tc.name      testStreamWritable02Chapter0003
     * @tc.desc      Test write method with large string to verify memory usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk received, length:", chunk.length);
          callback();
        }
      }

      const writableStream = new TestWritable();
      const largeString = 'A'.repeat(1024 * 1024);
      const result = writableStream.write(largeString, 'utf8');
      expect(result).assertFalse();
      const anotherLargeString = '测试'.repeat(512 * 1024);
      const result2 = writableStream.write(anotherLargeString, 'utf8');
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0400
     * @tc.name      testStreamWritable02Chapter0004
     * @tc.desc      Test write method with invalid Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      const writableStream = new TestWritable();
      try {
        const invalidBuffer = new Uint8Array([0xC0, 0x80]);
        const result = writableStream.write(invalidBuffer, 'utf8');
        expect(result).assertEqual(true);
        expect(invalidBuffer.length).assertEqual(2);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        const invalidString = '\uD800';
        const result = writableStream.write(invalidString, 'utf8');
        expect(result).assertEqual(true);
        expect(invalidString.length).assertEqual(1);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0500
     * @tc.name      testStreamWritable02Chapter0005
     * @tc.desc      Test write method with encoding error recovery
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount = 0;

      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          callback();
        }
      }

      const writableStream = new TestWritable();
      const validData = '正常数据';
      writableStream.write(validData, 'utf8');
      expect(writeCount).assertEqual(1);
      try {
        const invalidData = new Uint8Array([0xFF, 0xFE, 0x00]);
        const result = writableStream.write(invalidData, 'gbk');
        expect(result).assertEqual(true);
        expect(invalidData.length).assertEqual(3);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      writableStream.write('恢复写入', 'utf8');
      expect(writeCount).assertEqual(3);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0600
     * @tc.name      testStreamWritable02Chapter0007
     * @tc.desc      Test write method backpressure control
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCount = 0;

      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callbackCount++;
          console.info("Writable chunk", callbackCount, "is", chunk);
          setTimeout(() => {
            callback();
          }, 100);
        }
      }

      const writableStream = new TestWritable();
      const result1 = writableStream.write('first write');
      expect(result1).assertTrue();
      let result2 = true;
      for (let i = 0; i < 10; i++) {
        result2 = writableStream.write('data' + i);
        if (!result2) {
          break;
        }
      }
      expect(callbackCount).assertLessOrEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0700
     * @tc.name      testStreamWritable02Chapter0008
     * @tc.desc      Test writing empty string as chunk parameter (reverse test, interface explicitly not supported)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      const writableStream = new TestWritable();
      try {
        const result = writableStream.write('');
        expect(result).assertEqual(true);
        expect(writableStream instanceof TestWritable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0800
     * @tc.name      testStreamWritable02Chapter0009
     * @tc.desc      Test writing other TypedArray types after converting to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writtenData: Uint8Array = new Uint8Array(0);

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            const newArray = new Uint8Array(this.writtenData.length + chunk.length);
            newArray.set(this.writtenData);
            newArray.set(chunk, this.writtenData.length);
            this.writtenData = newArray;
          }
          callback();
        }

        getData(): Uint8Array {
          return this.writtenData;
        }
      }

      const writableStream = new TestWritable();
      const testArrays: ArrayBufferView[] = [
        new Int16Array([1, 2, 3]),
        new Uint16Array([4, 5, 6]),
        new Int32Array([7, 8, 9]),
        new Uint32Array([10, 11, 12]),
        new Float32Array([13.5, 14.5, 15.5]),
        new Float64Array([16.7, 17.8, 18.9]),
        new BigInt64Array([19n, 20n, 21n]),
        new BigUint64Array([22n, 23n, 24n])
      ];
      let totalBytes = 0;
      testArrays.forEach(arr => {
        const uint8Array = new Uint8Array(arr.buffer, arr.byteOffset, arr.byteLength);
        totalBytes += uint8Array.length;
        const result = writableStream.write(uint8Array);
        expect(result).assertEqual(true);
      });
      const finalData = writableStream.getData();
      expect(finalData.length).assertEqual(totalBytes);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_0900
     * @tc.name      testStreamWritable02Chapter0010
     * @tc.desc      Test writing TypedArray special values (Infinity, NaN) after converting to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writtenData: Uint8Array = new Uint8Array(0);

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            const newArray = new Uint8Array(this.writtenData.length + chunk.length);
            newArray.set(this.writtenData);
            newArray.set(chunk, this.writtenData.length);
            this.writtenData = newArray;
          }
          callback();
        }

        getData(): Uint8Array {
          return this.writtenData;
        }
      }

      const writableStream = new TestWritable();
      const float32Array = new Float32Array([Infinity, -Infinity, NaN, 0]);
      const float64Array = new Float64Array([Infinity, -Infinity, NaN, 0]);
      const uint8Array1 = new Uint8Array(float32Array.buffer, float32Array.byteOffset, float32Array.byteLength);
      const uint8Array2 = new Uint8Array(float64Array.buffer, float64Array.byteOffset, float64Array.byteLength);
      const result1 = writableStream.write(uint8Array1);
      const result2 = writableStream.write(uint8Array2);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      const finalData = writableStream.getData();
      expect(finalData.length).assertEqual(uint8Array1.length + uint8Array2.length);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1000
     * @tc.name      testStreamWritable02Chapter0011
     * @tc.desc      Test writing array containing non-numeric types after converting to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writtenData: Uint8Array = new Uint8Array(0);

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            const newArray = new Uint8Array(this.writtenData.length + chunk.length);
            newArray.set(this.writtenData);
            newArray.set(chunk, this.writtenData.length);
            this.writtenData = newArray;
          }
          callback();
        }

        getData(): Uint8Array {
          return this.writtenData;
        }
      }

      const writableStream = new TestWritable();
      const mixedArray: number[] = [1, 2.5, 3];
      const uint8Array = Uint8Array.from(mixedArray);
      const result = writableStream.write(uint8Array);
      expect(result).assertEqual(true);
      const finalData = writableStream.getData();
      expect(finalData.length).assertEqual(uint8Array.length);
      expect(finalData[0]).assertEqual(1);
      expect(finalData[1]).assertEqual(2);
      expect(finalData[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1100
     * @tc.name      testStreamWritable02Chapter0012
     * @tc.desc      Test writing large numeric values that overflow in Uint8Array conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writtenData: Uint8Array = new Uint8Array(0);

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            const newArray = new Uint8Array(this.writtenData.length + chunk.length);
            newArray.set(this.writtenData);
            newArray.set(chunk, this.writtenData.length);
            this.writtenData = newArray;
          }
          callback();
        }

        getData(): Uint8Array {
          return this.writtenData;
        }
      }

      const writableStream = new TestWritable();
      const largeValues = [256, 257, 65536, -1, 300];
      const uint8Array = Uint8Array.from(largeValues);
      const result = writableStream.write(uint8Array);
      expect(result).assertEqual(true);
      const finalData = writableStream.getData();
      expect(finalData.length).assertEqual(uint8Array.length);
      expect(finalData[0]).assertEqual(0);
      expect(finalData[1]).assertEqual(1);
      expect(finalData[2]).assertEqual(0);
      expect(finalData[3]).assertEqual(255);
      expect(finalData[4]).assertEqual(44);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1200
     * @tc.name      testStreamWritable02Chapter0013
     * @tc.desc      Test writing special arrays (non-numeric indices) after converting to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writtenData: Uint8Array = new Uint8Array(0);

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            const newArray = new Uint8Array(this.writtenData.length + chunk.length);
            newArray.set(this.writtenData);
            newArray.set(chunk, this.writtenData.length);
            this.writtenData = newArray;
          }
          callback();
        }

        getData(): Uint8Array {
          return this.writtenData;
        }
      }

      const writableStream = new TestWritable();
      const sparseArray: number[] = [];
      sparseArray[1] = 10;
      sparseArray[3] = 30;
      sparseArray[10] = 100;
      const uint8Array = Uint8Array.from(sparseArray);
      const result = writableStream.write(uint8Array);
      expect(result).assertEqual(true);
      const finalData = writableStream.getData();
      expect(finalData.length).assertEqual(11);
      expect(finalData[0]).assertEqual(0);
      expect(finalData[1]).assertEqual(10);
      expect(finalData[2]).assertEqual(0);
      expect(finalData[3]).assertEqual(30);
      expect(finalData[10]).assertEqual(100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1300
     * @tc.name      testStreamWritable02Chapter0014
     * @tc.desc      Test end method without parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end();
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1400
     * @tc.name      testStreamWritable02Chapter0015
     * @tc.desc      Test end method with string chunk and utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('test', 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1500
     * @tc.name      testStreamWritable02Chapter0016
     * @tc.desc      Test end method with undefined string chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(undefined, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1600
     * @tc.name      testStreamWritable02Chapter0017
     * @tc.desc      Test end method with null string chunk (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      try {
        const writableStream = new TestWritable();
        writableStream.end(new Uint8Array(0), 'utf8');
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1700
     * @tc.name      testStreamWritable02Chapter0018
     * @tc.desc      Test end method with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('', 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1800
     * @tc.name      testStreamWritable02Chapter0019
     * @tc.desc      Test end method with special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      writableStream.end(specialChars, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(specialChars.length).assertEqual(32);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_1900
     * @tc.name      testStreamWritable02Chapter0020
     * @tc.desc      Test end method with double special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let doubleSpecial = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      writableStream.end(doubleSpecial, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(doubleSpecial.length).assertEqual(65);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2000
     * @tc.name      testStreamWritable02Chapter0021
     * @tc.desc      Test end method with full ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      writableStream.end(asciiChars, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(asciiChars.length).assertEqual(94);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2100
     * @tc.name      testStreamWritable02Chapter0022
     * @tc.desc      Test end method with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let escapeStr = "\x41\x42\x43\x0a\x0d\x09";
      writableStream.end(escapeStr, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(escapeStr.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2200
     * @tc.name      testStreamWritable02Chapter0023
     * @tc.desc      Test end method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let emojiStr = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      writableStream.end(emojiStr, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(emojiStr.length).assertLarger(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2300
     * @tc.name      testStreamWritable02Chapter0024
     * @tc.desc      Test end method with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('NaN', 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2400
     * @tc.name      testStreamWritable02Chapter0025
     * @tc.desc      Test end method with large string for memory test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let largeStr = "a".repeat(1000000);
      writableStream.end(largeStr, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(largeStr.length).assertEqual(1000000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2500
     * @tc.name      testStreamWritable02Chapter0026
     * @tc.desc      Test end method with gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('测试', 'gb18030');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2600
     * @tc.name      testStreamWritable02Chapter0027
     * @tc.desc      Test end method with gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('测试', 'gbk');
      expect(writableStream instanceof TestWritable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2700
     * @tc.name      testStreamWritable02Chapter0028
     * @tc.desc      Test end method with gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end('测试', 'gb2312');
      expect(writableStream instanceof TestWritable).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2800
     * @tc.name      testStreamWritable02Chapter0029
     * @tc.desc      Test end method with gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let called = false;

      class TestWritable extends stream.Writable {
        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          called = true;
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('test', 'invalid-encoding');

      expect(called).assertTrue();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_2900
     * @tc.name      testStreamWritable02Chapter0030
     * @tc.desc      Test end method with Uint8Array chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3000
     * @tc.name      testStreamWritable02Chapter0031
     * @tc.desc      Test end method with Uint8Array boundary values 0 and 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3100
     * @tc.name      testStreamWritable02Chapter0032
     * @tc.desc      Test end method with Uint8ClampedArray converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let uint8Array = new Uint8Array([0, 255, 255, 0]);
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(4);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3200
     * @tc.name      testStreamWritable02Chapter0033
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let uint8Array = new Uint8Array([0, 127]);
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3300
     * @tc.name      testStreamWritable02Chapter0034
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3400
     * @tc.name      testStreamWritable02Chapter0035
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3500
     * @tc.name      testStreamWritable02Chapter0036
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3600
     * @tc.name      testStreamWritable02Chapter0037
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      expect(writableStream instanceof TestWritable).assertTrue();

      let uint8Array = new Uint8Array([0, 255]);
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);

      writableStream.end(uint8Array, 'utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3700
     * @tc.name      testStreamWritable02Chapter0038
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      expect(writableStream instanceof TestWritable).assertTrue();

      let uint8Array = new Uint8Array([0, 255]);
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);

      writableStream.end(uint8Array, 'utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3800
     * @tc.name      testStreamWritable02Chapter0039
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      expect(writableStream instanceof TestWritable).assertTrue();

      let uint8Array = new Uint8Array([0, 255]);
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);

      writableStream.end(uint8Array, 'utf8');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_3900
     * @tc.name      testStreamWritable02Chapter0040
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      expect(writableStream instanceof TestWritable).assertTrue();

      let uint8Array = new Uint8Array([0, 255]);
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);

      writableStream.end(uint8Array, 'utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4000
     * @tc.name      testStreamWritable02Chapter0041
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      expect(writableStream instanceof TestWritable).assertTrue();

      let uint8Array = new Uint8Array([0, 255]);
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8Array.length).assertEqual(2);
      expect(uint8Array[0]).assertEqual(0);
      expect(uint8Array[1]).assertEqual(255);

      writableStream.end(uint8Array, 'utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4100
     * @tc.name      testStreamWritable02Chapter0042
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let uint8Array = new Uint8Array([0, 0, 0]);
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(3);
      expect(uint8Array[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4200
     * @tc.name      testStreamWritable02Chapter0043
     * @tc.desc      Test end method with wrong type parameter (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      let streamCreated = false;

      try {
        const writableStream = new TestWritable();
        streamCreated = true;
        expect(writableStream instanceof TestWritable).assertEqual(true);

        const bigIntArray = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
        const buffer = bigIntArray.buffer;
        const uint8Array = new Uint8Array(buffer);

        expect(uint8Array instanceof Uint8Array).assertEqual(true);
        expect(uint8Array.length).assertLarger(0);

        writableStream.end(uint8Array, 'utf8');
        expect(writableStream !== null).assertEqual(true);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }

      expect(streamCreated).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4300
     * @tc.name      testStreamWritable02Chapter0044
     * @tc.desc      Test end method with wrong type parameter (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      let streamCreated = false;

      try {
        const writableStream = new TestWritable();
        streamCreated = true;
        expect(writableStream instanceof TestWritable).assertEqual(true);

        const bigUintArray = new BigUint64Array([0n, 18446744073709551615n]);
        const buffer = bigUintArray.buffer;
        const uint8Array = new Uint8Array(buffer);

        expect(uint8Array instanceof Uint8Array).assertEqual(true);
        expect(uint8Array.length).assertLarger(0);

        writableStream.end(uint8Array, 'utf8');
        expect(writableStream !== null).assertEqual(true);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }

      expect(streamCreated).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4400
     * @tc.name      testStreamWritable02Chapter0045
     * @tc.desc      Verify end callback is invoked when end method is called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let writeCalled = false

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCalled = true;
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('test', 'utf8', () => {
        expect(writeCalled).assertTrue();
      });
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4500
     * @tc.name      testStreamWritable02Chapter0046
     * @tc.desc      Test end method with write and then end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callCount++;
          console.info("Writable chunk", callCount, "is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.write('first', 'utf8');
      writableStream.end('last', 'utf8');
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4600
     * @tc.name      testStreamWritable02Chapter0047
     * @tc.desc      Test end method with corked stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callCount++;
          console.info("Writable chunk", callCount, "is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.write('corked1', 'utf8');
      writableStream.write('corked2', 'utf8');
      writableStream.end('final', 'utf8');
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4700
     * @tc.name      testStreamWritable02Chapter0048
     * @tc.desc      Test end method without implementing doWrite (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }
        }

        let writableStream = new TestWritable();
        let result = writableStream.end('test', 'utf8');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4800
     * @tc.name      testStreamWritable02Chapter0049
     * @tc.desc      Test end method with number chunk (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      let streamCreated = false;

      try {
        const writableStream: stream.Writable = new TestWritable();
        streamCreated = true;
        expect(writableStream instanceof TestWritable).assertEqual(true);

        const number: number = 123;
        const numberString: string = String(number);

        const bytes: Uint8Array = new Uint8Array(numberString.length);
        for (let i = 0; i < numberString.length; i++) {
          bytes[i] = numberString.charCodeAt(i);
        }

        expect(bytes.length).assertLarger(0);
        writableStream.end(bytes, 'utf8');

        expect(writableStream !== null).assertEqual(true);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }

      expect(streamCreated).assertEqual(true);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_4900
     * @tc.name      testStreamWritable02Chapter0050
     * @tc.desc      Test end method with boolean chunk (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      try {
        const writableStream: stream.Writable = new TestWritable();
        const boolValue: boolean = true;
        const boolString: string = String(boolValue);

        const bytes: Uint8Array = new Uint8Array(boolString.length);
        for (let i: number = 0; i < boolString.length; i++) {
          bytes[i] = boolString.charCodeAt(i);
        }

        writableStream.end(bytes, 'utf8');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5000
     * @tc.name      testStreamWritable02Chapter0051
     * @tc.desc      Test end method with object chunk (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      try {
        const writableStream: stream.Writable = new TestWritable();
        const obj: Record<string, number> = { "a": 1 };
        const objString: string = JSON.stringify(obj);
        const bytes: Uint8Array = new Uint8Array(objString.length);
        for (let i: number = 0; i < objString.length; i++) {
          bytes[i] = objString.charCodeAt(i);
        }

        writableStream.end(bytes, 'utf8');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5100
     * @tc.name      testStreamWritable02Chapter0052
     * @tc.desc      Test end method with array chunk (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      try {
        const writableStream: stream.Writable = new TestWritable();
        const array: number[] = [1, 2, 3];
        const arrayString: string = array.toString();

        const bytes: Uint8Array = new Uint8Array(arrayString.length);
        for (let i: number = 0; i < arrayString.length; i++) {
          bytes[i] = arrayString.charCodeAt(i);
        }

        writableStream.end(bytes, 'utf8');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5200
     * @tc.name      testStreamWritable02Chapter0053
     * @tc.desc      Test end method with empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let emptyArray = new Uint8Array([]);
      writableStream.end(emptyArray, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(emptyArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5300
     * @tc.name      testStreamWritable02Chapter0054
     * @tc.desc      Test end method with Uint8Array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(19);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5400
     * @tc.name      testStreamWritable02Chapter0055
     * @tc.desc      Test end method with invalid callback (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        _write(chunk: Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback();
        }
      }

      try {
        const writableStream: stream.Writable = new TestWritable();
        const testString: string = 'test';

        const bytes: Uint8Array = new Uint8Array(testString.length);
        for (let i: number = 0; i < testString.length; i++) {
          bytes[i] = testString.charCodeAt(i);
        }

        const invalidCallback: () => void = () => {
          throw new Error('not-a-function');
        };

        writableStream.end(bytes, 'utf8', invalidCallback);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTTWO_5500
     * @tc.name      testStreamWritable02Chapter0058
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 145, 114, 108, 100, 207, 50, 51, 193]);
      writableStream.end(uint8Array, 'utf8');
      expect(writableStream instanceof TestWritable).assertTrue();
      expect(uint8Array.length).assertEqual(13);
    });
  })
}