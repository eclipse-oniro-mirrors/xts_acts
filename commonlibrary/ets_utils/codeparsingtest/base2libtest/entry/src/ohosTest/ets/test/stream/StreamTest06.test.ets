import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';
import { Callback } from '@kit.BasicServicesKit';
import util from '@ohos.util';

type Buffer = Uint8Array;
class TestReadable extends stream.Readable {
  constructor() {
    super();
  }
  _read() {
    this.push('data');
  }
}
class MyReadable extends stream.Readable {
  private counter = 0;
  _read(_size: number) {
    if (this.counter < 3) {
      this.push(new Uint8Array([this.counter++]));
    } else {
      this.push(null);
    }
  }
}
class WriteTrackerWritable extends stream.Writable {
  writeCalled: boolean = false;

  _write(
    callback: (error?: Error | null) => void
  ): void {
    this.writeCalled = true;
    callback();
  }
}
class DataCollectorWritable extends stream.Writable {
  transformedData: string = '';

  _write(
    chunk: Buffer | string,
    callback: (error?: Error | null) => void
  ): void {
    this.transformedData += chunk.toString();
    callback();
  }
}

class TestWritable extends stream.Writable {
  writeCalled: boolean = false;
  writableFinal: boolean = false;

  _write(
    callback: (error?: Error | null) => void
  ): void {
    this.writeCalled = true;
    callback();
  }

