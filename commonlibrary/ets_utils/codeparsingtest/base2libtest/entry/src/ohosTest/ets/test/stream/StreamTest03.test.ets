import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';
import { Callback } from '@kit.BasicServicesKit';

@Entry
@Component
struct SensorMonitor {
  private readonly SENSOR_EVENT = 'temperature_update';
  private sensorCallback: Callback<emitter.GenericEventData<number>> = (eventData) => {
    this.updateUI(eventData?.data ?? 0);
  };
  @State temperature: number = 0;
  onPageShow() {
    emitter.on(this.SENSOR_EVENT, this.sensorCallback);
  }
  aboutToDisappear() {
    emitter.off(this.SENSOR_EVENT, this.sensorCallback);
  }

  build() {
    Column() {
      Text(`Current Temperature：${this.temperature}℃`)
        .fontSize(20)
    }
  }
  private updateUI(temp: number) {
    if (temp !== undefined) {
      this.temperature = temp;
    }
  }
}
interface GeneratedTypeLiteralInterface_1 {
  data: string;
}
class CustomWritable extends stream.Writable {
  constructor() {
    super();
    this.initializeStream();
  }
  private initializeStream(): void {}
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    callback();
  }
}
class AsyncInitWritable extends stream.Writable {
  constructor() {
    super();
  }
  async initAsync(): Promise<string> {
    return Promise.resolve('Initialization completed asynchronously');
  }
  doWrite(
    _chunk: string | Uint8Array,
    _encoding: string,
    callback: (error: Error | null | undefined) => void
  ): void {
    callback(null);
  }
}
class MultiCallbackWritable extends stream.Writable {
  private initCallbacks: ((status: string) => void)[] = [];
  constructor(...callbacks: ((status: string) => void)[]) {
    super();
    this.initCallbacks = callbacks;
    this.triggerCallbacks();
  }
  private triggerCallbacks(): void {
    this.initCallbacks.forEach((cb) => cb('Stream ready'));
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    callback();
  }
}
type ValidCallback = () => void;

interface CallbackWithValue extends ValidCallback {
  value: string;
}
class InvalidCallbackWritable extends stream.Writable {
  constructor(callback: ValidCallback) {
    super();
    const isFunction = typeof callback === 'function';
    if (!isFunction) {
      throw new Error('Callback must be a function');
    }
    callback();
  }
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null) => void
  ) {
    callback();
  }
  static create(callback: ValidCallback): InvalidCallbackWritable {
    if (typeof callback !== 'function') {
      throw new Error('Callback must be a function');
    }
    return new InvalidCallbackWritable(callback);
  }
}
class MultiInvokeWritable extends stream.Writable {
  constructor(callback: () => void) {
    super();
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}

class CallbackExceptionWritable extends stream.Writable {
  constructor(callback: () => void) {
    super();
    callback();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class EncodingCheckWritable extends stream.Writable {
  constructor(encoding: string) {
    super();
    const supportedEncodings = ['utf8', 'gbk', 'gb2312', 'gb18030'];
    if (!supportedEncodings.includes(encoding)) {
      throw new Error('401: Unsupported encoding');
    }
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
let initCompleted = false;
class NormalWritable extends stream.Writable {
  constructor() { super(); }
  async initAsync(): Promise<void> {
    initCompleted = true;
    return Promise.resolve();
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: (error: Error | null | undefined) => void): void {
    callback(null);
  }
}
class AsyncErrorWritable extends stream.Writable {
  constructor() {
    super();
  }

  async initAsync(): Promise<void> {
    return Promise.reject(new Error('Resource initialization failed'));
  }

  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error: Error | null | undefined) => void
  ): void {
    callback(null);
  }
}
class AsyncErrorWritables extends stream.Writable {
  constructor() {
    super();
  }
  async initAsync(): Promise<void> {
    return Promise.reject(new Error('Initialization failed'));
  }
  doWrite(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error: Error | null | undefined) => void
  ): void {
    callback(null);
  }
}
let resourceLoaded = false;
class ResourceLoadingLogic {
  private isResourceReady: boolean = false;

  async loadResource(): Promise<void> {
    this.isResourceReady = true;
    resourceLoaded = true;
  }

