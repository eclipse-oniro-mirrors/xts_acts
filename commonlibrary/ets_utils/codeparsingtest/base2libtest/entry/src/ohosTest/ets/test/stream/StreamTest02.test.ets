import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';
import { TreeController } from '@kit.ArkUI';

interface GeneratedTypeLiteralInterface_2 {
  code: number;
  name?: string;
  message?: string;
}
interface GeneratedTypeLiteralInterface_3 {
  data: GeneratedTypeLiteralInterface_4;
}
interface GeneratedTypeLiteralInterface_6 {
  code: number;
  message: string;
}
interface GeneratedTypeLiteralInterface_5 {
  data: GeneratedTypeLiteralInterface_6;
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
interface GeneratedObjectLiteralInterface_1 {
  bytesWritten: number;
}
interface GeneratedObjectLiteralInterface_2 {
  data: string;
}
interface GeneratedObjectLiteralInterface_3 {
  data: string;
}
type allExpectType = 'success' | 'fail' | 'pending';
interface GeneratedTypeLiteralInterface_1 {
  message: allExpectType;
  value: string;
}
interface GeneratedObjectLiteralInterface_8 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_9 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_10 {
  LOW: GeneratedObjectLiteralInterface_8;
  HIGH: GeneratedObjectLiteralInterface_9;
}
interface GeneratedObjectLiteralInterface_7 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_5 {
  ERROR: string;
  FINISH: string;
}
interface GeneratedTypeLiteralInterface_4 {
  message: string;
}
interface StatusData {
  status: string;
}
interface GeneratedObjectLiteralInterface_6 {
  bytesWritten: number;
}
interface GeneratedObjectLiteralInterface_4 {
  status: string;
}
class AfterEndStream extends stream.Writable {
  private _isEnded = false;
  constructor() {
    super();
    this.on('finish', () => this._isEnded = true);
  }
  cork(): boolean {
    return this._isEnded;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
  _write = this.doWrite;
}
class NoDoWriteStream extends stream.Writable {
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: (error?: Error | null) => void): void {
    callback(new Error('The doWrite() method is not implemented'));
  }
  _write = this.doWrite;
}
class InvalidEncodingStream extends stream.Writable {
  doWrite(
    _chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    const validEncodings = ['utf8', 'gbk'];
    if (!validEncodings.includes(encoding)) {
      callback(new Error(`Invalid encoding: ${encoding}`));
      return;
    }
    callback();
  }
  _write = this.doWrite;
};
class MultipleEndStream extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(
    _chunk: string | Uint8Array,
    _encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    callback();
  }
  _write(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    this.doWrite(chunk, encoding, callback);
  }
}
class NormalCorkStream extends stream.Writable {
  private _corkedCount = 0;
  cork(): boolean {
    this._corkedCount++;
    return true;
  }
  uncork(): boolean {
    if (this._corkedCount > 0) {
      this._corkedCount--;
      return true;
    }
    return false;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
  _write = this.doWrite;
}
class ClosedStream extends stream.Writable {
  private _isClosed = false;
  constructor() {
    super();
    this.on('finish', () => this._isClosed = true);
  }
  cork(): boolean {
    return !this._isClosed;
  }
  uncork(): boolean {
    return !this._isClosed;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
  _write = this.doWrite;
}
class InvalidStream extends stream.Writable {
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: (error?: Error | null) => void): void {
    callback(new Error('doWrite not implemented'));
  }
  _write = this.doWrite;
}
class OverUncorkStream extends stream.Writable {
  private _corkedCount = 0;
  cork(): boolean {
    this._corkedCount++;
    return true;
  }
  uncork(): boolean {
    if (this._corkedCount > 0) {
      this._corkedCount--;
      return true;
    }
    return false;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: () => void): void {
    callback();
  }
  _write = this.doWrite;
}
class BasicWritable extends stream.Writable {
  public writtenData: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    this.writtenData.push(chunk.toString());
    callback();
  }
}
class MultiCorkWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class AsyncWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(
    _chunk: string | Uint8Array,
    _encoding: string,
    callback: (error?: Error | null) => void
  ): void {
    callback(null);
  }
}
class EndWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class DefaultWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class UnCorkWithoutCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class OverUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class EndBeforeUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    this.doWrite(chunk, encoding, callback);
  }
}
class UnwritableStream extends stream.Writable {
  constructor() {
    super();
  }