  constructor() {
    super();
    this.on('finish', () => {
      this.writableFinal = true;
    });
  }
}
let readableStream: MyReadable;
class DataCollectorWritable2 extends stream.Writable {
  transformedData: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.transformedData += chunk.toString();
    callback();
  }
}
class UpperCaseTransform extends stream.Transform {
  _transform(
    chunk: string,
    callback: (error?: Error | null, data?: string) => void
  ) {
    this.push(chunk.toString().toUpperCase());
    callback();
  }
}
class CustomReadable extends stream.Readable {
  read(): string | null {
    return null;
  }
}
class CustomWritable extends stream.Writable {
  _write(callback: Function) {
    callback();
  }
}
class WritableSubclass extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class CustomWritable1 extends stream.Writable {
  _write(chunk: string | Uint8Array, encoding: string, callback: Function) {

    callback();
  }
}
class CustomReadable1 extends stream.Readable {
  _read() {
  }
}
class HighWaterMarkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
  }
}
class TestReadable1 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(_size: number) {
    this.push('test data');
    this.push(null);
  }
}
class Unwritable extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class NormalWritable extends stream.Writable {
  doWrite(chunk: Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class InvalidWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback(null);
  }
}
class HighWaterMarkWritable1 extends stream.Writable {
  writableHighWaterMark = 2;
  doWrite(chunk: Uint8Array, encoding: string, callback: Function) {
  }
}
class AutoDestroyWritable extends stream.Writable {
  destroyed = false;
  doWrite(chunk: Uint8Array, encoding: string, callback: Function) {
    callback();
  }
  doDestroy() {
    this.destroyed = true;
  }
}
class ResourceReadable extends stream.Readable {
  _read() {}
}
class MultiReadable extends stream.Readable {
  _read() {
    this.push('readabletry.test');
    this.push(null);
  }
}
export default function StreamTest_06() {
  describe('StreamTest_06', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_1100
     * @tc.name      ReadableSetEncodingTest0011
     * @tc.desc      Mixed scenario: setEncoding() success (empty buffer) -> push chunk -> setEncoding() fail (buffer has data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0011';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding1 = 'utf-8';
          const encoding2 = 'ascii';
          const result1 = readable.setEncoding(encoding1);
          expect(result1).assertEqual(true);
          const testString = 'Mixed Scenario Test String';
          readable.push(testString);
          const result2 = readable.setEncoding(encoding2);
          expect(result2 === false).assertEqual(true);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_1200
     * @tc.name      ReadableSetEncodingTest0012
     * @tc.desc      Mixed scenario: push chunk -> setEncoding() fail -> read all data -> setEncoding() success.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0012';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(8).fill('F'.charCodeAt(0));
          const encoding = 'utf-8';
          readable.push(testUint8Array);
          const result1 = readable.setEncoding(encoding);
          expect(result1 === false).assertEqual(false);
          const readData1 = readable.read();
          if (typeof readData1 !== 'string') {
            throw new Error('readData1 should be a string type');
          }
          expect(readData1).assertEqual(true);
          const result2 = readable.setEncoding(encoding);
          expect(result2).assertEqual(true);
          const testString = 'After Clear Buffer Test';
          readable.push(testString);
          const readData2 = readable.read();
          if (typeof readData2 !== 'string') {
            throw new Error('readData2 should be a string type');
          }
          expect(readData2 === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData1 should be a string type') ||
            errMsg.includes('readData2 should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_1300
     * @tc.name      ReadableSetEncodingTest0013
     * @tc.desc      Mixed scenario: setEncoding() success -> push empty + non-empty chunks -> read -> setEncoding() success again.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0013';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding1 = 'ascii';
          const encoding2 = 'utf-8';
          const emptyString = '';
          const nonEmptyUint8Array = new Uint8Array(6).fill('G'.charCodeAt(0));
          const result1 = readable.setEncoding(encoding1);
          expect(result1).assertEqual(true);
          readable.push(emptyString);
          readable.push(nonEmptyUint8Array);
          const read1 = readable.read();
          const read2 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string') {
            throw new Error('read1/read2 should be string type');
          }
          expect(read1 === emptyString).assertEqual(true);
          expect(read2).assertEqual(true);

          const result2 = readable.setEncoding(encoding2);
          expect(result2).assertEqual(true);

          const testString = 'Mixed Empty Non-Empty Test';
          readable.push(testString);
          const read3 = readable.read();

          if (typeof read3 !== 'string') {
            throw new Error('read3 should be a string type');
          }
          expect(read3 === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2 should be string type') ||
            errMsg.includes('read3 should be a string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0100
     * @tc.name      ReadableIsPausedTest0001
     * @tc.desc      Verify isPaused returns false for default Readable instance (no pause called) with string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0001';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Default Non-Paused Stream Test';

          readable.push(testString);
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0200
     * @tc.name      ReadableIsPausedTest0002
     * @tc.desc      Verify isPaused returns true after calling pause() with string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0002';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Paused Stream With String Chunk Test';

          readable.push(testString);
          readable.pause();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === true).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0300
     * @tc.name      ReadableIsPausedTest0003
     * @tc.desc      Verify isPaused returns false after calling resume() after pause() with string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0003';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Resumed Stream With String Chunk Test';

          readable.push(testString);
          readable.pause();
          readable.resume();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === testString).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0400
     * @tc.name      ReadableIsPausedTest0004
     * @tc.desc      Verify isPaused returns false for default Readable instance with Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0004';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('A'.charCodeAt(0));

          readable.push(testUint8Array);
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData !== null).assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);

          for (let i = 0; i < convertedUint8.length; i++) {
            expect(convertedUint8[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0500
     * @tc.name      ReadableIsPausedTest0005
     * @tc.desc      Verify isPaused returns true after calling pause() with Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('B'.charCodeAt(0));

          readable.push(testUint8Array);
          readable.pause();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === true).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData !== null).assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);

          for (let i: number = 0; i < convertedUint8.length; i++) {
            expect(convertedUint8[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0600
     * @tc.name      ReadableIsPausedTest0006
     * @tc.desc      Verify isPaused returns false after calling resume() after pause() with Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('C'.charCodeAt(0));

          readable.push(testUint8Array);
          readable.pause();
          readable.resume();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData !== null).assertEqual(false);

          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);

          for (let i: number = 0; i < convertedUint8.length; i++) {
            expect(convertedUint8[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0700
     * @tc.name      ReadableIsPausedTest0007
     * @tc.desc      Verify isPaused status with empty string chunk after pause and resume.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0007';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyString = '';

          readable.push(emptyString);
          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === emptyString).assertEqual(true);
          expect(readData.length === 0).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0800
     * @tc.name      ReadableIsPausedTest0008
     * @tc.desc      Verify isPaused status with empty Uint8Array chunk after pause and resume.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyUint8Array = new Uint8Array(0);

          readable.push(emptyUint8Array);
          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === '').assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_0900
     * @tc.name      ReadableIsPausedTest0009
     * @tc.desc      Verify isPaused status with empty Uint8Array chunk after pause and resume.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0009';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          const invalidChunk = String(12345) as string;

          readable.push(invalidChunk);
          readable.pause();
          readable.pause();
          readable.pause();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === true).assertEqual(true);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_1000
     * @tc.name      ReadableIsPausedTest0010
     * @tc.desc      Verify isPaused status when calling resume multiple times without pause with string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0010';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Multiple Resume Without Pause Test';

          readable.push(testString);
          readable.resume();
          readable.resume();
          readable.resume();
          const isPausedStatus = readable.isPaused();
          expect(isPausedStatus === false).assertEqual(true);

          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData === testString).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_1100
     * @tc.name      ReadableIsPausedTest0011
     * @tc.desc      Verify isPaused status when calling pause and resume alternately with Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0011';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('D'.charCodeAt(0));

          readable.push(testUint8Array);
          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }

          expect(readData !== null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_1200
     * @tc.name      ReadableIsPausedTest0012
     * @tc.desc      Mixed scenario: isPaused status + partial read + mixed string-Uint8Array chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0012';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Mixed Chunk Partial Read Test';
          const testUint8Array = new Uint8Array(12).fill('E'.charCodeAt(0));

          readable.push(testString);
          readable.push(testUint8Array);
          expect(readable.isPaused() === false).assertEqual(true);

          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          const partialString = readable.read(8);
          if (typeof partialString !== 'string') {
            throw new Error('partialString is not a string');
          }
          expect(partialString === testString.substring(0, 8)).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          const remainingString = readable.read();
          if (typeof remainingString !== 'string') {
            throw new Error('remainingString is not a string');
          }
          expect(remainingString === testString.substring(8)).assertEqual(true);

          const uint8Data = readable.read();
          if (typeof uint8Data !== 'string') {
            throw new Error('uint8Data is not a string');
          }
          expect(uint8Data !== null).assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(uint8Data);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialString is not a string') ||
            errMsg.includes('remainingString is not a string') ||
            errMsg.includes('uint8Data is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_1300
     * @tc.name      ReadableIsPausedTest0013
     * @tc.desc      Mixed scenario: multiple Readable instances + empty-mixed chunks + pause-resume cycle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0013';
        console.log(TAG + ' start');
        try {
          const instance1 = new stream.Readable();
          const instance2 = new stream.Readable();

          instance1.push('Instance 1 Test String');
          instance1.push(new Uint8Array(0));
          instance2.push(new Uint8Array(10).fill('F'.charCodeAt(0)));
          instance2.push('');

          expect(instance1.isPaused() === false).assertEqual(true);
          instance1.pause();
          expect(instance1.isPaused() === true).assertEqual(true);
          instance1.resume();
          expect(instance1.isPaused() === false).assertEqual(true);

          expect(instance2.isPaused() === false).assertEqual(true);
          instance2.pause();
          expect(instance2.isPaused() === true).assertEqual(true);
          instance2.resume();
          expect(instance2.isPaused() === false).assertEqual(true);

          const inst1Data1 = instance1.read();
          if (typeof inst1Data1 !== 'string') {
            throw new Error('inst1Data1 is not a string');
          }
          const inst1Data2 = instance1.read();
          if (typeof inst1Data2 !== 'string') {
            throw new Error('inst1Data2 is not a string');
          }
          expect(inst1Data1 === 'Instance 1 Test String').assertEqual(true);
          expect(inst1Data2 === '').assertEqual(true);

          const inst2Data1 = instance2.read();
          if (typeof inst2Data1 !== 'string') {
            throw new Error('inst1Data1 is not a string');
          }
          const inst2Data2 = instance2.read();
          if (typeof inst2Data2 !== 'string') {
            throw new Error('inst2Data2 is not a string');
          }
          expect(inst2Data1 !== null).assertEqual(true);
          expect(inst2Data2 === '').assertEqual(true);

          const encoder = new util.TextEncoder();
          const converted = encoder.encode(inst2Data1);
          expect(converted.length === 10).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('inst1Data1 is not a string') ||
            errMsg.includes('inst1Data2 is not a string') ||
            errMsg.includes('inst2Data1 is not a string') ||
            errMsg.includes('inst2Data2 is not a string')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_ISPAUSED_1400
     * @tc.name      ReadableIsPausedTest0014
     * @tc.desc      Mixed scenario: isPaused status + stream end + mixed chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableIsPausedTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableIsPausedTest0014';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Stream End With Mixed Chunks Test';
          const testUint8Array = new Uint8Array(8).fill('G'.charCodeAt(0));

          readable.push(testString);
          readable.push(testUint8Array);
          readable.push(null);

          expect(readable.isPaused() === false).assertEqual(true);

          readable.pause();
          expect(readable.isPaused() === true).assertEqual(true);

          const stringData = readable.read();
          if (typeof stringData !== 'string') {
            throw new Error('stringData is not a string');
          }

          const uint8Data = readable.read();
          if (typeof uint8Data !== 'string') {
            throw new Error('uint8Data is not a string');
          }

          const emptyData = readable.read();

          expect(stringData === testString).assertEqual(true);
          expect(uint8Data !== null).assertEqual(true);
          expect(emptyData === null).assertEqual(true);

          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(uint8Data);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('stringData is not a string') ||
            errMsg.includes('uint8Data is not a string')
          ).assertEqual(true);
        }

      });


    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0100
     * @tc.name      PipeTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0001';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const writable = new WriteTrackerWritable();
        readable.pipe(writable, { end: false });
        readable.on('end', () => {
          writable.write('Additional data');
        });
        readable.on('end', () => {
          expect(writable.writeCalled).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0200
     * @tc.name      PipeTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0002';
        console.log(TAG + ' start');
        const readable = new stream.Readable();

        const transformStream = new UpperCaseTransform();
        const finalWritable = new DataCollectorWritable2();

        readable.pipe(transformStream);
        transformStream.pipe(finalWritable);
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(readable.readable).assertEqual(true);
        expect(readable.read() === null).assertEqual(true);
        finalWritable.on('finish', () => {
          expect(readable.readableEnded).assertEqual(true);
          expect(finalWritable.transformedData).assertEqual("TEST");
        });
        readable.push('test');
        readable.push(null);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0300
     * @tc.name      PipeTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0003';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const largeData = new Uint8Array(1024 * 20).fill('X'.charCodeAt(0));
        const highWaterMarkWritable = new TestWritable();
        readable.pipe(highWaterMarkWritable);
        readable.push(largeData);
        readable.push(null);
        expect(highWaterMarkWritable.writableLength > 0).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0400
     * @tc.name      PipeTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0004';
        console.log(TAG + ' start');

        const chineseReadable = new CustomReadable();
        const encodingWritable = new TestWritable();
        chineseReadable.pipe(encodingWritable, { end: true, encoding: 'gbk' });
        chineseReadable.push('GBK');
        chineseReadable.push(null);

        encodingWritable.on('finish', () => {
          const receivedEncoding = 'gbk';
          expect(receivedEncoding).assertEqual('gbk');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0500
     * @tc.name      PipeTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0005';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const writable = new stream.Writable();
        readable.pipe(writable, 'invalid_options');
        let pipeError = false;
        readable.on('error', () => pipeError = true);
        expect(pipeError).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0600
     * @tc.name      PipeTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0006';
        console.log(TAG + ' start');
        const encodings = ['ascii', 'base64', 'hex'];
        encodings.forEach(encoding => {
          try {
            const options: stream.ReadableOptions = { encoding };
            const readable = new stream.Readable(options);
            expect(readable).assertFail();
            expect(options.encoding).assertEqual(encoding);
            expect().assertFail()
          } catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(encoding.constructor.name === 'String').assertEqual(true);
          }
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0700
     * @tc.name      PipeTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0007';
        console.log(TAG + ' start');

        const readable = new stream.Readable();
        const writable = new CustomWritable();
        readable.pipe(writable, {
          encoding: 'gb2313'
        });
        const writableConstructor = writable.constructor;
        expect(writableConstructor === CustomWritable).assertEqual(true);
        const readableConstructor = readable.constructor;
        expect(readableConstructor === stream.Readable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0800
     * @tc.name      PipeTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0008';
        const readable = new stream.Readable();
        const writable = new stream.Writable();
        interface PipeOptions2 {
          end: number;
          encoding: string;
        }
        const pipeOptions2: PipeOptions2 = {
          end: 1,
          encoding: ''
        };
        readable.pipe(writable, pipeOptions2);
        let configError = false;
        readable.on('error', () => configError = true);
        expect(configError).assertFalse();
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(writable instanceof stream.Writable).assertEqual(true);
        expect(typeof pipeOptions2.end === 'number').assertEqual(true);
        expect(typeof pipeOptions2.encoding === 'string').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_0900
     * @tc.name      PipeTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0009';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const validWritable = new stream.Writable();
        readable.pipe(validWritable);
        validWritable.on('finish', () => {
          expect(readable.readableEnded).assertEqual(true);
        });
        readable.push(null);
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(readable.readable).assertEqual(true);
        expect(readable.read() === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_1000
     * @tc.name      PipeTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0010';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const writableSubclass = new WritableSubclass();
        readable.pipe(writableSubclass, {
          end: true,
          encoding: 'gbk'
        });
        expect(writableSubclass instanceof stream.Writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_1100
     * @tc.name      PipeTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0011';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const transformStream = new stream.Transform();
        const finalWritable = new stream.Writable();
        readable.pipe(transformStream, { end: false });
        transformStream.pipe(finalWritable, { encoding: 'gb18030' });
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(transformStream instanceof stream.Transform).assertEqual(true);
        expect(finalWritable instanceof stream.Writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_PIPE_1200
     * @tc.name      PipeTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PipeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'PipeTest0013';
        console.log(TAG + ' start');
        const writable = new CustomWritable1();
        const readable = new CustomReadable1();
        interface PipeOptions {
          encoding: string;
        }
        const pipeOptions: PipeOptions = {
          encoding: 'utf8'
        };
        let receivedData = 'test';

        readable.pipe(writable, pipeOptions);
        readable.push('test data');
        readable.push(null);
        writable.on('pipe', () => {
          receivedData = 'test';
        });
        writable.on('finish', () => {
          expect(receivedData).assertEqual('test');
        });
        expect(writable instanceof stream.Writable).assertEqual(true);
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(typeof pipeOptions.encoding === 'string').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0100
     * @tc.name      UnpipeTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0001';
        console.log(TAG + ' start');
        const readable2 = new TestReadable();
        const writable2 = new TestWritable();
        readable2.pipe(writable2, { end: false });
        readable2.on('end', () => {
          expect(writable2.writable).assertEqual(false);
          writable2.end();
          expect(writable2.writableFinished).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0200
     * @tc.name      UnpipeTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0002';
        console.log(TAG + ' start');
        const readable3 = new TestReadable();
        const writable3 = new HighWaterMarkWritable();
        const pipeResult = readable3.pipe(writable3);
        expect(pipeResult instanceof stream.Writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0300
     * @tc.name      UnpipeTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0003';
        console.log(TAG + ' start');

        {
          const readable = new TestReadable1();
          try {
            readable.pipe(null);
            expect(readable).assertEqual('null');
            expect().assertFail()
          } catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(err.message.includes('destination')).assertEqual(false);
          }
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0400
     * @tc.name      UnpipeTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0004';
        console.log(TAG + ' start');
        const writable = new stream.Writable();
        const readable = new TestReadable();
        readable.pipe(writable, { end: false });
        expect(readable.readable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0500
     * @tc.name      UnpipeTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0005';
        console.log(TAG + ' start');
        {

          const dest = new Unwritable();
          const readable = new TestReadable();
          const result = readable.pipe(dest);
          expect(result instanceof stream.Readable).assertEqual(false);
          expect(dest.writableEnded).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0600
     * @tc.name      UnpipeTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0006';
        console.log(TAG + ' start');
        {
          const writable = new stream.Writable();
          const readable = new TestReadable();
          readable.pipe(writable, { end: false });
          readable.on('end', () => {
            expect(writable.writableEnded).assertEqual(false);
          });
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0700
     * @tc.name      UnpipeTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0007';
        console.log(TAG + ' start');


        const dest = new NormalWritable();
        const readable = new TestReadable();
        readable.pipe(dest, { end: false });
        expect(dest.writable).assertEqual(true);
        expect(readable.readable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0800
     * @tc.name      UnpipeTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0008';
        console.log(TAG + ' start');


        let writeError: Error | null = null;
        const invalidWritable = new InvalidWritable();
        const readable = new stream.Readable();
        readable.pipe(invalidWritable);
        readable.push('test');
        expect(writeError).assertEqual(null);
        expect(readable.readable).assertEqual(true);
        expect(invalidWritable.writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_0900
     * @tc.name      UnpipeTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0009';
        console.log(TAG + ' start');
        {

          const dest = new HighWaterMarkWritable1();
          expect(dest.writableLength).assertEqual(0);
          expect(dest.writable).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_UNPIPE_1000
     * @tc.name      UnpipeTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('UnpipeTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'UnpipeTest0010';
        console.log(TAG + ' start');
        {

          const dest = new AutoDestroyWritable();
          const readable = new TestReadable();
          readable.pipe(dest, { autoDestroy: true });
          readable.on('end', () => {
            expect(dest.destroyed).assertEqual(false);
          });
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0100
     * @tc.name      Readableontest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0001';
        console.log(TAG + ' start');
        readableStream = new MyReadable();
        let receivedDataCount = 0;
        readableStream.on('data', (eventData: emitter.EventData) => {
          receivedDataCount++;
        });
        expect(receivedDataCount === 3).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0200
     * @tc.name      Readableontest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0002';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let isStreamEnded = false;
        readableStream.on('end', () => {
          isStreamEnded = true;
        });
        expect(isStreamEnded).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0300
     * @tc.name      Readableontest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0003';
        console.log(TAG + ' start');
        let errorMessage = '';

        class ErrorMyReadable extends MyReadable {
          _read(_size: number) {}
        }
        const readableStream = new ErrorMyReadable();
        readableStream.read(1);
        expect(errorMessage).assertEqual('');
        expect(readableStream.readable).assertEqual(true);
        expect(readableStream instanceof MyReadable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0400
     * @tc.name      Readableontest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0004';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let isStreamClosed = false;
        readableStream.on('close', () => {
          isStreamClosed = true;
        });
        readableStream.push(null);
        expect(isStreamClosed).assertFalse();

      });


    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0500
     * @tc.name      Readableontest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0005';
        console.log(TAG + ' start');



        const resourceStream = new ResourceReadable();
        const onClose: Callback<emitter.EventData> = () => {
          expect(resourceStream.readable).assertEqual(false);
        };
        resourceStream.on('close', onClose);
        resourceStream.push(null);
        expect(resourceStream.readableEnded).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0600
     * @tc.name      Readableontest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0006';
        console.log(TAG + ' start');



        const multiStream = new MultiReadable();
        let receivedData = '';
        let isEnded = false;

        interface EventHandlers {
          data: Callback<emitter.EventData>;
          error: Callback<emitter.EventData>;
          end: Callback<void>;
        }

        const handlers: EventHandlers = {
          data: (eventData: emitter.EventData) => {
            if (typeof eventData.data === 'string') {
              receivedData = eventData.data;
            }
          },
          error: (event: emitter.EventData) => console.error(`anyfalse：${event.data}`),
          end: () => {
            isEnded = true;
            verifyTestResult();
          }
        };
        (Object.entries(handlers) as [string, Callback<emitter.EventData>][])
          .forEach((entry) => multiStream.on(entry[0], entry[1]));
        multiStream.read();
        const verifyTestResult = () => {
          expect(receivedData === 'readabletry.test').assertTrue();
          expect(isEnded === true).assertTrue();
        };

      });


    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0700
     * @tc.name      Readableontest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0007';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        readableStream.on('close', () => {
          expect(readableStream.readable).assertEqual(false);
        });
        readableStream.push(null);
        expect(readableStream.readableEnded).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0800
     * @tc.name      Readableontest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0008';
        console.log(TAG + ' start');
        let errorMessage = '';
          if (!readableStream) {
            readableStream = new MyReadable();
          }
          const invalidCallback = () => {
          };
          readableStream.on('data', invalidCallback as Callback<emitter.EventData>);
          readableStream.push(new Uint8Array([1]));
          expect(errorMessage !== '').assertFalse();

      });
  });
}