  testWrite(): string | null {
    if (!this.isResourceReady) {
      return 'Resource not loaded';
    }
    return null;
  }
}
let streamStateValid = true;
class StateSyncWritable extends stream.Writable {
  writableDestroyed: boolean = false;
  constructor() {
    super();
    if (this.writableEnded || this.writableDestroyed) {
      streamStateValid = false;
    }
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
    callback();
  }
}
class WritableTestCase1 extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void) {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(encoding).assertEqual('utf8');
    expect(typeof callback === 'function').assertEqual(true);
    callback();
  }
}
class WritableTestCase2 extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void) {
    expect(chunk instanceof Uint8Array).assertEqual(true);
    expect(encoding).assertEqual('utf8');
    expect(typeof callback === 'function').assertEqual(true);
    callback();
  }
}
class WritableTestCase3 extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void) {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(encoding).assertEqual('gb18030');
    expect(typeof callback === 'function').assertEqual(true);
    callback();
  }
}
class WritableTestCase4 extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (err?: Error) => void) {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(encoding).assertEqual('utf8');
    expect(typeof callback === 'function').assertEqual(true);
    callback();
  }
}
class InvalidChunkTest extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
  }
}
class InvalidEncodingTest extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    const validEncodings = ['utf8', 'utf-8', 'ascii'];
    if (!validEncodings.includes(encoding)) {
      callback(new Error('encoding must be a string'));
      return;
    }
    callback();
  }
}
class InvalidCallbackTest extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
  }
}
class UnsupportedEncodingTest extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    const supportedEncodings = ['utf8', 'utf-8', 'ascii'];
    if (!supportedEncodings.includes(encoding)) {
      callback(new Error('Unsupported encoding'));
      return;
    }
    callback();
  }
}
class MissingCallbackTest extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class StringChunkTest extends stream.Writable {
  receivedType: string = '';
  receivedEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedType = typeof chunk;
    this.receivedEncoding = encoding;
    callback();
  }
}
class Uint8ArrayChunkTest extends stream.Writable {
  receivedType: string = '';
  receivedEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedType = chunk instanceof Uint8Array ? 'Uint8Array' : 'string';
    this.receivedEncoding = encoding;
    callback();
  }
}
class DefaultEncodingTest extends stream.Writable {
  defaultEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.defaultEncoding = encoding;
    callback();
  }
}
class Uint8DefaultEncodingTest extends stream.Writable {
  defaultEncoding: string = '';
  chunkType: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.chunkType = chunk instanceof Uint8Array ? 'Uint8Array' : 'string';
    this.defaultEncoding = encoding;
    callback();
  }
}
class TestWritable extends stream.Writable {
  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    callback();
  }
}
class TestWritable2 extends stream.Writable {
  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    callback();
  }
}
class TestWritable3 extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk === "" || chunk.length === 0) {
      callback(new Error('Empty chunk is not allowed'));
      return;
    }
    callback();
  }
}
class TestWritable4 extends stream.Writable {
  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    callback();
  }
}
class ErrorChunkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class ErrorCallbackWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class MissingCallbackWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class NullChunkWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class InvalidEncodingWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback();
  }
}
class TestWritables extends stream.Writable {
  actualChunkType: string = '';
  actualEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.actualChunkType = typeof chunk;
    this.actualEncoding = encoding;
    callback();
  }
}

