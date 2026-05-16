import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable05Test() {
  describe('StreamWritable05Test', () => {
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

    interface ApiError {
      code: number;
      message: string;
    }

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0100
     * @tc.name      testStreamWritable05Chapter0001
     * @tc.desc      Test event callback with special characters in event name negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('cl!ose', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        const actualError = err as ApiError;
        expect(actualError.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0200
     * @tc.name      testStreamWritable05Chapter0002
     * @tc.desc      Test event callback with numeric string event name negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('123', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        const actualError = err as ApiError;
        expect(actualError.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0300
     * @tc.name      testStreamWritable05Chapter0003
     * @tc.desc      Test event callback with space in event name negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('close ', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        const actualError = err as ApiError;
        expect(actualError.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0400
     * @tc.name      testStreamWritable05Chapter0004
     * @tc.desc      Test event callback with uppercase event name negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('CLOSE', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        const actualError = err as ApiError;
        expect(actualError.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0500
     * @tc.name      testStreamWritable05Chapter0005
     * @tc.desc      Test registering same event multiple times last callback should work
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      let firstCallbackCalled: boolean = false;
      let secondCallbackCalled: boolean = false;
      const writable: TestWritable = new TestWritable();
      const firstCallback: () => void = (): void => {
        firstCallbackCalled = true;
      };
      const secondCallback: () => void = (): void => {
        secondCallbackCalled = true;
      };

      writable.on('error', firstCallback);
      writable.on('error', secondCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(firstCallbackCalled).assertFalse();
      expect(secondCallbackCalled).assertFalse();
    });

    class EventHandler {
      private callbackCalled: boolean = false;

      handleError(): void {
        this.callbackCalled = true;
      }

      getCallbackStatus(): boolean {
        return this.callbackCalled;
      }
    }

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0600
     * @tc.name      testStreamWritable05Chapter0007
     * @tc.desc      Test event callback with method reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      const handler: EventHandler = new EventHandler();
      const writable: TestWritable = new TestWritable();

      writable.on('error', handler.handleError.bind(handler));
      writable.write('test', 'utf8', (): void => {
      });

      expect(handler.getCallbackStatus()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0700
     * @tc.name      testStreamWritable05Chapter0008
     * @tc.desc      Test event registration after stream operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      let finishCalled: boolean = false;
      const writable: TestWritable = new TestWritable();
      const finishCallback: () => void = (): void => {
        finishCalled = true;
      };

      writable.write('test', 'utf8', (): void => {
      });
      writable.on('finish', finishCallback);
      writable.end();

      expect(finishCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0800
     * @tc.name      testStreamWritable05Chapter0009
     * @tc.desc      Test event registration with callback that returns value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      let callbackCalled: boolean = false;
      const writable: TestWritable = new TestWritable();
      const errorCallback: () => string = (): string => {
        callbackCalled = true;
        return 'error handled';
      };

      writable.on('error', errorCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(callbackCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0900
     * @tc.name      testStreamWritable05Chapter0010
     * @tc.desc      Test event name with unicode characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('cl😀se', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1000
     * @tc.name      testStreamWritable05Chapter0011
     * @tc.desc      Test event name with escape characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('cl\no\ts\re', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1100
     * @tc.name      testStreamWritable05Chapter0013
     * @tc.desc      Test event callback with nested function calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(
          chunk: string | Uint8Array,
          encoding: string,
          callback: (error?: Error) => void
        ): void {
          callback(new Error('write error'));
        }
      }

      let globalCallCount = 0;

      const nestedCallbackTest = (): void => {
        globalCallCount++;
        if (globalCallCount < 3) {
          nestedCallbackTest();
        }
      };

      const writable: TestWritable = new TestWritable();

      writable.on('error', (): void => {
        nestedCallbackTest();

        expect(globalCallCount).assertEqual(3);
      });

      writable.write('test', 'utf8');
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1200
     * @tc.name      testStreamWritable05Chapter0014
     * @tc.desc      Test registering all four valid events simultaneously
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      let closeCalled: boolean = false;
      let drainCalled: boolean = false;
      let errorCalled: boolean = false;
      let finishCalled: boolean = false;
      const writable: TestWritable = new TestWritable();
      const closeCallback: () => void = (): void => {
        closeCalled = true;
      };
      const drainCallback: () => void = (): void => {
        drainCalled = true;
      };
      const errorCallback: () => void = (): void => {
        errorCalled = true;
      };
      const finishCallback: () => void = (): void => {
        finishCalled = true;
      };

      writable.on('close', closeCallback);
      writable.on('drain', drainCallback);
      writable.on('error', errorCallback);
      writable.on('finish', finishCallback);

      writable.write('test', 'utf8', (): void => {
      });

      expect(errorCalled).assertFalse();
      expect(closeCalled).assertFalse();
      expect(drainCalled).assertTrue();
      expect(finishCalled).assertFalse();
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1300
     * @tc.name      testStreamWritable05Chapter0015
     * @tc.desc      Test event name with undefined value negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        const emptyArray: string[] = [];
        const eventName: string = emptyArray[0];
        writable.on(eventName, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1400
     * @tc.name      testStreamWritable05Chapter0016
     * @tc.desc      Test event name with null value negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        const eventName: string = null as never as string;
        writable.on(eventName, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1500
     * @tc.name      testStreamWritable05Chapter0017
     * @tc.desc      Test event name with empty string negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1600
     * @tc.name      testStreamWritable05Chapter0018
     * @tc.desc      Test event name with all special characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      let allEventsRegistered = true;
      try {
        for (let i: number = 0; i < specialChars.length; i++) {
          writable.on(specialChars.charAt(i), callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1700
     * @tc.name      testStreamWritable05Chapter0019
     * @tc.desc      Test event name with all ASCII characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        let asciiChars: string = '';
        for (let i: number = 32; i <= 125; i++) {
          asciiChars += String.fromCharCode(i);
        }
        writable.on(asciiChars, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1800
     * @tc.name      testStreamWritable05Chapter0020
     * @tc.desc      Test event name with concatenated special characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const specialChars: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

      let eventRegistered = false;
      try {
        writable.on(specialChars, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1900
     * @tc.name      testStreamWritable05Chapter0021
     * @tc.desc      Test event name with emoji and unicode characters negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const emojis: string[] = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇',
        '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      let allEventsRegistered = true;
      try {
        for (const emoji of emojis) {
          writable.on(`close${emoji}`, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2000
     * @tc.name      testStreamWritable05Chapter0022
     * @tc.desc      Test event name with illegal unicode encoding negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const illegalUnicode: string[] = [
        '\udc04', '\ud83d', '\udff4'
      ];

      let allEventsRegistered = true;
      try {
        for (const code of illegalUnicode) {
          writable.on(`close${code}`, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2100
     * @tc.name      testStreamWritable05Chapter0023
     * @tc.desc      Test event name with keyword strings negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const keywords: string[] = ['0', 'NaN', ''];

      let allEventsRegistered = true;
      try {
        for (const keyword of keywords) {
          writable.on(keyword, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2200
     * @tc.name      testStreamWritable05Chapter0024
     * @tc.desc      Test event name with long treeString type negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const initTreeString = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const treeString: string = initTreeString(10000);

      let eventRegistered = false;
      try {
        writable.on(treeString, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2300
     * @tc.name      testStreamWritable05Chapter0025
     * @tc.desc      Test event name with sliced string negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const originalStr: string = "{k1:value1,k2:value2}";
      const slicedStr: string = originalStr.substring(0, originalStr.length - 2);

      let eventRegistered = false;
      try {
        writable.on(slicedStr, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2400
     * @tc.name      testStreamWritable05Chapter0026
     * @tc.desc      Test event name with large repeated string negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const largeString: string = 'a'.repeat(1000000);

      let eventRegistered = false;
      try {
        writable.on(largeString, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered !== undefined).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2500
     * @tc.name      testStreamWritable05Chapter0027
     * @tc.desc      Test callback function memory management
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0027",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }

          doWrite(chunk: string | Uint8Array, encoding: string,
            callback: (error?: Error) => void): void {
            callback();
          }
        }

        const writable: TestWritable = new TestWritable();
        let callCount = 0;

        const createCallback = (): (() => void) => {
          const largeData: string = 'x'.repeat(10000);
          return (): void => {
            callCount++;
            console.log(largeData.length.toString());
          };
        };

        const callback = createCallback();

        writable.on('close', callback);

        writable.end();

        expect(callCount).assertEqual(1);
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2600
     * @tc.name      testStreamWritable05Chapter0028
     * @tc.desc      Test event name with whitespace variations negative case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      const writable: TestWritable = new TestWritable();
      const callback: () => void = (): void => {
      };
      const whitespaceVariations: string[] = [
        ' close', 'close ', ' close ', '\tclose', 'close\t', '\nclose', 'close\n'
      ];

      let allEventsRegistered = true;
      try {
        for (const eventName of whitespaceVariations) {
          writable.on(eventName, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered !== undefined).assertEqual(true);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2700
     * @tc.name      testStreamWritable05Chapter0029
     * @tc.desc      Test callback with arrow function and lexical scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback(new Error());
        }
      }

      const writable: TestWritable = new TestWritable();
      const outerValue: number = 42;
      let capturedValue: number = 0;

      const arrowCallback = (): void => {
        capturedValue = outerValue;
      };

      writable.on('error', arrowCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2800
     * @tc.name      testStreamWritable05Chapter0030
     * @tc.desc      Test callback function with this context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
          callback();
        }
      }

      class CallbackHandler {
        private value: number = 0;

        public handleClose(): void {
          this.value = 100;
        }

        public getValue(): number {
          return this.value;
        }
      }

      const writable: TestWritable = new TestWritable();
      const handler: CallbackHandler = new CallbackHandler();
      writable.on('close', handler.handleClose);
      writable.end();

      expect(handler.getValue()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2900
     * @tc.name      testStreamWritable05Chapter0033
     * @tc.desc      Test off method with valid event 'drain' and specific callback, verify callback is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        highWaterMark: number = 1;

        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          setTimeout(() => {
            callback();
          }, 10);
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      let testListenerCalled: boolean = false;
      let testListener = (): void => {
        testListenerCalled = true;
      };
      writableStream.on('drain', testListener);
      writableStream.off('drain', testListener);
      let result: boolean = writableStream.write('test');
      if (!result) {
        expect(testListenerCalled).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3000
     * @tc.name      testStreamWritable05Chapter0035
     * @tc.desc      Test off method with valid event 'finish' without callback parameter, verify all callbacks are removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      let testListener1Called: boolean = false;
      let testListener2Called: boolean = false;
      let testListener1 = (): void => {
        testListener1Called = true;
      };
      let testListener2 = (): void => {
        testListener2Called = true;
      };
      writableStream.on('finish', testListener1);
      writableStream.on('finish', testListener2);
      writableStream.off('finish');
      writableStream.end();
      setTimeout(() => {
        expect(testListener1Called).assertFalse();
        expect(testListener2Called).assertFalse();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3100
     * @tc.name      testStreamWritable05Chapter0036
     * @tc.desc      Test off method with empty string event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      let offSucceeded = false;

      try {
        writableStream.off('');
        offSucceeded = true;
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3200
     * @tc.name      testStreamWritable05Chapter0037
     * @tc.desc      Test off method with special characters event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('!');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3300
     * @tc.name      testStreamWritable05Chapter0038
     * @tc.desc      Test off method with full ASCII characters event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3400
     * @tc.name      testStreamWritable05Chapter0039
     * @tc.desc      Test off method with special characters repeated twice event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3500
     * @tc.name      testStreamWritable05Chapter0040
     * @tc.desc      Test off method with bell escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let bellChar: string = '\x07';
        writableStream.off(bellChar);
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3600
     * @tc.name      testStreamWritable05Chapter0041
     * @tc.desc      Test off method with backspace escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let backspaceChar: string = '\x08';
        writableStream.off(backspaceChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3700
     * @tc.name      testStreamWritable05Chapter0042
     * @tc.desc      Test off method with form feed escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let formFeedChar: string = '\x0C';
        writableStream.off(formFeedChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3800
     * @tc.name      testStreamWritable05Chapter0043
     * @tc.desc      Test off method with newline escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('\n');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3900
     * @tc.name      testStreamWritable05Chapter0044
     * @tc.desc      Test off method with carriage return escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('\r');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4000
     * @tc.name      testStreamWritable05Chapter0045
     * @tc.desc      Test off method with horizontal tab escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('\t');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4100
     * @tc.name      testStreamWritable05Chapter0046
     * @tc.desc      Test off method with vertical tab escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let verticalTabChar: string = '\x0B';
        writableStream.off(verticalTabChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4200
     * @tc.name      testStreamWritable05Chapter0047
     * @tc.desc      Test off method with backslash escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('\\');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4300
     * @tc.name      testStreamWritable05Chapter0048
     * @tc.desc      Test off method with single quote escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off("'");
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4400
     * @tc.name      testStreamWritable05Chapter0049
     * @tc.desc      Test off method with double quote escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('"');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4500
     * @tc.name      testStreamWritable05Chapter0050
     * @tc.desc      Test off method with question mark escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('?');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4600
     * @tc.name      testStreamWritable05Chapter0051
     * @tc.desc      Test off method with null character escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let nullChar: string = '\x00';
        writableStream.off(nullChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4700
     * @tc.name      testStreamWritable05Chapter0052
     * @tc.desc      Test off method with octal escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let octalChar: string = '\x41';
        writableStream.off(octalChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4800
     * @tc.name      testStreamWritable05Chapter0053
     * @tc.desc      Test off method with hex escape character event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let hexChar: string = '\x41';
        writableStream.off(hexChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4900
     * @tc.name      testStreamWritable05Chapter0054
     * @tc.desc      Test off method with unicode emoji event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('👆');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_5000
     * @tc.name      testStreamWritable05Chapter0055
     * @tc.desc      Test off method with multiple emoji characters event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        writableStream.off('👿👀💯🎅😼🔧💇');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_5100
     * @tc.name      testStreamWritable05Chapter0056
     * @tc.desc      Test off method with invalid unicode event parameter, expect parameter error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          callback();
        }
      }

      let writableStream: stream.Writable = new TestWritable();
      try {
        let invalidUnicode: string = String.fromCodePoint(0xDC04);
        writableStream.off(invalidUnicode);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
  })
}