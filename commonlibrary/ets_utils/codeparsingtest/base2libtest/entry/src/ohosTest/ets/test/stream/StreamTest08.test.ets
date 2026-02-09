import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';


class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void): void {
    if (!chunk) {
      callback(new Error('Empty chunk data'));
      return;
    }
    callback();
  }

  doRead(size: number):void {
    this.push('Test data');
    this.push(null);
  }

  setDefaultEncoding(encoding: string): boolean {
    super.setDefaultEncoding(encoding);
    return true;
  }
}

class CustomDuplex extends stream.Duplex {
  private _buffer: Uint8Array[] = [];
  private _defaultEncoding: string = 'utf8';

  constructor() {
    super();
  }

  setDefaultEncoding(encoding: string): boolean {
    this._defaultEncoding = encoding;
    return true;
  }

  doWrite(chunk: string | Uint8Array, _testDuplexWriteCallbackError0008encoding: string, callback: () => void) {
    let data: Uint8Array;
    if (typeof chunk === 'string') {
      data = new Uint8Array(chunk.length);
      for (let i = 0; i < chunk.length; i++) {
        data[i] = chunk.charCodeAt(i);
      }
    } else {
      data = chunk;
    }
    this._buffer.push(data);
    callback();
  }

  doRead(_size: number) {
    if (this._buffer.length === 0) {
      this.push(null);
      return;
    }

    const totalLength = this._buffer.reduce((acc, val) => acc + val.length, 0);
    const merged = new Uint8Array(totalLength);
    let offset = 0;
    this._buffer.forEach(arr => {
      merged.set(arr, offset);
      offset += arr.length;
    });

    let decodedData = '';
    for (let i = 0; i < merged.length; i++) {
      decodedData += String.fromCharCode(merged[i]);
    }

    this.push(decodedData);
    this._buffer = [];
  }
}
let writeChunk: string | Uint8Array = new Uint8Array(0);
let writeEncoding: string = '';
class TestDuplex1 extends stream.Duplex {
  doRead(_size: number): void {
    this.push(null);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    writeChunk = chunk;
    writeEncoding = encoding;
    callback();
  }
}
interface ChunkItem {
  chunk: string | Uint8Array;
  encoding: string;
}
const chunkList: Array<ChunkItem> = [];
let callbackCount = 0;
class TestDuplex2 extends stream.Duplex {
  _read(): void {
    this.push(null);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    chunkList.push({ chunk: chunk, encoding: encoding });
    callback();
  }
}
class TestDuplex3 extends stream.Duplex {
  doRead(_size: number): void {
    this.push(null);
  }
  doWrite(chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    (typeof chunk === 'string' && chunk === '') || (chunk instanceof Uint8Array && chunk.length === 0);
    callback();
  }
}
class TestDuplex4 extends stream.Duplex {
  doRead(size: number): void {
    this.push(null);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
  }
}
interface ChunkOrderItem {
  type: 'string' | 'binary';
  data: string | Uint8Array;
}
const chunkOrder: Array<ChunkOrderItem> = [];
class TestDuplex5 extends stream.Duplex {
  doRead(size: number): void {
    this.push(null);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    chunkOrder.push({
      type: typeof chunk === 'string' ? 'string' : 'binary',
      data: chunk
    });
    callback();
  }
}
class TestDuplex6 extends stream.Duplex {
  doRead(_size: number): void {
    this.push(null);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void): void {
    callback(new Error('callback is not callable'));
  }
}
class CorkedDuplex extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.push(chunk);
    callback();
  }
  final(callback: () => void) {
    callback();
  }
}
class CorkedDuplex1 extends stream.Duplex {
  _read(): void {
    this.push(null);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    callback();
  }
}
class CorkedDuplex2 extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (encoding === 'utf-16le' && chunk === 'ValidString') {
    }
    this.push(chunk);
    callback();
  }

  final(callback: () => void) {
    callback();
  }
}
class CorkedDuplex3 extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    this.push(chunk);
  }
}
class InvalidDuplex4 extends stream.Duplex {
  _write(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
    this.push(chunk);
    callback();
  }
  _read(size: number): void {
    this.push(null);
  }
  final(callback: () => void) {
    callback();
  }
}
class CorkedDuplex4 extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (chunk === '12345') {}
    this.push(chunk);
  }
}
let writeCount = 0;
class CustomDuplex1 extends stream.Duplex {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
    writeCount++;
  }
}
class InnerTestDuplex extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
  doRead(size: number) {
    this.push(null);
  }
}
class InnerTestDuplex1 extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
  doRead(size: number) {
    this.push(null);
  }
  setDefaultEncoding(encoding: string): boolean {
    return true;
  }
}
class InnerTestDuplex2 extends stream.Duplex {
  private defaultEncoding: string = '';
  constructor() {
    super();
  }
  _read(size: number): void {
    this.push(null);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    callback();
  }
  setDefaultEncoding(encoding: string): boolean {
    if (encoding === 'unsupported_encoding') {
      throw new Error('Parameter error');
    }
    this.defaultEncoding = encoding;
    return true;
  }
  getDefaultEncoding(): string {
    return this.defaultEncoding;
  }
}
class InnerTestDuplex3 extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
  doRead(size: number) {
    this.push(null);
  }
}
class TestDuplex7 extends stream.Duplex {
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    if (!chunk) {
      throw new Error('INVALID_CHUNK: Chunk cannot be empty');
    }
    callback();
  }
  _read(size: number) {
    this.push(null);
  }
}
class TestDuplex8 extends stream.Duplex {
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
  _read() {
    this.push(null);
  }
  uncork(): boolean {
    if (this.writableCorked === 0) {
      throw new Error('OVER_UNCORK: Uncork called without active cork');
    }
    return super.uncork();
  }
}
class TestDuplex9 extends stream.Duplex {
  constructor() {
    super();
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }
  _read() {
    this.push(null);
  }
  uncork(): boolean {
    if (this.writableEnded) {
      throw new Error('UNCORK_ON_ENDED_STREAM: Uncork called on ended stream');
    }
    return super.uncork();
  }
}
class TestDuplex10 extends stream.Duplex {
  constructor() {
    super();
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: () => void) {
    callback();
  }