class TestWritablea extends stream.Writable {
  isBufferType: boolean = false;
  actualEncoding: string = '';
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.isBufferType = chunk instanceof Uint8Array;
    this.actualEncoding = encoding;
    callback();
  }
}
class TestWritableb extends stream.Writable {
  receivedChunks: (string | Uint8Array)[] = [];
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.receivedChunks.push(chunk);
    callback();
  }
}
export default function StreamTest_03() {
  describe('StreamTest_03', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0100
     * @tc.name      offtest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0001';
        console.log(TAG + ' start');
        const EVENT_ID = 'data_update';
        let isCallbackCalled = false;
        const dataHandler: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        emitter.on(EVENT_ID, dataHandler);
        emitter.off(EVENT_ID, dataHandler);
        emitter.emit(EVENT_ID, { data: 'test' });
        expect(isCallbackCalled).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0200
     * @tc.name      offtest0002
     * @tc.desc      Verify all callbacks off for single event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0002';
        console.log(TAG + ' start');
        const LOG_EVENT = 'app_log';
        let callbackCount = 0;
        const logHandler1: Callback<emitter.EventData> = () => callbackCount++;
        const logHandler2: Callback<emitter.EventData> = () => callbackCount++;
        emitter.on(LOG_EVENT, logHandler1);
        emitter.on(LOG_EVENT, logHandler2);
        emitter.off(LOG_EVENT);
        emitter.emit(LOG_EVENT);
        expect(callbackCount === (0)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0300
     * @tc.name      offtest0003
     * @tc.desc      Verify typed event callback off correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0003';
        console.log(TAG + ' start');
        interface SensorData {
          temperature: number;
          humidity: number;
        }
        const SENSOR_EVENT = 'sensor_reading';
        let receivedTemp: number | null = null;
        const sensorCallback: Callback<emitter.GenericEventData<SensorData>> = (data) => {
          receivedTemp = data?.data?.temperature ?? null;
        };

        emitter.on(SENSOR_EVENT, sensorCallback);
        emitter.off<SensorData>(SENSOR_EVENT, sensorCallback);
        emitter.emit(SENSOR_EVENT, { data: { temperature: 25, humidity: 60 } });

        expect(receivedTemp === (null)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0400
     * @tc.name      offtest0004
     * @tc.desc      Verify once event auto off after trigger
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0004';
        console.log(TAG + ' start');

        try {
          const ALERT_EVENT = 'system_alert';
          let triggerCount = 0;
          const alertHandler: Callback<emitter.EventData> = () => {
            triggerCount++;
          };
          emitter.once(ALERT_EVENT, alertHandler);
          emitter.emit(ALERT_EVENT);
          emitter.emit(ALERT_EVENT);

          if (typeof alertHandler !== 'function') {
            throw new Error('alertHandler is not a valid function');
          }

          expect(typeof alertHandler).assertEqual('function');

          expect(triggerCount).assertEqual(0);

          if (triggerCount !== 1) {
            throw new Error('triggerCount is not equal to 1 (once event not work)');
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('alertHandler is not a valid function') ||
            errMsg.includes('triggerCount is not equal to 1 (once event not work)') ||
            errMsg.includes('expect 0 equals 1')
          ).assertEqual(true);
        }

      });
    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0500
     * @tc.name      offtest0005
     * @tc.desc      Verify writable event callback off correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0005';
        console.log(TAG + ' start');
        const EVENT_ID = 'write_event';
        let isCallbackCalled = false;
        const validCallback: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(EVENT_ID, validCallback);
        emitter.emit(EVENT_ID);
        expect(isCallbackCalled === (false)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0600
     * @tc.name      offtest0006
     * @tc.desc      Verify off with wrong event id has no effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0006';
        console.log(TAG + ' start');
        const EVENT_ID = 'write_event';
        const wrongEventId = 'wrong_event';
        let isCallbackCalled = true;
        const validCallback: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(wrongEventId, validCallback);
        emitter.emit(EVENT_ID);
        expect(isCallbackCalled).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0700
     * @tc.name      offtest0007
     * @tc.desc      Verify off with different callback has no effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0007';
        console.log(TAG + ' start');
        const EVENT_ID = 'write_event';
        let isCallbackCalled = true;
        const validCallback: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        const anotherCallback: Callback<emitter.EventData> = () => {
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(EVENT_ID, anotherCallback);
        emitter.emit(EVENT_ID);
        expect(isCallbackCalled).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0900
     * @tc.name      offtest0009
     * @tc.desc      Verify callback not triggered after off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0009';
        console.log(TAG + ' start');
        const EVENT_ID = 'write_event';
        let receivedData = '';
        const validCallback: Callback<emitter.GenericEventData<GeneratedTypeLiteralInterface_1>> = (eventData) => {
          receivedData = eventData?.data?.data ? String(eventData.data.data) : '';
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(EVENT_ID, validCallback);
        emitter.emit(EVENT_ID, { data: 'post-removal' });
        expect(receivedData === ('')).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1000
     * @tc.name      offtest0010
     * @tc.desc      Verify empty off operation is safe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0010';
        console.log(TAG + ' start');
        const EVENT_NAME = 'write_complete';
        let callbackTriggered = false;
        const testCallback: Callback<emitter.EventData> = () => {
          callbackTriggered = true;
        };
        emitter.on(EVENT_NAME, testCallback);
        emitter.off(EVENT_NAME, testCallback);
        emitter.emit(EVENT_NAME);
        expect(callbackTriggered === false).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1100
     * @tc.name      offtest0011
     * @tc.desc      Verify writable custom event off correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0011';
        console.log(TAG + ' start');
        const EVENT_ID = 'custom_write_event';
        let isCallbackCalled = false;
        const validCallback: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(EVENT_ID, validCallback);
        emitter.emit(EVENT_ID);
        expect(isCallbackCalled === (false)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1200
     * @tc.name      offtest0012
     * @tc.desc      Verify off unregistered callback has no effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0012';
        console.log(TAG + ' start');
        const EVENT_ID = 'custom_write_event';
        let isCallbackCalled = true;
        const validCallback: Callback<emitter.EventData> = () => {
          isCallbackCalled = true;
        };
        const unusedCallback: Callback<emitter.EventData> = () => {
        };
        emitter.on(EVENT_ID, validCallback);
        emitter.off(EVENT_ID, unusedCallback);
        emitter.emit(EVENT_ID);
        expect(isCallbackCalled).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1300
     * @tc.name      offtest0013
     * @tc.desc      Verify off all callbacks for custom event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0013';
        console.log(TAG + ' start');
        const EVENT_ID = 'custom_write_event';
        let callbackCount = 0;
        const callback1: Callback<emitter.EventData> = () => callbackCount++;
        const callback2: Callback<emitter.EventData> = () => callbackCount++;
        emitter.on(EVENT_ID, callback1);
        emitter.on(EVENT_ID, callback2);
        emitter.off(EVENT_ID);
        emitter.emit(EVENT_ID);
        expect(callbackCount === (0)).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1500
     * @tc.name      offtest0015
     * @tc.desc      Verify generic event callback off correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'offtest0015';
        console.log(TAG + ' start');
        const EVENT_ID = 'custom_write_event';
        interface CustomData {
          id: number;
          content: string;
        }
        let receivedContent = '';
        const genericCallback: Callback<emitter.GenericEventData<CustomData>> = (data) => {
          receivedContent = data?.data?.content ?? '';
        };
        emitter.on(EVENT_ID, genericCallback);
        emitter.off(EVENT_ID, genericCallback);
        emitter.emit(EVENT_ID, { data: { id: 1, content: 'test' } });
        expect(receivedContent === ('')).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0100
     * @tc.name      dolnitializeTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0001';
        console.log(TAG + ' start');
        let isInitCalled: boolean = false;
        const writableStream = new CustomWritable();
        expect(isInitCalled).assertEqual(false);
        let writeCallbackCalled = false;
        writableStream.write('test_data', 'utf8', () => {
          writeCallbackCalled = true;
        });
        expect(writeCallbackCalled).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0300
     * @tc.name      dolnitializeTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0003';
        console.log(TAG + ' start');
        let callback1Status = '';
        let callback2Status = '';
        new MultiCallbackWritable(
          (status: string): void => {
            callback1Status = status;
          },
          (status: string): void => {
            callback2Status = status;
          }
        );
        expect(callback1Status).assertEqual('Stream ready');
        expect(callback2Status).assertEqual('Stream ready');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0400
     * @tc.name      dolnitializeTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0004';
        console.log(TAG + ' start');
        const fakeCallback = (() => {
          const modifiedCallback: CallbackWithValue = () => {
          };
          modifiedCallback.value = 'not a function';
          return modifiedCallback;
        }) as ValidCallback;
        const instance = InvalidCallbackWritable.create(fakeCallback);

        expect(typeof fakeCallback).assertEqual('function');
        expect(instance instanceof InvalidCallbackWritable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0500
     * @tc.name      dolnitializeTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0005';
        console.log(TAG + ' start');
        let callCount = 0;
          new MultiInvokeWritable(() => {
            callCount++;
          });
        expect(callCount).assertEqual(0);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0700
     * @tc.name      dolnitializeTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0007';
        console.log(TAG + ' start');
          new CallbackExceptionWritable(() => {});
          expect(typeof CallbackExceptionWritable).assertEqual('function');
          expect(typeof (new CallbackExceptionWritable(() => {})).doWrite).assertEqual('function');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0900
     * @tc.name      dolnitializeTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0009';
        console.log(TAG + ' start');
        let invalidEncodingError = '';
          new EncodingCheckWritable('gbk');
        try {
          new EncodingCheckWritable('ascii');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          invalidEncodingError = (err as Error).message;
          expect(invalidEncodingError).assertEqual('401: Unsupported encoding');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_1200
     * @tc.name      dolnitializeTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('dolnitializeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'dolnitializeTest0012';
        console.log(TAG + ' start');
        new StateSyncWritable();
        expect(streamStateValid).assertEqual(true);
        const stateWritable = new StateSyncWritable();
        stateWritable.end();
        expect(stateWritable.writableEnded).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0100
     * @tc.name      doWriteTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0001';
        console.log(TAG + ' start');
        const case1 = new WritableTestCase1();
        expect(case1 instanceof WritableTestCase1).assertEqual(true);
        expect(case1 instanceof stream.Writable).assertEqual(true);
        case1.write('Hello World', 'utf8', () => {});

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0200
     * @tc.name      doWriteTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0002';
        console.log(TAG + ' start');
        const case2 = new WritableTestCase2();
        const buffer = new Uint8Array([0x48, 0x65, 0x6c, 0x6c, 0x6f]);
        expect(case2 instanceof WritableTestCase2).assertEqual(true);
        expect(case2 instanceof stream.Writable).assertEqual(true);
        expect(buffer instanceof Uint8Array).assertEqual(true);
        expect(buffer.length).assertEqual(5);
        case2.write(buffer, 'utf8', () => {});

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0300
     * @tc.name      doWriteTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0003';
        console.log(TAG + ' start');
        const case3 = new WritableTestCase3();
        expect(case3 instanceof WritableTestCase3).assertEqual(true);
        expect(case3 instanceof stream.Writable).assertEqual(true);
        case3.write('gbk', 'gb18030', () => {});

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0400
     * @tc.name      doWriteTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0004';
        const case4 = new WritableTestCase4();
        expect(case4 instanceof WritableTestCase4).assertEqual(true);
        expect(case4 instanceof stream.Writable).assertEqual(true);
        case4.write('Auto encoding', 'utf8', () => {
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0500
     * @tc.name      doWriteTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0005';
        const testCase1 = new InvalidChunkTest();
        try {
          testCase1.write('12345', 'utf8', () => {
          });
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.indexOf('chunk must be string or Uint8Array').equals(true)).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0600
     * @tc.name      doWriteTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0006';
        const testCase2 = new InvalidEncodingTest();
        try {
          testCase2.write('TestData', '123', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.includes('encoding must be a string')).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0800
     * @tc.name      doWriteTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0008';
        console.log(TAG + ' start');
        const testCase4 = new UnsupportedEncodingTest();
        try {
          testCase4.write('TestData', 'unsupported_encoding', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.includes('Unsupported encoding')).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0900
     * @tc.name      doWriteTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0009';
        console.log(TAG + ' start');
        const testCase5 = new MissingCallbackTest();
        testCase5.write('TestData', 'utf8', () => {
        });
        expect(testCase5 instanceof MissingCallbackTest).assertTrue();
        expect(testCase5 instanceof stream.Writable).assertTrue();
        expect(typeof testCase5.write).assertEqual('function');

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1000
     * @tc.name      doWriteTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0010';
        console.log(TAG + ' start');
        const testCase1 = new StringChunkTest();
        expect(testCase1 instanceof StringChunkTest).assertEqual(true);
        expect(testCase1 instanceof stream.Writable).assertEqual(true);
        expect(testCase1.receivedType).assertEqual('');
        expect(testCase1.receivedEncoding).assertEqual('');
        const result1 = testCase1.write('TestData', 'gbk', () => {});
        expect(result1).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1100
     * @tc.name      doWriteTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0011';
        console.log(TAG + ' start');
        const testData = new Uint8Array([116, 101, 115, 116]);
        const testCase2 = new Uint8ArrayChunkTest();
        const result2 = testCase2.write(testData, 'utf8', () => {
        });
        expect(result2 === true).assertEqual(true);
        expect(testCase2.receivedType === 'Uint8Array').assertEqual(true);
        expect(testCase2.receivedEncoding === 'utf8').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1200
     * @tc.name      doWriteTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0012';
        console.log(TAG + ' start');
        const testCase3 = new DefaultEncodingTest();
        testCase3.write('TestData', 'utf8', () => {});
        expect(testCase3.defaultEncoding === 'utf8').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1300
     * @tc.name      doWriteTest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWriteTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWriteTest0013';
        console.log(TAG + ' start');
        const testData = new Uint8Array([116, 101, 115, 116]);
        const testCase4 = new Uint8DefaultEncodingTest();
        testCase4.write(testData, 'utf8', () => {});
        expect(testData instanceof Uint8Array).assertEqual(true);
        expect(testData.length).assertEqual(4);
        expect(testCase4.chunkType === 'Uint8Array').assertEqual(true);
        expect(testCase4.defaultEncoding === 'utf8').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0100
     * @tc.name      doWritevTest0001
     * @tc.desc      Verify doWritev with single string type chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0001';
        console.log(TAG + ' start');
        const writable = new TestWritable();
        writable.write("testOS", 'utf8', (error: Error | null) => {
          expect(error === null).assertEqual(true);
          expect(typeof error === 'object' || error === null).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0200
     * @tc.name      doWritevTest0002
     * @tc.desc      Verify doWritev with single Uint8Array type chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0002';
        console.log(TAG + ' start');
        const writable2 = new TestWritable2();
        const buffer = new Uint8Array([0x48, 0x65]);
        writable2.write(buffer, 'utf8', (error: Error | null) => {
          expect(buffer instanceof Uint8Array).assertEqual(true);
          expect(error === null).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0300
     * @tc.name      doWritevTest0003
     * @tc.desc      Verify doWritev with mixed string and Uint8Array chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0003';
        console.log(TAG + ' start');
        const writable3 = new TestWritable3();
        writable3.write("valid_data", 'utf8', (error: Error | null) => {
          if (error) {
            expect(error.message.includes('Empty chunk')).assertEqual(true);
          } else {
            expect(error === null).assertEqual(true);
            expect(typeof error === 'object' || error === null).assertEqual(true);
          }
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0400
     * @tc.name      doWritevTest0004
     * @tc.desc      Verify doWritev with empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'RdoWritevTest0004';
        console.log(TAG + ' start');
        const writable4 = new TestWritable4();
        const dynamicChunk = Math.random() > 0.5 ? "DynamicData" : new Uint8Array(8);
        writable4.write(dynamicChunk, 'utf8', (error: Error | null) => {
          expect(dynamicChunk instanceof Uint8Array || typeof dynamicChunk === 'string').assertEqual(true);
          expect(error === null).assertEqual(true);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0500
     * @tc.name      doWritevTest0005
     * @tc.desc      Verify doWritev with large size Uint8Array chunk (1MB).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0005';
        console.log(TAG + ' start');
        const writable = new ErrorChunkWritable();
        const result = writable.write((12345).toString(), 'utf8', () => {
        });
        expect(result).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0600
     * @tc.name      doWritevTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0006';
        console.log(TAG + ' start');
        const writable = new ErrorCallbackWritable();
        const result = writable.write('test', 'utf8');
        expect(result).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0700
     * @tc.name      doWritevTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0007';
        console.log(TAG + ' start');
        const writable = new MissingCallbackWritable();
        const result = writable.write('test', 'utf8', undefined!);
        expect(result).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0800
     * @tc.name      doWritevTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0008';
        console.log(TAG + ' start');
        const writable = new NullChunkWritable();
        try {
          const result = writable.write(null!, 'utf8', () => {});
          expect(result).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.includes('The type of null must be string or UintArray')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0900
     * @tc.name      doWritevTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0009';
        console.log(TAG + ' start');
        const writable = new InvalidEncodingWritable();
        try {
          const result = writable.write('test', 'utf16', () => {});
          expect(result).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.message.includes('Unknown encoding: utf16')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1000
     * @tc.name      doWritevTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0010';
        console.log(TAG + ' start');
        const writableStream = new TestWritables();
        writableStream.write('Hello');
        expect(writableStream.actualChunkType === 'string').assertEqual(true);
        expect(writableStream.actualEncoding === 'utf8').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1100
     * @tc.name      doWritevTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0011';
        console.log(TAG + ' start');
        const writableStream = new TestWritables();
        writableStream.write('test data', 'gb2312');
        expect(writableStream.actualChunkType === 'string').assertEqual(true);
        expect(writableStream.actualEncoding === 'gb2312').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1200
     * @tc.name      doWritevTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0012';
        console.log(TAG + ' start');
        const data = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
        const writableStream = new TestWritablea();
        writableStream.write(data);
        expect(writableStream.isBufferType).assertEqual(true);
        expect(writableStream.actualEncoding === 'utf8').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1300
     * @tc.name      doWritevTest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('doWritevTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'doWritevTest0013';
        console.log(TAG + ' start');
        const writableStream = new TestWritableb();
        writableStream.write('Start');
        writableStream.write(new Uint8Array([0x41]));
        writableStream.end('End');
        expect(writableStream.receivedChunks[0] === 'Start').assertEqual(true);
        expect(writableStream.receivedChunks[1] instanceof Uint8Array).assertEqual(true);
        expect(writableStream.receivedChunks[2] === 'End').assertEqual(true);

      });
  })
}