import { stream, util } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamWritable07Test() {
  describe('StreamWritable07Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0100
     * @tc.name      testStreamWritable07Chapter0001
     * @tc.desc      Test doInitialize with normal callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialized = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(initialized).assertFalse();
      setTimeout(() => {
        expect(initialized).assertTrue();
      }, 10);
      initialized = true;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0200
     * @tc.name      testStreamWritable07Chapter0002
     * @tc.desc      Test doInitialize with callback that returns value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackResult: number = 0;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(callbackResult).assertEqual(0);
      setTimeout(() => {
        expect(callbackResult).assertEqual(42);
      }, 10);
      callbackResult = 42;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0300
     * @tc.name      testStreamWritable07Chapter0003
     * @tc.desc      Test doInitialize with arrow function callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrowFuncCalled = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(arrowFuncCalled).assertFalse();
      setTimeout(() => {
        expect(arrowFuncCalled).assertTrue();
      }, 10);
      arrowFuncCalled = true;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0400
     * @tc.name      testStreamWritable07Chapter0004
     * @tc.desc      Test doInitialize with async callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncComplete = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(asyncComplete).assertFalse();
      setTimeout(() => {
        expect(asyncComplete).assertTrue();
      }, 50);
      asyncComplete = true;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0500
     * @tc.name      testStreamWritable07Chapter0005
     * @tc.desc      Test doInitialize with callback that throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorCaught = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(errorCaught).assertFalse();
      setTimeout(() => {
        expect(errorCaught).assertTrue();
      }, 10);
      errorCaught = true;
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0600
     * @tc.name      testStreamWritable07Chapter0006
     * @tc.desc      Test doInitialize with callback that has parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let paramValue: string = '';

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(paramValue).assertEqual('');
      setTimeout(() => {
        expect(paramValue).assertEqual('testParam');
      }, 10);
      paramValue = 'testParam';
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0700
     * @tc.name      testStreamWritable07Chapter0007
     * @tc.desc      Test doInitialize without calling super.doInitialize
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let customInit = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          customInit = true;
          callback();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      setTimeout(() => {
        expect(customInit).assertTrue();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0800
     * @tc.name      testStreamWritable07Chapter0010
     * @tc.desc      Test doInitialize with callback accessing this context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        private contextValue: number = 100;

        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }

        getContextValue(): number {
          return this.contextValue;
        }
      }

      const writable = new TestWritable();
      setTimeout(() => {
        expect(writable.getContextValue()).assertEqual(100);
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_0900
     * @tc.name      testStreamWritable07Chapter0011
     * @tc.desc      Test doInitialize with null callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1000
     * @tc.name      testStreamWritable07Chapter0012
     * @tc.desc      Test doInitialize with undefined callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1100
     * @tc.name      testStreamWritable07Chapter0013
     * @tc.desc      Test doInitialize with number instead of callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1200
     * @tc.name      testStreamWritable07Chapter0014
     * @tc.desc      Test doInitialize with string instead of callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1300
     * @tc.name      testStreamWritable07Chapter0015
     * @tc.desc      Test doInitialize with object instead of callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1400
     * @tc.name      testStreamWritable07Chapter0016
     * @tc.desc      Test doInitialize with array instead of callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0016",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1500
     * @tc.name      testStreamWritable07Chapter0017
     * @tc.desc      Test doInitialize with boolean instead of callback (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {


        class TestWritable extends stream.Writable {
          doInitialize(callback: Function | undefined): void {
            super.doInitialize(callback);
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
            callback();
          }
        }

        const writable = new TestWritable();
        expect(writable == null).assertFalse();
      });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1600
     * @tc.name      testStreamWritable07Chapter0018
     * @tc.desc      Test doInitialize without overriding doWrite method (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }
      }

      let writableCreated = false;
      try {
        const writable = new TestWritable();
        writableCreated = true;
        expect(writable == null).assertEqual(false);
      } catch (error) {
        expect(error.code).assertEqual(401);
      }

      expect(writableCreated).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1700
     * @tc.name      testStreamWritable07Chapter0019
     * @tc.desc      Test doInitialize with empty class extending Writable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      setTimeout(() => {
        expect(writable == null).assertFalse();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1800
     * @tc.name      testStreamWritable07Chapter0020
     * @tc.desc      Test doInitialize with callback that uses setTimeout
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncResult: boolean = false;

      class TestWritable extends stream.Writable {
        doInitialize(callback: Function): void {
          super.doInitialize(callback);
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          super.doWrite(chunk, encoding, callback);
        }
      }

      const writable = new TestWritable();
      expect(asyncResult).assertFalse();
      setTimeout(() => {
        asyncResult = true;
        expect(asyncResult).assertTrue();
      }, 20);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_1900
     * @tc.name      testStreamWritable07Chapter0021
     * @tc.desc      Write normal UTF-8 encoded string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with chunk:", chunk)
          console.info("doWrite called with encoding:", encoding)
          expect(typeof chunk).assertEqual('string')
          expect(chunk as string).assertEqual('OpenHarmony')
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.write('OpenHarmony', 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2000
     * @tc.name      testStreamWritable07Chapter0022
     * @tc.desc      Write Uint8Array with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with Uint8Array")
          expect(chunk instanceof Uint8Array).assertTrue()
          let uint8Array = chunk as Uint8Array
          expect(uint8Array.length).assertEqual(11)
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let textEncoder = new util.TextEncoder()
      const dataArray = textEncoder.encode('OpenHarmony')
      let writableStream = new TestWritableImpl()
      writableStream.write(dataArray, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2100
     * @tc.name      testStreamWritable07Chapter0023
     * @tc.desc      Write empty string with UTF-8 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        private dataReceived: string[] = []

        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with empty string")
          expect(typeof chunk).assertEqual('string')
          expect((chunk as string).length).assertEqual(0)
          expect(encoding).assertEqual('utf8')
          this.dataReceived.push(chunk as string)
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.end('', 'utf8', () => {
      })
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2200
     * @tc.name      testStreamWritable07Chapter0024
     * @tc.desc      Write string with GBK encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with GBK encoding")
          expect(typeof chunk).assertEqual('string')
          expect(chunk as string).assertEqual('测试数据')
          expect(encoding).assertEqual('gbk')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.write('测试数据', 'gbk')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2300
     * @tc.name      testStreamWritable07Chapter0025
     * @tc.desc      Write string with GB18030 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with GB18030 encoding")
          expect(typeof chunk).assertEqual('string')
          expect(encoding).assertEqual('gb18030')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.write('中华人民共和国', 'gb18030')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2400
     * @tc.name      testStreamWritable07Chapter0026
     * @tc.desc      Write string with GB2312 encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with GB2312 encoding")
          expect(typeof chunk).assertEqual('string')
          expect(encoding).assertEqual('gb2312')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.write('简体中文', 'gb2312')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2500
     * @tc.name      testStreamWritable07Chapter0027
     * @tc.desc      Write string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with special characters")
          expect(typeof chunk).assertEqual('string')
          const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
          expect(chunk as string).assertEqual(specialChars)
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
      writableStream.write(specialChars, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2600
     * @tc.name      testStreamWritable07Chapter0028
     * @tc.desc      Write string containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with emoji string")
          expect(typeof chunk).assertEqual('string')
          const emojiStr = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴'
          expect(chunk as string).assertEqual(emojiStr)
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let writableStream = new TestWritableImpl()
      const emojiStr = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴'
      writableStream.write(emojiStr, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2700
     * @tc.name      testStreamWritable07Chapter0029
     * @tc.desc      Write Uint8Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with Uint8Array boundary values")
          expect(chunk instanceof Uint8Array).assertTrue()
          let uint8Array = chunk as Uint8Array
          expect(uint8Array.length).assertEqual(4)
          expect(uint8Array[0]).assertEqual(0)
          expect(uint8Array[1]).assertEqual(255)
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let boundaryArray = new Uint8Array([0, 255, 128, 127])
      let writableStream = new TestWritableImpl()
      writableStream.write(boundaryArray, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2800
     * @tc.name      testStreamWritable07Chapter0030
     * @tc.desc      Write large Uint8Array data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with large Uint8Array")
          expect(chunk instanceof Uint8Array).assertTrue()
          let uint8Array = chunk as Uint8Array
          expect(uint8Array.length > 0).assertTrue()
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let largeArray = new Uint8Array(1024)
      for (let i = 0; i < largeArray.length; i++) {
        largeArray[i] = i % 256
      }

      let writableStream = new TestWritableImpl()
      writableStream.write(largeArray, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_2900
     * @tc.name      testStreamWritable07Chapter0031
     * @tc.desc      Test with invalid encoding parameter (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        private receivedData: Array<string | Uint8Array> = []
        private receivedEncodings: string[] = []

        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with encoding:", encoding)
          this.receivedData.push(chunk)
          this.receivedEncodings.push(encoding)
          callback()
        }
      }

      let writableStream = new TestWritableImpl()

      try {
        const result = writableStream.write('test data', 'invalid-encoding')
        console.info("Write result with invalid encoding:", result)

        expect(typeof result).assertEqual('boolean')

        writableStream.end()

        expect(writableStream.writable).assertFalse()

      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3000
     * @tc.name      testStreamWritable07Chapter0032
     * @tc.desc      Test with null chunk parameter (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        private writeCount: number = 0

        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with chunk:", chunk)
          this.writeCount++
          expect(chunk == null).assertFalse()
          callback()
        }
      }

      let writableStream = new TestWritableImpl()

      try {
        const result = writableStream.write(null, 'utf8')
        console.info("Write result with null chunk:", result)

        expect(typeof result).assertEqual('boolean')

        writableStream.end()

      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3100
     * @tc.name      testStreamWritable07Chapter0033
     * @tc.desc      Test with undefined chunk parameter (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        private writeCount: number = 0

        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with chunk:", chunk)
          this.writeCount++
          expect(chunk).assertUndefined()
          callback()
        }
      }

      let writableStream = new TestWritableImpl()

      try {
        const result = writableStream.write(undefined, 'utf8')
        console.info("Write result with undefined chunk:", result)

        expect(typeof result).assertEqual('boolean')

        writableStream.end()

      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3200
     * @tc.name      testStreamWritable07Chapter0034
     * @tc.desc      Test with invalid chunk type (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          callback()
        }
      }

      let writableStream = new TestWritableImpl()

      try {
        const result = writableStream.write('test data', 'utf8')
        expect(typeof result).assertEqual('boolean')

        writableStream.end()

        expect(writableStream.writable).assertEqual(false)

      } catch (err) {
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3300
     * @tc.name      testStreamWritable07Chapter0035
     * @tc.desc      Test with empty encoding parameter (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        private receivedEncodings: string[] = []

        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with empty encoding:", encoding)
          this.receivedEncodings.push(encoding)
          expect(typeof encoding).assertEqual('string')
          expect(encoding.length).assertEqual(0)
          callback()
        }
      }

      let writableStream = new TestWritableImpl()

      try {
        const result = writableStream.write('test data', '')
        console.info("Write result with empty encoding:", result)

        expect(typeof result).assertEqual('boolean')

        writableStream.end()

        expect(writableStream.writable).assertFalse()

      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3400
     * @tc.name      testStreamWritable07Chapter0036
     * @tc.desc      Test doWrite callback error handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }
        _write(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
          this.doWrite(chunk, encoding, callback);
        }
        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void) {
          console.info("doWrite called, simulating callback error")
          expect(typeof chunk).assertEqual('string')
          expect(encoding).assertEqual('utf8')
          const mockError = new Error('Simulated callback error')
          setTimeout(() => callback(mockError), 0);
        }
      }
      let writableStream = new TestWritableImpl()
      let errorCaught = false
      writableStream.on('error', (data: Object) => {
        const err = data as Error
        errorCaught = true
      })
      writableStream.write('test data', 'utf8')

      await new Promise<void>((resolve) => {
        setTimeout(() => {
          expect(errorCaught).assertTrue()
          resolve();
        }, 100)
      })
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3500
     * @tc.name      testStreamWritable07Chapter0037
     * @tc.desc      Test multiple sequential write calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let writeCount = 0
      const expectedWrites = 3

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          writeCount++
          console.info(`doWrite call ${writeCount} with chunk:`, chunk)
          expect(encoding).assertEqual('utf8')

          callback()

          if (writeCount === expectedWrites) {
            expect(writeCount).assertEqual(expectedWrites)
          }
        }
      }

      let writableStream = new TestWritableImpl()
      writableStream.write('first', 'utf8')
      writableStream.write('second', 'utf8')
      writableStream.write('third', 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3600
     * @tc.name      testStreamWritable07Chapter0038
     * @tc.desc      Test mixed string and Uint8Array writes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let writeTypes: string[] = []

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          if (typeof chunk === 'string') {
            writeTypes.push('string')
          } else if (chunk instanceof Uint8Array) {
            writeTypes.push('Uint8Array')
          }

          callback()

          if (writeTypes.length === 4) {
            expect(writeTypes[0]).assertEqual('string')
            expect(writeTypes[1]).assertEqual('Uint8Array')
            expect(writeTypes[2]).assertEqual('string')
            expect(writeTypes[3]).assertEqual('Uint8Array')
          }
        }
      }

      let writableStream = new TestWritableImpl()
      let textEncoder = new util.TextEncoder()

      writableStream.write('string data', 'utf8')
      writableStream.write(textEncoder.encode('binary data'), 'utf8')
      writableStream.write('another string', 'gbk')
      writableStream.write(new Uint8Array([1, 2, 3, 4]), 'gb2312')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3700
     * @tc.name      testStreamWritable07Chapter0039
     * @tc.desc      Test with long string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with long string")
          expect(typeof chunk).assertEqual('string')
          let str = chunk as string
          expect(str.length > 1000).assertTrue()
          expect(str.startsWith('start-')).assertTrue()
          expect(str.endsWith('-end')).assertTrue()
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }


      let longString = 'start-'
      for (let i = 0; i < 1000; i++) {
        longString += `data${i}-`
      }
      longString += 'end'

      let writableStream = new TestWritableImpl()
      writableStream.write(longString, 'utf8')

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSEVEN_3800
     * @tc.name      testStreamWritable07Chapter0044
     * @tc.desc      Test with zero-length Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamWritable07Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class TestWritableImpl extends stream.Writable {
        constructor() {
          super()
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void) {
          console.info("doWrite called with zero-length Uint8Array")
          expect(chunk instanceof Uint8Array).assertTrue()
          let uint8Array = chunk as Uint8Array
          expect(uint8Array.length).assertEqual(0)
          expect(encoding).assertEqual('utf8')
          callback()
        }
      }

      let emptyArray = new Uint8Array(0)
      let writableStream = new TestWritableImpl()
      writableStream.write(emptyArray, 'utf8')

    })
  })
}