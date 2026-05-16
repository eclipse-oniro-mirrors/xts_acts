import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, util } from '@kit.ArkTS';

interface ReadableOptionsType {
  encoding?: string;
  highWaterMark?: number;
}

function createReadable(): stream.Readable {
  const options: ReadableOptionsType = {
    encoding: 'utf-8',
    highWaterMark: 16384
  };
  return new stream.Readable(options);
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamReadable02Test() {
  describe('StreamReadable02Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0100
     * @tc.name      testStreamReadable02Chapter0001
     * @tc.desc      Test pause during flowing mode, should switch to paused mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        private data: number[] = [1, 2, 3, 4, 5];
        private index: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
          if (this.index < this.data.length) {
            let chunk = new Uint8Array([this.data[this.index++]]);
            this.push(chunk);
          } else {
            this.push(null);
          }
        }
      }

      let readableStream = new TestReadable();
      let collected: Uint8Array[] = [];

      readableStream.on('data', (chunk: Object) => {
        collected.push(chunk as Uint8Array);
      });

      readableStream.on('end', () => {
        console.info("Stream ended, collected length:", collected.length);
        expect(collected.length).assertEqual(5);
      });

      readableStream.resume();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0200
     * @tc.name      testStreamReadable02Chapter0002
     * @tc.desc      Test pause when stream has ended, should still return readable and isPaused true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }
        doRead(size: number) {
          this.push(null);
        }
      }
      let readableStream = new TestReadable();
      let ended = false;
      await new Promise<void>((resolve) => {
        readableStream.on('end', () => {
          ended = true;
          console.info("Stream ended");
        });
        readableStream.read();

        setTimeout(() => {
          expect(ended).assertTrue();
          let result = readableStream.pause();
          console.info("Pause after end, result:", result);
          console.info("Is paused after end:", readableStream.isPaused());
          expect(readableStream.isPaused()).assertTrue();
          expect(result).assertEqual(readableStream);
          resolve();
        }, 100);
      });
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0300
     * @tc.name      testStreamReadable02Chapter0003
     * @tc.desc      Test pause on empty stream, should not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readableStream = new TestReadable();
      let pauseSucceeded = false;
      let errorCaught = false;

      try {
        let pauseResult = readableStream.pause();
        pauseSucceeded = true;
        expect(pauseResult).assertEqual(readableStream);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }

      expect(pauseSucceeded).assertEqual(true);
      expect(errorCaught).assertEqual(false);
      expect(readableStream.isPaused()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0400
     * @tc.name      testStreamReadable02Chapter0004
     * @tc.desc      Test pause return type is Readable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push(new Uint8Array([1, 2, 3]));
        }
      }

      let readableStream = new TestReadable();
      let result = readableStream.pause();
      console.info("Pause result type:", typeof result);
      expect(result instanceof stream.Readable).assertTrue();
      expect(readableStream.isPaused()).assertTrue();

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0500
     * @tc.name      testStreamReadable02Chapter0005
     * @tc.desc      Test pause after resume, should switch back to paused mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        private data: number[] = [10, 20, 30];
        private index: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
          if (this.index < this.data.length) {
            let chunk = new Uint8Array([this.data[this.index++]]);
            this.push(chunk);
          } else {
            this.push(null);
          }
        }
      }

      let readableStream = new TestReadable();
      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();

      readableStream.resume();
      expect(readableStream.isPaused()).assertFalse();

      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();
      console.info("Successfully switched between pause and resume");
    })
  })
}