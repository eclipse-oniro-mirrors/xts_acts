import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
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
let readableStream: MyReadable;
let unboundCount = 0;
let boundCount = 0;

class EventHandler {
  private count = 0;

  handleEvent(_e: emitter.EventData): void {
    this.count++;
    unboundCount = this.count;
  }

  boundHandleEvent(_e: emitter.EventData): void {
    this.count++;
    boundCount = this.count;
  }
}
let initCompleted = true;
class CustomReadable extends stream.Readable {
  constructor() {
    super();
    this.initialize();
  }

  private async initialize(): Promise<void> {
    initCompleted = true;
    await Promise.resolve();
    hilog.debug(0x0000, 'StreamDemo', 'Initialize completed');
  }

  _read(): void {
  }
}
class CustomReadable2 extends stream.Readable {
  constructor() {
    super();
    this.initialize();
  }

  private async initialize(): Promise<void> {
    await this.someAsyncInitializeMethod();

  }

  private async someAsyncInitializeMethod(): Promise<void> {
    await Promise.resolve();
  }

  _read(): void {
  }
}
class CustomReadable3 extends stream.Readable {
  public resourceAllocated = false;
  public resourceReleased = false;
  private initializePromise: Promise<void>;
  constructor() {
    super();
    this.initializePromise = this.initialize();
  }
  private async initialize(): Promise<void> {
    this.resourceAllocated = true;
  }
  public getInitializeCompletePromise(): Promise<void> {
    return this.initializePromise;
  }
  _read(): void {
  }
}
const READABLE_ERROR_EVENT: emitter.InnerEvent = { eventId: 1001 };
interface ErrorEventData {
  errorMsg: string;
}
class ReadableWithEmit extends stream.Readable {
  emit(event: string, error: Error): boolean {
    if (event === 'error') {
      const eventData: emitter.EventData = {
        data: { errorMsg: error.message } as ErrorEventData
      };
      emitter.emit(READABLE_ERROR_EVENT, eventData);
      return true;
    }
    return false;
  }
}
let receivedChunks: string[] = [];
class FixedSizeReadable extends stream.Readable {
  private dataSource = ['chunk1', 'chunk2', 'chunk3'];
  private index = 0;

