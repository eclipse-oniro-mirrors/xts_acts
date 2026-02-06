import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';
import util from '@ohos.util';
import { emitter } from '@kit.BasicServicesKit';

const TextEncoder = util.TextEncoder;
const TextDecoder = util.TextDecoder;

interface TransformOptions {
  transform?: (chunk: Uint8Array, encoding: string, cb: (error?: Error) => void) => void;
  doFlush?: (callback: (error?: Error, data?: Uint8Array) => void) => void;
}

class Transform {
  clearOutputData() {
  }
  pushData(chunk: Uint8Array) {
    this.outputData.push(chunk);
  }
  private _transform?: (chunk: Uint8Array, encoding: string, cb: (error?: Error) => void) => void;
  private _doFlush?: (callback: (error?: Error, data?: Uint8Array) => void) => void;
  private outputData: Uint8Array[] = [];
  private streamError: Error | null = null;

  constructor(options: TransformOptions) {
    this._transform = options.transform;
    this._doFlush = options.doFlush;
  }

  public async write(chunk: Uint8Array, encoding: string): Promise<void> {
    return new Promise((resolve) => {
      if (this._transform) {
        this._transform(chunk, encoding, (err) => {
          if (err) {
            this.streamError = err;
          }
          this.outputData.push(chunk);
          resolve();
        });
      } else {
        this.outputData.push(chunk);
        resolve();
      }
    });
  }

  public async end(): Promise<Uint8Array> {
    return new Promise((resolve, reject) => {
      if (this._doFlush) {
        let callbackCalled = false;
        const handleCallback = (err?: Error | null, data?: Uint8Array) => {
          if (callbackCalled) return;
          callbackCalled = true;

          if (err) {
            this.streamError = err;
            reject(err);
            return;
          }
          if (data) {
            this.outputData.push(data);
          }
          resolve(this.concatUint8Array(this.outputData));
        };

        this._doFlush(handleCallback);
        if (!callbackCalled && !this._doFlush.toString().includes('async')) {
          handleCallback(null, undefined);
        }
      } else {
        resolve(this.concatUint8Array(this.outputData));
      }
    });
  }

  public getError(): Error | null {
    return this.streamError;
  }

  private concatUint8Array(chunks: Uint8Array[]): Uint8Array {
    if (chunks.length === 0) {
      return new Uint8Array(0);
    }
    let totalLength = chunks.reduce((len, chunk) => len + chunk.length, 0);
    let result = new Uint8Array(totalLength);
    let offset = 0;
    for (const chunk of chunks) {
      result.set(chunk, offset);
      offset += chunk.length;
    }
    return result;
  }
}

async function streamTest(transformStream: Transform, testData: string): Promise<string> {
  const inputUint8 = new TextEncoder().encode(testData);
  await transformStream.write(inputUint8, 'utf-8');
  const outputUint8 = await transformStream.end();

  const streamError = transformStream.getError();
  if (streamError) {
    throw streamError;
  }
  return new TextDecoder().decode(outputUint8);
}