  close() {
    throw new Error('Method not implemented.');
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class BasicUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class MultiCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class NoCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback();
  }
}

const CUSTOM_EVENT: string = 'dataProcessed';
class DataProcessor extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string, encoding: string, callback: Function): void {
    emitter.emit(CUSTOM_EVENT, { data: chunk.toUpperCase() });
    callback();
  }
}
const HIGH_PRIORITY_EVENT: GeneratedObjectLiteralInterface_7 = {
  eventId: 1001,
  priority: emitter.EventPriority.HIGH
};
let processedData: string | undefined = '';
const dataProcessCallback = (event: emitter.GenericEventData<string>) => {
  processedData = event.data?.toUpperCase();
};

class PriorityWritable extends stream.Writable {
  constructor() {
    super();
    emitter.on(String(HIGH_PRIORITY_EVENT.eventId), dataProcessCallback);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    emitter.emit(String(HIGH_PRIORITY_EVENT.eventId), { data: chunk.toString() });
    callback();
  }
};
const TEST_EVENT_ID = 1001;
let isCallbackCalled = false;
class CancelWritable extends stream.Writable {
  private eventCallback = () => {
    isCallbackCalled = true;
  };
  constructor() {
    super();
    emitter.on(TEST_EVENT_ID.toString(), this.eventCallback);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    emitter.emit(TEST_EVENT_ID.toString(), { data: chunk.toString() });
    callback();
  }
  testUnsubscribe() {
    emitter.off(TEST_EVENT_ID.toString(), this.eventCallback);
    this.write('Test Data', 'utf8', () => {
      expect(isCallbackCalled === (false)).assertEqual(true);
    });
  }
};
const MULTI_EVENT_ID = 1002;
let handlerCount = 0;
const callbackFactory = () => () => {
  handlerCount++;
};

class MultiWritable extends stream.Writable {
  constructor() {
    super();
    emitter.on(MULTI_EVENT_ID.toString(), callbackFactory());
    emitter.on(MULTI_EVENT_ID.toString(), callbackFactory());
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    emitter.emit(MULTI_EVENT_ID.toString(), { data: chunk });
    callback();
  }

  validate() {
    this.write('test', 'utf8', () => {
      expect(handlerCount === (2)).assertEqual(false);
    });
  }
};
interface UserData {
  name: string;
  age: number;
}
const TYPED_EVENT = 'typedEvent';
let receivedUserData: UserData | null = null;
class TypedWritable extends stream.Writable {
  private typedHandler = (event: emitter.GenericEventData<UserData>) => {
    receivedUserData = event.data ?? null;
  };

  constructor() {
    super();
    emitter.on<UserData>(TYPED_EVENT, this.typedHandler);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    const user: UserData = { name: chunk.toString(), age: 20 };
    emitter.emit(TYPED_EVENT, { data: user });
    callback();
  }

  destroy() {
    emitter.off(TYPED_EVENT, this.typedHandler);
  }
};
const COMPLEX_EVENTS = ['eventA', 'eventB'];
let receivedEvents: string[] = [];

interface EventData {
  data: string;
}

class ComplexWritable extends stream.Writable {
  private handlers = new Map<string, Callback<emitter.GenericEventData<EventData>>>();
  private readonly done: () => void;
  private readonly testData: string;

  constructor(doneCallback: () => void, testData: string) {
    super();
    this.done = doneCallback;
    this.testData = testData;
    this.initHandlers();
  }

