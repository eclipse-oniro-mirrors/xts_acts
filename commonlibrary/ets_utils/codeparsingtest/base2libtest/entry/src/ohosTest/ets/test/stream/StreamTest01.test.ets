import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { stream } from '@kit.ArkTS';
type InvalidWriteSignature = (chunk: string | Uint8Array, encoding: string, callback: () => void) => void;
interface GeneratedTypeLiteralInterface_1 {
  chunk: string | Uint8Array;
  encoding: string;
}
interface GeneratedTypeLiteralInterface_2 {
  code: number;
  name?: string;
  message?: string;
}
interface GeneratedTypeLiteralInterface_4 {
  message: string;
}
interface GeneratedTypeLiteralInterface_6 {
  code: number;
  message: string;
}
interface GeneratedTypeLiteralInterface_8 {
  code: number;
}
interface GeneratedTypeLiteralInterface_7 {
  data: GeneratedTypeLiteralInterface_8;
}
interface GeneratedTypeLiteralInterface_9 {
  code: number;
  message: string;
}
interface ErrorData {
  data: GeneratedTypeLiteralInterface_9;
}

class BaseWritable extends stream.Writable {
  doWrite() {}
}

class EndWritable extends stream.Writable {
  doWrite(chunk: string, encoding: string, callback: () => void) {
    callback();
  }
}
class SimpleWritable extends stream.Writable {
  doWrite(chunk: string, encoding: string, callback: () => void) {
    callback();
  }
}
class MissingDoWrite extends stream.Writable {}
class EndOnceWritable extends stream.Writable {
  doWrite(chunk: string, encoding: string, callback: () => void) {
    callback();
  }
}
class GBKWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    expect(typeof chunk).assertEqual('string');
    expect(encoding).assertEqual('gbk');
    callback();
  }
}
class InvalidChunkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (typeof chunk === 'string' && !isNaN(Number(chunk))) {
      throw new Error('Invalid chunk type: number string is not allowed');
    }
    callback();
  }
}
class NullChunkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
}
class MixedParamsWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (encoding === 'invalid-encoding') {
      throw new Error('Unknown encoding: invalid-encoding');
    }
    callback();
  }
}
class InvalidEncodingWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (encoding === '123') {
      throw new Error('Unknown encoding: 123');
    }
    callback();
  }
}
class UnsupportedEncodingWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (encoding === 'ascii') {
      throw new Error('Unsupported encoding: ascii');
    }
    callback();
  }
}
class BasicWritable extends stream.Writable {
  _write(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.doWrite(chunk, encoding, callback);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.writeCount = (this.writeCount || 0) + 1;
    callback();
    if (this.writeCount === 3) {
      this.allWritesDone = true;
    }
  }
  writeCount?: number;
  allWritesDone?: boolean;
}
class EncodingMixWritable extends stream.Writable {
  public encodingCheck: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (typeof chunk === 'string') {
      this.encodingCheck = encoding;
    }
    callback();
  }
}
class CustomWritable extends stream.Writable {
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    callback(null);
  }
}
class BinaryWritable extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(
    chunk: Uint8Array | string,
    encoding: string,
    callback: (error?: Error | null) => void
  ) {
    callback(null);
  }
}
class EncodingWritable extends stream.Writable {
  public actualEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    this.actualEncoding = encoding;
    callback(null);
  }
}

class ErrorWritable extends stream.Writable {
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ) {
    callback(null);
  }
}
class EncodingCheckWritable extends stream.Writable {
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ) {
    if (encoding === 'invalid_encoding') {
      callback(new Error('invalid_encoding'));
    } else {
      callback(null);
    }
  }
}
class CallbackWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback(null);
  }
}
class BinaryEndWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback(null);
  }
}
class CorkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array | null, encoding: string, callback: (error?: Error | null) => void) {
    callback(null);
  }
}
class EncodingErrorWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    if (encoding === '123') {
      callback(new Error('Invalid encoding'));
    } else {
      callback(null);
    }
  }
}
class TestWritable1 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class TestWritable4 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class TestWritable5 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class TestWritable2 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class TestWritable3 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
type BufferEncoding = 'utf8' | 'ascii' | 'base64' | 'hex' | 'binary';

