import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable04Test() {
  describe('StreamWritable04Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0100
     * @tc.name      testStreamWritable04Chapter0001
     * @tc.desc      Set default encoding with invalid Unicode encoding \\udc04
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
        let result: boolean = writableStream.setDefaultEncoding('\\udc04');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0200
     * @tc.name      testStreamWritable04Chapter0002
     * @tc.desc      Set default encoding with keyword "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
        let result: boolean = writableStream.setDefaultEncoding('0');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0300
     * @tc.name      testStreamWritable04Chapter0003
     * @tc.desc      Set default encoding with keyword "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
        let result: boolean = writableStream.setDefaultEncoding('NaN');
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0400
     * @tc.name      testStreamWritable04Chapter0004
     * @tc.desc      Set default encoding with treestring type (large JSON-like string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initTreeString: (size: number) => string = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

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
        let treeString: string = initTreeString(1000);
        let result: boolean = writableStream.setDefaultEncoding(treeString);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0500
     * @tc.name      testStreamWritable04Chapter0005
     * @tc.desc      Set default encoding with slicestring type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: TestWritable = new TestWritable();

      let originalString: string = "{k1:value1,k2:value2}";
      let sliceString: string = originalString.substring(0, originalString.length - 2);

      try {
        let result: boolean = writableStream.setDefaultEncoding(sliceString);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0600
     * @tc.name      testStreamWritable04Chapter0006
     * @tc.desc      Set default encoding with huge repeated string (memory test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
        let hugeString: string = 'a'.repeat(10000);
        let result: boolean = writableStream.setDefaultEncoding(hugeString);
        expect(result).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0700
     * @tc.name      testStreamWritable04Chapter0007
     * @tc.desc      Set default encoding with valid encoding after multiple invalid attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
        let result1: boolean = writableStream.setDefaultEncoding('invalid');
        expect(result1).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      try {
        let result2: boolean = writableStream.setDefaultEncoding('!!!');
        expect(result2).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      let finalResult: boolean = writableStream.setDefaultEncoding('utf8');
      expect(finalResult).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0800
     * @tc.name      testStreamWritable04Chapter0008
     * @tc.desc      Test cork method returns true when called on a writable stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.cork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_0900
     * @tc.name      testStreamWritable04Chapter0009
     * @tc.desc      Test cork method increments writableCorked property by 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let initialCorkedValue = writableStream.writableCorked;
      writableStream.cork();
      let afterCorkedValue = writableStream.writableCorked;
      expect(afterCorkedValue).assertEqual(initialCorkedValue + 1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1000
     * @tc.name      testStreamWritable04Chapter0010
     * @tc.desc      Test multiple cork calls increment writableCorked property accordingly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let initialCorkedValue = writableStream.writableCorked;
      writableStream.cork();
      writableStream.cork();
      writableStream.cork();
      let afterCorkedValue = writableStream.writableCorked;
      expect(afterCorkedValue).assertEqual(initialCorkedValue + 3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1100
     * @tc.name      testStreamWritable04Chapter0011
     * @tc.desc      Test cork method can be paired with uncork method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let initialCorkedValue = writableStream.writableCorked;
      writableStream.cork();
      writableStream.uncork();
      let afterCorkedValue = writableStream.writableCorked;
      expect(afterCorkedValue).assertEqual(initialCorkedValue);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1200
     * @tc.name      testStreamWritable04Chapter0012
     * @tc.desc      Test cork method returns true and data is buffered when stream is corked
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private buffer: string[] = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.buffer.push(chunk.toString());
          callback();
        }

        getBuffer(): string[] {
          return this.buffer;
        }
      }

      let writableStream = new TestWritable();
      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();

      let writeResult1 = writableStream.write("test data 1");
      let writeResult2 = writableStream.write("test data 2");

      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1300
     * @tc.name      testStreamWritable04Chapter0013
     * @tc.desc      Test cork method called after stream is destroyed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Array<string | Uint8Array> = [];
        private writeCount: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData.push(chunk);
          this.writeCount++;
          callback();
        }

        getReceivedData(): Array<string | Uint8Array> {
          return this.receivedData;
        }

        getWriteCount(): number {
          return this.writeCount;
        }
      }

      let writableStream = new TestWritable();
      let writeResult1 = writableStream.write("first data");
      expect(writeResult1).assertTrue();
      expect(writableStream.getWriteCount()).assertEqual(1);
      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();
      expect(writableStream.writableCorked).assertEqual(1);
      let writeResult2 = writableStream.write("second data");
      expect(writeResult2).assertTrue();
      let writeResult3 = writableStream.write("third data");
      expect(writeResult3).assertTrue();
      expect(writableStream.getWriteCount()).assertEqual(1);
      writableStream.uncork();
      expect(writableStream.getWriteCount()).assertEqual(3);
      let receivedData = writableStream.getReceivedData();
      expect(receivedData.length).assertEqual(3);
      expect(receivedData[0]).assertEqual("first data");
      expect(receivedData[1]).assertEqual("second data");
      expect(receivedData[2]).assertEqual("third data");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1400
     * @tc.name      testStreamWritable04Chapter0014
     * @tc.desc      Test cork method called after stream is ended
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end();
      let result = writableStream.cork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1500
     * @tc.name      testStreamWritable04Chapter0015
     * @tc.desc      Test cork method returns true on different writable stream instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let stream1 = new TestWritable();
      let stream2 = new TestWritable();
      let result1 = stream1.cork();
      let result2 = stream2.cork();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1600
     * @tc.name      testStreamWritable04Chapter0016
     * @tc.desc      Test cork method returns true when writableCorked is already non-zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result1 = writableStream.cork();
      let result2 = writableStream.cork();
      let result3 = writableStream.cork();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(writableStream.writableCorked).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1700
     * @tc.name      testStreamWritable04Chapter0017
     * @tc.desc      Test cork method after writing data without corking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeCount: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCount++;
          callback();
        }

        getWriteCount(): number {
          return this.writeCount;
        }
      }

      let writableStream = new TestWritable();
      let writeResult = writableStream.write("test data");
      expect(writeResult).assertTrue();
      expect(writableStream.getWriteCount()).assertEqual(1);

      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();
      expect(writableStream.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1800
     * @tc.name      testStreamWritable04Chapter0018
     * @tc.desc      Test cork method with Uint8Array data buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private buffer: Uint8Array[] = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.buffer.push(chunk);
          }
          callback();
        }

        getBuffer(): Uint8Array[] {
          return this.buffer;
        }
      }

      let writableStream = new TestWritable();
      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();

      let data = new Uint8Array([72, 101, 108, 108, 111]);
      let writeResult = writableStream.write(data);
      expect(writeResult).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_1900
     * @tc.name      testStreamWritable04Chapter0019
     * @tc.desc      Test cork method with string data in different encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();

      let writeResult1 = writableStream.write("Hello", "utf8");
      let writeResult2 = writableStream.write("World", "ascii");
      let writeResult3 = writableStream.write("测试", "utf-8");

      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
      expect(writeResult3).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2000
     * @tc.name      testStreamWritable04Chapter0020
     * @tc.desc      Test cork method multiple times with uncork in between
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let initialCorked = writableStream.writableCorked;

      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(initialCorked + 1);

      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(initialCorked);

      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(initialCorked + 1);

      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(initialCorked + 2);

      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(initialCorked + 1);

      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(initialCorked);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2100
     * @tc.name      testStreamWritable04Chapter0021
     * @tc.desc      Test cork method on stream with error state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback(new Error("Simulated write error"));
        }
      }

      let writableStream = new TestWritable();
      try {
        writableStream.write("test data");
        let corkResult = writableStream.cork();
        expect(corkResult).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2200
     * @tc.name      testStreamWritable04Chapter0022
     * @tc.desc      Test cork method on stream with custom internal buffer implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private internalBuffer: Array<string | Uint8Array> = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.internalBuffer.push(chunk);
          callback();
        }

        getInternalBufferSize(): number {
          return this.internalBuffer.length;
        }
      }

      let writableStream = new TestWritable();
      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();

      for (let i = 0; i < 10; i++) {
        let writeResult = writableStream.write("data" + i);
        expect(writeResult).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2300
     * @tc.name      testStreamWritable04Chapter0023
     * @tc.desc      Test cork method returns false when stream is already destroyed with error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeOperations: string[] = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeOperations.push(chunk.toString());
          callback();
        }

        getWriteOperations(): string[] {
          return this.writeOperations;
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.cork();
      let writeResult1 = writableStream.write("data1");
      let writeResult2 = writableStream.write("data2");
      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();
      writableStream.uncork();
      writableStream.uncork();
      let writeOperations = writableStream.getWriteOperations();
      expect(writeOperations.length).assertEqual(2);
      expect(writeOperations[0]).assertEqual("data1");
      expect(writeOperations[1]).assertEqual("data2");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2400
     * @tc.name      testStreamWritable04Chapter0024
     * @tc.desc      Test cork method with concurrent writes from multiple cork states
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeOperations: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeOperations++;
          callback();
        }

        getWriteOperations(): number {
          return this.writeOperations;
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.cork();

      let writeResult1 = writableStream.write("data1");
      let writeResult2 = writableStream.write("data2");

      expect(writeResult1).assertTrue();
      expect(writeResult2).assertTrue();

      writableStream.uncork();
      writableStream.uncork();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2500
     * @tc.name      testStreamWritable04Chapter0025
     * @tc.desc      Test cork method after uncork when writableCorked is zero should not go negative
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let initialCorked = writableStream.writableCorked;

      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(initialCorked);

      let corkResult = writableStream.cork();
      expect(corkResult).assertTrue();
      expect(writableStream.writableCorked).assertEqual(initialCorked + 1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2600
     * @tc.name      testStreamWritable04Chapter0026
     * @tc.desc      Test uncork method returns true after cork is called once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2700
     * @tc.name      testStreamWritable04Chapter0027
     * @tc.desc      Test uncork method returns false when no cork is called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2800
     * @tc.name      testStreamWritable04Chapter0028
     * @tc.desc      Test multiple uncork calls after multiple cork calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.cork();
      let result1: boolean = writableStream.uncork();
      let result2: boolean = writableStream.uncork();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_2900
     * @tc.name      testStreamWritable04Chapter0029
     * @tc.desc      Test uncork method flushes buffered data correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount: number = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.write('data1', 'utf8');
      writableStream.write('data2', 'utf8');
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(writeCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3000
     * @tc.name      testStreamWritable04Chapter0030
     * @tc.desc      Test uncork method after stream is destroyed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        destroy() {
          throw new Error('Method not implemented.');
        }

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      try {
        writableStream.destroy();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      try {
        let result: boolean = writableStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3100
     * @tc.name      testStreamWritable04Chapter0031
     * @tc.desc      Test uncork method returns false when called more times than cork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      let result1: boolean = writableStream.uncork();
      let result2: boolean = writableStream.uncork();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3200
     * @tc.name      testStreamWritable04Chapter0032
     * @tc.desc      Test uncork method with TypedArray data in buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedData: Uint8Array[] = [];

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            receivedData.push(chunk);
          }
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      let data1: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      let data2: Uint8Array = new Uint8Array([87, 111, 114, 108, 100]);
      writableStream.write(data1);
      writableStream.write(data2);
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(receivedData.length).assertEqual(2);
      expect(receivedData[0][0]).assertEqual(72);
      expect(receivedData[1][0]).assertEqual(87);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3300
     * @tc.name      testStreamWritable04Chapter0033
     * @tc.desc      Test uncork method with large amount of buffered data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount: number = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          Promise.resolve().then(() => {
            callback();
          });
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      for (let i = 0; i < 100; i++) {
        writableStream.write('data' + i, 'utf8');
      }
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();

      setTimeout(() => {
        expect(writeCount).assertEqual(100);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3400
     * @tc.name      testStreamWritable04Chapter0034
     * @tc.desc      Test uncork method when stream is in flowing mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        resume() {
          throw new Error('Method not implemented.');
        }

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      try {
        writableStream.resume();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
      let result: boolean = writableStream.uncork();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3500
     * @tc.name      testStreamWritable04Chapter0035
     * @tc.desc      Test uncork method after end is called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.write('data', 'utf8');
      writableStream.end();
      try {
        let result: boolean = writableStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3600
     * @tc.name      testStreamWritable04Chapter0036
     * @tc.desc      Test uncork method returns true when corked multiple times and uncorked multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.cork();
      writableStream.cork();
      let result1: boolean = writableStream.uncork();
      let result2: boolean = writableStream.uncork();
      let result3: boolean = writableStream.uncork();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3700
     * @tc.name      testStreamWritable04Chapter0037
     * @tc.desc      Test uncork method after stream is corked
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();

      const result: boolean = writableStream.uncork();

      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3800
     * @tc.name      testStreamWritable04Chapter0038
     * @tc.desc      Test uncork method with writableCorked property checking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_3900
     * @tc.name      testStreamWritable04Chapter0039
     * @tc.desc      Test uncork method when writableCorked is 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4000
     * @tc.name      testStreamWritable04Chapter0040
     * @tc.desc      Test uncork method with TypedArray containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedData: number[] = [];

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            for (let i = 0; i < chunk.length; i++) {
              receivedData.push(chunk[i]);
            }
          }
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      let data: Uint8Array = new Uint8Array([0, 255, 128, 1, 254]);
      writableStream.write(data);
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(receivedData).assertDeepEquals([0, 255, 128, 1, 254]);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4100
     * @tc.name      testStreamWritable04Chapter0041
     * @tc.desc      Test uncork method with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedString: string = '';

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (typeof chunk === 'string') {
            receivedString += chunk;
          }
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      let specialString: string = '!@#$%^&*()_+-=[]{}\\|;:\'",.<>/?`~';
      writableStream.write(specialString, 'utf8');
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(receivedString).assertEqual(specialString);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4200
     * @tc.name      testStreamWritable04Chapter0042
     * @tc.desc      Test uncork method with empty data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      let writeCalled = false;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCalled = true;
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();

      const emptyBytes: Uint8Array = new Uint8Array(0);
      writableStream.write(emptyBytes);

      const result: boolean = writableStream.uncork();

      expect(result).assertTrue();
      expect(writeCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4300
     * @tc.name      testStreamWritable04Chapter0043
     * @tc.desc      Test uncork method with null and undefined data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      try {
        writableStream.write(null, 'utf8');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let result: boolean = writableStream.uncork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4400
     * @tc.name      testStreamWritable04Chapter0045
     * @tc.desc      Test uncork method with different encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedData: string[] = [];

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (typeof chunk === 'string') {
            receivedData.push(chunk);
          }
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.write('hello', 'utf8');
      writableStream.write('world', 'ascii');
      writableStream.write('测试', 'utf8');
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(receivedData).assertDeepEquals(['hello', 'world', '测试']);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4500
     * @tc.name      testStreamWritable04Chapter0046
     * @tc.desc      Test uncork method with chunk as both string and Uint8Array mixed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedItems: (string | Uint8Array)[] = [];

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          receivedItems.push(chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.cork();
      writableStream.write('string data', 'utf8');
      writableStream.write(new Uint8Array([1, 2, 3, 4, 5]));
      writableStream.write('more string', 'ascii');
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(receivedItems.length).assertEqual(3);
      expect(typeof receivedItems[0]).assertEqual('string');
      expect(receivedItems[0]).assertEqual('string data');
      expect(receivedItems[1] instanceof Uint8Array).assertTrue();
      expect(receivedItems[2]).assertEqual('more string');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4600
     * @tc.name      testStreamWritable04Chapter0047
     * @tc.desc      Test uncork method when stream is already uncorked but with pending writes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writeCount: number = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.write('data1', 'utf8');
      writableStream.write('data2', 'utf8');
      expect(writeCount).assertEqual(2);
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      expect(writeCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4700
     * @tc.name      testStreamWritable04Chapter0048
     * @tc.desc      Test uncork method with maximum cork depth
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      for (let i = 0; i < 100; i++) {
        writableStream.cork();
      }
      expect(writableStream.writableCorked).assertEqual(100);
      for (let i = 0; i < 100; i++) {
        let result: boolean = writableStream.uncork();
        expect(result).assertTrue();
      }
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4800
     * @tc.name      testStreamWritable04Chapter0049
     * @tc.desc      Test uncork method with finish event after uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finishCalled: boolean = false;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.on('finish', () => {
        finishCalled = true;
      });
      writableStream.cork();
      writableStream.write('data', 'utf8');
      let result: boolean = writableStream.uncork();
      expect(result).assertTrue();
      writableStream.end();
      setTimeout(() => {
        expect(finishCalled).assertTrue();
      }, 0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_4900
     * @tc.name      testStreamWritable04Chapter0050
     * @tc.desc      Test registering valid close event with correct callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      let eventTriggered: boolean = false;
      const writable: TestWritable = new TestWritable();
      const closeCallback: () => void = (): void => {
        eventTriggered = true;
      };

      writable.on('close', closeCallback);
      writable.end();

      expect(eventTriggered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_5000
     * @tc.name      testStreamWritable04Chapter0051
     * @tc.desc      Test registering valid drain event with correct callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private bufferSize: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          this.bufferSize += 1;
          setTimeout((): void => {
            this.bufferSize = 0;
            callback();
          }, 10);
        }
      }

      let drainTriggered: boolean = false;
      const writable: TestWritable = new TestWritable();
      const drainCallback: () => void = (): void => {
        drainTriggered = true;
      };

      writable.on('drain', drainCallback);
      writable.write('a');
      writable.write('b');

      setTimeout((): void => {
        expect(drainTriggered).assertTrue();
      }, 50);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_5100
     * @tc.name      testStreamWritable04Chapter0052
     * @tc.desc      Test registering valid error event with correct callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      let errorTriggered: boolean = false;
      const writable: TestWritable = new TestWritable();
      const errorCallback: () => void = (): void => {
        errorTriggered = true;
      };

      writable.on('error', errorCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(errorTriggered).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_5200
     * @tc.name      testStreamWritable04Chapter0053
     * @tc.desc      Test registering valid finish event with correct callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      let finishTriggered: boolean = false;
      const writable: TestWritable = new TestWritable();
      const finishCallback: () => void = (): void => {
        finishTriggered = true;
      };

      writable.on('finish', finishCallback);
      writable.end();

      expect(finishTriggered).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFOUR_5300
     * @tc.name      testStreamWritable04Chapter0054
     * @tc.desc      Test registering multiple events on same writable stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      let closeTriggered: boolean = false;
      let finishTriggered: boolean = false;
      const writable: TestWritable = new TestWritable();
      const closeCallback: () => void = (): void => {
        closeTriggered = true;
      };
      const finishCallback: () => void = (): void => {
        finishTriggered = true;
      };

      writable.on('close', closeCallback);
      writable.on('finish', finishCallback);
      writable.end();

      expect(closeTriggered).assertTrue();
      expect(finishTriggered).assertFalse();
    });
  })
}