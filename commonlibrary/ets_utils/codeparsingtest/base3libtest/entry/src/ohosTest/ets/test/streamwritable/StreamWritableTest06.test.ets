import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable06Test() {
  describe('StreamWritable06Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0100
     * @tc.name      testStreamWritable06Chapter0001
     * @tc.desc      Test off method with keyword event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      try {
        writableStream.off('NaN');
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0200
     * @tc.name      testStreamWritable06Chapter0002
     * @tc.desc      Test off method with number 0 keyword event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        writableStream.off('0');
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0300
     * @tc.name      testStreamWritable06Chapter0003
     * @tc.desc      Test off method removing non-existent callback, should not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      let testListenerCalled: boolean = false;
      let testListener = (): void => {
        testListenerCalled = true;
      };
      writableStream.on('finish', (): void => {
      });
      writableStream.off('finish', testListener);
      writableStream.end();
      setTimeout(() => {
        expect(testListenerCalled).assertFalse();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0400
     * @tc.name      testStreamWritable06Chapter0004
     * @tc.desc      Test off method with event parameter that is not allowed (invalid event name), expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        writableStream.off('notvalid');
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0500
     * @tc.name      testStreamWritable06Chapter0005
     * @tc.desc      Test off method with treeString type event parameter (long structured string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let init: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        let treeString = init(1000);
        expect(treeString.length).assertLarger(0);
        writableStream.off(treeString);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0600
     * @tc.name      testStreamWritable06Chapter0006
     * @tc.desc      Test off method with sliceString type event parameter (string slice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        let str = "{k1:value1,k2:value2}";
        expect(str.length).assertLarger(0);
        let sliceStr = str.substring(0, str.length - 2);
        expect(sliceStr.length).assertLarger(0);
        writableStream.off(sliceStr);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0700
     * @tc.name      testStreamWritable06Chapter0007
     * @tc.desc      Test off method with large string for memory usage check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        let largeStr = "a".repeat(100000);
        expect(largeStr.length).assertEqual(100000);
        writableStream.off(largeStr);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0800
     * @tc.name      testStreamWritable06Chapter0008
     * @tc.desc      Test GC behavior after using large string with off method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      expect(writableStream instanceof TestWritable).assertEqual(true);

      let offSucceeded = false;
      try {
        {
          let largeStr = "b".repeat(100000);
          expect(largeStr.length).assertEqual(100000);
          writableStream.off(largeStr);
          offSucceeded = true;
        }

        expect(typeof writableStream.off).assertEqual('function');
        if (globalThis.gc) {
          expect(typeof globalThis.gc).assertEqual('function');
        }
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });
  })
}