class BasicCorkStream extends stream.Writable {
  public writtenChunks: (string | Uint8Array)[] = [];
  public writeCount = 0;
  private corked = false;
  private buffer: (string | Uint8Array)[] = [];
  constructor() {
    super();
  }
  cork(): boolean {
    this.corked = true;
    return true;
  }
  uncork(): boolean {
    this.corked = false;
    this.buffer.forEach(chunk => {
      this._write(chunk, 'utf8', () => {
      });
    });
    this.buffer = [];
    return true;
  }
  write(chunk: string | Uint8Array, encoding: BufferEncoding = 'utf8'): boolean {
    if (this.corked) {
      this.buffer.push(chunk);
      return false;
    }
    return super.write(chunk, encoding);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: BufferEncoding,
    callback: (error?: Error | null) => void
  ): void {
    this.writtenChunks.push(chunk);
    this.writeCount++;
    callback();
  }
}
interface ChunkItem {
  chunk: string | Uint8Array;
  encoding: string;
}
class MultiCorkStream extends stream.Writable {
  public writtenChunks: (string | Uint8Array)[] = [];
  public writeCount = 0;
  private _writableCorked = 0;
  private _writableBuffer: ChunkItem[] = [];
  constructor() {
    super();
  }
  cork(): boolean {
    this._writableCorked++;
    return true;
  }
  uncork(): boolean {
    if (this._writableCorked > 0) {
      this._writableCorked--;
      if (this._writableCorked === 0) {
        this._flushBuffer();
      }
    }
    return true;
  }
  private _flushBuffer() {
    this._writableBuffer.forEach((chunkItem) => {
      this.doWrite(chunkItem.chunk, chunkItem.encoding, () => {
      });
    });
    this._writableBuffer = [];
  }
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    this.writtenChunks.push(chunk);
    this.writeCount++;
    callback();
  }
  write(chunk: string | Uint8Array, encoding: string = 'utf8'): boolean {
    if (this._writableCorked > 0) {
      this._writableBuffer.push({ chunk, encoding });
      return false;
    }
    this.doWrite(chunk, encoding, () => {
    });
    return true;
  }
  get corkedCount(): number {
    return this._writableCorked;
  }
}
class EndWithCorkStream extends stream.Writable {
  writtenChunks: Array<GeneratedTypeLiteralInterface_1> = [];
  writeCount = 0;
  isFinished = false;
  constructor() {
    super();
    this.on('finish', () => this.isFinished = true);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    const chunkStr = typeof chunk === 'string' ? chunk : chunk.toString();
    this.writtenChunks.push({ chunk: chunkStr, encoding });
    this.writeCount++;
    callback();
  }
  _write = this.doWrite;
}
class OverUncorkStream extends stream.Writable {
  private corkedCount = 0;

  cork(): boolean {
    this.corkedCount++;
    return true;
  }

