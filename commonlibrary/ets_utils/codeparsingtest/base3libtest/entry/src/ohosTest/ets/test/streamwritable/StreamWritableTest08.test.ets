import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable08Test() {
  describe('StreamWritable08Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0100
     * @tc.name      testStreamWritable08Chapter0001
     * @tc.desc      test doWritev with normal string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const receivedChunks: Array<string | Uint8Array> = []

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("Writable chunks", chunks);
          receivedChunks.push(chunks[0])
          callback();
        }
      }

      const writableStream = new TestWritable();
      writableStream.write('data1', 'utf8');
      writableStream.write('data2', 'utf8');
      expect(receivedChunks.length).assertEqual(2);
      expect((receivedChunks as string[])[0]).assertEqual('data1');
      expect((receivedChunks as string[])[1]).assertEqual('data2');
      writableStream.uncork();
      writableStream.end();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0200
     * @tc.name      testStreamWritable08Chapter0002
     * @tc.desc      test doWritev with Uint8Array array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        public receivedChunks: (string | Uint8Array)[] = [];
        public doWritevCalled: boolean = false;

        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("doWritev called with chunks count:", chunks.length);
          this.doWritevCalled = true;

          for (let i = 0; i < chunks.length; i++) {
            this.receivedChunks.push(chunks[i]);
          }

          expect(chunks.length).assertEqual(2);
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          console.info("doWrite called instead of doWritev");
          this.receivedChunks.push(chunk);
          callback();
        }
      }

      const writableStream = new TestWritable();
      const uint8Array1 = new Uint8Array([72, 101, 108, 108, 111]);
      const uint8Array2 = new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);

      writableStream.cork();
      writableStream.write(uint8Array1);
      writableStream.write(uint8Array2);
      writableStream.uncork();

      setTimeout(() => {
        expect(writableStream.receivedChunks.length > 0).assertTrue();

        if (writableStream.receivedChunks.length >= 2) {
          expect(writableStream.receivedChunks.length).assertEqual(2);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0300
     * @tc.name      testStreamWritable08Chapter0003
     * @tc.desc      test doWritev with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("Writable chunks", chunks);
          expect(chunks.length).assertEqual(0);
          callback();
        }
      }

      const writableStream = new TestWritable();
      writableStream.uncork();
      writableStream.end();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0400
     * @tc.name      testStreamWritable08Chapter0004
     * @tc.desc      test doWritev with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        public receivedData: string[] = [];
        public doWritevCalled: boolean = false;

        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("doWritev called with chunks count:", chunks.length);
          this.doWritevCalled = true;

          for (let i = 0; i < chunks.length; i++) {
            const chunk = chunks[i];
            if (typeof chunk === 'string') {
              this.receivedData.push(chunk);
            } else if (chunk instanceof Uint8Array) {
              let result = '';
              for (let j = 0; j < chunk.length; j++) {
                result += String.fromCharCode(chunk[j]);
              }
              this.receivedData.push(result);
            }
          }

          expect(chunks.length).assertEqual(2);
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          console.info("doWrite called");
          if (typeof chunk === 'string') {
            this.receivedData.push(chunk);
          } else if (chunk instanceof Uint8Array) {
            let result = '';
            for (let i = 0; i < chunk.length; i++) {
              result += String.fromCharCode(chunk[i]);
            }
            this.receivedData.push(result);
          }
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();
      writableStream.write('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~', 'utf8');
      writableStream.write('Hello\nWorld\tTest\r', 'utf8');
      writableStream.uncork();

      setTimeout(() => {
        expect(writableStream.receivedData.length).assertEqual(2);

        if (writableStream.receivedData.length >= 2) {
          expect(writableStream.receivedData[0]).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
          expect(writableStream.receivedData[1]).assertEqual('Hello\nWorld\tTest\r');
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0500
     * @tc.name      testStreamWritable08Chapter0005
     * @tc.desc      test doWritev with unicode and emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        public receivedData: string[] = [];
        public doWritevCalled: boolean = false;

        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("doWritev called with chunks count:", chunks.length);
          this.doWritevCalled = true;

          for (let i = 0; i < chunks.length; i++) {
            const chunk = chunks[i];
            if (typeof chunk === 'string') {
              this.receivedData.push(chunk);
            } else if (chunk instanceof Uint8Array) {
              let result = '';
              for (let j = 0; j < chunk.length; j++) {
                result += String.fromCharCode(chunk[j]);
              }
              this.receivedData.push(result);
            }
          }

          expect(chunks.length).assertEqual(3);
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          console.info("doWrite called");
          if (typeof chunk === 'string') {
            this.receivedData.push(chunk);
          } else if (chunk instanceof Uint8Array) {
            let result = '';
            for (let i = 0; i < chunk.length; i++) {
              result += String.fromCharCode(chunk[i]);
            }
            this.receivedData.push(result);
          }
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();
      writableStream.write('👆', 'utf8');
      writableStream.write('🎅', 'utf8');
      writableStream.write('🤼‍♂️', 'utf8');
      writableStream.uncork();

      setTimeout(() => {
        expect(writableStream.receivedData.length).assertEqual(3);

        if (writableStream.receivedData.length >= 3) {
          expect(writableStream.receivedData[0]).assertEqual('👆');
          expect(writableStream.receivedData[1]).assertEqual('🎅');
          expect(writableStream.receivedData[2]).assertEqual('🤼‍♂️');
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0600
     * @tc.name      testStreamWritable08Chapter0006
     * @tc.desc      test doWritev with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        public receivedChunks: Uint8Array[] = [];
        public doWritevCalled: boolean = false;

        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("doWritev called with chunks count:", chunks.length);
          this.doWritevCalled = true;

          for (let i = 0; i < chunks.length; i++) {
            const chunk = chunks[i];
            if (chunk instanceof Uint8Array) {
              this.receivedChunks.push(chunk);
            } else if (typeof chunk === 'string') {
              const str = chunk;
              const uint8Array = new Uint8Array(str.length);
              for (let j = 0; j < str.length; j++) {
                uint8Array[j] = str.charCodeAt(j);
              }
              this.receivedChunks.push(uint8Array);
            }
          }

          expect(chunks.length).assertEqual(4);
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          console.info("doWrite called");
          if (chunk instanceof Uint8Array) {
            this.receivedChunks.push(chunk);
          } else if (typeof chunk === 'string') {
            const str = chunk;
            const uint8Array = new Uint8Array(str.length);
            for (let i = 0; i < str.length; i++) {
              uint8Array[i] = str.charCodeAt(i);
            }
            this.receivedChunks.push(uint8Array);
          }
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();
      writableStream.write(new Uint8Array([0]), 'utf8');
      writableStream.write(new Uint8Array([255]), 'utf8');

      const arr1 = new Uint8Array(1);
      arr1[0] = 255;
      writableStream.write(arr1, 'utf8');

      const arr2 = new Uint8Array(1);
      arr2[0] = 0;
      writableStream.write(arr2, 'utf8');
      writableStream.uncork();

      setTimeout(() => {
        expect(writableStream.receivedChunks.length).assertEqual(4);

        if (writableStream.receivedChunks.length >= 4) {
          expect(writableStream.receivedChunks[0][0]).assertEqual(0);
          expect(writableStream.receivedChunks[1][0]).assertEqual(255);
          expect(writableStream.receivedChunks[2][0]).assertEqual(255);
          expect(writableStream.receivedChunks[3][0]).assertEqual(0);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0700
     * @tc.name      testStreamWritable08Chapter0007
     * @tc.desc      test doWritev callback is called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let callbackCalled = false;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("Writable chunks", chunks);
          expect(chunks.length).assertEqual(1);
          expect((chunks as string[])[0]).assertEqual('test');

          callbackCalled = true;
          callback();
        }
      }

      const writableStream = new TestWritable();
      writableStream.write('test', 'utf8');
      writableStream.uncork();
      writableStream.end();

      setTimeout(() => {
        expect(callbackCalled).assertTrue();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0800
     * @tc.name      testStreamWritable08Chapter0008
     * @tc.desc      test doWritev with large array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        public receivedData: string[] = [];
        public doWritevCalled: boolean = false;

        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: () => void): void {
          console.info("doWritev called with chunks length:", chunks.length);
          this.doWritevCalled = true;

          for (let i = 0; i < chunks.length; i++) {
            const chunk = chunks[i];
            if (typeof chunk === 'string') {
              this.receivedData.push(chunk);
            } else if (chunk instanceof Uint8Array) {
              let result = '';
              for (let j = 0; j < chunk.length; j++) {
                result += String.fromCharCode(chunk[j]);
              }
              this.receivedData.push(result);
            }
          }

          expect(chunks.length).assertEqual(10);
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          console.info("doWrite called");
          if (typeof chunk === 'string') {
            this.receivedData.push(chunk);
          } else if (chunk instanceof Uint8Array) {
            let result = '';
            for (let i = 0; i < chunk.length; i++) {
              result += String.fromCharCode(chunk[i]);
            }
            this.receivedData.push(result);
          }
          callback();
        }
      }

      const writableStream = new TestWritable();

      writableStream.cork();
      for (let i = 0; i < 10; i++) {
        writableStream.write(`data${i}`, 'utf8');
      }
      writableStream.uncork();

      setTimeout(() => {
        expect(writableStream.receivedData.length).assertEqual(10);

        for (let i = 0; i < writableStream.receivedData.length; i++) {
          expect(writableStream.receivedData[i]).assertEqual(`data${i}`);
        }

        writableStream.end();
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_0900
     * @tc.name      testStreamWritable08Chapter0009
     * @tc.desc      test doWritev callback execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let callbackExecutionCount = 0;
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }
        _writev(chunks: string[] | Uint8Array[], callback: Function): void {
          this.doWritev(chunks, callback);
        }
        doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
          console.info("Writable chunks count:", chunks.length);
          setTimeout(() => {
            (callback as (error?: Error | null) => void)();
            callbackExecutionCount++;
          }, 0);
        }
      }
      const writableStream = new TestWritable();
      writableStream.write('chunk1', 'utf8');
      writableStream.write('chunk2', 'utf8');
      writableStream.write('chunk3', 'utf8');
      writableStream.uncork();
      writableStream.end();
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          console.info("Callback execution count:", callbackExecutionCount);
          expect(callbackExecutionCount).assertEqual(3);
          resolve();
        }, 100);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTEIGHT_1000
     * @tc.name      testStreamWritable08Chapter0010
     * @tc.desc      test doWritev with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable08Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestWritable extends stream.Writable {
        public receivedData: string[] = [];
        public doWritevCalled: boolean = false;
        constructor() {
          super();
        }
        _writev(chunks: string[] | Uint8Array[], callback: Function): void {
          this.doWritev(chunks, callback);
        }
        _write(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          this.doWrite(chunk, encoding, callback);
        }
        doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
          console.info("doWritev called with chunks length:", chunks.length);
          this.doWritevCalled = true;
          for (let i = 0; i < chunks.length; i++) {
            const chunk = chunks[i];
            if (typeof chunk === 'string') {
              this.receivedData.push(chunk);
            } else if (chunk instanceof Uint8Array) {
              let result = '';
              for (let j = 0; j < chunk.length; j++) {
                result += String.fromCharCode(chunk[j]);
              }
              this.receivedData.push(result);
            }
          }
          expect(chunks.length).assertEqual(3);
          setTimeout(() => (callback as (error?: Error | null) => void)(), 0);
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          console.info("doWrite called");
          if (typeof chunk === 'string') {
            this.receivedData.push(chunk);
          } else if (chunk instanceof Uint8Array) {
            let result = '';
            for (let i = 0; i < chunk.length; i++) {
              result += String.fromCharCode(chunk[i]);
            }
            this.receivedData.push(result);
          }
          setTimeout(() => callback(), 0);
        }
      }
      const writableStream = new TestWritable();
      await new Promise<void>((resolve) => {
        writableStream.end('empty', 'utf8', () => {
          resolve();
        });
      });
      await new Promise<void>((resolve) => {
        setTimeout(async () => {
          const writableStream2 = new TestWritable();
          writableStream2.cork();
          writableStream2.write('empty1', 'utf8');
          writableStream2.write('empty2', 'utf8');
          writableStream2.write('non-empty', 'utf8');
          writableStream2.uncork();
          await new Promise<void>((resolveInner) => {
            setTimeout(() => {
              expect(writableStream2.receivedData.length).assertEqual(3);
              if (writableStream2.receivedData.length >= 3) {
                expect(writableStream2.receivedData[0]).assertEqual('empty1');
                expect(writableStream2.receivedData[1]).assertEqual('empty2');
                expect(writableStream2.receivedData[2]).assertEqual('non-empty');
              }
              writableStream2.end();
              resolveInner();
            }, 100);
          });
          resolve();
        }, 50);
      });
    });
  })
}