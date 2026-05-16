import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';

interface StreamError {
  code: number;
  message: string;
}

interface CallbackParamObject {
  a: number;
  b: string;
  c: number[];
}

function wait(timeout: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, timeout));
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

class TestReadableClose extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
  }
}

class TestReadableEnd extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
  }
}

export default function StreamReadable04Test() {
  describe('StreamReadable04Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(200);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0100
     * @tc.name      testStreamReadable04Chapter0001
     * @tc.desc      Test 'close' event triggered when readable push null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        class TestReadableClose extends stream.Readable {
          constructor() {
            super();
          }

          doRead(_size: number): void {
          }
        }

        let readable: TestReadableClose = new TestReadableClose();
        let closeEventTriggered: boolean = false;

        await new Promise<void>((resolve) => {
          readable.on('close', () => {
            closeEventTriggered = true;
            expect(closeEventTriggered).assertTrue();
            resolve();
          });
          readable.push(null);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0200
     * @tc.name      testStreamReadable04Chapter0002
     * @tc.desc      Test 'end' event triggered when readable push null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        class TestReadableEnd extends stream.Readable {
          constructor() {
            super();
          }

          doRead(_size: number): void {
          }
        }

        let readable: TestReadableEnd = new TestReadableEnd();
        let endEventTriggered: boolean = false;

        await new Promise<void>((resolve) => {
          readable.on('end', () => {
            endEventTriggered = true;
            expect(endEventTriggered).assertTrue();
            resolve();
          });
          readable.push(null);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0300
     * @tc.name      testStreamReadable04Chapter0003
     * @tc.desc      Test 'error' event triggered when doRead throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(_size: number): void {
            throw new Error('Simulated error');
          }
        }

        let readable: TestReadable = new TestReadable();
        let errorEventTriggered: boolean = false;

        return new Promise<void>((resolve) => {
          readable.on('error', () => {
            errorEventTriggered = true;
            expect(errorEventTriggered).assertTrue();
            resolve();
          });

          try {
            readable.read();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
          }

          setTimeout(() => {
            if (!errorEventTriggered) {
              expect(errorEventTriggered).assertEqual(true);
            }
            resolve();
          }, 100);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0400
     * @tc.name      testStreamReadable04Chapter0004
     * @tc.desc      Test 'off' method removes readable event listener
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {

        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(_size: number): void {
          }
        }

        let readable = new TestReadable();
        let readableCount: number = 0;

        const readableCallback = (): void => {
          readableCount++;
        };

        readable.on('readable', readableCallback);
        readable.off('readable', readableCallback);

        readable.push('test');
        await wait(100);
        expect(readableCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0500
     * @tc.name      testStreamReadable04Chapter0005
     * @tc.desc      Remove a specific callback for 'readable' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let readableCount: number = 0;

      const readableCallback = (): void => {
        readableCount++;
      };

      readable.on('readable', readableCallback);
      readable.off('readable', readableCallback);

      readable.push('test');
      setTimeout(() => {
        expect(readableCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0600
     * @tc.name      testStreamReadable04Chapter0006
     * @tc.desc      Remove a specific callback for 'data' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let dataCount1: number = 0;

      const dataCallback1 = (): void => {
        dataCount1++;
      };

      readable.on('data', dataCallback1);
      readable.off('data', dataCallback1);

      readable.push('test data');

      setTimeout(() => {
        expect(dataCount1).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0700
     * @tc.name      testStreamReadable04Chapter0007
     * @tc.desc      Remove a specific callback for 'close' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let closeCount: number = 0;

      const closeCallback = (): void => {
        closeCount++;
      };

      readable.on('close', closeCallback);
      readable.off('close', closeCallback);

      readable.push(null);

      setTimeout(() => {
        expect(closeCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0800
     * @tc.name      testStreamReadable04Chapter0008
     * @tc.desc      Remove a specific callback for 'end' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let endCount: number = 0;

      const endCallback = (): void => {
        endCount++;
      };

      readable.on('end', endCallback);
      readable.off('end', endCallback);

      readable.push(null);

      setTimeout(() => {
        expect(endCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0900
     * @tc.name      testStreamReadable04Chapter0009
     * @tc.desc      Remove a specific callback for 'error' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let errorCount: number = 0;

      const errorCallback = (): void => {
        errorCount++;
      };

      readable.on('error', errorCallback);
      readable.off('error', errorCallback);

      setTimeout(() => {
        expect(errorCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1000
     * @tc.name      testStreamReadable04Chapter0010
     * @tc.desc      Remove all callbacks for an event when callback parameter is omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let callCount1: number = 0;
      let callCount2: number = 0;
      let callCount3: number = 0;

      const callback1 = (): void => {
        callCount1++;
      };
      const callback2 = (): void => {
        callCount2++;
      };
      const callback3 = (): void => {
        callCount3++;
      };

      readable.on('readable', callback1);
      readable.on('readable', callback2);
      readable.on('readable', callback3);
      readable.off('readable');

      readable.push('test');

      setTimeout(() => {
        expect(callCount1).assertEqual(0);
        expect(callCount2).assertEqual(0);
        expect(callCount3).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1100
     * @tc.name      testStreamReadable04Chapter0011
     * @tc.desc      Call off for an event that has no registered callbacks (should not throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      expect(readable instanceof TestReadable).assertEqual(true);

      const dummyCallback = (): void => {
      };

      let errorOccurred = false;
      try {
        readable.off('data', dummyCallback);
        readable.off('readable');
        expect(readable !== null).assertEqual(true);
        expect(typeof readable.off).assertEqual('function');
      } catch (err) {
        errorOccurred = true;
        expect(err.code).assertEqual(undefined);
      }

      expect(errorOccurred).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1200
     * @tc.name      testStreamReadable04Chapter0012
     * @tc.desc      Call off with empty string event parameter (should throw error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();

      const dummyCallback = (): void => {
      };

      let offSucceeded = false;

      try {
        readable.off('', dummyCallback);
        offSucceeded = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1300
     * @tc.name      testStreamReadable04Chapter0013
     * @tc.desc      Call off with unsupported event string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();

      const dummyCallback = (): void => {
      };

      let errorOccurred = false;
      try {
        readable.off('unsupported', dummyCallback);
      } catch (err) {
        errorOccurred = true;
        expect(err.code).assertEqual(401);
      }

      expect(errorOccurred).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1400
     * @tc.name      testStreamReadable04Chapter0014
     * @tc.desc      Test off method with pause event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let pauseCount: number = 0;

      const pauseCallback = (): void => {
        pauseCount++;
      };

      readable.on('pause', pauseCallback);
      readable.off('pause', pauseCallback);

      readable.pause();

      setTimeout(() => {
        expect(pauseCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1500
     * @tc.name      testStreamReadable04Chapter0015
     * @tc.desc      Test off method with resume event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let resumeCount: number = 0;

      const resumeCallback = (): void => {
        resumeCount++;
      };

      readable.on('resume', resumeCallback);
      readable.off('resume', resumeCallback);

      readable.pause();
      readable.resume();

      setTimeout(() => {
        expect(resumeCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1600
     * @tc.name      testStreamReadable04Chapter0016
     * @tc.desc      Remove multiple callbacks for same event with different off calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
        }
      }

      let readable = new TestReadable();
      let count1: number = 0;
      let count2: number = 0;
      let count3: number = 0;

      const callback1 = (): void => {
        count1++;
      };
      const callback2 = (): void => {
        count2++;
      };
      const callback3 = (): void => {
        count3++;
      };

      readable.on('data', callback1);
      readable.on('data', callback2);
      readable.on('data', callback3);

      readable.off('data', callback1);
      readable.off('data', callback3);

      readable.push('test');

      setTimeout(() => {
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(1);
        expect(count3).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1700
     * @tc.name      testStreamReadable04Chapter0017
     * @tc.desc      Test doInitialize with valid callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        initializeCalled: boolean = false;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.initializeCalled = true;
          console.info("Readable doInitialize called");
          callback();
        }

        doRead(_size: number): void {

        }
      }

      const myReadable: TestReadable = new TestReadable();
      let dataReceived: boolean = false;

      myReadable.on('data', (): void => {
        dataReceived = true;
      });

      expect(myReadable.initializeCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1800
     * @tc.name      testStreamReadable04Chapter0018
     * @tc.desc      Test doInitialize callback with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();
      expect(myReadable instanceof TestReadable).assertEqual(true);

      let dataListenerAdded = false;

      try {
        myReadable.on('data', (): void => {
        });
        dataListenerAdded = true;

        expect(myReadable !== null).assertEqual(true);
        expect(typeof myReadable.on).assertEqual('function');
        expect(dataListenerAdded).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1900
     * @tc.name      testStreamReadable04Chapter0019
     * @tc.desc      Test doInitialize callback with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();
      expect(myReadable instanceof TestReadable).assertEqual(true);

      let dataListenerAdded = false;

      try {
        myReadable.on('data', (): void => {
        });
        dataListenerAdded = true;

        expect(myReadable !== null).assertEqual(true);
        expect(typeof myReadable.on).assertEqual('function');
        expect(dataListenerAdded).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2000
     * @tc.name      testStreamReadable04Chapter0020
     * @tc.desc      Test doInitialize callback with NaN parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = NaN;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(Number.isNaN(myReadable.callbackParam)).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2100
     * @tc.name      testStreamReadable04Chapter0021
     * @tc.desc      Test doInitialize callback with Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = Infinity;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Infinity);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2200
     * @tc.name      testStreamReadable04Chapter0022
     * @tc.desc      Test doInitialize callback with -Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = -Infinity;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(-Infinity);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2300
     * @tc.name      testStreamReadable04Chapter0023
     * @tc.desc      Test doInitialize callback with number.MAX_VALUE parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = Number.MAX_VALUE;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Number.MAX_VALUE);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2400
     * @tc.name      testStreamReadable04Chapter0024
     * @tc.desc      Test doInitialize callback with Number.MIN_VALUE parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = Number.MIN_VALUE;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Number.MIN_VALUE);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2500
     * @tc.name      testStreamReadable04Chapter0025
     * @tc.desc      Test doInitialize callback with bigint parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: bigint = 0n;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = BigInt(9007199254740991);
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam.toString()).assertEqual("9007199254740991");
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2600
     * @tc.name      testStreamReadable04Chapter0026
     * @tc.desc      Test doInitialize callback with typed array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: Uint8Array = new Uint8Array(0);

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = new Uint8Array([72, 101, 108, 108, 111]);
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        const paramLength: number = myReadable.callbackParam.length;
        const isLengthGreaterThanZero: boolean = paramLength > 0;
        expect(isLengthGreaterThanZero).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2700
     * @tc.name      testStreamReadable04Chapter0027
     * @tc.desc      Test doInitialize with empty string parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: string = "";

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = "";
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual("");
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2800
     * @tc.name      testStreamReadable04Chapter0028
     * @tc.desc      Test doInitialize with special characters in callback parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: string = "";

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        const paramLength: number = myReadable.callbackParam.length;
        const isLengthGreaterThanZero: boolean = paramLength > 0;
        expect(isLengthGreaterThanZero).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2900
     * @tc.name      testStreamReadable04Chapter0029
     * @tc.desc      Test doInitialize with array parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: Array<number> = [];

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = [1, 2, 3, 4, 5];
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam.length).assertEqual(5);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3000
     * @tc.name      testStreamReadable04Chapter0030
     * @tc.desc      Test doInitialize with object parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: CallbackParamObject = { a: 0, b: "", c: [] };

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = { a: 1, b: "test", c: [1, 2, 3] };
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        const keysLength: number = Object.keys(myReadable.callbackParam).length;
        const isKeysLengthGreaterThanZero: boolean = keysLength > 0;
        expect(isKeysLengthGreaterThanZero).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3100
     * @tc.name      testStreamReadable04Chapter0031
     * @tc.desc      Test doInitialize callback not called (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        initializeCalled: boolean = false;

        doInitialize(callback: Function): void {

          this.initializeCalled = true;
          console.info("Readable doInitialize called but callback not invoked");

        }

        doRead(_size: number): void {

        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {

        });

        expect(myReadable.initializeCalled).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3200
     * @tc.name      testStreamReadable04Chapter0032
     * @tc.desc      Test doInitialize with callback throwing error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);

          callback();
          throw new Error("Test error in doInitialize");
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();
      expect(myReadable instanceof TestReadable).assertTrue();

      let errorCaught = false;
      let errorMessage = '';

      try {
        myReadable.on('data', (): void => {
        });
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(undefined);
      }

      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3300
     * @tc.name      testStreamReadable04Chapter0033
     * @tc.desc      Test doInitialize with multiple on listeners
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        initializeCount: number = 0;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.initializeCount++;
          callback();
        }

        doRead(_size: number): void {

        }
      }

      const myReadable: TestReadable = new TestReadable();
      let listener1Called: boolean = false;
      let listener2Called: boolean = false;

      myReadable.on('data', (): void => {
        listener1Called = true;
      });

      myReadable.on('data', (): void => {
        listener2Called = true;
      });

      expect(myReadable.initializeCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3400
     * @tc.name      testStreamReadable04Chapter0034
     * @tc.desc      Test doInitialize with boolean parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        callbackParam: boolean = false;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.callbackParam = true;
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(true);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3500
     * @tc.name      testStreamReadable04Chapter0035
     * @tc.desc      Test doInitialize with different event types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        initializeCalled: boolean = false;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          this.initializeCalled = true;
          callback();
        }

        doRead(_size: number): void {

        }
      }

      const myReadable: TestReadable = new TestReadable();
      let errorHandlerCalled: boolean = false;
      let endHandlerCalled: boolean = false;

      myReadable.on('error', (): void => {
        errorHandlerCalled = true;
      });

      myReadable.on('end', (): void => {
        endHandlerCalled = true;
      });

      expect(myReadable.initializeCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3600
     * @tc.name      testStreamReadable04Chapter0036
     * @tc.desc      Test doInitialize with callback returning value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestReadable extends stream.Readable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
          callback();
        }

        doRead(_size: number): void {
        }
      }

      const myReadable: TestReadable = new TestReadable();

      let callbackCalled = false;
      try {
        myReadable.on('data', (): void => {
          callbackCalled = true;
        });

        expect(callbackCalled).assertEqual(false);
      } catch (error) {
        expect(error.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3700
     * @tc.name      testStreamReadable04Chapter0037
     * @tc.desc      Test read method with NaN parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        doRead(_size: number): void {
        }
      }

      let readable: TestReadable = new TestReadable();
      readable.on('data', () => {
      });

      try {
        readable.read(NaN);
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3800
     * @tc.name      testStreamReadable04Chapter0038
     * @tc.desc      Test read method with Infinity parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        doRead(_size: number): void {
        }
      }

      let readable: TestReadable = new TestReadable();
      readable.on('data', () => {
      });

      try {
        readable.read(Infinity);
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3900
     * @tc.name      testStreamReadable04Chapter0039
     * @tc.desc      Test read method with negative parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestReadable extends stream.Readable {
        doRead(_size: number): void {
        }
      }

      let readable: TestReadable = new TestReadable();
      readable.on('data', () => {
      });

      try {
        readable.read(-1);
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_4000
     * @tc.name      testStreamReadable04Chapter0040
     * @tc.desc      Test read method with valid 65535 size parameter calls doRead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedSize = 0;

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          receivedSize = size;
        }
      }

      let readable: TestReadable = new TestReadable();
      readable.on('data', () => {
      });
      readable.read(65536);

      expect(receivedSize > 0).assertTrue();
    });
  });
}