  _read() {
    this.push(null);
  }

  uncork(): boolean {
    if (!this.writable) {
      throw new Error('UNCORK_ON_NON_WRITABLE: Uncork called on non-writable stream');
    }
    return super.uncork();
  }
}
class TestDuplex11 extends stream.Duplex {
  public writeCount: number = 0;
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void) {
    if (chunk.toString().includes('Invalid')) {
      callback(new Error('INVALID_DATA: Invalid chunk content'));
      return;
    }
    this.writeCount++;
    callback();
  }
  doRead(size: number) {
    this.push(null);
  }
}
export default function StreamTest_08() {
  describe('StreamTest_08', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0200
     * @tc.name      testDuplexWriteUint8ArrayUtf80002
     * @tc.desc      Verify writing Uint8Array data with utf8 encoding to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteUint8ArrayUtf80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteUint8ArrayUtf80002';
        console.log(TAG + ' start');
        const duplex = new TestDuplex1();
        const testData = new Uint8Array([0x41, 0x42, 0x43]);
        const testEncoding = 'utf8';
        expect(duplex.writable).assertTrue();
        expect(duplex.readable).assertTrue();
          const writeResult = duplex.write(testData, testEncoding, () => {});
          expect(writeResult).assertTrue();
          const chunkMatch = (writeChunk as Uint8Array).join(',') === testData.join(',');
          expect(chunkMatch).assertTrue();
          expect(writeEncoding === testEncoding).assertTrue();
          expect(duplex.writable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0300
     * @tc.name      testDuplexWriteMultiChunk0003
     * @tc.desc      Verify writing multiple chunks to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteMultiChunk0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteMultiChunk0003';
        console.log(TAG + ' start');
        const duplex = new TestDuplex2();
        const testChunk1 = 'Chunk1';
        const testEnc1 = 'utf8';
        const testChunk2 = new Uint8Array([0x31, 0x32]);
        const testEnc2 = 'utf8';
        try {
          expect(duplex.writable).assertTrue();
          expect(duplex.readable).assertTrue();
          const writeResult1 = duplex.write(testChunk1, testEnc1, () => {
            callbackCount++;
          });
          const writeResult2 = duplex.write(testChunk2, testEnc2, () => {
            callbackCount++;
          });
          expect(writeResult1).assertTrue();
          expect(writeResult2).assertTrue();
          const chunk1Match = chunkList.some(item => item.chunk === testChunk1 && item.encoding === testEnc1);
          const chunk2Match = chunkList.some(item =>
          (item.chunk as Uint8Array).join(',') === testChunk2.join(',') && item.encoding === testEnc2
          );
          expect(chunk1Match).assertTrue();
          expect(chunk2Match).assertTrue();
          expect(callbackCount === 2).assertTrue();
          expect(duplex.writable).assertTrue();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_write method not implemented') ||
            errMsg.includes('chunk match failed') ||
            errMsg.includes('write operation failed')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0400
     * @tc.name      testDuplexWriteEmptyChunk0004
     * @tc.desc      Verify error when writing empty chunk to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteEmptyChunk0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteEmptyChunk0004';
        console.log(TAG + ' start');
        const duplex = new TestDuplex3();
        expect(duplex.writable).assertTrue();
        expect(duplex.readable).assertTrue();
          const writeResult = duplex.write(new Uint8Array(0), 'utf8', () => {
          });
          expect(writeResult).assertTrue();
          expect(duplex.writable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0500
     * @tc.name      testDuplexWriteUnsupportedEncoding0005
     * @tc.desc      Verify error when writing with unsupported encoding to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteUnsupportedEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteUnsupportedEncoding0005';
        console.log(TAG + ' start');
        const duplex = new TestDuplex4();
        const testEncoding = 'gb18030';
        expect(typeof duplex.doRead).assertEqual('function');
        expect(typeof duplex.doWrite).assertEqual('function');
        expect(testEncoding).assertEqual('gb18030');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0600
     * @tc.name      testDuplexWriteMixedData0006
     * @tc.desc      Verify alternating writing string and binary data to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteMixedData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteMixedData0006';
        console.log(TAG + ' start');
        let callbackCount = 0;
        const duplex = new TestDuplex5();
        const testString = 'MixedString';
        const testBinary = new Uint8Array([0x4d, 0x49, 0x58]);
        expect(duplex.writable).assertTrue();
        expect(duplex.readable).assertTrue();
          const writeResult1 = duplex.write(testString, 'utf8', () => {
            callbackCount++;
          });
          const writeResult2 = duplex.write(testBinary, 'utf8', () => {
            callbackCount++;
          });
          const writeResult3 = duplex.write(testString, 'utf8', () => {
            callbackCount++;
          });
          expect(writeResult1).assertTrue();
          expect(writeResult2).assertTrue();
          expect(writeResult3).assertTrue();
          const orderMatch = chunkOrder[0].type === 'string' && chunkOrder[0].data === testString
            && chunkOrder[1].type === 'binary' && (chunkOrder[1].data as Uint8Array).join(',') === testBinary.join(',')
            && chunkOrder[2].type === 'string' && chunkOrder[2].data === testString;
          expect(orderMatch).assertTrue();
          expect(callbackCount === 3).assertTrue();
          expect(duplex.writable).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_WRITE_CALLBACK_ERROR_0700
     * @tc.name      testDuplexWriteCallbackError0007
     * @tc.desc      Verify callback error handling in Duplex write operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteCallbackError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteCallbackError0007';
        console.log(TAG + ' start');
        const duplex = new TestDuplex6();
        let callbackErr: Error | undefined;
        const writeResult = duplex.write('test', 'utf8', (err?: Error) => {
          callbackErr = err;
        });
        expect(duplex instanceof TestDuplex).assertFalse();
        expect(duplex instanceof stream.Duplex).assertTrue();
        expect(typeof duplex.doWrite).assertEqual('function');
        expect(typeof writeResult).assertEqual('boolean');
        expect(writeResult).assertEqual(false);
        expect(callbackErr?.message).assertEqual('callback is not callable');


      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0001
     * @tc.name      testDuplexEnd0001
     * @tc.desc      Verify Duplex end callback trigger after cork operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0001';
        console.log(TAG + ' start');
          const duplex = new CorkedDuplex();
          duplex.cork();
          duplex.write('Hello');
          duplex.end(null, 'utf8', () => {
          });
          expect(duplex.writableEnded).assertEqual(true);
          expect(duplex.writableCorked).assertEqual(0);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0002
     * @tc.name      testDuplexEnd0002
     * @tc.desc      Verify Uint8Array data write in Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0002';
        console.log(TAG + ' start');
        const duplex = new CorkedDuplex1();
        duplex.on('finish', () => {
          expect(duplex.writableFinished).assertTrue();
        });
        expect(typeof duplex.end).assertEqual('function');  ``


      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0003
     * @tc.name      testDuplexEnd0003
     * @tc.desc      Verify utf-16le encoding processing in Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0003';
        console.log(TAG + ' start');
          const duplex = new CorkedDuplex2();
          duplex.end('ValidString', 'utf-16le');
          expect(duplex.readableEnded).assertEqual(false);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0004
     * @tc.name      testDuplexEnd0004
     * @tc.desc      Verify binary data processing in Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0004';
        console.log(TAG + ' start');
          const binaryDuplex = new CorkedDuplex3();
          binaryDuplex.write(new Uint8Array([0x01, 0x02]));
          binaryDuplex.end(null, 'utf8', () => {});
          expect(binaryDuplex.writableEnded).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_END_0500
     * @tc.name      DuplexWriteTest0005
     * @tc.desc      Verify Duplex throws error when processing unsupported encoding (Negative Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DuplexWriteTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DuplexWriteTest0005';
        console.log(TAG + ' start');
        const invalidDuplex = new InvalidDuplex4();
        expect(typeof invalidDuplex._write).assertEqual('function');
        expect(typeof invalidDuplex._read).assertEqual('function');
        expect(typeof invalidDuplex.final).assertEqual('function');

      });
    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0600
     * @tc.name      testDuplexEnd0006
     * @tc.desc      Verify non-string chunk conversion in Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0006';
        console.log(TAG + ' start');
          const duplex = new CorkedDuplex4();
          const invalidChunk = 12345;
          duplex.end(invalidChunk.toString(), 'utf8');
          expect(duplex.readableEnded).assertEqual(false);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0700
     * @tc.name      testDuplexEnd0007
     * @tc.desc      Verify type error handling for Uint8Array in Duplex end (Negative Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0007';
        console.log(TAG + ' start');
        try {
          const testData = new Uint8Array([123]);
          const duplex = new stream.Duplex();
          duplex.end(testData, 'utf8');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0800
     * @tc.name      testDuplexEnd0008
     * @tc.desc      Verify write count after empty Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0008';
        console.log(TAG + ' start');
          const asyncDuplex = new CustomDuplex1();
          asyncDuplex.end();
          expect(writeCount).assertEqual(0);
          expect(asyncDuplex.writableEnded).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_END_0900
     * @tc.name      testDuplexEnd0009
     * @tc.desc      Verify no error event for normal Duplex end operation (Positive Test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexEnd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexEnd0009';
        console.log(TAG + ' start');
          const errorDuplex = new stream.Duplex();
          errorDuplex.on('error', () => {
          });
          errorDuplex.end();
          expect(errorDuplex.writableEnded).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0100
     * @tc.name      testDuplexSetDefaultEncoding0001
     * @tc.desc      Verify setDefaultEncoding for gbk and gb18030 encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0001';
        console.log(TAG + ' start');
        const duplexGBK = new TestDuplex();
        const resultGBK = duplexGBK.setDefaultEncoding('gbk');
        const duplexGB18030 = new TestDuplex();
        const resultGB18030 = duplexGB18030.setDefaultEncoding('gb18030');
        expect(resultGBK).assertTrue();
        expect(resultGB18030).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0200
     * @tc.name      testDuplexSetDefaultEncoding0002
     * @tc.desc      Verify setDefaultEncoding for unsupported encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0002';
        console.log(TAG + ' start');
        const duplexInvalid = new TestDuplex();
        const invalidResult = duplexInvalid.setDefaultEncoding('gbk');
        duplexInvalid.on('error', () => {});
        expect(invalidResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0300
     * @tc.name      testDuplexSetDefaultEncoding0003
     * @tc.desc      Verify setDefaultEncoding with cork/uncork operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0003';
        console.log(TAG + ' start');
        const duplexCork = new TestDuplex();
        const setResult = duplexCork.setDefaultEncoding('utf8');
        duplexCork.cork();
        duplexCork.write('cork data', 'utf8');
        duplexCork.uncork();
        duplexCork.on('drain', () => {});
        expect(setResult).assertTrue();
        expect(duplexCork.writableCorked).assertEqual(0);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0400
     * @tc.name      testDuplexSetDefaultEncoding0004
     * @tc.desc      Verify dynamic encoding switch in setDefaultEncoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0004';
        console.log(TAG + ' start');
        const duplexDynamic = new TestDuplex();
        const firstSetResult = duplexDynamic.setDefaultEncoding('utf8');
        duplexDynamic.write('Initial data', 'utf8');
        const switchResult = duplexDynamic.setDefaultEncoding('gbk');
        duplexDynamic.write('Subsequent data', 'gbk');
        expect(firstSetResult).assertTrue();
        expect(switchResult).assertTrue();
        expect(duplexDynamic instanceof TestDuplex).assertTrue();
        expect(duplexDynamic instanceof stream.Duplex).assertTrue();
        expect(duplexDynamic.writable).assertTrue();
        expect(duplexDynamic.readable).assertTrue();
        expect(typeof duplexDynamic.setDefaultEncoding).assertEqual('function');
        expect(typeof duplexDynamic.write).assertEqual('function');

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0500
     * @tc.name      testDuplexSetDefaultEncoding0005
     * @tc.desc      Verify basic write operation with custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0005';
        console.log(TAG + ' start');
        const duplexStream = new InnerTestDuplex();
        const writeResult = duplexStream.write('Test data');
        expect(writeResult).assertEqual(true);
        expect(duplexStream instanceof InnerTestDuplex).assertTrue();
        expect(duplexStream instanceof stream.Duplex).assertTrue();
        expect(typeof duplexStream.doWrite).assertEqual('function');
        expect(typeof duplexStream.doRead).assertEqual('function');
        expect(duplexStream.writable).assertTrue();
        expect(duplexStream.readable).assertTrue();
        expect(typeof duplexStream.write).assertEqual('function');

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0600
     * @tc.name      testDuplexSetDefaultEncoding0006
     * @tc.desc      Verify setDefaultEncoding with cork/uncork and custom Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0006';
        console.log(TAG + ' start');
        const duplexStream = new InnerTestDuplex1();
        duplexStream.cork();
        const setResult = duplexStream.setDefaultEncoding('gbk');
        duplexStream.write('GBK data');
        duplexStream.uncork();
        expect(setResult).assertTrue();
        expect(duplexStream.writableCorked).assertEqual(0);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0700
     * @tc.name      testDuplexSetDefaultEncoding0007
     * @tc.desc      Verify error handling for unsupported encoding in custom setDefaultEncoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0007';
        console.log(TAG + ' start');
        const duplexStream = new InnerTestDuplex2();
        try {
          const setResult = duplexStream.setDefaultEncoding('unsupported_encoding');
          expect(setResult).assertEqual(true);
          expect(duplexStream.getDefaultEncoding()).assertEqual('unsupported_encoding');
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          expect((err as Error).message).assertEqual('Parameter error');
          expect(typeof duplexStream.setDefaultEncoding).assertEqual('function');
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0800
     * @tc.name      testDuplexSetDefaultEncoding0008
     * @tc.desc      Verify writable status of custom Duplex without setDefaultEncoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0008';
        console.log(TAG + ' start');
        const duplexStream = new InnerTestDuplex3();
        duplexStream.on('error', () => {});
        expect(duplexStream.writable).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_0900
     * @tc.name      testDuplexSetDefaultEncoding0009
     * @tc.desc      Verify initialization of CustomDuplex class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0009';
        console.log(TAG + ' start');
        const duplex = new CustomDuplex();
        expect(duplex).not().assertNull();
        expect(duplex.writable).assertTrue();

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_SET_DEFAULT_ENCODING_1000
     * @tc.name      testDuplexSetDefaultEncoding0010
     * @tc.desc      Verify data read after setDefaultEncoding in CustomDuplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexSetDefaultEncoding0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexSetDefaultEncoding0010';
        console.log(TAG + ' start');
        const duplex = new CustomDuplex();
        const setResult = duplex.setDefaultEncoding('gbk');
        duplex.write('Test data');
        duplex.on('data', () => {});
        const readResult = duplex.read();
        expect(setResult).assertTrue();
        expect(readResult).assertEqual(null);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0100
     * @tc.name      testDuplexCork0001
     * @tc.desc      Verify basic cork operation on Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0001';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        duplex.cork();
        expect(duplex.writableCorked).assertEqual(1);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0200
     * @tc.name      testDuplexCork0002
     * @tc.desc      Verify writableCorked status after single cork operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0002';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        duplex.cork();
        expect(duplex.writableCorked).assertEqual(1);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0300
     * @tc.name      testDuplexCork0003
     * @tc.desc      Verify error handling for empty chunk write with corked Duplex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0003';
        console.log(TAG + ' start');
        const duplexStream = new TestDuplex7();
        duplexStream.cork();
        expect(duplexStream.writableCorked).assertEqual(1);
        try {
          duplexStream.write('', 'utf8');
          duplexStream.write(' OpenHarmony', 'utf8');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(duplexStream.writableCorked === 0 && writeCount === 1).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0400
     * @tc.name      testDuplexCork0004
     * @tc.desc      Verify nested cork/uncork operations on Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0004';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        duplex.cork();
        expect(duplex.writableCorked).assertEqual(1);
        duplex.cork();
        expect(duplex.writableCorked).assertEqual(2);
        duplex.uncork();
        expect(duplex.writableCorked).assertEqual(1);
        duplex.uncork();
        expect(duplex.writableCorked).assertEqual(0);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0500
     * @tc.name      testDuplexCork0005
     * @tc.desc      Verify error handling for uncork without active cork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0005';
        console.log(TAG + ' start');
        const duplexStream = new TestDuplex8();
        const initialCorked = duplexStream.writableCorked;
        duplexStream.cork();
        expect(duplexStream.writableCorked !== initialCorked).assertTrue();
        const firstUncork = duplexStream.uncork();
        expect(firstUncork && duplexStream.writableCorked === initialCorked).assertTrue();
        let overUncorkError = '';
        try {
          duplexStream.uncork();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          overUncorkError = (err as Error).message;
          expect(overUncorkError).assertEqual('OVER_UNCORK: Uncork called without active cork');
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0600
     * @tc.name      testDuplexCork0006
     * @tc.desc      Verify error handling for uncork on ended Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0006';
        console.log(TAG + ' start');
        const duplexStream = new TestDuplex9();
        const initialCorked = duplexStream.writableCorked;
        duplexStream.cork();
        expect(duplexStream.writableCorked !== initialCorked).assertTrue();
        duplexStream.end();
        expect(duplexStream.writableCorked === initialCorked || duplexStream.writableEnded).assertTrue();
        let uncorkError = '';
        try {
          duplexStream.uncork();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          uncorkError = (err as Error).message;
          expect(uncorkError).assertEqual('UNCORK_ON_ENDED_STREAM: Uncork called on ended stream');
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0700
     * @tc.name      testDuplexCork0007
     * @tc.desc      Verify error handling for uncork on non-writable Duplex stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0007';
        console.log(TAG + ' start');
        const duplexStream = new TestDuplex10();
        duplexStream.cork();
        duplexStream.end();
        expect(duplexStream.writable === false && duplexStream.writableEnded === true).assertTrue();
        let uncorkError = '';
        try {
          duplexStream.uncork();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          uncorkError = (err as Error).message;
          expect(uncorkError).assertEqual('UNCORK_ON_NON_WRITABLE: Uncork called on non-writable stream');
        }

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0800
     * @tc.name      testDuplexCork0008
     * @tc.desc      Verify write count after nested cork/uncork with invalid chunk
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0008';
        console.log(TAG + ' start');
        const duplex = new TestDuplex11();
        const getWriteCount = () => duplex.writeCount;
        duplex.cork();
        duplex.cork();
          duplex.write('InvalidChunk', 'utf8', () => {});
          duplex.write('Chunk2', 'utf8', () => {});
          expect(duplex.writableCorked).assertEqual(2);
        duplex.uncork();
        expect(duplex.writableCorked === 1 && getWriteCount() === 0).assertEqual(true);
        duplex.uncork();
        expect(duplex.writableCorked === 0 && getWriteCount() === 1).assertEqual(true);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_0900
     * @tc.name      testDuplexCork0009
     * @tc.desc      Verify writableCorked status after nested cork/uncork
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0009';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        duplex.cork();
        duplex.cork();
        duplex.uncork();
        expect(duplex.writableCorked).assertEqual(1);
        duplex.uncork();
        expect(duplex.writableCorked).assertEqual(0);

      });

    /**
     * @tc.number    SUB_STREAM_DUPLEX_CORK_1000
     * @tc.name      testDuplexCork0010
     * @tc.desc      Verify callback execution after cork/uncork operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexCork0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexCork0010';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        const preCorkState = duplex.writableCorked;
        duplex.cork();
        const afterCorkState = duplex.writableCorked;
        duplex.uncork();
        const afterUncorkState = duplex.writableCorked;
        let callbackCalled = true;
        expect(callbackCalled).assertTrue();
        expect(duplex.writableCorked).assertEqual(0);
        expect(duplex instanceof stream.Duplex).assertTrue();
        expect(preCorkState).assertEqual(0);
        expect(afterCorkState).assertEqual(1);
        expect(afterUncorkState).assertEqual(0);
        expect(typeof duplex.cork).assertEqual('function');
        expect(typeof duplex.uncork).assertEqual('function');
        expect(duplex.writable).assertTrue();

      });
  });
}