  uncork(): boolean {
    if (this.corkedCount > 0) {
      this.corkedCount--;
      return true;
    }
    return false;
  }

  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }

  _write = this.doWrite;
}
export default function StreamTest_01() {
  describe('StreamTest_01', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0100
     * @tc.name      Writableconstructortest0001
     * @tc.desc      Verify Writable basic instantiation properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0001';
        console.log(TAG + ' start');
        const writable = new BaseWritable();
        expect(writable.writable).assertEqual(true);
        expect(writable.writableHighWatermark).assertEqual(16384);
        expect(writable instanceof stream.Writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0200
     * @tc.name      Writableconstructortest0002
     * @tc.desc      Verify Writable write Uint8Array data with callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0002';
        console.log(TAG + ' start');
        let bufferLength = 5;
        const binaryWritable = new BinaryWritable();
        binaryWritable.write(new Uint8Array([72, 101, 108, 108, 111]), 'utf8', () => {
          expect(bufferLength).assertEqual(5);
          expect(binaryWritable instanceof BinaryWritable).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0300
     * @tc.name      Writableconstructortest0003
     * @tc.desc      Verify Writable end method callback trigger.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0003';
        console.log(TAG + ' start');
        let endedState = false;

        const endWritable = new EndWritable();
        endWritable.end('', 'utf8', () => {
          endedState = true;
        });
        expect(endedState).assertEqual(false);
        expect(endWritable instanceof EndWritable).assertEqual(true);
      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0400
     * @tc.name      Writableconstructortest0004
     * @tc.desc      Verify Writable close event trigger after end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0004';
        console.log(TAG + ' start');
        let closeTriggered = false;
        const writableStream = new stream.Writable();
        writableStream.on('close', () => closeTriggered = true);
        writableStream.end();
        expect(closeTriggered).assertEqual(true);
        expect(writableStream.writableEnded).assertEqual(true);
        expect(writableStream instanceof stream.Writable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0500
     * @tc.name      Writableconstructortest0005
     * @tc.desc      Verify Writable write return value is true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0005';
        console.log(TAG + ' start');
        const writableStream = new SimpleWritable();
        expect(writableStream.write('data')).assertEqual(true);
        expect(writableStream.constructor.name).assertEqual('SimpleWritable');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0600
     * @tc.name      Writableconstructortest0006
     * @tc.desc      Verify error when write to Writable missing doWrite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0006';
        console.log(TAG + ' start');
        let writeError = '';
        const missingWriter = new MissingDoWrite();
        try {
          missingWriter.write('data', 'utf8');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} caught error: ${err}`);
          writeError = (err as Error).message;
          expect(writeError).assertContain('The doWrite() method is not implemented');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0700
     * @tc.name      Writableconstructortest0007
     * @tc.desc      Verify Writable end method callback execution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0007';
        console.log(TAG + ' start');
        let ended = false;
        const writable = new stream.Writable();
        writable.end('', 'utf8', () => {
          ended = true;
        });
        expect(ended).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0800
     * @tc.name      Writableconstructortest0008
     * @tc.desc      Verify error event trigger for invalid encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0008';
        console.log(TAG + ' start');
        let errorCount = 0;
        const writable = new ErrorWritable();
        writable.on('error', () => errorCount++);
        writable.write(new Uint8Array(), 'invalid_encoding');
        expect(errorCount).assertEqual(0);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_0900
     * @tc.name      Writableconstructortest0009
     * @tc.desc      Verify Writable end method execute only once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0009';
        console.log(TAG + ' start');
        let endCount = 0;
        const writable = new EndOnceWritable();
        writable.on('finish', () => endCount++);
        writable.end(undefined);
        writable.end(undefined);
        expect(endCount).assertEqual(0);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLECONSTRUCTOR_1000
     * @tc.name      Writableconstructortest0010
     * @tc.desc      Verify Writable write with custom encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writableconstructortest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writableconstructortest0010';
        console.log(TAG + ' start');
        const writableInstance = new EncodingWritable();
        writableInstance.write('shuju', 'gbk');
        expect(writableInstance.actualEncoding).assertEqual('gbk');
        expect(writableInstance.constructor.name).assertEqual('EncodingWritable');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0100
     * @tc.name      Writablewritetest0001
     * @tc.desc      Verify Writable write string with default utf8 encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0001';
        console.log(TAG + ' start');
        let writeCompleted = false;
        const writable = new BasicWritable();
        const data = 'hello';
        writable.write(data, 'utf8', () => {});
        expect(writeCompleted).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0200
     * @tc.name      Writablewritetest0002
     * @tc.desc      Verify Writable write string with gbk encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0002';
        console.log(TAG + ' start');
        let gbkWriteCompleted = false;
        const writable = new GBKWritable();
        const data = 'niaho';
        writable.write(data, 'gbk', () => {});
        expect(gbkWriteCompleted).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0300
     * @tc.name      Writablewritetest0003
     * @tc.desc      Verify error when write invalid number type chunk to Writable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0003';
        console.log(TAG + ' start');
        type WriteSignature = (chunk: string | Uint8Array, encoding: string, callback: () => void) => boolean;
        const writable = new InvalidChunkWritable();
        let errorMessage = '';
        try {
          const invalidChunk = '12345';
          (writable.write as WriteSignature)(invalidChunk, 'utf8', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          errorMessage = (err as Error).message;
          expect(errorMessage).assertContain('Invalid chunk type');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0400
     * @tc.name      Writablewritetest0004
     * @tc.desc      Verify error when write null/undefined chunk to Writable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0004';
        console.log(TAG + ' start');
        type InvalidChunkSignature = (chunk: null | undefined, encoding: string, callback: () => void) => boolean;
        const writable = new NullChunkWritable();
        let nullError = '';
        let undefinedError = '';
        try {
          (writable.write as InvalidChunkSignature)(null, 'gbk', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} null fail, err: ${err}`);
          nullError = (err as Error).message;
          expect(nullError).assertContain('null');
        }
        try {
          (writable.write as (chunk: undefined, encoding: string, callback: () => void) => void)(undefined, 'utf8', (
          ) => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} undefined fail, err: ${err}`);
          undefinedError = (err as Error).message;
          expect(undefinedError).assertContain('undefined');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0500
     * @tc.name      Writablewritetest0005
     * @tc.desc      Verify error when pass invalid encoding parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0005';
        console.log(TAG + ' start');
        const writable = new MixedParamsWritable();
        let paramError = '';
        try {
          (writable.write as InvalidWriteSignature)('test', 'invalid-encoding', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          paramError = (err as Error).message;
          expect(paramError).assertContain('Unknown encoding: invalid-encoding');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0600
     * @tc.name      Writablewritetest0006
     * @tc.desc      Verify error when write Uint8Array with invalid number encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0006';
        console.log(TAG + ' start');
        const writable = new InvalidEncodingWritable();
        const buffer = new Uint8Array([0x48, 0x65]);
        let encodingError = '';
        try {
          writable.write(buffer, '123' as string, () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          encodingError = (err as Error).message;
          expect(encodingError).assertContain('Unknown encoding: 123');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0700
     * @tc.name      Writablewritetest0007
     * @tc.desc      Verify error when write with unsupported ascii encoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0007';
        console.log(TAG + ' start');
        const writable = new UnsupportedEncodingWritable();
        let unsupportedError = '';
        try {
          writable.write('test', 'ascii', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          unsupportedError = (err as Error).message;
          expect(unsupportedError).assertContain('Unsupported encoding: ascii');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEWRITE_0900
     * @tc.name      Writablewritetest0009
     * @tc.desc      Verify Writable write with case-insensitive encoding and Uint8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Writablewritetest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Writablewritetest0009';
        console.log(TAG + ' start');
        const writable = new EncodingMixWritable();
        writable.write(new Uint8Array([0x41]), 'gbk');
        writable.write('Test', 'UTF8');
        expect(writable.encodingCheck).assertEqual('UTF8');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0100
     * @tc.name      writableend0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0001';
        console.log(TAG + ' start');
        const writableStream = new CustomWritable();
        let endCallCount = 0;
        writableStream.end('finish', 'utf8', () => {
          endCallCount++;
          expect(endCallCount).assertEqual(1);
          expect(writableStream.writableFinished).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0200
     * @tc.name      writableend0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0002';
        console.log(TAG + ' start');
        const writable = new stream.Writable();
        writable.end();
        expect(writable.writableFinished).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0300
     * @tc.name      writableend0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0003';
        console.log(TAG + ' start');
        const writable = new BinaryWritable();
        let finishTriggered = false;
        writable.on('finish', () => {
          finishTriggered = true;
        });
        writable.write(new Uint8Array([0x48, 0x6F]));
        writable.end();
          expect(finishTriggered).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0400
     * @tc.name      writableend0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0004';
        console.log(TAG + ' start');
        const writable = new EncodingWritable();
        let encodingValidated = false;
        writable.end('Final String', 'base64', (error: Error | null) => {
          if (!error) {
            encodingValidated = true;
          }
        });
        expect(encodingValidated).assertEqual(false);
        expect(writable.writableFinished).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0500
     * @tc.name      writableend0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0005';
        console.log(TAG + ' start');
        const writable = new CorkWritable();
        writable.cork();
        expect(writable.writableCorked).assertEqual(1);
        writable.write('First chunk');
        writable.end('Last chunk');
        expect(writable.writableCorked).assertEqual(0);
        expect(writable.writableFinished).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0600
     * @tc.name      writableend0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0006';
        console.log(TAG + ' start');
        const writable = new ErrorWritable();
        let errorMessage = '';
        try {
          type InvalidEndSignature = (
            chunk: string | Uint8Array,
            encoding: string,
            callback: () => void
          ) => void;
          (writable.end as InvalidEndSignature)('123', 'utf-8', () => {});
          throw new Error('Chunk weibaocuo');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          errorMessage = (err as Error).message;
          expect(errorMessage).assertContain('Chunk');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0700
     * @tc.name      writableend0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0007';
        console.log(TAG + ' start');
        const writable = new EncodingCheckWritable();
        let errorMessage = '';
        writable.end('Test', 'invalid_encoding', (error?: Error | null) => {
          if (error) {
            errorMessage = error.message;
            expect(errorMessage).assertContain('invalid_encoding');
          }
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0800
     * @tc.name      writableend0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0008';
        console.log(TAG + ' start');
        const writable = new stream.Writable();
        let errorMessage = '';
        try {
          writable.end('first_end', undefined, () => {
            writable.end('second_end', undefined, () => {
              throw new Error('meicuo');
            });
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          errorMessage = (err as Error).message;
          expect(errorMessage).assertContain('no');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_0900
     * @tc.name      writableend0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0009';
        console.log(TAG + ' start');
        let errorMessage = '';
        try {
          const invalidCallback: string = 'invalid_callback';
          const writable = new CallbackWritable();
          writable.end('data', 'utf-8', (error: Error | null) => {
            if (error) {
              console.error(error.toString());
            }
          });
          if (typeof invalidCallback !== 'function') {
            throw new Error(' callback weishibiesanshu');
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          errorMessage = (err as Error).message;
          expect(errorMessage).assertContain(' callback');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_1000
     * @tc.name      writableend0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0010';
        console.log(TAG + ' start');
        const writable = new BinaryEndWritable();
        let streamFinished = false;
        writable.end(new Uint8Array([1, 2, 3]), undefined, (error: Error | null) => {
          if (error) {
            throw error;
          }
          if (!writable.writableFinished) {
            throw new Error('cuo');
          }
          streamFinished = true;
        });
        expect(streamFinished).assertEqual(false);
        expect(writable.writableFinished).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_1100
     * @tc.name      writableend0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0011';
        console.log(TAG + ' start');
        const writable = new CorkWritable();
        writable.cork();
        expect(writable.writableCorked).assertEqual(1);
        writable.write('buffered_data');
        expect(writable.writableCorked).assertEqual(1)

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLEEND_1200
     * @tc.name      writableend0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('writableend0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'writableend0012';
        console.log(TAG + ' start');
        const writable = new EncodingErrorWritable();
        let realErrorMsg = '';
        writable.end('data', '123' as string, (error: Error | null) => {
          try {
            if (error) {
              realErrorMsg = error.message;
            }
            expect().assertFail()
          } catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(realErrorMsg).assertContain('Invalid encoding');
          }
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0100
     * @tc.name      setDefaultEncodingTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0001';
        console.log(TAG + ' start');
        let writable1 = new TestWritable1();
        let result1 = writable1.setDefaultEncoding();
        expect(result1).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0200
     * @tc.name      setDefaultEncodingTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0002';
        console.log(TAG + ' start');
        let writable2 = new TestWritable2();
        let validEncodings = ['utf8', 'gb18030', 'gbk', 'gb2312'];
        validEncodings.forEach((encoding) => {
          let result = writable2.setDefaultEncoding(encoding);
          expect(result).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0300
     * @tc.name      setDefaultEncodingTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0003';
        console.log(TAG + ' start');
        let writable3 = new TestWritable3();
        let result3 = writable3.setDefaultEncoding('');
        expect(result3).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0400
     * @tc.name      setDefaultEncodingTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0004';
        console.log(TAG + ' start');
        let writable4 = new TestWritable4();
        let result4 = writable4.setDefaultEncoding('utf-8');
        expect(result4).assertEqual(true);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0500
     * @tc.name      setDefaultEncodingTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0005';
        console.log(TAG + ' start');
        let writable5 = new TestWritable5();
        writable5.setDefaultEncoding('gbk');
        let result5 = writable5.setDefaultEncoding('gb18030');
        expect(result5).assertEqual(true);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0700
     * @tc.name      setDefaultEncodingTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0007';
        console.log(TAG + ' start');
        let writable2 = new TestWritable2();
        let result2 = writable2.setDefaultEncoding();
        expect(result2).assertEqual(false);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_0900
     * @tc.name      setDefaultEncodingTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0009';
        console.log(TAG + ' start');
        let writable4 = new TestWritable4();
        let result4 = writable4.setDefaultEncoding(null);
        expect(result4).assertEqual(false);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_1000
     * @tc.name      setDefaultEncodingTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0010';
        console.log(TAG + ' start');
        let writable5 = new TestWritable5();
        let result5 = writable5.setDefaultEncoding();
        expect(result5).assertEqual(false);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_1200
     * @tc.name      setDefaultEncodingTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0012';
        console.log(TAG + ' start');
        let writable2 = new TestWritable2();
        let result2 = writable2.setDefaultEncoding('utf8');
        expect(result2).assertEqual(true);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_1300
     * @tc.name      setDefaultEncodingTest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0013';
        console.log(TAG + ' start');
        let writable3 = new TestWritable3();
        let result3 = writable3.setDefaultEncoding('gb18030');
        expect(result3).assertEqual(true);

      })
    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_1400
     * @tc.name      setDefaultEncodingTest0014
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest00t14';
        console.log(TAG + ' start');
        let writable4 = new TestWritable4();
        let result4 = writable4.setDefaultEncoding('gbk');
        expect(result4).assertEqual(true);

      })
    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_SETDEFAULTENCODING_1500
     * @tc.name      setDefaultEncodingTest0015
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('setDefaultEncodingTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'setDefaultEncodingTest0015';
        console.log(TAG + ' start');
        let writable5 = new TestWritable5();
        let result5 = writable5.setDefaultEncoding('gb2312');
        expect(result5).assertEqual(true);

      })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0100
     * @tc.name      corkTest0001
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0001';
        console.log(TAG + ' start');
        const writableStream = new BasicCorkStream();
        const corkRes = writableStream.cork();
        expect(corkRes).assertEqual(true);
        const writeRes1 = writableStream.write('Buffer Data 1');
        const writeRes2 = writableStream.write('Buffer Data 2');
        expect(writeRes1).assertEqual(false);
        expect(writeRes2).assertEqual(false);
        expect(writableStream.writeCount).assertEqual(0);
        const uncorkRes = writableStream.uncork();
        expect(uncorkRes).assertEqual(true);
        expect(writableStream.writeCount).assertEqual(2);
        expect(writableStream.writtenChunks).assertDeepEquals(['Buffer Data 1', 'Buffer Data 2']);
        writableStream.end();
        writableStream.on('finish', () => {});

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0200
     * @tc.name      corkTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0002';
        console.log(TAG + ' start');
        const writableStream = new MultiCorkStream();
        expect(writableStream.corkedCount).assertEqual(0);
        const cork1 = writableStream.cork();
        const cork2 = writableStream.cork();
        expect(cork1).assertEqual(true);
        expect(cork2).assertEqual(true);
        expect(writableStream.corkedCount).assertEqual(2);
        const writeResA = writableStream.write('DataA');
        const writeResB = writableStream.write('DataB');
        expect(writeResA).assertEqual(false);
        expect(writeResB).assertEqual(false);
        expect(writableStream.writeCount).assertEqual(0);
        expect(writableStream.writtenChunks.length).assertEqual(0);
        const uncork1 = writableStream.uncork();
        expect(uncork1).assertEqual(true);
        expect(writableStream.corkedCount).assertEqual(1);
        expect(writableStream.writeCount).assertEqual(0);
        const uncork2 = writableStream.uncork();
        expect(uncork2).assertEqual(true);
        expect(writableStream.corkedCount).assertEqual(0);
        expect(writableStream.writeCount).assertEqual(2);
        expect(writableStream.writtenChunks).assertDeepEquals(['DataA', 'DataB']);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0300
     * @tc.name      corkTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0003';
        console.log(TAG + ' start');
        const writableStream = new EndWithCorkStream();
        writableStream.cork();
        expect(writableStream.writeCount).assertEqual(0);
        writableStream.write('Delayed data1', 'gbk');
        writableStream.write('Delayed data2', 'utf8');
        expect(writableStream.writeCount).assertEqual(0);
        writableStream.uncork();
        writableStream.end('End Data', 'utf8', () => {
          expect(writableStream.writeCount).assertEqual(3);
          expect(writableStream.writtenChunks).assertDeepEquals([
            { chunk: 'Delayed data1', encoding: 'gbk' },
            { chunk: 'Delayed data2', encoding: 'utf8' },
            { chunk: 'End Data', encoding: 'utf8' }
          ]);
          expect(writableStream.isFinished).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0400
     * @tc.name      corkTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0004';
        console.log(TAG + ' start');
        const writableStream = new OverUncorkStream();
        const isFirstCorked = writableStream.cork();
        const uncorkFirst = writableStream.uncork();
        const uncorkSecond = writableStream.uncork();
        expect(isFirstCorked).assertEqual(true);
        expect(uncorkFirst).assertEqual(true);
        expect(uncorkSecond).assertEqual(false);
        writableStream.end();

      });
  })
}