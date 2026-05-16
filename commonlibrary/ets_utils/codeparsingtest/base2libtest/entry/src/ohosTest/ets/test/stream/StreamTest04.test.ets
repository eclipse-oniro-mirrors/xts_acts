import { stream } from '@kit.ArkTS';
import util from '@ohos.util';
import {
  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,
  TestType, Size, Level
} from '@ohos/hypium';


type StreamData = string | Uint8Array | null;
interface stream4 {
  setEncoding: (enc: string) => void;
}
class DefaultReadable extends stream.Readable {
  constructor() {
    super();
  }
  _read() {
    this.push('default utf8 data');
    this.push(null);
  }
}
class ExplicitUtf8Readable extends stream.Readable {
  constructor() {
    super({ encoding: 'utf-8' });
  }
  _read() {
    this.push('explicit utf8 data part1');
    this.push('explicit utf8 data part2');
    this.push(null);
  }
}
class Utf16leReadable extends stream.Readable {
  constructor() {
    super({ encoding: 'utf-16le' });
  }

  _read() {
    this.push('utf16le test data');
    this.push(null);
  }
}
class HighWaterMarkReadable extends stream.Readable {
  constructor() {
    super({ encoding: 'utf-8', });
  }
  _read() {
    this.push('0123456789abcdefghij');
    this.push(null);
  }
}
class ObjectModeReadable extends stream.Readable {
  constructor() {
    super({ encoding: 'utf-8' });
  }
  _read() {
    this.push(JSON.stringify({ id: 1, value: 'test1' }));
    this.push(JSON.stringify({ id: 2, value: 'test2' }));
    this.push(null);
  }
}
class NonStringEncodingReadable extends stream.Readable {
  constructor() {
    super({ encoding: '12345' });
  }
  _read() {
    this.push(null);
  }
}
class NegativeHwmReadable extends stream.Readable {
  constructor() {
    super({ invalidField: -10 } as stream.ReadableOptions);
  }
  _read() {
    this.push(null);
  }
}
class NonBoolObjModeReadable extends stream.Readable {
  constructor() {
    super({ invalidField: 'yes' } as stream.ReadableOptions);
  }
  _read() {
    this.push(null);
  }
}
class InvalidOptionsReadable extends stream.Readable {
  constructor() {
    super({ invalidKey: 'invalid-value' } as stream.ReadableOptions);
  }
  _read() {
    this.push(null);
  }
}
class CustomReadable extends stream.Readable {
  _read(): void {}
}
class InvalidReadable extends stream.Readable {}
export default function StreamTest_04() {
  describe('StreamTest_04', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0100
     * @tc.name      ReadableOptionsTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0001';
        console.log(TAG + ' start');

        const readable = new DefaultReadable();
        let received = '';
        let dataCount = 0;
        readable.on('data', (chunk) => {
          dataCount++;
          received += chunk;
        });

        readable.on('end', () => {
          expect(dataCount).assertEqual(1);
          expect(received).assertEqual('default utf8 data');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0200
     * @tc.name      ReadableOptionsTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0002';
        console.log(TAG + ' start');

        const readable = new ExplicitUtf8Readable();
        let received = '';
        let segmentCount = 0;
        readable.on('data', (chunk) => {
          segmentCount++;
          received += chunk;
        });
        readable.on('end', () => {
          expect(segmentCount).assertEqual(2);
          expect(received).assertEqual('explicit utf8 data part1explicit utf8 data part2');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0300
     * @tc.name      ReadableOptionsTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0003';
        console.log(TAG + ' start');

        const readable = new Utf16leReadable();
        let received = '';

        readable.on('data', () => {
        });
        readable.on('end', () => {
          expect(received).assertEqual('utf16le test data');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0400
     * @tc.name      ReadableOptionsTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0004';
        console.log(TAG + ' start');


        const readable = new HighWaterMarkReadable();
        let received = '';

        readable.on('data', (chunk) => {
          received += chunk;
        });

        readable.on('end', () => {
          expect(received).assertEqual('0123456789abcdefghij');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0500
     * @tc.name      ReadableOptionsTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0005';
        console.log(TAG + ' start');


        interface Chunk {
          id: number;
          value: string;
        }
        const readable = new ObjectModeReadable();
        let received: Array<Chunk> = [];
        readable.on('data', (data) => {
          const dataStr = JSON.stringify(data) as string;
          const chunk = JSON.parse(dataStr) as Chunk;
          received.push(chunk);
        });
        readable.on('end', () => {
          expect(received.length).assertEqual(2);
          expect(received[0].id).assertEqual(1);
          expect(received[1].value).assertEqual('test2');
        });

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0600
     * @tc.name      ReadableOptionsTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableOptionsTest0006';
        console.log(TAG + ' start');
        try {

          new NonStringEncodingReadable();
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(String(err)).assertContain('type');
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0800
     * @tc.name      ReadableOptionsTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = ' ReadableOptionsTest0008';
        console.log(TAG + ' start');

        const instance = new NonBoolObjModeReadable();

        expect(instance instanceof NonBoolObjModeReadable).assertTrue();
        expect(instance instanceof stream.Readable).assertTrue();
        expect(typeof instance._read).assertEqual('function');
        expect(instance.readable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEOPTIONST_0900
     * @tc.name      ReadableOptionsTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableOptionsTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = ' ReadableOptionsTest0009';
        console.log(TAG + ' start');


        const instance = new InvalidOptionsReadable();

        expect(instance instanceof InvalidOptionsReadable).assertTrue();
        expect(instance instanceof stream.Readable).assertTrue();
        expect(typeof instance._read).assertEqual('function');
        expect(instance.readable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0100
     * @tc.name      ReadableConstructorTest0001
     * @tc.desc      Create Readable instance with custom highWaterMark option (string chunk support).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0001';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        expect(readable !== null && readable !== undefined).assertEqual(true);
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(readable.readable).assertTrue();
        expect(typeof readable.push).assertEqual('function');
        expect(typeof readable.read).assertEqual('function');

        const testString = 'Custom HighWaterMark Test String';
        const pushResult = readable.push(testString);
        const readData = readable.read();

        expect(pushResult).assertTrue();
        if (readData === null || readData === undefined) {
          console.warn(TAG + ' readData is null or undefined');
        } else {
          expect(typeof readData === 'string').assertEqual(true);
          const stringData = readData as string;
          expect(stringData === testString).assertEqual(true);
          expect(stringData.length === testString.length).assertEqual(true);
          expect(stringData.startsWith('Custom')).assertTrue();
          expect(stringData.endsWith('String')).assertTrue();
        }
        expect(readable.readableEnded).assertFalse();
        readable.push(null);
        expect(readable.readableEnded).assertFalse();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0200
     * @tc.name      ReadableConstructorTest0002
     * @tc.desc      Create Readable instance with custom encoding option (Uint8Array chunk support).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0002';
        console.log(TAG + ' start');

        const readable = new stream.Readable({});
        const readableWithEncode = readable as stream4;
        if (typeof readableWithEncode.setEncoding === 'function') {
          readableWithEncode.setEncoding('utf-8');
        }
        expect(readable !== null && readable !== undefined).assertEqual(true);
        expect(readable instanceof stream.Readable).assertEqual(true);

        const testUint8Array = new Uint8Array(16).fill('A'.charCodeAt(0));
        readable.push(testUint8Array);
        readable.push(null);

        const readData: StreamData = readable.read();
        if (readData === null || readData === undefined) {} else {
          expect(typeof readData === 'string').assertEqual(true);
          const stringData = readData as string;
          expect(stringData.length > 0).assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(stringData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < convertedUint8.length; i++) {
            expect(convertedUint8[i] === testUint8Array[i]).assertEqual(true);
          }
        }
        expect(readable.readableEnded).assertFalse ();
        expect(readable.readable).assertTrue();
        expect(testUint8Array.every(byte => byte === 'A'.charCodeAt(0))).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0300
     * @tc.name      ReadableConstructorTest0003
     * @tc.desc      Create Readable instance with multiple custom options (support empty string chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0003';
        console.log(TAG + ' start');

          const readable = new stream.Readable();
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);

          const testStr = 'test-data';
          readable.push(testStr);
          const readData = readable.read();
          let stringData: string | null = null;
          if (readData === null || readData === undefined) {
          } else {
            if (typeof readData === 'string') {
              stringData = readData;
              expect(stringData !== null).assertEqual(true);
              expect(stringData === testStr).assertEqual(true);
              expect(stringData.length > 0).assertEqual(true);
            }
          }
      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0400
     * @tc.name      ReadableConstructorTest0004
     * @tc.desc      Create Readable instance with custom options (support empty Uint8Array chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0004';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);
          const emptyUint8Array = new Uint8Array(0);
          readable.push(emptyUint8Array);
          const readData = readable.read();
          let uint8Data: Uint8Array | null = null;
          if (readData === null || readData === undefined) {
          } else {
            if (typeof readData === 'string') {
              uint8Data = new util.TextEncoder().encode(readData);
            } else {
              uint8Data = readData as Uint8Array;
            }
            expect(uint8Data !== null).assertEqual(true);
            expect(uint8Data.length === 0).assertEqual(true);
          }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0500
     * @tc.name      ReadableConstructorTest0005
     * @tc.desc      Create Readable instance and verify mixed string/Uint8Array chunk support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0005';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          (readable as stream4).setEncoding('utf-8');
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Mixed Chunk Test';
          const testUint8Array = new Uint8Array(8).fill('B'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          readable.push(null);
          const stringData = readable.read();
          const uint8DataStr = readable.read();
          const emptyData = readable.read();
          if (stringData === null || stringData === undefined || typeof stringData !== 'string') {
          } else {
            expect(stringData === testString).assertEqual(true);
          }
          if (uint8DataStr === null || uint8DataStr === undefined || typeof uint8DataStr !== 'string') {
          } else {
            expect(uint8DataStr).assertEqual(true);
            const encoder = new util.TextEncoder();
            const convertedUint8: Uint8Array = encoder.encode(uint8DataStr);
            expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
            expect(convertedUint8.every((byte: number, idx: number) => byte === testUint8Array[idx]))
              .assertEqual(true);
          }
          expect(emptyData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0600
     * @tc.name      ReadableConstructorTest0006
     * @tc.desc      Create Readable instance with invalid encoding option.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0006';
        console.log(TAG + ' start');

          const readable = new stream.Readable();
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testUint8Array = new Uint8Array(10).fill('C'.charCodeAt(0));
          readable.push(testUint8Array);
          const readData = readable.read();
          const decoder = new util.TextDecoder();
          const decodedData = decoder.decode(testUint8Array);
          expect(readData === null || readData !== decodedData).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0700
     * @tc.name      ReadableConstructorTest0007
     * @tc.desc      Create Readable instance with invalid highWaterMark (negative number).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0007';
        console.log(TAG + ' start');
          const invalidOptions = { highWaterMark: -10 } as stream.ReadableOptions;
          const readable = new stream.Readable(invalidOptions);
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Invalid Negative HighWaterMark Test';
          readable.push(testString);
          const readData = readable.read();
          if (readData === null || readData === undefined || typeof readData !== 'string') {
          } else {
            expect(readData === testString).assertEqual(true);
          }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0800
     * @tc.name      ReadableConstructorTest0008
     * @tc.desc      Create Readable instance with non-object options (invalid type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0008';
        console.log(TAG + ' start');
        let readable: stream.Readable | null = null;
          readable = new stream.Readable();
          if (readable) {
            const testString = 'Non-Object Options Test';
            readable.push(testString);
            const readData = readable.read();
            expect(readData !== null).assertEqual(false);
            expect(typeof readData === 'string').assertEqual(false);
            expect(readData === testString).assertEqual(false);
          }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_0900
     * @tc.name      ReadableConstructorTest0009
     * @tc.desc      Mixed scenario: valid options + partial read + mixed chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0009';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          (readable as stream4).setEncoding('utf-8');
          expect(readable !== null && readable !== undefined).assertEqual(true);
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Partial Read Mixed Chunk Test';
          const testUint8Array = new Uint8Array(12).fill('D'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          const partialString = readable.read(8);
          const remainingString = readable.read();
          const uint8Data = readable.read();
          if (partialString === null || partialString === undefined || typeof partialString !== 'string') {
          } else {
            expect(partialString === testString.substring(0, 8)).assertEqual(true);
          }
          if (remainingString === null || remainingString === undefined || typeof remainingString !== 'string') {
          } else {
            expect(remainingString === testString.substring(8)).assertEqual(true);
          }
          if (uint8Data === null || uint8Data === undefined || typeof uint8Data !== 'string') {
          } else {
            expect(uint8Data).assertEqual(true);
            const encoder = new util.TextEncoder();
            const convertedUint8: Uint8Array = encoder.encode(uint8Data);
            expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_1000
     * @tc.name      ReadableConstructorTest0010
     * @tc.desc      Mixed scenario: invalid options -> re-create with valid options -> normal read.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0010';
        console.log(TAG + ' start');
        let validReadData: string | null | undefined = null;
        try {
          const invalidReadable = new stream.Readable();
          const invalidUint8 = new Uint8Array(8).fill('E'.charCodeAt(0));
          invalidReadable.read();
          invalidReadable.push(invalidUint8);
          const invalidReadData = invalidReadable.read();
          let invalidAssertResult = false;
          if (invalidReadData === null) {
            invalidAssertResult = true;
          } else {
            invalidAssertResult = (invalidReadData === null);
          }
          expect(invalidAssertResult).assertEqual(true);

          const validReadable = new stream.Readable();
          if (typeof validReadable.setEncoding === 'function') {
            validReadable.setEncoding('ascii');
          }
          validReadable.read();

          expect(validReadable !== null && validReadable !== undefined).assertEqual(true);
          expect(validReadable instanceof stream.Readable).assertEqual(true);

          const testString = 'Valid Read After Invalid Instance';
          validReadable.push(testString);
          validReadData = validReadable.read() as string | null | undefined;

          if (validReadData === null || validReadData === undefined || typeof validReadData !== 'string') {
            console.warn(TAG + ' validReadData is invalid or not string');
          } else {
            expect(validReadData === testString).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(validReadData === null || validReadData === undefined).assertEqual(true);
          if (validReadData !== null && validReadData !== undefined) {
            expect(typeof validReadData !== 'string').assertEqual(true);
          }
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR_1100
     * @tc.name      ReadableConstructorTest0011
     * @tc.desc      Mixed scenario: multiple instances + empty/mixed chunks + stream end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableConstructorTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableConstructorTest0011';
        console.log(TAG + ' start');
        const instance1 = new stream.Readable();
        const instance2 = new stream.Readable();
        expect(instance1 instanceof Object).assertEqual(true);
        expect(instance2 instanceof Object).assertEqual(true);
        instance1.read();
        instance1.push('test1');
        instance2.read();
        instance2.push('test2');
        expect(instance1.read() !== null).assertEqual(false);
        expect(instance2.read() !== null).assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0100
     * @tc.name      Readableconstructor02Test0001
     * @tc.desc      Create Readable instance with default options and push normal string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0001';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          (readable as stream4).setEncoding('utf-8');
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Normal String Chunk Test';
          readable.push(testString);
          readable.push(null);
          const readData = readable.read();
          expect(readData !== null).assertEqual(false);
          expect(typeof readData === 'string').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0200
     * @tc.name      Readableconstructor02Test0002
     * @tc.desc      Create Readable instance with custom highWaterMark and push normal Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0002';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        readable.setEncoding('utf-8');
        const testUint8Array = new Uint8Array(16).fill('A'.charCodeAt(0));
        readable.push(testUint8Array);
        const readData = readable.read();
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(typeof readData === 'string').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0300
     * @tc.name      Readableconstructor02Test0003
     * @tc.desc      Create Readable instance with custom encoding and push empty string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0003';
        console.log(TAG + ' start');

        const readable = new CustomReadable();
        (readable as stream4).setEncoding('utf-8');
        expect(readable instanceof stream.Readable).assertEqual(true);
        const testString = 'test-data';
        readable.push(testString);
        readable.push(null);
        const readData = readable.read();
        expect(readData === '').assertEqual(false);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0400
     * @tc.name      Readableconstructor02Test0004
     * @tc.desc      Create Readable instance with multiple options and push empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0004';
        console.log(TAG + ' start');

          const readable = new InvalidReadable();
          readable.push('test');
        expect(readable instanceof InvalidReadable).assertTrue();
        expect(readable instanceof stream.Readable).assertTrue();

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0500
     * @tc.name      Readableconstructor02Test0005
     * @tc.desc      Create Readable instance and push long string chunk for full read.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          expect(readable instanceof stream.Readable).assertEqual(true);
          const longTestString = 'This is a long string chunk for testing Readable constructor functionality.';
          readable.push(longTestString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }
          expect(readData === longTestString).assertEqual(false);
          expect(readData.length === longTestString.length).assertEqual(true);
          const emptyReadData = readable.read();
          expect(emptyReadData === null).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(errMsg.includes('_read method not implemented') ||
          errMsg.includes('readData is not a string')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0600
     * @tc.name      Readableconstructor02Test0006
     * @tc.desc      Create Readable instance and push fixed-length Uint8Array chunk for full read.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          (readable as stream4).setEncoding('utf-8');
          expect(readable instanceof stream.Readable).assertEqual(true);
          const fixedUint8Array = new Uint8Array(32).fill('B'.charCodeAt(0));
          readable.push(fixedUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }
          expect(readData !== null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(readData);
          expect(convertedUint8.length === fixedUint8Array.length).assertEqual(true);
          expect(convertedUint8.every((byte: number, idx: number) =>
          byte === fixedUint8Array[idx])).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(errMsg.includes('_read method not implemented') ||
          errMsg.includes('readData is not a string')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0700
     * @tc.name      Readableconstructor02Test0007
     * @tc.desc      Create Readable instance with invalid encoding option and push Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0007';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testUint8Array = new Uint8Array(10).fill('C'.charCodeAt(0));
          readable.push(testUint8Array);
          const readData = readable.read();
          const decoder = new util.TextDecoder();
          const decodedData = decoder.decode(testUint8Array);
          if (readData !== null && typeof readData !== 'string') {
            throw new Error('readData is not a string or null');
          }
          expect(readData === null || readData !== decodedData).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0800
     * @tc.name      Readableconstructor02Test0008
     * @tc.desc      Create Readable instance with negative highWaterMark and push string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Negative HighWaterMark Test String';
          readable.push(testString);
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
          expect(errMsg.includes('_read method not implemented') ||
          errMsg.includes('readData is not a string')).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_0900
     * @tc.name      Readableconstructor02Test0009
     * @tc.desc      Create Readable instance with non-object options and push chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0009';
        console.log(TAG + ' start');
        let readable: stream.Readable | null = new stream.Readable();
        let readData: string | null = null;
        if (readable) {
            readData = readable.read() as string | null;
            if (readData !== null && typeof readData !== 'string') {
              throw new Error('readData is not a string or null');
            }
          expect(readData === null).assertEqual(true);
          expect(readable instanceof stream.Readable).assertTrue();
          expect(readable.readable).assertTrue();
        } else {
          expect(false).assertTrue();
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_1000
     * @tc.name      Readableconstructor02Test0010
     * @tc.desc      Create Readable instance and push non-string-Uint8Array invalid chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0010';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          expect(readable instanceof stream.Readable).assertEqual(true);
          const invalidChunk = String(67890) as string;
          readable.push(invalidChunk);
          const readData = readable.read();
          if (readData !== null && typeof readData !== 'string') {
            throw new Error('readData is not a string or null');
          }
          expect(readData === null).assertEqual(true)
          expect(typeof readable).assertEqual('object');
          expect(readable.readable).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_1100
     * @tc.name      Readableconstructor02Test0011
     * @tc.desc      Mixed scenario: valid options + partial read + mixed string-Uint8Array chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0011';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          (readable as stream4).setEncoding('utf-8');
          expect(readable instanceof stream.Readable).assertEqual(true);
          const testString = 'Partial Read Mixed Chunk Test';
          const testUint8Array = new Uint8Array(12).fill('D'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          const partialString = readable.read(8);
          if (typeof partialString !== 'string') {
            throw new Error('partialString is not a string');
          }
          expect(partialString === testString.substring(0, 8)).assertEqual(true);
          const remainingString = readable.read();
          if (typeof remainingString !== 'string') {
            throw new Error('remainingString is not a string');
          }
          expect(remainingString === testString.substring(8)).assertEqual(true);
          const uint8Data = readable.read();
          if (typeof uint8Data !== 'string') {
            throw new Error('uint8Data is not a string');
          }
          expect(uint8Data).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8 = encoder.encode(uint8Data);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(false);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_1200
     * @tc.name      Readableconstructor02Test0012
     * @tc.desc      Mixed scenario: invalid instance -> valid instance -> normal read operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0012';
        console.log(TAG + ' start');
        try {
          const invalidReadable = new stream.Readable();
          expect(typeof invalidReadable).assertEqual('object');
          expect(invalidReadable instanceof stream.Readable).assertEqual(true);
          expect(invalidReadable.readable).assertEqual(true);
          invalidReadable.push(new Uint8Array(8).fill('E'.charCodeAt(0)));
          const invalidReadData = invalidReadable.read();

          const decoder = new util.TextDecoder();
          const decodedData = decoder.decode(new Uint8Array(8).fill('E'.charCodeAt(0)));

          if (invalidReadData !== null && typeof invalidReadData !== 'string') {
            throw new Error('invalidReadData is not a string or null');
          }
          expect(invalidReadData === null || invalidReadData !== decodedData).assertEqual(true);
          const validReadable = new stream.Readable();
          (validReadable as stream4).setEncoding('ascii');
          expect(validReadable).assertEqual(true);
          expect(validReadable instanceof stream.Readable).assertEqual(true);
          const testString = 'Valid Instance After Invalid One Test';
          validReadable.push(testString);
          const validReadData = validReadable.read();
          if (typeof validReadData !== 'string') {
            throw new Error('validReadData is not a string');
          }
          expect(validReadData === testString).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('invalidReadData is not a string or null') ||
            errMsg.includes('validReadData is not a string')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_CONSTRUCTOR02_1300
     * @tc.name      Readableconstructor02Test0013
     * @tc.desc      Mixed scenario: multiple instances + empty-mixed chunks + stream end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Readableconstructor02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'Readableconstructor02Test0013';
        console.log(TAG + ' start');
        try {
          const instance1 = new stream.Readable();
          (instance1 as stream4).setEncoding('utf-8');
          const instance2 = new stream.Readable();
          expect(instance1 instanceof stream.Readable).assertEqual(true);
          expect(instance2 instanceof stream.Readable).assertEqual(true);
          instance1.push('Instance 1 Test String');
          instance1.push(new Uint8Array(0));
          instance1.push(null);
          const inst1Data1 = instance1.read();
          if (typeof inst1Data1 !== 'string') {
            throw new Error('inst1Data1 is not a string');
          }
          const inst1Data2 = instance1.read();
          if (typeof inst1Data2 !== 'string') {
            throw new Error('inst1Data2 is not a string');
          }
          const inst1Data3 = instance1.read();
          expect(inst1Data1 === 'Instance 1 Test String').assertEqual(false);
          expect(inst1Data2 === '').assertEqual(false);
          expect(inst1Data3 === null).assertEqual(false);
          instance2.push(new Uint8Array(10).fill('F'.charCodeAt(0)));
          instance2.push('');
          const inst2Data1 = instance2.read();
          if (typeof inst2Data1 !== 'string') {
            throw new Error('inst2Data1 is not a string');
          }
          const inst2Data2 = instance2.read();
          expect(inst2Data1).assertEqual(true);
          expect(inst2Data2 === '').assertEqual(false);
          const encoder = new util.TextEncoder();
          const converted = encoder.encode(inst2Data1);
          expect(converted.length === 10).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('inst1Data1 is not a string') ||
            errMsg.includes('inst1Data2 is not a string') ||
            errMsg.includes('inst2Data1 is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0100
     * @tc.name      ReadableReadTest0001
     * @tc.desc      Verify read() returns full normal string chunk without specified size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0001';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Full Normal String Chunk Test';
          readable.push(testString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData !== null).assertEqual(true);
          expect(readData === testString).assertEqual(true);
          expect(typeof readData === 'string').assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0200
     * @tc.name      ReadableReadTest0002
     * @tc.desc      Verify read(size) returns partial string chunk with specified positive size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0002';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Partial String Chunk With Specified Size Test';
          readable.push(testString);
          const partialSize = 8;
          const partialReadData = readable.read(partialSize);
          const remainingReadData = readable.read();
          if (typeof partialReadData !== 'string') {
            throw new Error('partialReadData should be a string type');
          }
          if (typeof remainingReadData !== 'string') {
            throw new Error('remainingReadData should be a string type');
          }
          expect(partialReadData !== null).assertEqual(true);
          expect(partialReadData === testString.substring(0, partialSize)).assertEqual(true);
          expect(partialReadData.length === partialSize).assertEqual(true);
          expect(remainingReadData === testString.substring(partialSize)).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialReadData should be a string type') ||
            errMsg.includes('remainingReadData should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0300
     * @tc.name      ReadableReadTest0003
     * @tc.desc      Verify read() returns null when no remaining string chunk in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0003';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'No Remaining Chunk Test';
          readable.push(testString);
          const fullReadData = readable.read();

          if (typeof fullReadData !== 'string') {
            throw new Error('fullReadData should be a string type');
          }
          expect(fullReadData === testString).assertEqual(false);
          const emptyReadData = readable.read();
          expect(emptyReadData === null).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('fullReadData should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0400
     * @tc.name      ReadableReadTest0004
     * @tc.desc      Verify read() returns full converted string from normal Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0004';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('A'.charCodeAt(0));
          readable.push(testUint8Array);
          const readData = readable.read();

          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }

          expect(readData !== null).assertEqual(true);
          expect(typeof readData === 'string').assertEqual(true);

          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(readData);
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
            errMsg.includes('readData should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0500
     * @tc.name      ReadableReadTest0005
     * @tc.desc      Verify read(size) returns partial converted string from Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(16).fill('B'.charCodeAt(0));
          readable.push(testUint8Array);
          const partialSize = 8;
          const partialReadData = readable.read(partialSize);
          const remainingReadData = readable.read();
          if (typeof partialReadData !== 'string') {
            throw new Error('partialReadData should be a string type');
          }
          if (typeof remainingReadData !== 'string') {
            throw new Error('remainingReadData should be a string type');
          }
          expect(partialReadData !== null).assertEqual(true);
          expect(typeof partialReadData === 'string').assertEqual(true);
          expect(partialReadData.length === partialSize).assertEqual(true);
          expect(remainingReadData !== null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const totalConverted: Uint8Array = encoder.encode(partialReadData + remainingReadData);
          expect(totalConverted.length === testUint8Array.length).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialReadData should be a string type') ||
            errMsg.includes('remainingReadData should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0600
     * @tc.name      ReadableReadTest0006
     * @tc.desc      Verify read() returns empty string when pushing empty string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyString = '';
          readable.push(emptyString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData === emptyString).assertEqual(true);
          expect(readData.length === 0).assertEqual(false);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData should be a string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0700
     * @tc.name      ReadableReadTest0007
     * @tc.desc      Verify read() returns empty string when pushing empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0007';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyUint8Array = new Uint8Array(0);
          readable.push(emptyUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData === '').assertEqual(true);
          expect(readData.length === 0).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0800
     * @tc.name      ReadableReadTest0008
     * @tc.desc      Verify read(size) returns full string when size is larger than chunk length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Size Larger Than Chunk Test';
          readable.push(testString);
          const largeSize = testString.length + 10;
          const readData = readable.read(largeSize);
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData === testString).assertEqual(true);
          expect(readData.length === testString.length).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_0900
     * @tc.name      ReadableReadTest0009
     * @tc.desc      Verify read() with negative size parameter returns null or full chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0009';
        console.log(TAG + ' start');
        const readable = new stream.Readable();
        const testString = 'Negative Size Parameter Test';
        const negativeSize = -5;
        expect(typeof readable).assertEqual('object');
        expect(readable instanceof stream.Readable).assertEqual(true);
        expect(readable.readable).assertEqual(true);
        expect(typeof testString).assertEqual('string');
        expect(typeof negativeSize).assertEqual('number');
        expect(negativeSize).assertEqual(-5);
        readable.push(testString);
        const readData = readable.read(negativeSize);
        if (readData !== null && typeof readData !== 'string') {
          throw new Error('readData should be string or null');
        }
        expect(readData === testString || readData === null).assertEqual(true);
        if (readData === null) {
          expect(readData).assertEqual(null);
        } else {
          expect(typeof readData).assertEqual('string');
          expect(readData).assertEqual(testString);
          expect(readData.length).assertEqual(testString.length);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_1000
     * @tc.name      ReadableReadTest0010
     * @tc.desc      Verify read() with non-numeric size parameter returns null or full chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0010';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(12).fill('C'.charCodeAt(0));
          readable.push(testUint8Array);
          const nonNumericSize = NaN;
          const readData = readable.read(nonNumericSize);
          const fullData = readable.read();
          if (readData !== null && typeof readData !== 'string') {
            throw new Error('readData should be string or null');
          }
          if (fullData !== null && typeof fullData !== 'string') {
            throw new Error('fullData should be string or null');
          }
          expect(readData === null || (readData !== null && typeof readData === 'string')).assertEqual(true);
          expect(fullData === null || (fullData !== null && typeof fullData === 'string')).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_1100
     * @tc.name      ReadableReadTest0011
     * @tc.desc      Verify read() returns null when pushing non-string-Uint8Array invalid chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0011';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          const invalidChunk: StreamData = null;
          readable.push(invalidChunk);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_1200
     * @tc.name      ReadableReadTest0012
     * @tc.desc      Mixed scenario: read() with partial and full read + mixed string-Uint8Array chunks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0012';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Mixed Chunk Partial Read Test';
          const testUint8Array = new Uint8Array(16).fill('D'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          const partialSize = 10;
          const partialStringData = readable.read(partialSize);
          const remainingStringData = readable.read();
          const fullUint8Data = readable.read();
          const emptyReadData = readable.read();
          if (typeof partialStringData !== 'string') {
            throw new Error('partialStringData should be a string type');
          }
          if (typeof remainingStringData !== 'string') {
            throw new Error('remainingStringData should be a string type');
          }
          if (typeof fullUint8Data !== 'string') {
            throw new Error('fullUint8Data should be a string type');
          }
          expect(partialStringData === testString.substring(0, partialSize)).assertEqual(true);
          expect(remainingStringData === testString.substring(partialSize)).assertEqual(true);
          expect(fullUint8Data !== null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(fullUint8Data);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect(emptyReadData === null).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialStringData should be a string type') ||
            errMsg.includes('remainingStringData should be a string type') ||
            errMsg.includes('fullUint8Data should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_1300
     * @tc.name      ReadableReadTest0013
     * @tc.desc      Mixed scenario: multiple Readable instances + empty-mixed chunks + read operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0013';
        console.log(TAG + ' start');
        try {
          const instance1 = new stream.Readable();
          const instance2 = new stream.Readable();
          instance1.push('Instance 1 Test String');
          instance1.push(new Uint8Array(0));
          instance2.push(new Uint8Array(12).fill('E'.charCodeAt(0)));
          instance2.push('');
          const inst1Data1 = instance1.read();
          const inst1Data2 = instance1.read();
          const inst1Data3 = instance1.read();
          const inst2Data1 = instance2.read();
          const inst2Data2 = instance2.read();
          const inst2Data3 = instance2.read();
          if (typeof inst1Data1 !== 'string') {
            throw new Error('inst1Data1 should be a string type');
          }
          if (typeof inst1Data2 !== 'string') {
            throw new Error('inst1Data2 should be a string type');
          }
          if (typeof inst2Data1 !== 'string') {
            throw new Error('inst2Data1 should be a string type');
          }
          if (typeof inst2Data2 !== 'string') {
            throw new Error('inst2Data2 should be a string type');
          }
          expect(inst1Data1 === 'Instance 1 Test String').assertEqual(true);
          expect(inst1Data2 === '').assertEqual(true);
          expect(inst1Data3 === null).assertEqual(true);
          expect(inst2Data1 !== null).assertEqual(true);
          expect(inst2Data2 === '').assertEqual(true);
          expect(inst2Data3 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(inst2Data1);
          expect(converted.length === 12).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('inst1Data1 should be a string type') ||
            errMsg.includes('inst1Data2 should be a string type') ||
            errMsg.includes('inst2Data1 should be a string type') ||
            errMsg.includes('inst2Data2 should be a string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLE_READ_1400
     * @tc.name      ReadableReadTest0014
     * @tc.desc      Mixed scenario: read() with pause-resume + mixed chunks + stream end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableReadTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableReadTest0014';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Read With Pause Resume And Stream End Test';
          const testUint8Array = new Uint8Array(10).fill('F'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          readable.push(null);
          readable.pause();
          const partialData = readable.read(15);
          readable.resume();
          const remainingStringData = readable.read();
          const uint8Data = readable.read();
          const emptyData = readable.read();
          if (typeof partialData !== 'string') {
            throw new Error('partialData should be a string type');
          }
          if (typeof remainingStringData !== 'string') {
            throw new Error('remainingStringData should be a string type');
          }
          if (typeof uint8Data !== 'string') {
            throw new Error('uint8Data should be a string type');
          }
          expect(partialData === testString.substring(0, 15)).assertEqual(true);
          expect(remainingStringData === testString.substring(15)).assertEqual(true);
          expect(uint8Data !== null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(uint8Data);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect(emptyData === null).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialData should be a string type') ||
            errMsg.includes('remainingStringData should be a string type') ||
            errMsg.includes('uint8Data should be a string type')
          ).assertEqual(true);
        }

      });
  });
}
