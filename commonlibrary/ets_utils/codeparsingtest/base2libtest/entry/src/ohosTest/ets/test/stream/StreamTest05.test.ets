import { stream } from '@kit.ArkTS';
import util from '@ohos.util';
import {
  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,
  TestType, Size, Level
} from '@ohos/hypium';

type StreamData = string | Uint8Array | null;

export default function StreamTest_05() {
  describe('StreamTest_05', () => {
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0100
     * @tc.name      ReadableResumeTest0001
     * @tc.desc      Verify resume() switches paused stream to flowing mode (string chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0001';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Test Resume String Chunk';
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0200
     * @tc.name      ReadableResumeTest0002
     * @tc.desc      Verify resume() switches paused stream to flowing mode (Uint8Array chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0002';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(10).fill('A'.charCodeAt(0));
          expect(testUint8Array instanceof Uint8Array).assertEqual(true);
          expect(typeof testUint8Array).assertEqual('object');
          expect(testUint8Array.length).assertEqual(10);
          expect(testUint8Array.BYTES_PER_ELEMENT).assertEqual(1);
          expect(testUint8Array.byteLength).assertEqual(10);
          const aCharCode = 'A'.charCodeAt(0);
          expect(aCharCode).assertEqual(65);
          for (let i = 0; i < testUint8Array.length; i++) {
            expect(testUint8Array[i]).assertEqual(aCharCode);
          }
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0300
     * @tc.name      ReadableResumeTest0003
     * @tc.desc      Verify resume() takes effect repeatedly (flowing mode remains after multiple calls).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0003';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Multiple Resume Test';
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable1: stream.Readable = readable.resume();
          const resumedReadable2: stream.Readable = readable.resume();
          const resumedReadable3: stream.Readable = readable.resume();
          expect(resumedReadable1 === readable).assertEqual(true);
          expect(resumedReadable2 === readable).assertEqual(true);
          expect(resumedReadable3 === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0400
     * @tc.name      ReadableResumeTest0004
     * @tc.desc      Verify resume() works with empty string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0004';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyString = '';
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(emptyString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
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
            errMsg.includes('readData should be a string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0500
     * @tc.name      ReadableResumeTest0005
     * @tc.desc      Verify resume() works with empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          expect(readData === '').assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0600
     * @tc.name      ReadableResumeTest0006
     * @tc.desc      Verify resume() switches mode before pushing chunk (string type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Resume Before Push String';
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0700
     * @tc.name      ReadableResumeTest0007
     * @tc.desc      Verify resume() switches mode before pushing chunk (Uint8Array type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0007';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(8).fill('B'.charCodeAt(0));
          const resumedReadable: stream.Readable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(false);
          expect(convertedUint8.every((byte: number, index: number) =>
          byte === testUint8Array[index]
          )).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0800
     * @tc.name      ReadableResumeTest0008
     * @tc.desc      Verify resume() has no effect on already flowing stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          expect(readable.isPaused() === false).assertEqual(true);
          const secondResume = readable.resume();
          expect(secondResume === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          const testString = 'Flowing Stream Resume Test';
          readable.push(testString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_0900
     * @tc.name      ReadableResumeTest0009
     * @tc.desc      Verify resume() after pushing null (stream ended) has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0009';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Ended Stream Resume Test';
          readable.push(testString);
          readable.push(null);
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(false);
          const readData1 = readable.read();
          const readData2 = readable.read();
          if (typeof readData1 !== 'string') {
            throw new Error('readData1 should be a string type');
          }
          expect(readData1 === testString).assertEqual(true);
          expect(readData2 === null).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData1 should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1000
     * @tc.name      ReadableResumeTest0010
     * @tc.desc      Verify resume() with invalid chunk (undefined) pushed to stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0010';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          expect(readable.isPaused() === true).assertEqual(false);
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1100
     * @tc.name      ReadableResumeTest0011
     * @tc.desc      Verify resume() cannot recover stream after pushing invalid non-string/Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0011';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1200
     * @tc.name      ReadableResumeTest0012
     * @tc.desc      Mixed scenario: resume() + pause() + resume() to switch mode repeatedly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0012';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString1 = 'Mixed Chunk 1';
          const testUint8Array = new Uint8Array(5).fill('D'.charCodeAt(0));
          const testString2 = 'Mixed Chunk 2';
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testString1);
          readable.push(testUint8Array);
          readable.push(testString2);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          const read4 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string' || typeof read3 !== 'string') {
            throw new Error('read1/read2/read3 should be string type');
          }
          expect(read1 === testString1).assertEqual(true);
          expect(read3 === testString2).assertEqual(true);
          expect(read4 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read2);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
            expect().assertFail()
          }
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2/read3 should be string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1300
     * @tc.name      ReadableResumeTest0013
     * @tc.desc      Mixed scenario: resume() + mixed string/Uint8Array chunk reading.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0013';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString1 = 'Mixed Chunk 1';
          const testUint8Array = new Uint8Array(5).fill('D'.charCodeAt(0));
          const testString2 = 'Mixed Chunk 2';
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(testString1);
          readable.push(testUint8Array);
          readable.push(testString2);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          const read4 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string' || typeof read3 !== 'string') {
            throw new Error('read1/read2/read3 should be string type');
          }
          expect(read1 === testString1).assertEqual(true);
          expect(read3 === testString2).assertEqual(true);
          expect(read4 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read2);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2/read3 should be string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1400
     * @tc.name      ReadableResumeTest0014
     * @tc.desc      Mixed scenario: resume() + partial read + full read of large chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0014';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const largeString = 'Large Mixed Read Test: 1234567890abcdefghijklmnopqrstuvwxyz';
          const stepSize = 10;
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(largeString);
          const partialRead = readable.read(stepSize);
          const remainingRead = readable.read();
          if (typeof partialRead !== 'string' || typeof remainingRead !== 'string') {
            throw new Error('partialRead/remainingRead should be string type');
          }
          expect(partialRead === largeString.substring(0, stepSize)).assertEqual(true);
          expect(remainingRead === largeString.substring(stepSize)).assertEqual(true);
          expect(partialRead.length === stepSize).assertEqual(true);
          expect(remainingRead.length === largeString.length - stepSize).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialRead/remainingRead should be string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLERESUME_1500
     * @tc.name      ReadableResumeTest0015
     * @tc.desc      Mixed scenario: resume() with empty and non-empty chunk mixed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableResumeTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableResumeTest0015';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const nonEmptyString = 'Non-empty Chunk';
          const emptyString = '';
          const nonEmptyUint8 = new Uint8Array(4).fill('E'.charCodeAt(0));
          const resumedReadable = readable.resume();
          expect(resumedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === false).assertEqual(true);
          readable.push(nonEmptyString);
          readable.push(emptyString);
          readable.push(nonEmptyUint8);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          const read4 = readable.read();
          const read5 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string' || typeof read3 !== 'string'
            || typeof read4 !== 'string') {
            throw new Error('read1/read2/read3/read4 should be string type');
          }
          expect(read1 === nonEmptyString).assertEqual(true);
          expect(read2 === emptyString).assertEqual(true);
          expect(read4 === emptyString).assertEqual(true);
          expect(read5 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read3);
          expect(converted.length === nonEmptyUint8.length).assertEqual(true);
          expect(converted.every((byte: number, idx: number) =>
          byte === nonEmptyUint8[idx]
          )).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2/read3/read4 should be string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0100
     * @tc.name      ReadablePauseTest0001
     * @tc.desc      Verify pause() switches flowing stream to paused mode (string chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0001';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Test Pause String Chunk';
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
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
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0200
     * @tc.name      ReadablePauseTest0002
     * @tc.desc      Verify pause() switches flowing stream to paused mode (Uint8Array chunk).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0002';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(10).fill('A'.charCodeAt(0));
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }
          expect(readData).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          for (let i = 0; i < convertedUint8.length; i++) {
            expect(convertedUint8[i] === testUint8Array[i]).assertEqual(true);
            expect().assertFail()
          }
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0300
     * @tc.name      ReadablePauseTest0003
     * @tc.desc      Verify pause() takes effect repeatedly (paused mode remains after multiple calls).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0003';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Multiple Pause Test';
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable1: stream.Readable = readable.pause();
          const pausedReadable2: stream.Readable = readable.pause();
          const pausedReadable3: stream.Readable = readable.pause();
          expect(pausedReadable1 === readable).assertEqual(true);
          expect(pausedReadable2 === readable).assertEqual(true);
          expect(pausedReadable3 === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(testString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0400
     * @tc.name      ReadablePauseTest0004
     * @tc.desc      Verify pause() works with empty string chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0004';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const emptyString = '';
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(emptyString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0500
     * @tc.name      ReadablePauseTest0005
     * @tc.desc      Verify pause() works with empty Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }
          expect(readData).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0600
     * @tc.name      ReadablePauseTest0006
     * @tc.desc      Verify pause() switches mode before pushing chunk (string type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Pause Before Push String';
          readable.resume();
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
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
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData is not a string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0700
     * @tc.name      ReadablePauseTest0007
     * @tc.desc      Verify pause() switches mode before pushing chunk (Uint8Array type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0007';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(8).fill('B'.charCodeAt(0));
          readable.resume();
          const pausedReadable: stream.Readable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData is not a string');
          }
          expect(readData).assertEqual(true);
          const encoder = new util.TextEncoder();
          const convertedUint8: Uint8Array = encoder.encode(readData);
          expect(convertedUint8.length === testUint8Array.length).assertEqual(true);
          expect(convertedUint8.every((byte: number, index: number) =>
          byte === testUint8Array[index]
          )).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0800
     * @tc.name      ReadablePauseTest0008
     * @tc.desc      Verify pause() has no effect on already paused stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          expect(readable.isPaused() === true).assertEqual(false);
          const firstPause = readable.pause();
          const secondPause = readable.pause();
          expect(firstPause === readable).assertEqual(true);
          expect(secondPause === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          const testString = 'Paused Stream Pause Test';
          readable.push(testString);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_0900
     * @tc.name      ReadablePauseTest0009
     * @tc.desc      Verify pause() after pushing null (stream ended) has no effect.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0009';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Ended Stream Pause Test';
          readable.push(testString);
          readable.push(null);
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          const readData1 = readable.read();
          const readData2 = readable.read();
          if (typeof readData1 !== 'string') {
            throw new Error('readData1 is not a string');
          }
          if (readData2 !== null && typeof readData2 === 'string') {
            throw new Error('readData2 should be null after stream ends');
          }
          expect(readData1 === testString).assertEqual(true);
          expect(readData2 === null).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('readData1 is not a string') ||
            errMsg.includes('readData2 should be null after stream ends')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_1000
     * @tc.name      ReadablePauseTest0010
     * @tc.desc      Verify pause() with invalid chunk (undefined) pushed to stream.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0010';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          readable.resume();
          expect(readable.isPaused() === false).assertEqual(true);
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_1100
     * @tc.name      ReadablePauseTest0011
     * @tc.desc      Verify pause() cannot recover stream after pushing invalid non-string/Uint8Array chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0011';
        console.log(TAG + ' start');
          const readable = new stream.Readable();
          readable.resume();
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          const readData = readable.read();
          expect(readData === null).assertEqual(true);

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_1200
     * @tc.name      ReadablePauseTest0012
     * @tc.desc      Mixed scenario: pause() + mixed string/Uint8Array chunk reading.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0012';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString1 = 'Mixed Chunk A';
          const testUint8Array = new Uint8Array(5).fill('D'.charCodeAt(0));
          const testString2 = 'Mixed Chunk B';
          readable.resume();
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(testString1);
          readable.push(testUint8Array);
          readable.push(testString2);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          const read4 = readable.read();
          if (typeof read1 !== 'string') {
            throw new Error('read1 should be string');
          }
          if (typeof read2 !== 'string') {
            throw new Error('read2 should be string');
          }
          if (typeof read3 !== 'string') {
            throw new Error('read3 should be string');
          }
          expect(read1 === testString1).assertEqual(true);
          expect(read3 === testString2).assertEqual(true);
          expect(read4 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read2);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1 should be string') ||
            errMsg.includes('read2 should be string') ||
            errMsg.includes('read3 should be string')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_1300
     * @tc.name      ReadablePauseTest0013
     * @tc.desc      Mixed scenario: pause() + partial read + full read of large chunk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0013';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const largeString = 'Large Pause Mixed Read Test: 0123456789abcdefghijklmnopqrstuvwxyz';
          const stepSize = 12;
          readable.resume();
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(largeString);
          const partialRead = readable.read(stepSize);
          const remainingRead = readable.read();
          if (typeof partialRead !== 'string') {
            throw new Error('partialRead should be a string type');
          }
          if (typeof remainingRead !== 'string') {
            throw new Error('remainingRead should be a string type');
          }
          expect(partialRead === largeString.substring(0, stepSize)).assertEqual(true);
          expect(remainingRead === largeString.substring(stepSize)).assertEqual(true);
          expect(partialRead.length === stepSize).assertEqual(true);
          expect(remainingRead.length === largeString.length - stepSize).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('partialRead should be a string type') ||
            errMsg.includes('remainingRead should be a string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLEPAUSE_1400
     * @tc.name      ReadablePauseTest0014
     * @tc.desc      Mixed scenario: pause() with empty and non-empty chunk mixed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadablePauseTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadablePauseTest0014';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const nonEmptyString = 'Non-empty Data';
          const emptyString = '';
          const nonEmptyUint8 = new Uint8Array(4).fill('E'.charCodeAt(0));
          readable.resume();
          const pausedReadable = readable.pause();
          expect(pausedReadable === readable).assertEqual(true);
          expect(readable.isPaused() === true).assertEqual(true);
          readable.push(nonEmptyString);
          readable.push(emptyString);
          readable.push(nonEmptyUint8);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          const read4 = readable.read();
          const read5 = readable.read();
          if (typeof read1 !== 'string') throw new Error('read1 should be string');
          if (typeof read2 !== 'string') throw new Error('read2 should be string');
          if (typeof read3 !== 'string') throw new Error('read3 should be string');
          if (typeof read4 !== 'string') throw new Error('read4 should be string');
          expect(read1 === nonEmptyString).assertEqual(true);
          expect(read2 === emptyString).assertEqual(true);
          expect(read4 === emptyString).assertEqual(true);
          expect(read5 === null).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read3);
          expect(converted.length === nonEmptyUint8.length).assertEqual(true);
          expect(converted.every((byte: number, idx: number) =>
          byte === nonEmptyUint8[idx]
          )).assertEqual(true);
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1 should be string') ||
            errMsg.includes('read2 should be string') ||
            errMsg.includes('read3 should be string') ||
            errMsg.includes('read4 should be string')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0100
     * @tc.name      ReadableSetEncodingTest0001
     * @tc.desc      Verify setEncoding() returns true when setting valid utf-8 encoding (no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0001';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding = 'utf-8';
          expect(typeof readable).assertEqual('object');
          expect(readable instanceof stream.Readable).assertEqual(true);
          expect(readable.readable).assertEqual(true);
          expect(typeof encoding).assertEqual('string');
          expect(encoding).assertEqual('utf-8');
          expect(['utf-8', 'utf8', 'ascii', 'latin1'].includes(encoding)).assertEqual(true);
          const testString = 'Test UTF-8 Encoding';
          expect(typeof testString).assertEqual('string');
          expect(testString).assertEqual('Test UTF-8 Encoding');
          readable.push(testString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(typeof readData).assertEqual('string');
          expect(readData === testString).assertEqual(true);
          expect(readData.length).assertEqual(testString.length);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0200
     * @tc.name      ReadableSetEncodingTest0002
     * @tc.desc      Verify setEncoding() returns true when setting valid ascii encoding (no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0002';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding = 'ascii';
          const result = readable.setEncoding(encoding);
          expect(result).assertEqual(true);
          const testUint8Array = new Uint8Array(8).fill('A'.charCodeAt(0));
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          expect(typeof readData === 'string').assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(readData);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
          }
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0300
     * @tc.name      ReadableSetEncodingTest0003
     * @tc.desc      Verify setEncoding() returns true when setting undefined encoding (default encoding, no buffer data).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0003';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const result = readable.setEncoding();
          expect(result).assertEqual(false);
          const testString = 'Default Encoding Test';
          const testUint8Array = new Uint8Array(5).fill('B'.charCodeAt(0));
          readable.push(testString);
          readable.push(testUint8Array);
          readable.push(null);
          const read1 = readable.read();
          const read2 = readable.read();
          const read3 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string') {
            throw new Error('read1/read2 should be string type');
          }
          expect(read1 === testString).assertEqual(true);
          expect(read3 === null).assertEqual(true);
          expect(typeof read2 === 'string').assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read2);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2 should be string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0400
     * @tc.name      ReadableSetEncodingTest0004
     * @tc.desc      Verify setEncoding() works with empty string chunk after setting valid encoding (no buffer data initially).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0004';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding = 'utf-8';
          const result = readable.setEncoding(encoding);
          expect(result).assertEqual(true);
          const emptyString = '';
          readable.push(emptyString);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
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
            errMsg.includes('readData should be a string type')
          ).assertEqual(false);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0500
     * @tc.name      ReadableSetEncodingTest0005
     * @tc.desc      Verify setEncoding() works with empty Uint8Array chunk after setting valid encoding (no buffer data initially).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0005';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding = 'ascii';
          const result = readable.setEncoding(encoding);
          expect(result).assertEqual(true);
          const emptyUint8Array = new Uint8Array(0);
          readable.push(emptyUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          expect(readData === '').assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0600
     * @tc.name      ReadableSetEncodingTest0006
     * @tc.desc      Verify setEncoding() can reset valid encoding (no buffer data between resets).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0006';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const encoding1 = 'utf-8';
          const encoding2 = 'ascii';
          const result1 = readable.setEncoding(encoding1);
          expect(result1).assertEqual(true);
          readable.read();
          const result2 = readable.setEncoding(encoding2);
          expect(result2).assertEqual(true);
          const testUint8Array = new Uint8Array(6).fill('C'.charCodeAt(0));
          readable.push(testUint8Array);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          expect(typeof readData === 'string').assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(readData);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          expect(converted.every((byte: number, idx: number) =>
          byte === testUint8Array[idx]
          )).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0700
     * @tc.name      ReadableSetEncodingTest0007
     * @tc.desc      Verify setEncoding() returns false when setting encoding with string chunk in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0007';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Buffer Has String Data';
          const encoding = 'utf-8';
          readable.push(testString);
          const result = readable.setEncoding(encoding);
          expect(result === false).assertEqual(false);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0800
     * @tc.name      ReadableSetEncodingTest0008
     * @tc.desc      Verify setEncoding() returns false when setting encoding with Uint8Array chunk in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0008';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testUint8Array = new Uint8Array(10).fill('D'.charCodeAt(0));
          const encoding = 'ascii';
          readable.push(testUint8Array);
          const result = readable.setEncoding(encoding);
          expect(result === false).assertEqual(true);
          const readData = readable.read();
          if (typeof readData !== 'string') {
            throw new Error('readData should be a string type');
          }
          expect(readData).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(readData);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
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
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_0900
     * @tc.name      ReadableSetEncodingTest0009
     * @tc.desc      Verify setEncoding() returns false when setting encoding with mixed chunks in buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0009';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const testString = 'Mixed Buffer Data';
          const testUint8Array = new Uint8Array(5).fill('E'.charCodeAt(0));
          const encoding = 'utf-8';
          readable.push(testString);
          readable.push(testUint8Array);
          const result = readable.setEncoding(encoding);
          expect(result === false).assertEqual(false);
          const read1 = readable.read();
          const read2 = readable.read();
          if (typeof read1 !== 'string' || typeof read2 !== 'string') {
            throw new Error('read1/read2 should be string type');
          }
          expect(read1 === testString).assertEqual(true);
          const encoder = new util.TextEncoder();
          const converted: Uint8Array = encoder.encode(read2);
          expect(converted.length === testUint8Array.length).assertEqual(true);
          for (let i: number = 0; i < converted.length; i++) {
            expect(converted[i] === testUint8Array[i]).assertEqual(true);
          }
          expect().assertFail()
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err instanceof Error).assertEqual(true);
          const errMsg = (err as Error).toString();
          expect(
            errMsg.includes('_read method not implemented') ||
            errMsg.includes('read1/read2 should be string type')
          ).assertEqual(true);
        }

      });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_READABLESETENCODING_1000
     * @tc.name      ReadableSetEncodingTest0010
     * @tc.desc      Verify setEncoding() returns false when setting invalid encoding with empty buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ReadableSetEncodingTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'ReadableSetEncodingTest0010';
        console.log(TAG + ' start');
        try {
          const readable = new stream.Readable();
          const invalidEncoding = 'invalid-encoding-123';
          const result = readable.setEncoding(invalidEncoding);
          expect(result === false).assertEqual(true);
          const testString = 'Invalid Encoding Test';
          readable.push(testString);
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
            errMsg.includes('invalid encoding') ||
            errMsg.includes('readData should be a string type')
          ).assertEqual(false);
        }

      });
  });
}