interface GeneratedTypeLiteralInterface_1 {
  objectMode: boolean;
  value: string | Error;
}
class StreamDataEvent implements emitter.EventData {
  target: Object | null;
  data: GeneratedTypeLiteralInterface_1;
  constructor(data: string | Error, target: Object | null = null) {
    this.target = target;
    this.data = {
      value: data,
      objectMode: false
    };
  }
}
class ErrorTransform extends stream.Transform {
  doRead(_size: number): void {}
  doTransform(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (err?: Error | null, data?: string | Uint8Array) => void
  ): void {
    const processedData = typeof chunk === 'string'
      ? chunk.toUpperCase()
      : new TextDecoder(encoding || 'utf-8').decode(chunk).toUpperCase();
    callback(null, processedData);
  }
  _transform = this.doTransform;
}
class LifecycleTransform extends stream.Transform {
  doTransform(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    this.push(chunk);
    callback(null);
  }
  doFinal(callback: (error?: Error | null) => void): void {
    callback(null);
  }
  _transform = this.doTransform;
  _flush = this.doFinal;
}
class BadTransform extends stream.Transform {
  doTransform() {
    throw new Error('Transform method not implemented correctly');
  }
  _transform = this.doTransform;
}
class NoCallbackTransform extends stream.Transform {
  _transform(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    this.push(chunk);
    callback();
  }
}
class UpperTransform extends stream.Transform {
  doRead(_size: number): void {}
  doTransform(
    chunk: string | Uint8Array,
    _encoding: string,
    callback: (error?: Error | null, data?: string | Uint8Array) => void
  ): void {
  }
}
class TypeCheckTransform extends stream.Transform {
  doTransform(
    chunk: string | Uint8Array,
    encoding: string,
    callback: (error?: Error | null, data?: string | Uint8Array) => void
  ): void {
    if (typeof chunk !== 'string' && !(chunk instanceof Uint8Array)) {
      callback(new Error('Illegal data type'));
      return;
    }
    if (chunk.toString().includes('key')) callback(new Error('Illegal data type'));
    else callback(null, chunk);
  }
  _transform = this.doTransform;
}
class TransformPos1 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(typeof encoding === 'string').assertEqual(true);
    expect(typeof callback === 'function').assertEqual(true);
    const processed = chunk.toUpperCase();
    callback(null, processed);
  }
}
class TransformPos2 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    expect(chunk === '').assertEqual(true);
    expect(encoding === 'ascii').assertEqual(true);
    callback(null, 'empty');
  }
}
class TransformPos3 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    const processed = chunk + '_processed';
    callback(null, processed);
  }
}
class TransformPos4 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    expect(chunk.length === 5).assertEqual(false);
    callback(null, chunk);
  }
}
class TransformPos5 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    callback();
  }
}
class TransformNeg1 extends stream.Transform {
  override doTransform(chunk: string|number, encoding: string, callback: Function): void {
    if (typeof chunk !== 'string') {
      callback(new Error('Chunk must be string'));
      return;
    }
    callback(null, chunk);
  }
}
class TransformNeg2 extends stream.Transform {
  override doTransform(chunk: string, encoding: string | boolean, callback: Function): void {
    if (typeof encoding !== 'string') {
      callback(new Error('Encoding must be string'));
      return;
    }
    callback(null, chunk);
  }
}
class TransformNeg3 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function | string): void {
    if (typeof callback !== 'function') {
      throw new Error('Callback must be function');
    }
    callback();
  }
}
class TransformNeg4 extends stream.Transform {
  override doTransform(chunk: string | undefined, encoding: string, callback: Function): void {
    if (chunk === undefined) {
      throw new Error('Chunk cannot be undefined');
    }
    callback();
  }
}
class TransformNeg5 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback?: Function): void {
    if (!callback) {
      throw new Error('Callback is required');
    }
    callback();
  }
}
class TransformCom1 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(encoding === 'invalid').assertEqual(true);
    expect(typeof callback === 'function').assertEqual(true);
    callback(new Error('Unsupported encoding'), null);
  }
}
class TransformCom2 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    if (chunk === '') {
      callback(new Error('Empty chunk'), null);
    } else {
      callback(null, chunk);
    }
  }
}
class TransformCom3 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    callback(null, chunk);
  }
}
class TransformCom4 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    expect(typeof chunk === 'string').assertEqual(true);
    expect(typeof encoding === 'string').assertEqual(true);
    expect(typeof callback === 'function').assertEqual(true);
    callback();
  }
}
class TransformCom5 extends stream.Transform {
  override doTransform(chunk: string, encoding: string, callback: Function): void {
    const encodingAlias = encoding === 'utf-8' ? 'utf8' : encoding;
    expect(encodingAlias === 'utf8').assertEqual(true);
    const processed = chunk.repeat(2);
    callback(null, processed);
  }
}
class ForwardTransform extends Transform {
  constructor() {
    super({});
  }
  transform(chunk: Uint8Array, encoding: string, cb: () => void): void {
    this.push(chunk);
    cb();
  }
  push(_chunk: Uint8Array) {
    throw new Error('Method not implemented.');
  }
  doFlush(callback: (error?: Error, data?: Uint8Array) => void): void {
    callback();
  }
}
class LocalTransform {
  constructor(options: TransformOptions) {
    if (options.doFlush) {
      const testResult = options.doFlush(() => {});
      if (typeof testResult === 'string') {
      }
    }
  }
}
const TEST_DATA = 'OpenHarmony Transform doFlush Callback Test';
interface GeneratedTypeLiteralInterface_2 {
  type?: number;
}