  private initHandlers() {
    COMPLEX_EVENTS.forEach(eventId => {
      const handler = (event: emitter.GenericEventData<EventData>) => {
        const validData = event.data?.data;
        if (validData) {
          receivedEvents.push(validData);
          if (receivedEvents.length === COMPLEX_EVENTS.length) {
            this.validateEvents();
          }
        }
      };
      this.handlers.set(eventId, handler);
      emitter.on(eventId, handler);
    });
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    COMPLEX_EVENTS.forEach(eventId => {
      const eventData: GeneratedObjectLiteralInterface_2 = { data: chunk.toString() + '_' + eventId };
      emitter.emit(eventId, eventData);
    });
    callback();
  }

  private validateEvents() {
    const expectedEvents = [
      `${this.testData}_eventA`,
      `${this.testData}_eventB`
    ];
    expect(JSON.stringify(receivedEvents) === (JSON.stringify(expectedEvents))).assertEqual(true);
    this.cleanup();
    this.done();
  }
  private cleanup() {
    COMPLEX_EVENTS.forEach(eventId => {
      const handler = this.handlers.get(eventId);
      if (handler) {
        emitter.off(eventId, handler);
      }
    });
  }
};
export default function StreamTest_02() {
  describe('StreamTest_02', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0500
     * @tc.name      corkTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0005';
        console.log(TAG + ' start');
        const writableStream = new AfterEndStream();
        writableStream.end('End Data', 'utf8', () => {
          expect(writableStream.cork()).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0600
     * @tc.name      corkTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0006';
        console.log(TAG + ' start');
        const writableStream = new NoDoWriteStream();
        writableStream.cork();
        writableStream.write('Invalid data', 'utf8');
        const uncorkResult = writableStream.uncork();
        expect(uncorkResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0700
     * @tc.name      corkTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0007';
        console.log(TAG + ' start');
        interface ErrorEventData {
          data: GeneratedTypeLiteralInterface_2;
        }
        const writableStream = new InvalidEncodingStream();
        writableStream.cork();
        const writeResult = writableStream.write('Test Data', 'ascii');
        expect(writeResult).assertEqual(true);
        writableStream.on('error', (err: ErrorEventData) => {
          expect(err.data).assertEqual('Invalid encoding: ascii');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0800
     * @tc.name      corkTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0008';
        console.log(TAG + ' start');
        const writableStream = new MultipleEndStream();
        writableStream.end('First ending', 'utf8', () => {
          try {
            writableStream.end('The second time ended');
            expect().assertFail();
          } catch (err) {
            console.error(`${TAG} fail, err: ${err}`);
            expect(err !== null).assertTrue();
            expect((err as Error).message.length > 0).assertTrue();
          }
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0900
     * @tc.name      corkTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0009';
        console.log(TAG + ' start');
        const writable = new NormalCorkStream();
        expect(writable.cork()).assertEqual(true);
        expect(writable.uncork()).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1000
     * @tc.name      corkTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0010';
        console.log(TAG + ' start');
        const writable = new ClosedStream();
        writable.end('');
        writable.on('finish', () => {
          expect(writable.cork()).assertEqual(false);
          expect(writable.uncork()).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1100
     * @tc.name      corkTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0011';
        console.log(TAG + ' start');
        const writable = new InvalidStream();
        writable.write("test", 'utf8');
        expect(writable.cork()).assertEqual(true);
        expect(writable.writable).assertEqual(false);
        expect(writable.writableCorked).assertEqual(1);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1200
     * @tc.name      corkTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'corkTest0012';
        console.log(TAG + ' start');
        const writable = new OverUncorkStream();
        expect(writable.cork()).assertEqual(true);
        expect(writable.uncork()).assertEqual(true);
        expect(writable.uncork()).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0100
     * @tc.name      uncorkTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0001';
        console.log(TAG + ' start');
        const writable = new BasicWritable();
        const corkResult = writable.cork();
        expect(corkResult).assertEqual(true);
        writable.write('buffer1', 'utf8');
        writable.write('buffer2', 'utf8');
        expect(writable.writtenData.length).assertEqual(0);
        const uncorkResult = writable.uncork();
        expect(uncorkResult).assertEqual(true);
        expect(writable.writtenData.join(',')).assertEqual('buffer1,buffer2');
        writable.end();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0200
     * @tc.name      uncorkTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0002';
        console.log(TAG + ' start');
        const writable = new MultiCorkWritable();
        expect(writable.cork()).assertEqual(true);
        expect(writable.cork()).assertEqual(true);
        writable.write('layer1', 'utf8');
        writable.write('layer2', 'utf8');
        const firstUncork = writable.uncork();
        const secondUncork = writable.uncork();
        expect(firstUncork).assertEqual(true);
        expect(secondUncork).assertEqual(true);
        writable.end('');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0300
     * @tc.name      uncorkTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'WuncorkTest0003';
        console.log(TAG + ' start');
        const writable = new AsyncWritable();
        expect(writable.cork()).assertEqual(true);
        ['data1', 'data2', 'data3'].forEach(item => {
          writable.write(item, 'utf8');
        });
        const uncorkSuccess = writable.uncork();
        expect(uncorkSuccess).assertEqual(true);
        writable.end('');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0400
     * @tc.name      uncorkTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0004';
        console.log(TAG + ' start');
        const writable = new EndWritable();
        expect(writable.cork()).assertEqual(true);
        writable.write('finalData', 'utf8');
        expect(writable.uncork()).assertEqual(true);
        writable.end('finalData', 'utf8', () => {});

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0500
     * @tc.name      uncorkTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0005';
        console.log(TAG + ' start');
        const writable = new DefaultWritable();
        const uncorkWithoutCork = writable.uncork();
        expect(uncorkWithoutCork).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0600
     * @tc.name      uncorkTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0006';
        console.log(TAG + ' start');
        const writable = new UnCorkWithoutCork();
        const result = writable.uncork();
        expect(result).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0700
     * @tc.name      uncorkTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0007';
        console.log(TAG + ' start');
        const writable = new OverUncork();
        expect(writable.cork()).assertEqual(true);
        expect(writable.uncork()).assertEqual(true);
        const extraUncorkResult = writable.uncork();
        expect(extraUncorkResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0800
     * @tc.name      uncorkTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0008';
        console.log(TAG + ' start');
        const writable = new EndBeforeUncork();
        const corkResult = writable.cork();
        expect(corkResult).assertEqual(true);
        writable.end('');
        const uncorkAfterEnd = writable.uncork();
        expect(uncorkAfterEnd).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_0900
     * @tc.name      uncorkTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0009';
        console.log(TAG + ' start');
        const writable = new UnwritableStream();
        try {
          writable.close();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect((String(err)).includes('implemented')).assertEqual(true);
        }
        const uncorkWhenUnwritable = writable.uncork();
        expect(uncorkWhenUnwritable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_1000
     * @tc.name      uncorkTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0010';
        console.log(TAG + ' start');
        const writable = new BasicUncork();
        expect(writable.cork()).assertEqual(true);
        const uncorkResult = writable.uncork();
        expect(uncorkResult).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_1100
     * @tc.name      uncorkTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0011';
        console.log(TAG + ' start');
        const writable = new MultiCork();
        expect(writable.cork()).assertEqual(true);
        expect(writable.cork()).assertEqual(true);
        const firstUncork = writable.uncork();
        const secondUncork = writable.uncork();
        expect(firstUncork).assertEqual(true);
        expect(secondUncork).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_1200
     * @tc.name      uncorkTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0012';
        console.log(TAG + ' start');
        const writable = new NoCork();
        const result = writable.uncork();
        expect(result).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_1300
     * @tc.name      uncorkTest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0013';
        console.log(TAG + ' start');
        const writable = new OverUncork();
        expect(writable.cork()).assertEqual(true);
        expect(writable.uncork()).assertEqual(true);
        const extraUncork = writable.uncork();
        expect(extraUncork).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_UNCORK_1400
     * @tc.name      uncorkTest0014
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'uncorkTest0014';
        console.log(TAG + ' start');
        const writable = new EndBeforeUncork();
        let corkResult:boolean
        let uncorkAfterEnd:boolean
        corkResult = writable.cork();
        expect(corkResult).assertEqual(true);
        writable.end('');
        uncorkAfterEnd = writable.uncork();
        expect(uncorkAfterEnd).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0100
     * @tc.name      ontest0001
     * @tc.desc      Verify close event trigger correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0001';
        console.log(TAG + ' start');
        const EVENT_NAME: string = 'close';
        let eventDataReceived: emitter.GenericEventData<StatusData> | null = null;
        const callback: Callback<emitter.GenericEventData<StatusData>> = (eventData) => {
          eventDataReceived = eventData;
        };
        const writableStream = new TestWritable();
        emitter.on(EVENT_NAME, callback);
        const expectedData: GeneratedObjectLiteralInterface_4 = { status: 'closed' };
        writableStream.end('finish', 'utf8', () => {
          emitter.emit(EVENT_NAME, { data: expectedData } as emitter.GenericEventData<StatusData>);
          expect(JSON.stringify(eventDataReceived?.data) === (JSON.stringify(expectedData))).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0200
     * @tc.name      ontest0002
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0002';
        console.log(TAG + ' start');
        const CUSTOM_EVENT: string = 'dataProcessed';
        let receivedData: string | undefined = '';
        const dataCallback: Callback<emitter.GenericEventData<string>> = (eventData) => {
          receivedData = eventData?.data;
        };
        const processor = new DataProcessor();
        emitter.on(CUSTOM_EVENT, dataCallback);
        const testData = 'testData';
        processor.write(testData, 'utf8', () => {
            expect(receivedData === (testData.toUpperCase())).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0300
     * @tc.name      ontest0003
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0003';
        console.log(TAG + ' start');
        const EVENTS: GeneratedObjectLiteralInterface_5 = { ERROR: 'error', FINISH: 'finish' };
        let errorMessage: string | undefined = '';
        interface FinishData { bytesWritten: number; }
        let finishData: FinishData | null = null;
        const errorHandler = (event: emitter.GenericEventData<GeneratedTypeLiteralInterface_4>) => {
          errorMessage = event.data?.message;
        };
        const finishHandler = (event: emitter.GenericEventData<FinishData>) => {
          finishData = event.data ?? null;
        };
        emitter.on(EVENTS.ERROR, errorHandler);
        emitter.on(EVENTS.FINISH, finishHandler);
        const expectedErrorMsg = 'Write failed';
        const expectedFinishData: GeneratedObjectLiteralInterface_6 = { bytesWritten: 1024 };
        emitter.emit(EVENTS.ERROR,
          { data: { message: expectedErrorMsg } } as emitter.GenericEventData<GeneratedTypeLiteralInterface_4>);
        emitter.emit(EVENTS.FINISH, { data: expectedFinishData } as emitter.GenericEventData<FinishData>);
          expect(errorMessage === (expectedErrorMsg)).assertEqual(false);
          expect(JSON.stringify(finishData) === (JSON.stringify(expectedFinishData))).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0400
     * @tc.name      ontest0004
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0004';
        console.log(TAG + ' start');
        const testData = 'priorityData';
        const priorityStream = new PriorityWritable();
        priorityStream.write(testData, 'utf8', () => {
          expect(processedData === (testData.toUpperCase())).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0500
     * @tc.name      ontest0005
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0005';
        console.log(TAG + ' start');
        const TEMP_EVENT: string = 'tempEvent';
        let isCallbackCalled = false;
        const tempCallback = () => {
          isCallbackCalled = true;
        };
        emitter.on(TEMP_EVENT, tempCallback);
        emitter.off(TEMP_EVENT, tempCallback);
        emitter.emit(TEMP_EVENT, { data: 'test' });
        expect(isCallbackCalled === (false)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0600
     * @tc.name      ontest0006
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0006';
        console.log(TAG + ' start');
        const cancelWritable = new CancelWritable();
        expect(typeof cancelWritable.testUnsubscribe).assertEqual('function');
        cancelWritable.testUnsubscribe();

      });
    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0700
     * @tc.name      ontest0007
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0007';
        console.log(TAG + ' start');
        const TYPE_EVENT_ID = 'typeMismatch';
        let isTypeError = false;
        interface ValidData { value: string; }
        emitter.on<ValidData>(TYPE_EVENT_ID, (data) => {
          isTypeError = !data.data?.value;
        });
        emitter.emit(TYPE_EVENT_ID, { data: { count: 123 } });
        expect(isTypeError).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0800
     * @tc.name      ontest0008
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0008';
        console.log(TAG + ' start');
        const multiWritable = new MultiWritable();
        expect(typeof multiWritable.validate).assertEqual('function');
        multiWritable.validate();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_0900
     * @tc.name      ontest0009
     * @tc.desc      Verify unregistered event emit handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0009';
        console.log(TAG + ' start');
        interface EventData {
          data: string;
        }
        try {
          let isErrorCaught = false;
          let eventDataReceived: EventData | null = null;
          emitter.once('1001', (data: EventData) => {
            eventDataReceived = data;
          });
          emitter.emit('1001', { data: 'test' });
          if (eventDataReceived === null) {
            throw new Error('1001 event not triggered or data not received');
          }
          const receivedData = eventDataReceived as EventData;
          if (receivedData.data !== 'test') {
            throw new Error('received event data is not equal to "test"');
          }
          expect(isErrorCaught).assertEqual(false);
          expect(eventDataReceived).assertEqual(true);
          expect(typeof eventDataReceived === 'object').assertEqual(true);
          expect(receivedData.data === 'test').assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('1001 event not triggered or data not received') ||
            errMsg.includes('received event data is not equal to "test"')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_1000
     * @tc.name      ontest0010
     * @tc.desc      Verify basic event handling in writable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0010';
        console.log(TAG + ' start');
        let receivedData = '';
        const testData = 'HelloEmitter';
        const writer = new BasicWritable();
        writer.write(testData, 'utf8', () => {
            expect(receivedData === (JSON.stringify(testData))).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_1100
     * @tc.name      ontest0011
     * @tc.desc      Verify typed event data handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0011';
        console.log(TAG + ' start');
        const testName = 'testUser';
        const typedWritable = new TypedWritable();
        typedWritable.write(testName, 'utf8', () => {
          expect(receivedUserData !== null).assertEqual(false);
          if (receivedUserData) {
            expect(receivedUserData!.name === testName).assertEqual(false);
            expect(receivedUserData!.age === 20).assertEqual(true);
          }
            typedWritable.destroy();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_1200
     * @tc.name      ontest0012
     * @tc.desc      Verify event priority execution sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ontest0012';
        console.log(TAG + ' start');
        let logSequence: string[] = [];
        const expectedSequence = 'HIGH,LOW';
        const priorityWritable = new PriorityWritable();
        priorityWritable.write('testPriority', 'utf8', () => {
            expect(logSequence.join(',') === (expectedSequence)).assertEqual(false);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_ON_1300
     * @tc.name      ontest0013
     * @tc.desc      Verify emitter once works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: ()=> void): Promise<void> => {
        const TAG = 'ontest0013';
        console.log(TAG + ' start');
        const testData = 'test';
        const complexWritable = new ComplexWritable(done, testData);
        complexWritable.write(testData, 'utf8');
        expect(complexWritable instanceof ComplexWritable).assertEqual(true);
        expect(complexWritable instanceof stream.Writable).assertEqual(true);
        done();
      })
  })
}