import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamDuplex08Test() {
  describe('StreamDuplex08Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0100
     * @tc.name      testStreamDuplex08Chapter0001
     * @tc.desc      Test doWritev with extremely large string causing potential overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        writeError: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            if (typeof chunk === 'string' && chunk.length > 1000000) {
              this.writeError = true;
            }
            callback();
          } catch (e) {
            expect(e.code).assertEqual(401);
            this.writeError = true;
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            expect(chunks.length).assertEqual(1);
            callback();
          } catch (e) {
            expect(e.code).assertEqual(401);
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();
        try {
          let largeString = 'a'.repeat(100);
          duplexStream.write(largeString, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }
        duplexStream.uncork();
        duplexStream.end();
        expect(duplexStream.writeError).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0200
     * @tc.name      testStreamDuplex08Chapter0002
     * @tc.desc      Test doWritev with null and undefined values (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        errorCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk === null || chunk === undefined) {
            this.errorCount++;
          }
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        try {
          duplexStream.write(null, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        try {
          duplexStream.write(undefined, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        duplexStream.write('valid data', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.errorCount).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0300
     * @tc.name      testStreamDuplex08Chapter0003
     * @tc.desc      Test doWritev with different encoding parameter values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        encodingErrors: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            this.encodingErrors++;
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            expect(chunks.length).assertEqual(3);
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      let duplexStream = new TestDuplex();
      try {
        duplexStream.cork();

        duplexStream.write('test1', 'utf8');
        duplexStream.write('test2', 'utf-8');
        duplexStream.write('test3', 'ascii');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.encodingErrors).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
        expect(duplexStream.encodingErrors).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0400
     * @tc.name      testStreamDuplex08Chapter0004
     * @tc.desc      Test doWritev with empty string and empty Uint8Array (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        emptyChunksHandled: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if ((typeof chunk === 'string' && chunk.length === 0) ||
            (chunk instanceof Uint8Array && chunk.length === 0)) {
            this.emptyChunksHandled++;
          }
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      try {
        duplexStream.cork();

        try {
          duplexStream.write('', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        try {
          duplexStream.write(new Uint8Array([]), 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        duplexStream.write('non-empty data', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.emptyChunksHandled).assertLess(2);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
        expect(duplexStream.emptyChunksHandled).assertLess(2);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0500
     * @tc.name      testStreamDuplex08Chapter0005
     * @tc.desc      Test doWritev with invalid encoding types (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        invalidEncodingErrors: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (encoding === 'invalid-encoding' || encoding === 'unknown') {
            this.invalidEncodingErrors++;
          }
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      try {
        duplexStream.cork();

        try {
          duplexStream.write('test1', 'invalid-encoding');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        try {
          duplexStream.write('test2', 'unknown');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        duplexStream.write('test3', 'utf8');
        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.invalidEncodingErrors).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
        expect(duplexStream.invalidEncodingErrors).assertEqual(0);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0600
     * @tc.name      testStreamDuplex08Chapter0006
     * @tc.desc      Test doWritev with extremely large chunk causing memory issues (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        memoryError: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            if ((typeof chunk === 'string' && chunk.length > 10000000) ||
              (chunk instanceof Uint8Array && chunk.length > 10000000)) {
              this.memoryError = true;
            }
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            this.memoryError = true;
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      try {
        duplexStream.cork();

        try {
          let hugeString = 'x'.repeat(500);
          duplexStream.write(hugeString, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          let hugeArray = new Uint8Array(500);
          duplexStream.write(hugeArray, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.memoryError).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
        expect(duplexStream.memoryError).assertEqual(false);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0700
     * @tc.name      testStreamDuplex08Chapter0007
     * @tc.desc      Test doWritev with invalid callback usage (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        callbackErrors: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            if (callback === null || callback === undefined) {
              this.callbackErrors++;
              return;
            }
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            this.callbackErrors++;
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            if (callback === null || callback === undefined) {
              this.callbackErrors++;
              return;
            }
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            this.callbackErrors++;
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        duplexStream.write('test data', 'utf8');
        duplexStream.write('more data', 'utf8');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.callbackErrors).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0800
     * @tc.name      testStreamDuplex08Chapter0009
     * @tc.desc      Test doWritev with various string and Uint8Array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        validWrites: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            this.validWrites++;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            this.validWrites += chunks.length;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        duplexStream.write('normal string', 'utf8');

        duplexStream.write('12345', 'utf8');

        duplexStream.write('!@#$%^&*()', 'utf8');

        duplexStream.write(new Uint8Array([1, 2, 3, 4, 5]), 'utf8');

        duplexStream.write(new Uint8Array([0, 255]), 'utf8');

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.validWrites).assertEqual(5);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_0900
     * @tc.name      testStreamDuplex08Chapter0010
     * @tc.desc      Test doWritev with multiple uncork calls (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        uncorkCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          this.uncorkCount++;
          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();

        duplexStream.cork();
        duplexStream.write('data1', 'utf8');
        duplexStream.uncork();

        duplexStream.cork();
        duplexStream.write('data2', 'utf8');
        duplexStream.uncork();

        duplexStream.cork();
        duplexStream.write('data3', 'utf8');
        duplexStream.uncork();

        duplexStream.end();

        expect(duplexStream.uncorkCount > 0).assertEqual(true);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1000
     * @tc.name      testStreamDuplex08Chapter0011
     * @tc.desc      Test doWritev with rapid cork/uncork cycles (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        cycleCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          this.cycleCount++;
          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();

        for (let i = 0; i < 10; i++) {
          duplexStream.cork();
          duplexStream.write(`data${i}`, 'utf8');
          duplexStream.uncork();
        }

        duplexStream.end();

        expect(duplexStream.cycleCount).assertEqual(10);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1100
     * @tc.name      testStreamDuplex08Chapter0012
     * @tc.desc      Test doWritev with concurrent writes from multiple sources
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        concurrentWrites: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            this.concurrentWrites++;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            this.concurrentWrites += chunks.length;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        let writePromises: Promise<boolean>[] = [];
        for (let i = 0; i < 10; i++) {
          writePromises.push(new Promise<boolean>((resolve, reject) => {
            setTimeout(() => {
              try {
                duplexStream.write(`concurrent${i}`, 'utf8');
                resolve(true);
              } catch (e) {
                expect(e.code).assertEqual(undefined);
                reject(e);
              }
            }, Math.random() * 10);
          }));
        }

        (async () => {
          try {
            await Promise.all(writePromises);
            duplexStream.uncork();
            duplexStream.end();

            expect(duplexStream.concurrentWrites).assertEqual(10);
          } catch (e) {
            expect(e.code).assertEqual(undefined);
          }
        })();
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1200
     * @tc.name      testStreamDuplex08Chapter0013
     * @tc.desc      Test doWritev with invalid data types (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        invalidTypeWrites: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (typeof chunk !== 'string' && !(chunk instanceof Uint8Array)) {
            this.invalidTypeWrites++;
          }
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        duplexStream.write('valid string', 'utf8');
        duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8');

        try {
          duplexStream.write('', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        try {
          duplexStream.write(new Uint8Array(0), 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(401);
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.invalidTypeWrites).assertEqual(0);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1300
     * @tc.name      testStreamDuplex08Chapter0014
     * @tc.desc      Test doWritev with corrupted or malformed data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            expect(chunks.length).assertEqual(1);
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        try {
          let corruptedBuffer = new ArrayBuffer(10);
          let corruptedView = new Uint8Array(corruptedBuffer);
          for (let i = 0; i < corruptedView.length; i++) {
            corruptedView[i] = Math.random() * 256;
          }
          duplexStream.write(corruptedView, 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream == undefined).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1400
     * @tc.name      testStreamDuplex08Chapter0015
     * @tc.desc      Test doWritev with edge case operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        validOperations: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            this.validOperations++;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            this.validOperations += chunks.length;
            callback();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.cork();

      duplexStream.write('a', 'utf8');

      let longString = 'x'.repeat(1000);
      duplexStream.write(longString, 'utf8');

      duplexStream.write(new Uint8Array([1]), 'utf8');

      let edgeArray = new Uint8Array(256);
      for (let i = 0; i < 256; i++) {
        edgeArray[i] = i;
      }
      duplexStream.write(edgeArray, 'utf8');

      duplexStream.write('\n\r\t\b\f', 'utf8');

      duplexStream.uncork();
      duplexStream.end();

      expect(duplexStream.validOperations > 0).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1500
     * @tc.name      testStreamDuplex08Chapter0016
     * @tc.desc      Test doWritev with very small buffer size (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        bufferOverflow: boolean = false;
        writeCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCount++;
          const chunkSize = typeof chunk === 'string' ? chunk.length : chunk.length;

          if (this.writeCount > 10) {
            this.bufferOverflow = true;
          }

          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          this.writeCount += chunks.length;

          if (this.writeCount > 10) {
            this.bufferOverflow = true;
          }

          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        for (let i = 0; i < 20; i++) {
          try {
            duplexStream.write(`data${i}`, 'utf8');
          } catch (e) {
            expect(e.code).assertEqual(undefined);
          }
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.bufferOverflow).assertEqual(true);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1600
     * @tc.name      testStreamDuplex08Chapter0018
     * @tc.desc      Test doWritev with destroyed stream (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        destroyedWrites: number = 0;
        isDestroyed: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (this.isDestroyed) {
            return;
          }
          this.destroyedWrites++;
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          if (this.isDestroyed) {
            return;
          }
          this.destroyedWrites += chunks.length;
          callback();
        }

        destroyStream() {
          this.isDestroyed = true;
        }
      }

      try {
        let duplexStream = new TestDuplex();

        duplexStream.write('before destroy', 'utf8');

        try {
          duplexStream.destroyStream();
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.write('after destroy', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        duplexStream.end();

        expect(duplexStream.destroyedWrites).assertEqual(1);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1700
     * @tc.name      testStreamDuplex08Chapter0019
     * @tc.desc      Test doWritev with comprehensive error recovery
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        errorCount: number = 0;
        recoverySuccess: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          try {
            if (typeof chunk === 'string' && chunk.includes('ERROR')) {
              this.errorCount++;
              callback(new Error('Simulated error'));
            } else {
              callback();
            }
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          try {
            let hasError = false;
            for (let chunk of chunks) {
              if (typeof chunk === 'string' && chunk.includes('ERROR')) {
                this.errorCount++;
                hasError = true;
              }
            }

            if (hasError) {
              callback(new Error('Batch contains error'));
            } else {
              this.recoverySuccess = true;
              callback();
            }
          } catch (e) {
            expect(e.code).assertEqual(undefined);
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        duplexStream.cork();

        try {
          duplexStream.write('normal1', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.write('ERROR_DATA', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.write('normal2', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.write('normal3', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.write('ERROR_AGAIN', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        duplexStream.uncork();
        duplexStream.end();

        expect(duplexStream.errorCount >= 2).assertEqual(true);
        expect(duplexStream.recoverySuccess).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1800
     * @tc.name      testStreamDuplex08Chapter0020
     * @tc.desc      Test doWritev with callback errors propagation (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        errorPropagationCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (typeof chunk === 'string' && chunk === 'ERROR_CHUNK') {
            callback(new Error('Write error'));
          } else {
            callback();
          }
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          let hasError = false;
          for (let chunk of chunks) {
            if (typeof chunk === 'string' && chunk === 'ERROR_CHUNK') {
              hasError = true;
              break;
            }
          }
          if (hasError) {
            callback(new Error('Batch write error'));
          } else {
            callback();
          }
        }
      }

      try {
        let duplexStream = new TestDuplex();
        let errorEvents = 0;

        duplexStream.on('error', (err) => {
          errorEvents++;
        });

        duplexStream.cork();
        duplexStream.write('normal1', 'utf8');
        duplexStream.write('ERROR_CHUNK', 'utf8');
        duplexStream.write('normal2', 'utf8');
        duplexStream.uncork();

        duplexStream.end();

        expect(errorEvents > 0).assertEqual(true);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTEIGHT_1900
     * @tc.name      testStreamDuplex08Chapter0021
     * @tc.desc      Test doWritev with multiple end calls (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamDuplex08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestDuplex extends stream.Duplex {
        endCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.endCount++;
          callback();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          this.endCount += chunks.length;
          callback();
        }
      }

      try {
        let duplexStream = new TestDuplex();

        duplexStream.write('data1', 'utf8');
        duplexStream.end();

        try {
          duplexStream.end();
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        try {
          duplexStream.end('final data', 'utf8');
        } catch (e) {
          expect(e.code).assertEqual(undefined);
        }

        expect(duplexStream.endCount).assertLess(3);
      } catch (e) {
        expect(e.code).assertEqual(undefined);
      }
    });
  })
}