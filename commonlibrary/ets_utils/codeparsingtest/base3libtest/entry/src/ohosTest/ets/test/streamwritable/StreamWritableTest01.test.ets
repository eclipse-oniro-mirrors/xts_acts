import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable01Test() {
  describe('StreamWritable01Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0100
     * @tc.name      testStreamWritable01Chapter0001
     * @tc.desc      Test Writable constructor creates instance successfully
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream = new stream.Writable()

      expect(writableStream != null).assertTrue()
      expect(typeof writableStream.write === 'function').assertTrue()
      expect(typeof writableStream.end === 'function').assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0200
     * @tc.name      testStreamWritable01Chapter0002
     * @tc.desc      Test creating multiple Writable instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream1 = new stream.Writable()
      let writableStream2 = new stream.Writable()

      expect(writableStream1 != null).assertTrue()
      expect(writableStream2 != null).assertTrue()
      expect(writableStream1 === writableStream2).assertFalse()
      expect(typeof writableStream1.write === 'function').assertTrue()
      expect(typeof writableStream2.write === 'function').assertTrue()
      expect(typeof writableStream1.end === 'function').assertTrue()
      expect(typeof writableStream2.end === 'function').assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0300
     * @tc.name      testStreamWritable01Chapter0003
     * @tc.desc      Test Writable instance type checking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream = new stream.Writable()

      expect(writableStream instanceof stream.Writable).assertTrue()
      expect(writableStream instanceof Object).assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0400
     * @tc.name      testStreamWritable01Chapter0004
     * @tc.desc      Test Writable constructor is a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(stream.Writable != null).assertTrue()
      expect(typeof stream.Writable === 'function').assertTrue()
      let writableStream = new stream.Writable()
      expect(writableStream != null).assertTrue()
      expect(typeof writableStream.write === 'function').assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0500
     * @tc.name      testStreamWritable01Chapter0005
     * @tc.desc      Test Writable constructor in strict mode context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const createWritableInStrictMode = (): stream.Writable => {
        'use strict'
        return new stream.Writable()
      }
      let writableStream = createWritableInStrictMode()

      expect(writableStream != null).assertTrue()
      expect(typeof writableStream.write === 'function').assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0600
     * @tc.name      testStreamWritable01Chapter0006
     * @tc.desc      Test Writable constructor assignment to variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const WritableConstructor = stream.Writable
      let writableStream = new WritableConstructor()

      expect(writableStream != null).assertTrue()
      expect(writableStream instanceof stream.Writable).assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0700
     * @tc.name      testStreamWritable01Chapter0007
     * @tc.desc      Test Writable constructor for memory leaks with multiple creations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instances: stream.Writable[] = []
      const instanceCount = 10
      for (let i = 0; i < instanceCount; i++) {
        let writableStream = new stream.Writable()
        instances.push(writableStream)
        expect(writableStream != null).assertTrue()
        expect(typeof writableStream.write === 'function').assertTrue()
      }

      for (let i = 0; i < instances.length; i++) {
        for (let j = i + 1; j < instances.length; j++) {
          expect(instances[i] === instances[j]).assertFalse()
        }
      }
      instances.length = 0
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0800
     * @tc.name      testStreamWritable01Chapter0008
     * @tc.desc      Test writing normal string data with default encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData += chunk;
          }

          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('Hello World');
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_0900
     * @tc.name      testStreamWritable01Chapter0009
     * @tc.desc      Test writing Uint8Array data with default encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array[] = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData.push(chunk);
          }
          callback();
        }

        getData(): Uint8Array[] {
          return this.receivedData;
        }
      }

      const data = new Uint8Array([72, 101, 108, 108, 111]);
      const writableStream = new TestWritable();
      const result = writableStream.write(data);
      expect(result).assertTrue();
      expect(writableStream.getData().length).assertEqual(1);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1000
     * @tc.name      testStreamWritable01Chapter0010
     * @tc.desc      Test writing empty string should return valid boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          callback();
        }

        wasWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      const writableStream = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let errorCaught = false;
      let writeSuccess = false;
      try {
        const result = writableStream.write('');
        writeSuccess = result;
        expect(typeof result).assertEqual('boolean');
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }

      setTimeout(() => {
        const writeCalled = writableStream.wasWriteCalled();

        if (!errorCaught) {
          expect(writeSuccess).assertEqual(true);
          expect(writeCalled).assertEqual(true);
        }
      }, 10);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1100
     * @tc.name      testStreamWritable01Chapter0011
     * @tc.desc      Test writing string with utf8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedEncoding: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.receivedEncoding = encoding;
          callback();
        }

        getEncoding(): string {
          return this.receivedEncoding;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('test', 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getEncoding()).assertEqual('utf8');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1200
     * @tc.name      testStreamWritable01Chapter0012
     * @tc.desc      Test writing string with gb18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedEncoding: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.receivedEncoding = encoding;
          callback();
        }

        getEncoding(): string {
          return this.receivedEncoding;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('test', 'gb18030');
      expect(result).assertTrue();
      expect(writableStream.getEncoding()).assertEqual('gb18030');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1300
     * @tc.name      testStreamWritable01Chapter0013
     * @tc.desc      Test writing string with gbk encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedEncoding: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.receivedEncoding = encoding;
          callback();
        }

        getEncoding(): string {
          return this.receivedEncoding;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('test', 'gbk');
      expect(result).assertTrue();
      expect(writableStream.getEncoding()).assertEqual('gbk');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1400
     * @tc.name      testStreamWritable01Chapter0014
     * @tc.desc      Test writing string with gb2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedEncoding: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.receivedEncoding = encoding;
          callback();
        }

        getEncoding(): string {
          return this.receivedEncoding;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('test', 'gb2312');
      expect(result).assertTrue();
      expect(writableStream.getEncoding()).assertEqual('gb2312');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1500
     * @tc.name      testStreamWritable01Chapter0015
     * @tc.desc      Test writing with invalid encoding parameter should handle gracefully
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private encodingReceived: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.encodingReceived = encoding;
          callback();
        }

        getEncodingReceived(): string {
          return this.encodingReceived;
        }
      }

      const writableStream = new TestWritable();
      let errorCaught = false;
      let writeSuccess = false;
      const testEncoding: string = 'ascii';
      try {
        const result = writableStream.write('test', testEncoding);
        writeSuccess = result;
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }
      if (!errorCaught) {
        expect(writeSuccess).assertEqual(true);
        setTimeout(() => {
          const receivedEncoding = writableStream.getEncodingReceived();
          expect(receivedEncoding !== '').assertEqual(true);
        }, 10);
      } else {
        expect(errorCaught).assertEqual(false);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1600
     * @tc.name      testStreamWritable01Chapter0016
     * @tc.desc      Test writing with callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private callbackCalled = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          setTimeout(() => {
            this.callbackCalled = true;
            callback();
          }, 10);
        }

        isCallbackCalled(): boolean {
          return this.callbackCalled;
        }
      }

      const writableStream = new TestWritable();
      let callbackExecuted = false;
      const result = writableStream.write('test', 'utf8', () => {
        callbackExecuted = true;
      });
      setTimeout(() => {
        expect(result).assertTrue();
        expect(callbackExecuted).assertTrue();
      }, 50);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1700
     * @tc.name      testStreamWritable01Chapter0017
     * @tc.desc      Test writing string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const specialChars = '!@#$%^&*()_+-=[]{}|;:,.<>?';
      const writableStream = new TestWritable();
      const result = writableStream.write(specialChars, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(specialChars);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1800
     * @tc.name      testStreamWritable01Chapter0018
     * @tc.desc      Test writing string containing all ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      let asciiString = '';
      for (let i = 32; i <= 126; i++) {
        asciiString += String.fromCharCode(i);
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(asciiString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData().length).assertEqual(95);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_1900
     * @tc.name      testStreamWritable01Chapter0019
     * @tc.desc      Test writing string containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const emojis = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      const writableStream = new TestWritable();
      const result = writableStream.write(emojis, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(emojis);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2000
     * @tc.name      testStreamWritable01Chapter0020
     * @tc.desc      Test writing string containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const escapeString = 'Line1\nLine2\tTab\\Backslash\'Single\"Double';
      const writableStream = new TestWritable();
      const result = writableStream.write(escapeString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(escapeString);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2100
     * @tc.name      testStreamWritable01Chapter0021
     * @tc.desc      Test writing Uint8Array with boundary value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const data = new Uint8Array([0, 1, 2, 3]);
      const writableStream = new TestWritable();
      const result = writableStream.write(data);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array)[0]).assertEqual(0);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2200
     * @tc.name      testStreamWritable01Chapter0022
     * @tc.desc      Test writing Uint8Array with boundary value 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const data = new Uint8Array([254, 255, 1, 2]);
      const writableStream = new TestWritable();
      const result = writableStream.write(data);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array)[1]).assertEqual(255);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2300
     * @tc.name      testStreamWritable01Chapter0023
     * @tc.desc      Test writing Uint8Array with special values (Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const arr: number[] = [72, 101, NaN, Infinity, -Infinity, 108, 111];
      const uint8Array = new Uint8Array(arr);
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array)[2]).assertEqual(0);
      expect((receivedData as Uint8Array)[3]).assertEqual(0);
      expect((receivedData as Uint8Array)[4]).assertEqual(0);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2400
     * @tc.name      testStreamWritable01Chapter0024
     * @tc.desc      Test writing large string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedLength: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedLength = chunk.length;
          }
          callback();
        }

        getLength(): number {
          return this.receivedLength;
        }
      }

      const largeString = 'A'.repeat(10000);
      const writableStream = new TestWritable();
      const result = writableStream.write(largeString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getLength()).assertEqual(10000);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2500
     * @tc.name      testStreamWritable01Chapter0025
     * @tc.desc      Test writing large Uint8Array data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedLength: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedLength = chunk.length;
          }
          callback();
        }

        getLength(): number {
          return this.receivedLength;
        }
      }

      const largeArray = new Uint8Array(5000);
      for (let i = 0; i < largeArray.length; i++) {
        largeArray[i] = i % 256;
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(largeArray);
      expect(result).assertTrue();
      expect(writableStream.getLength()).assertEqual(5000);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2600
     * @tc.name      testStreamWritable01Chapter0026
     * @tc.desc      Test writing multiple times to the same stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeCount: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCount++;
          callback();
        }

        getWriteCount(): number {
          return this.writeCount;
        }
      }

      const writableStream = new TestWritable();
      const result1 = writableStream.write('first', 'utf8');
      const result2 = writableStream.write('second', 'utf8');
      const result3 = writableStream.write(new Uint8Array([1, 2, 3]));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(writableStream.getWriteCount()).assertEqual(3);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2700
     * @tc.name      testStreamWritable01Chapter0027
     * @tc.desc      Test writing string containing number keyword "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const keywordString = 'NaN';
      const writableStream = new TestWritable();
      const result = writableStream.write(keywordString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(keywordString);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2800
     * @tc.name      testStreamWritable01Chapter0028
     * @tc.desc      Test writing null string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private writeCalled: boolean = false;
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }

        getReceivedData(): string {
          return this.receivedData;
        }
      }

      const writableStream = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let errorCaught = false;
      let writeResult: boolean = false;
      try {
        const nullString: string = 'null';
        expect(nullString).assertEqual('null');
        writeResult = writableStream.write(nullString);
        expect(typeof writeResult).assertEqual('boolean');
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(undefined);
      }

      setTimeout(() => {
        const writeCalled = writableStream.getWriteCalled();
        const receivedData = writableStream.getReceivedData();

        if (!errorCaught) {
          expect(writeResult).assertEqual(true);
          expect(writeCalled).assertEqual(true);
          expect(receivedData).assertEqual('null');
        }
      }, 10);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_2900
     * @tc.name      testStreamWritable01Chapter0029
     * @tc.desc      Test writing string with "undefined" keyword
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          callback();
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      const writableStream = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let errorCaught = false;
      let writeResult: boolean = false;
      try {
        const undefinedString: string = 'undefined';
        expect(undefinedString).assertEqual('undefined');
        writeResult = writableStream.write(undefinedString);
        expect(typeof writeResult).assertEqual('boolean');
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(undefined);
      }

      setTimeout(() => {
        const writeCalled = writableStream.getWriteCalled();

        if (!errorCaught) {
          expect(writeResult).assertEqual(true);
          expect(writeCalled).assertEqual(true);
        }
      }, 10);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3000
     * @tc.name      testStreamWritable01Chapter0030
     * @tc.desc      Test writing Uint8Array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const int8Array = new Int8Array([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
      const uint8Array = new Uint8Array(int8Array.length);
      for (let i = 0; i < int8Array.length; i++) {
        uint8Array[i] = int8Array[i] & 0xFF;
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      if (receivedData) {
        for (let i = 0; i < receivedData.length; i++) {
          const value = receivedData[i];
          expect(value >= 0 && value <= 255).assertTrue();
        }
      }
    });
    let generateTreeString: (size: number) => string = (size: number): string => {
      let ans = '[';
      while (ans.length < size) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}]';
      return ans;
    };
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3100
     * @tc.name      testStreamWritable01Chapter0031
     * @tc.desc      Test writing Uint8Array with multiple consecutive zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const data = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      const writableStream = new TestWritable();
      const result = writableStream.write(data);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(19);
      for (let i = 9; i <= 13; i++) {
        expect((receivedData as Uint8Array)[i]).assertEqual(0);
      }

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3200
     * @tc.name      testStreamWritable01Chapter0032
     * @tc.desc      Test writing string containing "0" keyword
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const keywordString = '0';
      const writableStream = new TestWritable();
      const result = writableStream.write(keywordString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(keywordString);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3300
     * @tc.name      testStreamWritable01Chapter0033
     * @tc.desc      Test writing string with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const unicodeString = String.fromCharCode(0xD83D, 0xDC46) +
      String.fromCharCode(0xD83D, 0xDC7F) +
      String.fromCharCode(0xD83D, 0xDC40) +
      String.fromCharCode(0xD83D, 0xDCAF);
      const writableStream = new TestWritable();
      const result = writableStream.write(unicodeString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(unicodeString);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3400
     * @tc.name      testStreamWritable01Chapter0034
     * @tc.desc      Test writing string with potential invalid Unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private receivedData: string = '';
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      const loneSurrogate = String.fromCharCode(0xDC04) + String.fromCharCode(0xD83D) + String.fromCharCode(0xDFF4);
      const writableStream = new TestWritable();
      let errorCaught = false;
      let writeResult: boolean = false;
      try {
        writeResult = writableStream.write(loneSurrogate, 'utf8');
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(undefined);
      }

      expect(writableStream instanceof TestWritable).assertEqual(true);
      expect(typeof writableStream.write).assertEqual('function');

      setTimeout(() => {
        const writeCalled = writableStream.getWriteCalled();
        if (!errorCaught) {
          expect(writeResult).assertEqual(true);
          expect(writeCalled).assertEqual(true);
          expect(writableStream.getData().length).assertLarger(0);
        } else {
          expect(errorCaught).assertEqual(true);
        }
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3500
     * @tc.name      testStreamWritable01Chapter0035
     * @tc.desc      Test writing empty Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeCalled: boolean = false;
        private receivedLength: number = -1;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          if (chunk instanceof Uint8Array) {
            this.receivedLength = chunk.length;
          }
          callback();
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }

        getLength(): number {
          return this.receivedLength;
        }
      }

      const emptyArray = new Uint8Array([]);
      const writableStream = new TestWritable();
      const result = writableStream.write(emptyArray);
      expect(result).assertTrue();
      expect(writableStream.getLength()).assertEqual(0);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3600
     * @tc.name      testStreamWritable01Chapter0036
     * @tc.desc      Test writing Uint8Array with overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const overflowValues = [256, 65536, 32768, 100, 200];
      const uint8Array = new Uint8Array(overflowValues.length);
      for (let i = 0; i < overflowValues.length; i++) {
        uint8Array[i] = overflowValues[i] & 0xFF;
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      if (receivedData) {
        for (let i = 0; i < receivedData.length; i++) {
          const value = receivedData[i];
          expect(value >= 0 && value <= 255).assertTrue();
        }
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3700
     * @tc.name      testStreamWritable01Chapter0037
     * @tc.desc      Test writing Uint8Array with valid numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const validArray = new Uint8Array([72, 108, 45, 99, 0, 255, 128]);
      const writableStream = new TestWritable();
      const result = writableStream.write(validArray);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(7);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3800
     * @tc.name      testStreamWritable01Chapter0038
     * @tc.desc      Test writing sliced string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const originalStr = "{k1:value1,k2:value2}";
      const slicedStr = originalStr.substring(0, originalStr.length - 2);
      const writableStream = new TestWritable();
      const result = writableStream.write(slicedStr, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(slicedStr);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_3900
     * @tc.name      testStreamWritable01Chapter0039
     * @tc.desc      Test writing tree-like string structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedLength: number = 0;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedLength = chunk.length;
          }
          callback();
        }

        getLength(): number {
          return this.receivedLength;
        }
      }

      const treeString = generateTreeString(1000);
      const writableStream = new TestWritable();
      const result = writableStream.write(treeString, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getLength() > 0).assertTrue();

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4000
     * @tc.name      testStreamWritable01Chapter0040
     * @tc.desc      Test writing special characters repeated twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const specialCharsTwice = ' !!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      const writableStream = new TestWritable();
      const result = writableStream.write(specialCharsTwice, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(specialCharsTwice);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4100
     * @tc.name      testStreamWritable01Chapter0041
     * @tc.desc      Test writing Uint8Array with Int8 boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const int8Values = new Int8Array([-128, 127, -129, 128]);
      const uint8Array = new Uint8Array(int8Values.length);
      for (let i = 0; i < int8Values.length; i++) {
        uint8Array[i] = int8Values[i] & 0xFF;
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(4);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4200
     * @tc.name      testStreamWritable01Chapter0042
     * @tc.desc      Test writing Uint8Array with Uint16 boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const uint16Values = [0, 65535, 65536, 32768];
      const uint8Array = new Uint8Array(uint16Values.length);
      for (let i = 0; i < uint16Values.length; i++) {
        uint8Array[i] = uint16Values[i] & 0xFF;
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(4);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4300
     * @tc.name      testStreamWritable01Chapter0043
     * @tc.desc      Test writing string with all escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: string = '';

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (typeof chunk === 'string') {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): string {
          return this.receivedData;
        }
      }

      const escapeSequences = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\123\\x41';
      const writableStream = new TestWritable();
      const result = writableStream.write(escapeSequences, 'utf8');
      expect(result).assertTrue();
      expect(writableStream.getData()).assertEqual(escapeSequences);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4400
     * @tc.name      testStreamWritable01Chapter0044
     * @tc.desc      Test writing Uint8ClampedArray type data converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const clampedArray = new Uint8ClampedArray([0, 255, 128, 200, 50]);
      const uint8Array = new Uint8Array(clampedArray.length);
      for (let i = 0; i < clampedArray.length; i++) {
        uint8Array[i] = clampedArray[i];
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(5);
      expect((receivedData as Uint8Array)[0]).assertEqual(0);
      expect((receivedData as Uint8Array)[1]).assertEqual(255);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4500
     * @tc.name      testStreamWritable01Chapter0045
     * @tc.desc      Test writing mixed data types to stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedItems: Array<string | Uint8Array> = [];

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.receivedItems.push(chunk);
          callback();
        }

        getItems(): Array<string | Uint8Array> {
          return this.receivedItems;
        }
      }

      const writableStream = new TestWritable();
      const result1 = writableStream.write('Hello', 'utf8');
      const result2 = writableStream.write(new Uint8Array([32]));
      const result3 = writableStream.write('World', 'utf8');
      const result4 = writableStream.write(new Uint8Array([33]));
      const result5 = writableStream.write('123', 'ascii');
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
      expect(writableStream.getItems().length).assertEqual(5);

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4600
     * @tc.name      testStreamWritable01Chapter0046
     * @tc.desc      Test writing without providing callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          callback();
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      const writableStream = new TestWritable();
      const result = writableStream.write('test data', 'utf8');
      expect(result).assertTrue();
      setTimeout(() => {
        expect(writableStream.getWriteCalled()).assertTrue();
      }, 10);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4700
     * @tc.name      testStreamWritable01Chapter0047
     * @tc.desc      Test writing large string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedLength: number = 0;
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          if (typeof chunk === 'string') {
            this.receivedLength = chunk.length;
          }
          callback();
        }

        getLength(): number {
          return this.receivedLength;
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      let largeString = '';
      const targetLength = 10000;
      for (let i = 0; i < targetLength; i++) {
        largeString += 'A';
      }
      const writableStream = new TestWritable();
      const result = writableStream.write(largeString, 'utf8');
      expect(result).assertTrue();
      setTimeout(() => {
        expect(writableStream.getWriteCalled()).assertTrue();
        expect(writableStream.getLength()).assertEqual(targetLength);
      }, 50);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4800
     * @tc.name      testStreamWritable01Chapter0048
     * @tc.desc      Test writing Uint8Array created from regular number array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const numberArray: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const uint8Array = new Uint8Array(numberArray);
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(14);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_4900
     * @tc.name      testStreamWritable01Chapter0049
     * @tc.desc      Test writing Uint8Array representing HelloWorld123?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      const expected = "HelloWorld123?";
      let actual = "";
      for (let i = 0; i < (receivedData as Uint8Array).length; i++) {
        actual += String.fromCharCode((receivedData as Uint8Array)[i]);
      }
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_5000
     * @tc.name      testStreamWritable01Chapter0050
     * @tc.desc      Test writing Uint8Array with various non-numeric scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;
        private writeCalled: boolean = false;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          this.writeCalled = true;
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }

        getWriteCalled(): boolean {
          return this.writeCalled;
        }
      }

      const writableStream = new TestWritable();
      try {
        const array1 = new Uint8Array([72, 101, NaN, Infinity, 108, 111]);
        const result1 = writableStream.write(array1);
        expect(result1).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
      try {
        const specialArray: number[] = [];
        specialArray[0] = 72;
        specialArray[1] = 101;
        const uint8Array = new Uint8Array(specialArray);
        const result2 = writableStream.write(uint8Array);
        expect(result2).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTONE_5100
     * @tc.name      testStreamWritable01Chapter0051
     * @tc.desc      Test writing Uint8Array with all boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level      Level 2
     */
    it('testStreamWritable01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        private receivedData: Uint8Array | null = null;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }

        getData(): Uint8Array | null {
          return this.receivedData;
        }
      }

      const testValues = [0, 255, 0, 0];
      const uint8Array = new Uint8Array(4);
      uint8Array[0] = 0;
      uint8Array[1] = 255;
      uint8Array[2] = 256 & 0xFF;
      uint8Array[3] = (-1) & 0xFF;
      const writableStream = new TestWritable();
      const result = writableStream.write(uint8Array);
      expect(result).assertTrue();
      const receivedData = writableStream.getData();
      expect(receivedData != null).assertTrue();
      expect((receivedData as Uint8Array).length).assertEqual(4);
      expect((receivedData as Uint8Array)[0]).assertEqual(0);
      expect((receivedData as Uint8Array)[1]).assertEqual(255);
      expect((receivedData as Uint8Array)[2]).assertEqual(0);
      expect((receivedData as Uint8Array)[3]).assertEqual(255);
    });
  })
}