  _read(size: number) {
    if (this.index < this.dataSource.length) {
      this.push(this.dataSource[this.index]);
      receivedChunks.push(this.dataSource[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}
let bufferAvailable: Uint8Array | string | null = null;

class PausedLargeRead extends stream.Readable {
  private data = new Uint8Array(10).fill(0xAA);

  _read(size: number) {
    this.push(this.data.slice(0, size));
  }
}
class HighWaterMarkReadable extends stream.Readable {
  private largeData = new Uint8Array(20 * 1024).fill(0x41);

  _read(size: number) {
    this.push(this.largeData);
  }
}
class TestWritable extends stream.Writable {
  _write(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class OverflowReadable extends stream.Readable {
  private data = new Uint8Array([1, 2, 3]);
  _read(size: number) {
    const actualSize = Math.min(size, this.data.length);
    const chunk = this.data.slice(0, actualSize);
    this.push(chunk);
    this.push(null);
  }
}
class EndedReadable extends stream.Readable {
  _read(size: number) {
    this.push(null);
  }
}
class ClosedStreamReadable extends stream.Readable {
  _read(size: number) {
    this.push(null);
  }
}
class PausedReadable extends stream.Readable {
  private counter = 0;
  _read(size: number) {
    if (this.counter++ < 2) {
      this.push(`Chunk ${this.counter}`);
    } else {
      this.push(null);
    }
  }
}
class ErrorReadable extends stream.Readable {
  _read(size: number) {
    throw new Error('Simulated read failure');
  }
}
class DynamicSizeReadable extends stream.Readable {
  private data = new Uint8Array([1, 2, 3, 4, 5]);
  _read(size: number) {
    const actualSize = Math.min(size, this.data.length);
    const chunk = this.data.slice(0, actualSize);
    this.data = this.data.slice(actualSize);
    this.push(chunk);
  }
}
class StringPushReadable extends stream.Readable {
  private encoding?: string;
  constructor(encoding?: string) {
    super({ encoding });
    this.encoding = encoding;
  }
  _read(size: number) {
    this.push('Hello Harmony', this.encoding);
    this.push(null);
  }
}
class BinaryPushReadable extends stream.Readable {
  private data = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
  constructor() {
    super();
  }
  _read(size: number) {
    this.push(this.data);
    this.push(null);
  }
}
class NullPushReadable extends stream.Readable {
  doRead(size: number) {
    this.push('Initial Data');
    this.push(null);
  }
}
class MixedPushReadable extends stream.Readable {
  private counter = 0;
  _read(size: number) {
    if (this.counter++ % 2 === 0) {
      this.push('Text Block ' + this.counter);
    } else {
      this.push(new Uint8Array([0x41 + this.counter]));
    }
    this.push(null);
  }
}
interface ChunkInfo {
  data: string;
  encoding: string;
}

class MultiEncodingReadable extends stream.Readable {
  private chunks: Array<ChunkInfo> = [
    { data: 'chinere', encoding: 'gbk' },
    { data: 'qiehuan', encoding: 'gb18030' }
  ];

  doRead() {
    this.chunks.forEach((chunkInfo) => {
      this.push(chunkInfo.data, chunkInfo.encoding);
    });
    this.push(null);
  }
}
class NullChunkReadable extends stream.Readable {
  doRead() {
    this.push('Initial data');
    const endResult = this.push(null, 'gb2312');
    expect(endResult === false).assertTrue();
  }
}
class HybridPushReadable extends stream.Readable {
  private chunks = [
    new Uint8Array([0x48, 0x4F, 0x53]),
    null
  ];
  doRead() {
    this.chunks.forEach(chunk => {
      if (chunk instanceof Uint8Array) {
        this.push(chunk);
      } else if (typeof chunk === 'string') {
        this.push(chunk, 'gbk');
      } else {
        this.push(null);
      }
    });
  }
}
class Uint8WithEncodingReadable extends stream.Readable {
  doRead() {
    const data = new Uint8Array([72, 101, 108, 108, 111]);
    const result = this.push(data, 'utf8');
    expect(result === true).assertTrue();
    this.push(null);
  }
}
class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }
  doRead(size: number): void {
    this.push(null);
  }
  doWrite(chunk: Uint8Array, encoding: string, callback: Function): void {
    callback();
  }
}
class CustomWaterMarkDuplex extends stream.Duplex {
  constructor() {
    super();
  }
}
class ObjectModeDuplex extends stream.Duplex {
  constructor() {
    super();
  }
}
type BufferEncoding = 'utf8' | 'ascii' | 'utf16le' | 'base64' | 'hex';
let writeChunk: string | Uint8Array = '';
let writeEncoding: BufferEncoding = 'utf8';
let callbackCalled = false;
class TestDuplex1 extends stream.Duplex {
  _read(): void {
    this.push(null);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: BufferEncoding,
    callback: (error?: Error | null) => void
  ): void {
    writeChunk = chunk;
    writeEncoding = encoding;
    callback();
  }
}
export default function StreamTest_07() {
  describe('StreamTest_07', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_0900
     * @tc.name      Readableontest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0009';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        expect(readableStream !== null).assertEqual(true);
        expect(readableStream !== undefined).assertEqual(true);
        expect(readableStream instanceof MyReadable).assertEqual(true);
        expect(typeof readableStream.on === 'function').assertEqual(true);
        expect(typeof readableStream.push === 'function').assertEqual(true);
        let callbackCount = 0;
        const sameCallback = () => {
          callbackCount++;
        };
        readableStream.on('data', sameCallback);
        readableStream.on('data', sameCallback);
        readableStream.push(new Uint8Array([1]));
        expect(callbackCount === 2).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_1000
     * @tc.name      Readableontest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0010';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let endTriggerCount = 0;
        const endHandler = () => {
          endTriggerCount++;
        };
        readableStream.on('end', endHandler);
        readableStream.push(null);
        const newStream = new MyReadable();
        newStream.on('end', endHandler);
        newStream.push(null);
        expect(endTriggerCount === 2).assertFalse();
        expect(readableStream instanceof MyReadable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_1100
     * @tc.name      Readableontest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0011';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let unregisteredEventTriggered = false;
        const unregisteredCallback: Callback<emitter.EventData> = () => {
          unregisteredEventTriggered = true;
        };
        readableStream.push(null);
        expect(unregisteredEventTriggered).assertFalse();
        expect(readableStream !== null).assertTrue();
        expect(typeof unregisteredCallback === 'function').assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_1200
     * @tc.name      Readableontest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0012';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        const dataHandler: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          if (eventData.data instanceof Uint8Array) {
          }
        };
        const endHandler: Callback<emitter.EventData> = () => {
          readableStream.off('data', dataHandler);
          readableStream.off('end', endHandler);
        };
        readableStream.on('data', dataHandler);
        readableStream.on('end', endHandler);
        readableStream.push(null);
        expect(readableStream !== null).assertEqual(true);
        expect(readableStream !== undefined).assertEqual(true);
        expect(readableStream instanceof MyReadable).assertEqual(true);
        expect(typeof readableStream.on === 'function').assertEqual(true);
        expect(typeof readableStream.off === 'function').assertEqual(true);
        expect(typeof readableStream.push === 'function').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_1300
     * @tc.name      Readableontest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0013';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let eventTriggerCount = 0;
        const createHandler = (): Callback<emitter.EventData> => {
          return () => {
            eventTriggerCount++;
          };
        };
        ['data', 'close', 'pause'].forEach((event) => {
          readableStream.on(event, createHandler());
        });
        expect(eventTriggerCount >= 2).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEON_1400
     * @tc.name      Readableontest0014
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableontest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableontest0019';
        console.log(TAG + ' start');
        if (!readableStream) {
          readableStream = new MyReadable();
        }
        let decodedPayload = '';

        interface CustomData {
          timestamp: number;
          payload: string;
        }

        const typedHandler: Callback<emitter.GenericEventData<CustomData>> =
          (eventData: emitter.GenericEventData<CustomData>) => {
            const customData = eventData.data as CustomData;
            decodedPayload = customData.payload;
          };
        readableStream.on('data', typedHandler as Callback<emitter.EventData>);
        expect(decodedPayload === 'test').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0100
     * @tc.name      Readableofftest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0001';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isTriggered = false;
        const dataHandler: Callback<emitter.EventData> = () => {
          isTriggered = true;
        };
        readableStream.on('data', dataHandler);
        readableStream.off('data', dataHandler);
        readableStream.push(new Uint8Array([1]));
        expect(isTriggered).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0200
     * @tc.name      Readableofftest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0002';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let handlerACount = 0;
        let handlerBCount = 0;
        const handlerA: Callback<emitter.EventData> = () => {
          handlerACount++;
        };
        const handlerB: Callback<emitter.EventData> = () => {
          handlerBCount++;
        };
        readableStream.on('data', handlerA);
        readableStream.on('data', handlerB);
        readableStream.off('data', handlerA);
        readableStream.push(new Uint8Array([1]));
        expect(handlerACount === 0 && handlerBCount === 1).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0300
     * @tc.name      Readableofftest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0003';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isEndTriggered = false;
        let isHandlerRemoved = false;
        const dataHandler: Callback<emitter.EventData> = () => {
        };
        const endHandler: Callback<emitter.EventData> = (): void => {
          isEndTriggered = true;
          readableStream.off('data', dataHandler);
          readableStream.off('end', endHandler);
          isHandlerRemoved = true;
        };
        readableStream.on('data', dataHandler);
        readableStream.on('end', endHandler);
        readableStream.push(null);
        expect(isEndTriggered && isHandlerRemoved).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0400
     * @tc.name      Readableofftest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0004';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let eventTriggerCount = 0;
        const eventsToRemove = ['data', 'pause', 'resume'];
        eventsToRemove.forEach((event) => {
          const handler: Callback<emitter.EventData> = () => {
            eventTriggerCount++;
          };
          readableStream.on(event, handler);
        });
        eventsToRemove.forEach((event) => {
          readableStream.off(event);
        });
        readableStream.push(new Uint8Array([1]));
        expect(eventTriggerCount === 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0500
     * @tc.name      Readableofftest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0005';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isOnceTriggered = false;
        const onceHandler: Callback<emitter.EventData> = () => {
          isOnceTriggered = true;
          readableStream.off('data', onceHandler);
        };
        readableStream.on('data', onceHandler);
        readableStream.off('data', onceHandler);
        readableStream.push(new Uint8Array([1]));
        expect(isOnceTriggered === false).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0600
     * @tc.name      Readableofftest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0006';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isTriggered = false;
        const genericCallback: Callback<emitter.EventData> = () => {
          isTriggered = true;
        };
        readableStream.on('data', genericCallback);
        readableStream.off('data', genericCallback);
        readableStream.push(new Uint8Array([1]));
        expect(isTriggered).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0700
     * @tc.name      Readableofftest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0007';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isDataTriggered = false;
        const dataHandler: Callback<emitter.EventData> = () => {
          isDataTriggered = true;
        };
        readableStream.on('data', dataHandler);
        readableStream.off('data', dataHandler);
        readableStream.push(new Uint8Array([1]));
        expect(isDataTriggered === false).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0800
     * @tc.name      Readableofftest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0008';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isDataTriggered = false;
        const dataHandler: Callback<emitter.EventData> = (): void => {
          isDataTriggered = true;
        };
        const wrongTypeHandler: Callback<emitter.EventData> = (): void => {
        };
        readableStream.on('data', dataHandler);
        readableStream.off('data', wrongTypeHandler);
        readableStream.push(new Uint8Array([1]));
        expect(isDataTriggered).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_0900
     * @tc.name      Readableofftest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0009';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isDataTriggered = false;
        const validHandler: Callback<emitter.EventData> = () => {
          isDataTriggered = true;
        };
        readableStream.on('data', validHandler);
        readableStream.off('data', validHandler);
        readableStream.off('data', validHandler);
        readableStream.push(new Uint8Array([1]));
        expect(isDataTriggered === false).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_1000
     * @tc.name      Readableofftest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0010';
        console.log(TAG + ' start');
        let errorMessage = '';
        try {
          const readableStream = new stream.Readable();
          const dataHandler: Callback<emitter.EventData> = () => {
          };
          readableStream.on('data', dataHandler);
          throw new Error('Invalid off parameters');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          errorMessage = (err as Error).message;
          expect(errorMessage).assertEqual('Invalid off parameters');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_1100
     * @tc.name      Readableofftest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0011';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isDataTriggered = false;
        const validCallback: Callback<emitter.EventData> = () => {
          isDataTriggered = true;
        };
        readableStream.on('data', validCallback);
        readableStream.off('data', validCallback);
        readableStream.push(new Uint8Array([1]));
        expect(isDataTriggered).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_1200
     * @tc.name      Readableofftest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0012';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let isDataTriggered = false;
        const validCallback: Callback<emitter.EventData> = (): void => {
          isDataTriggered = true;
        };
        const invalidCallback: Callback<emitter.EventData> = (): void => {
        };
        const validEvent = 'data';
        const invalidEvent = 'invalid_event';
        readableStream.on(validEvent, validCallback);
        readableStream.off(invalidEvent, validCallback);
        readableStream.off(validEvent, invalidCallback);
        readableStream.push(new Uint8Array([1]));
        expect(isDataTriggered).assertFalse();
        expect(validEvent).assertEqual('data');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOFF_1300
     * @tc.name      Readableofftest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableofftest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableofftest0013';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        const handlerInstance = new EventHandler();
        const unboundHandler: Callback<emitter.EventData> = handlerInstance.handleEvent.bind(handlerInstance);
        readableStream.on('data', unboundHandler);
        readableStream.off('data', unboundHandler);
        const boundHandler: Callback<emitter.EventData> = handlerInstance.boundHandleEvent.bind(handlerInstance);
        readableStream.on('data', boundHandler);
        readableStream.off('data', boundHandler);
        readableStream.push(new Uint8Array([1]));
        expect(unboundCount === 0 && boundCount === 0).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0100
     * @tc.name      Readabledolnitializetest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0001';
        console.log(TAG + ' start');
        const readableStream = new CustomReadable();
        readableStream.on('data', () => {
        });
        expect(initCompleted && readableStream.readable === true).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0200
     * @tc.name      Readabledolnitializetest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0002';
        console.log(TAG + ' start');
        const readableStream = new CustomReadable2();
        readableStream.on('data', () => {
        });
        expect(readableStream instanceof stream.Readable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0400
     * @tc.name      Readabledolnitializetest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0004';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable({});
        readableStream.on('data', () => {});

        const isReadable = readableStream.readable === true;
        const hasOnMethod = typeof readableStream.on === 'function';
        expect(isReadable && hasOnMethod).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0500
     * @tc.name      Readabledolnitializetest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0005';
        console.log(TAG + ' start');
        const readableStream = new ReadableWithEmit();
        let timeoutErrorCaptured = false;
        emitter.on(READABLE_ERROR_EVENT, (eventData: emitter.EventData) => {
          const errorData = eventData.data as ErrorEventData;
          const errorMsg = errorData?.errorMsg ?? 'Unknown error';
          const error = new Error(errorMsg);
          timeoutErrorCaptured = true;
          expect(error.message).assertEqual('Initialization timeout');
        });
        const interval = setInterval(() => {
        }, 1000);
        clearInterval(interval);
        readableStream.push(null);
        readableStream.emit('error', new Error('Initialization timeout'));
        expect(timeoutErrorCaptured === false).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0600
     * @tc.name      Readabledolnitializetest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0006';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let errorMessage = '';
        readableStream.on('error', (err) => {
          errorMessage = (err as Error).message;
        });
        readableStream.push(null);
        readableStream.push('error');
        expect(errorMessage).assertEqual('');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0700
     * @tc.name      Readabledolnitializetest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0007';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let streamEnded = false;
        readableStream.push(null);
        streamEnded = true;
        expect(streamEnded === true).assertTrue();
        expect(streamEnded).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDOLNITIALIZE_0800
     * @tc.name      Readabledolnitializetest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readabledolnitializetest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readabledolnitializetest0008';
        console.log(TAG + ' start');
        const readableStream = new stream.Readable();
        let dataEventTriggered = false;
        readableStream.on('data', () => {
          dataEventTriggered = true;
        });
        expect(dataEventTriggered === false).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READREADABLEDO_READ_0100
     * @tc.name      ReadabledoReadtest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0001';
        console.log(TAG + ' start');
        const readable = new FixedSizeReadable();
        readable.on('data', () => {
        });
        expect(receivedChunks.join(',') === 'chunk1,chunk2,chunk3').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0200
     * @tc.name      ReadabledoReadtest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0002';
        console.log(TAG + ' start');
        const pausedStream = new PausedLargeRead();
        pausedStream.pause();
        pausedStream.read(8);
        pausedStream.on('readable', () => {
          bufferAvailable = pausedStream.read();
        });
        pausedStream.resume();
        expect(bufferAvailable !== null && bufferAvailable).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0300
     * @tc.name      ReadabledoReadtest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0003';
        console.log(TAG + ' start');
        let isPaused = true;
        let isResumed = true;
        const highWaterStream = new HighWaterMarkReadable();
        highWaterStream.on('pause', () => {
          isPaused = true;
        });
        highWaterStream.on('resume', () => {
          isResumed = true;
        });
        const someWritableStream = new TestWritable();
        highWaterStream.pipe(someWritableStream);
        expect(isPaused || isResumed).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0400
     * @tc.name      ReadabledoReadtest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0004';
        console.log(TAG + ' start');
        let chunkLength = 0;
        const overflowStream = new OverflowReadable();
        overflowStream.on('data', (chunk) => {
          chunkLength = (chunk as Uint8Array).length;
        });
        overflowStream.read(10);
        expect(chunkLength === 3).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0500
     * @tc.name      ReadabledoReadtest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0005';
        console.log(TAG + ' start');
        let postEndReads: (Uint8Array | string | null)[] = [];
        const endedStream = new EndedReadable();
        endedStream.on('end', () => {
        });
        endedStream.resume();
        expect(postEndReads.join(',') === 'null,null').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0600
     * @tc.name      ReadabledoReadtest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0006';
        console.log(TAG + ' start');
        let postEndReadResult: string | null = '';
        const closedStream = new ClosedStreamReadable();
        closedStream.on('end', () => {
          const data = closedStream.read();
          postEndReadResult = data;
        });
        expect(postEndReadResult === null).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0700
     * @tc.name      ReadabledoReadtest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0007';
        console.log(TAG + ' start');
        let resumedData: string[] = [];
        const pausedStream = new PausedReadable();
        pausedStream.pause();
        pausedStream.read();
        pausedStream.resume();
        pausedStream.on('data', (chunk) => {
          resumedData.push(chunk.toString());
        });
        expect(resumedData.join(',') === 'Chunk 1,Chunk 2').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0800
     * @tc.name      ReadabledoReadtest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0008';
        console.log(TAG + ' start');
        let errorMessage = '';
        const errorStream = new ErrorReadable();
        errorStream.read(1);
        expect(errorMessage !== 'now').assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEDO_READ_0900
     * @tc.name      ReadabledoReadtest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadabledoReadtest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadabledoReadtest0009';
        console.log(TAG + ' start');
        let receivedBytes: number[] = [];
        const dynamicStream = new DynamicSizeReadable();
        dynamicStream.on('data', (chunk) => {
          const length = (chunk as Uint8Array).length;
          receivedBytes.push(length);
        });
        dynamicStream.read(4);
        dynamicStream.read(2);
        expect(receivedBytes.join(',') === '4,1').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0100
     * @tc.name      Readablepushtest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0001';
        console.log(TAG + ' start');
        let utf8Content = '';
        let gbkContent = '';
        const utf8Stream = new StringPushReadable('utf8');
        utf8Stream.on('data', (chunk) => {
          utf8Content = chunk.toString();
        });
        const gbkStream = new StringPushReadable('gbk');
        gbkStream.on('data', (chunk) => {
          gbkContent = chunk.toString();
        });
        utf8Stream.read();
        gbkStream.read();
        expect(utf8Content === 'Hello Harmony' && gbkContent === 'Hello Harmony').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0200
     * @tc.name      Readablepushtest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0002';
        console.log(TAG + ' start');
        let isUint8Type = false;
        const binaryStream = new BinaryPushReadable();
        binaryStream.on('data', (chunk) => {
          isUint8Type = chunk instanceof Uint8Array;
        });
        binaryStream.read();
        expect(isUint8Type).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0300
     * @tc.name      Readablepushtest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0003';
        console.log(TAG + ' start');
        interface EventDataContent {
          data: string;
        }
        let lastChunk = '';
        let isStreamEnded = false;
        const endedStream = new NullPushReadable();
        endedStream.on('data', (eventData: emitter.EventData) => {
          if (typeof eventData.data === 'object' && eventData.data !== null) {
            lastChunk = (eventData.data as EventDataContent).data;
          } else if (typeof eventData.data === 'string') {
            lastChunk = eventData.data;
          }
        });
        endedStream.on('end', () => {
          isStreamEnded = true;
        });
        expect(lastChunk === 'Initial Data' && isStreamEnded).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0400
     * @tc.name      Readablepushtest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0004';
        console.log(TAG + ' start');
        let stringChunk = '';
        let binaryChunkChar = '';
        const mixedStream = new MixedPushReadable();
        mixedStream.on('data', (chunk) => {
          if (typeof chunk === 'string') {
            stringChunk = chunk;
          } else if (chunk instanceof Uint8Array) {
            binaryChunkChar = String.fromCharCode(...Array.from(chunk));
          }
        });
        mixedStream.read();
        expect(stringChunk === 'Text Block 1' && binaryChunkChar === 'C').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0500
     * @tc.name      Readablepushtest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0005';
        console.log(TAG + ' start');
        let totalLength = 0;
        const readable2 = new MultiEncodingReadable();
        readable2.on('data', (chunk) => {
          totalLength += chunk.toString().length;
        });
        expect(totalLength === 8).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0600
     * @tc.name      Readablepushtest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0006';
        console.log(TAG + ' start');
        let chunkCount = 0;
        const pushData = () => {
          for (let i = 1; i <= 3; i++) {
            chunkCount++;
          }
        };
        pushData();
        expect(chunkCount === 3).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0700
     * @tc.name      Readablepushtest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0007';
        console.log(TAG + ' start');
        let isStreamTerminated = false;
        new NullChunkReadable().on('end', () => {
          isStreamTerminated = true;
        });
        expect(isStreamTerminated).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0800
     * @tc.name      Readablepushtest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0008';
        console.log(TAG + ' start');
        let binaryContent = '';
        let stringContent = '';
        new HybridPushReadable().on('data', (eventData: emitter.EventData) => {
          const chunk = eventData.data;
          if (chunk instanceof Uint8Array) {
            binaryContent = chunk.toString();
          } else if (typeof chunk === 'string') {
            stringContent = chunk;
          }
        });
        expect(binaryContent === 'HOS' && stringContent === 'hongmeng').assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPUSH_0900
     * @tc.name      Readablepushtest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readablepushtest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readablepushtest0009';
        console.log(TAG + ' start');
        let receivedContent = '';
        let isStreamEnded = false;
        const readable1 = new Uint8WithEncodingReadable();
        readable1.on('data', (chunk) => {
          receivedContent = chunk.toString();
        });
        readable1.on('end', () => {
          isStreamEnded = true;
        });
        expect(receivedContent === 'Hello' && isStreamEnded).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_CONSTRUCTOR_0100
     * @tc.name      testDuplexConstructor0001
     * @tc.desc      Validate read/write state with default constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexConstructor0001';
        console.log(TAG + ' start');
        const duplex = new TestDuplex();
        const data1 = new Uint8Array([49, 50, 51]);
        const data2 = new Uint8Array([52, 53, 54]);
        let writeCount = 0;
        const checkDone = () => {
          writeCount++;
          if (writeCount === 2) {
            expect(duplex.writable === true).assertTrue();
            expect(writeCount === 2).assertTrue();
          }
        };
        duplex.write(data1, 'utf8', checkDone);
        duplex.write(data2, 'utf8', checkDone);
        expect(duplex.writable === true).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_CONSTRUCTOR_0200
     * @tc.name      testDuplexConstructor0002
     * @tc.desc      Validate writable state after writing empty data in cork state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexConstructor0002';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        const emptyData = new Uint8Array(0);
        duplex.cork();
        const writeResult = duplex.write(emptyData);
        expect(writeResult === true).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_CONSTRUCTOR_0300
     * @tc.name      testDuplexConstructor0003
     * @tc.desc      Verify error when accessing unimplemented doRead method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexConstructor0003';
        console.log(TAG + ' start');
        let duplex = new CustomWaterMarkDuplex();
        expect(duplex.writableHighWatermark === 16384 && duplex.readableHighWatermark === 16384)
          .assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_CONSTRUCTOR_0400
     * @tc.name      testDuplexConstructor0004
     * @tc.desc      Validate error when writing to ended stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexConstructor0004';
        console.log(TAG + ' start');
        let duplex = new ObjectModeDuplex();
        expect(duplex.writableObjectMode === false && duplex.readableObjectMode === false)
          .assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_CONSTRUCTOR_0500
     * @tc.name      testDuplexConstructor0005
     * @tc.desc      Prevent multiple end method invocations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexConstructor0005';
        console.log(TAG + ' start');
        const duplex = new stream.Duplex();
        duplex.cork();
        expect(duplex.writableCorked === 1).assertTrue();
        duplex.uncork();
        expect(duplex.writableCorked === 0 && duplex.readable === true && duplex.writable === true).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_DUPLEX_WRITE_0100
     * @tc.name      testDuplexWriteStringUtf80001
     * @tc.desc      Verify writing string data with utf8 encoding to Duplex stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDuplexWriteStringUtf80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testDuplexWriteStringUtf80001';
        console.log(TAG + ' start');
        const duplex = new TestDuplex1();
        const testData = 'TestString';
        const testEncoding: BufferEncoding = 'utf8';
        try {
          duplex.write(testData, testEncoding, () => {
            callbackCalled = true;
            expect(writeChunk === testData).assertEqual(true);
            expect(writeEncoding === testEncoding).assertEqual(true);
            expect(callbackCalled).assertTrue();
            expect((writeChunk === testData) && (writeEncoding === testEncoding) && callbackCalled).assertEqual(true);
          });
          expect().assertFail()
        } catch (runtimeErr) {
          console.error(`${TAG} fail, err: ${runtimeErr}`);
          expect(runtimeErr instanceof Error).assertEqual(true);
          const errMsg = (runtimeErr as Error).toString();
          expect(
            errMsg.includes('_write method not implemented') ||
            errMsg.includes('duplex write error')
          ).assertEqual(false);
        }

      });
  })
}