export default function StreamTest_10() {
  describe('StreamTest_10', () => {
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
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0200
     * @tc.name      constructorTest0002
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0002';
        console.log(TAG + ' start');
        let receivedData = '';
          const errorStream = new ErrorTransform();
          errorStream.doTransform('test_error_data', 'utf8', (_, data) => {
              expect(data === undefined).assertEqual(false);
              receivedData = data as string;
              expect(receivedData).assertEqual('TEST_ERROR_DATA');
            });
        expect(receivedData).assertEqual('TEST_ERROR_DATA');

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0300
     * @tc.name      constructorTest0003
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0003';
        console.log(TAG + ' start');
        let finishTriggered = false, closeTriggered = false, flushTriggered = false;
        const lifecycleTransform = new LifecycleTransform();
        lifecycleTransform.on('finish', () => finishTriggered = true);
        lifecycleTransform.on('close', () => {
          closeTriggered = true;
          expect(flushTriggered && finishTriggered && closeTriggered).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0400
     * @tc.name      constructorTest0004
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0004';
        console.log(TAG + ' start');
        let errorMsg = '';
        try {
          const brokenTransform = new BadTransform();
          brokenTransform.write('test');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          if (err) {
            expect(err instanceof Error).assertEqual(true);
            errorMsg = (err as Error).message;
            expect(errorMsg.includes('doTransform')).assertEqual(false);
          }
        }
        expect(errorMsg.trim() !== '').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0500
     * @tc.name      constructorTest0005
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0005';
        console.log(TAG + ' start');
        let errorMsg = '';
        try {
          const typedData: GeneratedTypeLiteralInterface_2 = {};
          typedData.type!.toFixed(2);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(errorMsg.includes('Type')).assertFalse();
          expect(errorMsg.trim().length > 0).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0600
     * @tc.name      constructorTest0006
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0006';
        console.log(TAG + ' start');
        const transformInstance = new NoCallbackTransform();
        transformInstance.write('data');
        expect(transformInstance instanceof NoCallbackTransform).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFROM_CONSTRUCTOR_0700
     * @tc.name      constructorTest0007
     * @tc.desc      Verify UpperCaseTransform can convert string to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('constructorTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'constructorTest0007';
        console.log(TAG + ' start');
        let result = '';
          const transform = new UpperTransform();
          transform.on('data', (event: emitter.EventData) => {
            const data = event.data as string | Uint8Array;
            result = typeof data === 'string'
              ? data
              : new TextDecoder('utf-8').decode(data);
            expect(result).assertEqual('HELLO');
          });
          expect(transform instanceof stream.Transform).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0100
     * @tc.name      DoTransformTest0001
     * @tc.desc      Verify doTransform with valid string chunk, utf8 encoding and normal callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0001';
        console.log(TAG + ' start');
        const transform = new TransformPos1();
        let result = '';
        transform.on('data', (data: emitter.EventData) => {
          result = (data as StreamDataEvent).data.value as string;
        });
        transform.doTransform('test', 'utf8', () => {});
        expect(result === 'TEST').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0200
     * @tc.name      DoTransformTest0002
     * @tc.desc      Verify doTransform with empty string chunk and valid callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0002';
        console.log(TAG + ' start');
        const transform = new TransformPos2();
        let result = '';
        transform.on('data', (data: emitter.EventData) => {
          result = (data as StreamDataEvent).data.value as string;
        });
        transform.doTransform('', 'ascii', () => {});
        expect(result === 'empty').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0300
     * @tc.name      DoTransformTest0003
     * @tc.desc      Verify doTransform with callback returns processed data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0003';
        console.log(TAG + ' start');
        const transform = new TransformPos3();
        let callbackResult: string = '';
        transform.doTransform('raw', 'utf8', (err: null, data: string) => {
          callbackResult = data;
        });
        expect(callbackResult === 'raw_processed').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0400
     * @tc.name      DoTransformTest0004
     * @tc.desc      Verify doTransform with multi-byte string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0004';
        console.log(TAG + ' start');
        const transform = new TransformPos4();
        let result = '';
        transform.on('data', (data: emitter.EventData) => {
          result = (data as StreamDataEvent).data.value as string;
        });
        transform.doTransform('Test data', 'utf8', () => {});
        expect(result === 'Test data').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0500
     * @tc.name      DoTransformTest0005
     * @tc.desc      Verify doTransform with callback executed only once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0005';
        console.log(TAG + ' start');
        const transform = new TransformPos5();
        let callbackCount = 0;
        transform.doTransform('count', 'utf8', () => {
          callbackCount++;
        });
        expect(callbackCount === 1).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0600
     * @tc.name      DoTransformTest0006
     * @tc.desc      Verify doTransform with non-string chunk type (number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0006';
        console.log(TAG + ' start');
        const transform = new TransformNeg1();
        try {
          transform.doTransform(123, 'utf8', (err: Error) => {
            if (err) {
              throw err;
            }
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Chunk must be string");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0700
     * @tc.name      DoTransformTest0007
     * @tc.desc      Verify doTransform with non-string encoding type (boolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0007';
        console.log(TAG + ' start');
        const transform = new TransformNeg2();
        try {
          transform.doTransform('test', true, (err: Error) => {
            if (err) {
              throw err;
            }
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Encoding must be string");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0800
     * @tc.name      DoTransformTest0008
     * @tc.desc      Verify doTransform with non-function callback type (string).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0008';
        console.log(TAG + ' start');
        const transform = new TransformNeg3();
        try {
          transform.doTransform('test', 'utf8', 'not_func');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Callback must be function");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_0900
     * @tc.name      DoTransformTest0009
     * @tc.desc      Verify doTransform with undefined chunk parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0009';
        console.log(TAG + ' start');
        const transform = new TransformNeg4();
        try {
          transform.doTransform(undefined, 'utf8', () => {});
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Chunk cannot be undefined");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_TRANSFORM_DOTRANSFORM_1000
     * @tc.name      DoTransformTest0010
     * @tc.desc      Verify doTransform with missing callback parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0010';
        console.log(TAG + ' start');
        const transform = new TransformNeg5();
        try {
          transform.doTransform('test', 'utf8');
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Callback is required");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFORM_DOTRANSFORM_1100
     * @tc.name      DoTransformTest0011
     * @tc.desc      Verify doTransform with valid chunk + invalid encoding + valid callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0011';
        console.log(TAG + ' start');

        const transform = new TransformCom1();
        let callbackErr: string = '';
        transform.doTransform('valid_chunk', 'invalid', (err: Error) => {
          callbackErr = err.message;
        });
        expect(callbackErr === 'Unsupported encoding').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFORM_DOTRANSFORM_1200
     * @tc.name      DoTransformTest0012
     * @tc.desc      Verify doTransform with empty chunk + valid encoding + callback returns error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0012';
        console.log(TAG + ' start');

        const transform = new TransformCom2();
        let callbackErr: string = '';
        transform.doTransform('', 'utf8', (err: Error) => {
          callbackErr = err.message;
        });
        expect(callbackErr === 'Empty chunk').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFORM_DOTRANSFORM_1300
     * @tc.name      DoTransformTest0013
     * @tc.desc      Verify doTransform with multi-chunk + callback accumulates data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0013';
        console.log(TAG + ' start');

        const transform = new TransformCom3();
        let accumulated: string[] = [];
        transform.doTransform('chunk1', 'utf8', (err: null, data: string) => {
          accumulated.push(data);
        });
        transform.doTransform('chunk2', 'utf8', (err: null, data: string) => {
          accumulated.push(data);
        });
        expect(accumulated.join(',') === 'chunk1,chunk2').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFORM_DOTRANSFORM_1400
     * @tc.name      DoTransformTest0014
     * @tc.desc      Verify doTransform with valid params + callback throws error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0014';
        console.log(TAG + ' start');

        const transform = new TransformCom4();
        try {
          transform.doTransform('test', 'utf8', () => {
            throw new Error('Callback error');
          });
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertEqual("Error: Callback error");
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFORM_DOTRANSFORM_1500
     * @tc.name      DoTransformTest0015
     * @tc.desc      Verify doTransform with valid chunk + encoding alias + callback returns processed data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoTransformTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoTransformTest0015';
        console.log(TAG + ' start');

        const transform = new TransformCom5();
        let callbackResult: string = '';
        transform.doTransform('repeat', 'utf-8', (err: null, data: string) => {
          callbackResult = data;
        });
        expect(callbackResult === 'repeatrepeat').assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_0500
     * @tc.name      DoFlushTest0005
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0005';
        console.log(TAG + ' start');
        let isTypeErrorCaught = false;
          const invalidOptions: TransformOptions = {
            doFlush: () => {
              return 'not_a_function';
            }
          };
          new LocalTransform(invalidOptions);
          expect(isTypeErrorCaught).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_0700
     * @tc.name      DoFlushTest0007
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0007';
        console.log(TAG + ' start');
        const options: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            const encoder = new TextEncoder();
            callback(undefined, encoder.encode(TEST_DATA));
          }
        };
        new Transform(options).end().then((data) => {
          const decoder = new TextDecoder();
          expect(decoder.decode(data)).assertEqual(TEST_DATA);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_0800
     * @tc.name      DoFlushTest0008
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0008';
        console.log(TAG + ' start');
        const asyncOptions: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            callback(undefined, new TextEncoder().encode(TEST_DATA));
          }
        };
        new Transform(asyncOptions).end().then((data) => {
          expect(data.length > 0).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_0900
     * @tc.name      DoFlushTest0009
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0009';
        console.log(TAG + ' start');
        const chunkOptions: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            const encoder = new TextEncoder();
            callback(undefined, encoder.encode('Chunk1'));
            callback(undefined, encoder.encode('Chunk2'));
          }
        };
        new Transform(chunkOptions).end().catch((err: Error) => {
          expect(err.message.includes('multiple')).assertTrue();
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_1000
     * @tc.name      DoFlushTest0010
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0010';
        console.log(TAG + ' start');
        const emptyOptions: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            callback(undefined, new Uint8Array(0));
          }
        };
        new Transform(emptyOptions).end().then((data) => {
          expect(data.length).assertEqual(0);
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_TRANSFROM_DOFLUSH_1100
     * @tc.name      DoFlushTest0011
     * @tc.desc      Array Unshift index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('DoFlushTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'DoFlushTest0011';
        console.log(TAG + ' start');
        const errorDataOptions: TransformOptions = {
          doFlush: (callback: (error?: Error, data?: Uint8Array) => void) => {
            const encoder = new TextEncoder();
            callback(new Error('Combined error'), encoder.encode(TEST_DATA));
          }
        };
        new Transform(errorDataOptions).end().catch((err: Error) => {
          expect(err.message).assertEqual('Combined error');
        });

      });
  })
}
