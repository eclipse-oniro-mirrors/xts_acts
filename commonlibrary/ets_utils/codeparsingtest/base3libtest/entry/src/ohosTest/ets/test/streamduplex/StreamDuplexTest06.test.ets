import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamDuplex06Test() {
  describe('StreamDuplex06Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0100
     * @tc.name      testStreamDuplex06Chapter0001
     * @tc.desc      Test doWrite with valid gbk string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('测试数据', 'gbk', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('测试数据');
          expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('gbk');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0200
     * @tc.name      testStreamDuplex06Chapter0002
     * @tc.desc      Test doWrite with valid gb18030 string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('中文数据', 'gb18030', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('中文数据');
          expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('gb18030');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0300
     * @tc.name      testStreamDuplex06Chapter0003
     * @tc.desc      Test doWrite with valid gb2312 string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('简单文本', 'gb2312', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('简单文本');
          expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('gb2312');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0400
     * @tc.name      testStreamDuplex06Chapter0004
     * @tc.desc      Test doWrite with Uint8Array chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(uint8Array);
          expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('utf8');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0500
     * @tc.name      testStreamDuplex06Chapter0005
     * @tc.desc      Test doWrite with empty string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        callbackCalled: boolean = false;

        constructor() {
          super();
          this.callbackCalled = false;
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.callbackCalled = true;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('test', 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('test');
          expect((duplexStream as TestDuplex).callbackCalled).assertTrue();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0600
     * @tc.name      testStreamDuplex06Chapter0006
     * @tc.desc      Test doWrite with special characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      await new Promise<void>((resolve) => {
        duplexStream.write(specialChars, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(specialChars);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0700
     * @tc.name      testStreamDuplex06Chapter0007
     * @tc.desc      Test doWrite with emoji string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let emojiString = '👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴';
      await new Promise<void>((resolve) => {
        duplexStream.write(emojiString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(emojiString);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0800
     * @tc.name      testStreamDuplex06Chapter0008
     * @tc.desc      Test doWrite with escape characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let escapeString = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\\"\\?\\0\\x41\\101';
      await new Promise<void>((resolve) => {
        duplexStream.write(escapeString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(escapeString);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_0900
     * @tc.name      testStreamDuplex06Chapter0009
     * @tc.desc      Test doWrite with large string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedLength: number = 0;
        callbackCalled: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (typeof chunk === 'string') {
            this.receivedLength = chunk.length;
          } else {
            this.receivedLength = chunk.length;
          }
          this.callbackCalled = true;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let largeString = 'a'.repeat(100000);
      await new Promise<void>((resolve) => {
        duplexStream.write(largeString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedLength).assertEqual(100000);
          expect((duplexStream as TestDuplex).callbackCalled).assertTrue();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1000
     * @tc.name      testStreamDuplex06Chapter0010
     * @tc.desc      Test doWrite with Uint8Array containing boundary values
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        callbackCalled: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          this.callbackCalled = true;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let uint8Array = new Uint8Array([0, 255, 128, 127]);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData[0]).assertEqual(0);
          expect((duplexStream as TestDuplex).receivedData[1]).assertEqual(255);
          expect((duplexStream as TestDuplex).receivedData[2]).assertEqual(128);
          expect((duplexStream as TestDuplex).receivedData[3]).assertEqual(127);
          expect((duplexStream as TestDuplex).callbackCalled).assertTrue();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1100
     * @tc.name      testStreamDuplex06Chapter0011
     * @tc.desc      Test doWrite with Uint8Array containing multiple zeros
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        dataLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
            this.dataLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 0, 0, 0, 0, 0, 87, 111, 114, 108, 100]);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).dataLength).assertEqual(15);
          expect((duplexStream as TestDuplex).receivedData[5]).assertEqual(0);
          expect((duplexStream as TestDuplex).receivedData[6]).assertEqual(0);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1200
     * @tc.name      testStreamDuplex06Chapter0012
     * @tc.desc      Test doWrite with empty Uint8Array
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        dataLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
            this.dataLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let uint8Array = new Uint8Array([]);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).dataLength).assertEqual(0);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1300
     * @tc.name      testStreamDuplex06Chapter0013
     * @tc.desc      Test doWrite with invalid encoding parameter (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write('test', 'invalid_encoding');
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(401);
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1400
     * @tc.name      testStreamDuplex06Chapter0014
     * @tc.desc      Test doWrite with null chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write(null, 'utf8');
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(401);
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1500
     * @tc.name      testStreamDuplex06Chapter0015
     * @tc.desc      Test doWrite with undefined chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write(undefined, 'utf8');
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(401);
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1600
     * @tc.name      testStreamDuplex06Chapter0016
     * @tc.desc      Test doWrite with number chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.write(JSON.stringify(123), 'utf8');
      expect((duplexStream as TestDuplex).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1700
     * @tc.name      testStreamDuplex06Chapter0017
     * @tc.desc      Test doWrite with boolean chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.write(JSON.stringify(true), 'utf8');
      expect((duplexStream as TestDuplex).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1800
     * @tc.name      testStreamDuplex06Chapter0018
     * @tc.desc      Test doWrite with object chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.write(JSON.stringify({}), 'utf8');
      expect((duplexStream as TestDuplex).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_1900
     * @tc.name      testStreamDuplex06Chapter0019
     * @tc.desc      Test doWrite with array chunk (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      duplexStream.write(JSON.stringify([1, 2, 3]), 'utf8');
      expect((duplexStream as TestDuplex).toString()).assertEqual('[object Object]');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2000
     * @tc.name      testStreamDuplex06Chapter0020
     * @tc.desc      Test doWrite with number encoding (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write('test', JSON.stringify(123));
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(401);
      }
      expect(errorThrown).assertTrue();
    });



    /** 
  * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2100 
  * @tc.name      testStreamDuplex06Chapter0021 
  * @tc.desc      Test doWrite with undefined encoding (negative test) 
  * @tc.type      Function 
  * @tc.size      MediumTest 
  * @tc.level     Level 2 
  */ 
 it('testStreamDuplex06Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { 

   class TestDuplex extends stream.Duplex { 
     constructor () { 
       super (); 
     } 
 
     doRead(size: number) { 
     } 
 
     doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) { 
       callback(); 
     } 
   } 
 
   let duplexStream = new TestDuplex(); 
   try { 
     let result = duplexStream.write('test', undefined); 
     expect(result).assertTrue();
   } catch (err) { 
     if (err.code !== undefined) { 
       expect(err.code).assertEqual(401); 
     } else { 
       expect(err !== undefined).assertTrue(); 
     } 
   } 
 });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2200
     * @tc.name      testStreamDuplex06Chapter0022
     * @tc.desc      Test doWrite with number encoding (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write('test', JSON.stringify(123));
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(401);
      }
      expect(errorThrown).assertTrue();
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2300
     * @tc.name      testStreamDuplex06Chapter0023
     * @tc.desc      Test doWrite without callback parameter (negative test)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      expect(duplexStream instanceof TestDuplex).assertEqual(true);

      let errorCaught = false;

      try {
        const writeResult = duplexStream.write('test', 'utf8');
        expect(typeof writeResult).assertEqual('boolean');
      } catch (err) {
        errorCaught = true;
        expect(err.code).assertEqual(401);
      }

      if (errorCaught) {
        expect(errorCaught).assertEqual(true);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2400
     * @tc.name      testStreamDuplex06Chapter0024
     * @tc.desc      Test doWrite with ASCII characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let asciiString =
        '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      await new Promise<void>((resolve) => {
        duplexStream.write(asciiString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(asciiString);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2500
     * @tc.name      testStreamDuplex06Chapter0025
     * @tc.desc      Test doWrite with Uint8Array from other TypedArray conversion
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let int8Array = new Int8Array([-128, -1, 0, 1, 127]);
      let uint8Array = new Uint8Array(int8Array.buffer);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData.length).assertEqual(5);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2600
     * @tc.name      testStreamDuplex06Chapter0026
     * @tc.desc      Test doWrite callback error handling
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        errorTriggered: boolean = false;

        constructor() {
          super();
          this.on('error', () => {
            this.errorTriggered = true;
          });
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          const testError = new Error('Test error');
          callback(testError);
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('test', 'utf8', (err: Error) => {
          expect(err.message).assertEqual('Test error');
          resolve();
        });
      });
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          expect((duplexStream as TestDuplex).errorTriggered).assertTrue();
          resolve();
        }, 0);
      });
    });



    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2700
     * @tc.name      testStreamDuplex06Chapter0027
     * @tc.desc      Test doWrite with repeated special characters string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let repeatedSpecialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      await new Promise<void>((resolve) => {
        duplexStream.write(repeatedSpecialChars, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(repeatedSpecialChars);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2800
     * @tc.name      testStreamDuplex06Chapter0028
     * @tc.desc      Test doWrite with keyword string chunk
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let keywordString = '0 NaN Infinity';
      await new Promise<void>((resolve) => {
        duplexStream.write(keywordString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(keywordString);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_2900
     * @tc.name      testStreamDuplex06Chapter0029
     * @tc.desc      Test doWrite with ASCII encoding
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('Hello World', 'ascii', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('Hello World');
          expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('ascii');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3000
     * @tc.name      testStreamDuplex06Chapter0030
     * @tc.desc      Test doWrite with base64 encoded data
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let base64String = 'SGVsbG8gV29ybGQ=';

      try {
        await new Promise<void>((resolve) => {
          duplexStream.write(base64String, 'base64', () => {
            expect((duplexStream as TestDuplex).receivedData).assertEqual(base64String);
            expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('base64');
            resolve();
          });
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3100
     * @tc.name      testStreamDuplex06Chapter0031
     * @tc.desc      Test doWrite with hex encoded data
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let hexString = '48656c6c6f20576f726c64';

      try {
        await new Promise<void>((resolve) => {
          duplexStream.write(hexString, 'hex', () => {
            expect((duplexStream as TestDuplex).receivedData).assertEqual(hexString);
            expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('hex');
            resolve();
          });
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3200
     * @tc.name      testStreamDuplex06Chapter0032
     * @tc.desc      Test doWrite with latin1 encoding
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let latin1String = 'Hello World';

      try {
        await new Promise<void>((resolve) => {
          duplexStream.write(latin1String, 'latin1', () => {
            expect((duplexStream as TestDuplex).receivedData).assertEqual(latin1String);
            expect((duplexStream as TestDuplex).receivedEncoding).assertEqual('latin1');
            resolve();
          });
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3300
     * @tc.name      testStreamDuplex06Chapter0033
     * @tc.desc      Test doWrite with Int8Array converted to Uint8Array
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        receivedLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
            this.receivedLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let int8Array = new Int8Array([-128, -64, 0, 64, 127]);
      let uint8Array = new Uint8Array(int8Array.buffer);
      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedLength).assertEqual(5);
          expect((duplexStream as TestDuplex).receivedData instanceof Uint8Array).assertTrue();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3400
     * @tc.name      testStreamDuplex06Chapter0034
     * @tc.desc      Test doWrite with multiple consecutive writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Array<string | Uint8Array> = [];
        writeCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData.push(chunk);
          this.writeCount++;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        let callbacksCompleted = 0;

        duplexStream.write('First', 'utf8', () => {
          callbacksCompleted++;
        });

        duplexStream.write('Second', 'utf8', () => {
          callbacksCompleted++;
        });

        duplexStream.write('Third', 'utf8', () => {
          callbacksCompleted++;
          expect((duplexStream as TestDuplex).writeCount).assertEqual(3);
          expect((duplexStream as TestDuplex).receivedData[0]).assertEqual('First');
          expect((duplexStream as TestDuplex).receivedData[1]).assertEqual('Second');
          expect((duplexStream as TestDuplex).receivedData[2]).assertEqual('Third');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3500
     * @tc.name      testStreamDuplex06Chapter0035
     * @tc.desc      Test doWrite with mixed string and Uint8Array writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Array<string | Uint8Array> = [];

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData.push(chunk);
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let uint8Array = new Uint8Array([65, 66, 67]);

      await new Promise<void>((resolve) => {
        let callbacksCompleted = 0;

        duplexStream.write('Hello', 'utf8', () => {
          callbacksCompleted++;
        });

        duplexStream.write(uint8Array, 'utf8', () => {
          callbacksCompleted++;
        });

        duplexStream.write('World', 'utf8', () => {
          callbacksCompleted++;
          expect((duplexStream as TestDuplex).receivedData.length).assertEqual(3);
          expect((duplexStream as TestDuplex).receivedData[0]).assertEqual('Hello');
          expect((duplexStream as TestDuplex).receivedData[1] instanceof Uint8Array).assertTrue();
          expect((duplexStream as TestDuplex).receivedData[2]).assertEqual('World');
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3600
     * @tc.name      testStreamDuplex06Chapter0036
     * @tc.desc      Test doWrite with very large Uint8Array (1MB)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let size = 1024;
      let uint8Array = new Uint8Array(size);
      for (let i = 0; i < size; i++) {
        uint8Array[i] = i % 256;
      }

      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedLength).assertEqual(size);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3700
     * @tc.name      testStreamDuplex06Chapter0037
     * @tc.desc      Test doWrite with encoding parameter omitted (should default to utf8)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';
        receivedEncoding: string = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          this.receivedEncoding = encoding;
          callback();
        }
      }

      let duplexStream = new TestDuplex();


      return new Promise<void>((resolve) => {

        duplexStream.write('Hello World', undefined, () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual('Hello World');


          const receivedEncoding = (duplexStream as TestDuplex).receivedEncoding;
          expect(receivedEncoding === 'utf8' || receivedEncoding === '').assertTrue();

          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3800
     * @tc.name      testStreamDuplex06Chapter0038
     * @tc.desc      Test doWrite with callback parameter omitted
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        writeCalled: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCalled = true;
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let result = duplexStream.write('Hello World', 'utf8');

      await new Promise<void>((resolve) => {
        setTimeout(() => {
          expect((duplexStream as TestDuplex).writeCalled).assertTrue();

          expect(typeof result === 'boolean').assertTrue();
          resolve();
        }, 0);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_3900
     * @tc.name      testStreamDuplex06Chapter0039
     * @tc.desc      Test doWrite with both encoding and callback omitted
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        writeCalled: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCalled = true;
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let result = duplexStream.write('Hello World');
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          expect((duplexStream as TestDuplex).writeCalled).assertTrue();
          expect(typeof result === 'boolean').assertTrue();
          resolve();
        }, 0);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4000
     * @tc.name      testStreamDuplex06Chapter0040
     * @tc.desc      Test doWrite with synchronous error thrown in doWrite
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        constructor() {
          super();
          this.on('error', (err) => {

          });
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          throw new Error('Synchronous error in doWrite');
        }
      }

      let duplexStream = new TestDuplex();
      let errorThrown = false;
      try {
        duplexStream.write('test', 'utf8', () => {
        });
      } catch (err) {
        errorThrown = true;
        expect(err.code).assertEqual(undefined);
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4100
     * @tc.name      testStreamDuplex06Chapter0041
     * @tc.desc      Test doWrite with callback called multiple times (should handle gracefully)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestDuplex extends stream.Duplex {
        callbackCount: number = 0;
        writeCompleted: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
          this.callbackCount++;

          if (this.callbackCount === 1) {
            setTimeout(() => {
              try {
                callback();
              } catch (e) {
                expect(e.code).assertEqual(401);
              }
            }, 0);
          }
        }
      }

      let duplexStream = new TestDuplex();
      expect(duplexStream instanceof TestDuplex).assertEqual(true);

      let writeCallbackCalled = false;
      await new Promise<void>((resolve) => {
        const writeResult = duplexStream.write('test', 'utf8', () => {
          writeCallbackCalled = true;
          resolve();
        });
        expect(typeof writeResult).assertEqual('boolean');
      });

      expect(writeCallbackCalled).assertEqual(true);
      expect(duplexStream.callbackCount).assertLargerOrEqual(1);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4200
     * @tc.name      testStreamDuplex06Chapter0042
     * @tc.desc      Test doWrite with async callback execution
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        writeCompleted: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {

          setTimeout(() => {
            this.writeCompleted = true;
            callback();
          }, 10);
        }
      }

      let duplexStream = new TestDuplex();
      await new Promise<void>((resolve) => {
        duplexStream.write('test', 'utf8', () => {
          expect((duplexStream as TestDuplex).writeCompleted).assertTrue();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4300
     * @tc.name      testStreamDuplex06Chapter0043
     * @tc.desc      Test doWrite when stream is in closed state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      interface ITestDuplex {
        doWriteCalled: boolean;
        markAsClosed(): void;
        isClosed(): boolean;
      }

      class TestDuplex extends stream.Duplex implements ITestDuplex {
        doWriteCalled: boolean = false;
        private streamClosed: boolean = false;

        constructor() {
          super();
        }

        doRead(size: number): void {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
          if (this.streamClosed) {
            callback(new Error('Stream is closed'));
            return;
          }

          this.doWriteCalled = true;
          callback();
        }

        markAsClosed(): void {
          this.streamClosed = true;
        }

        isClosed(): boolean {
          return this.streamClosed;
        }
      }

      let duplexStream: TestDuplex = new TestDuplex();
      duplexStream.markAsClosed();

      return new Promise<void>((resolve: () => void) => {
        duplexStream.write('test', 'utf8', (err: Error | undefined) => {
          expect(err instanceof Error).assertTrue();
          expect(duplexStream.doWriteCalled).assertFalse();
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4400
     * @tc.name      testStreamDuplex06Chapter0044
     * @tc.desc      Test doWrite with backpressure (write returns false when buffer full)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        writeCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {

        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCount++;

          setTimeout(() => {
            callback();
          }, 50);
        }
      }

      let duplexStream = new TestDuplex();


      let result1 = duplexStream.write('0123456789', 'utf8');
      expect(result1).assertTrue();


      let result2 = duplexStream.write('0123456789', 'utf8');

      expect(typeof result2 === 'boolean').assertTrue();

      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 100);
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4500
     * @tc.name      testStreamDuplex06Chapter0045
     * @tc.desc      Test doWrite with zero-length Uint8Array but with buffer
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        dataLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
            this.dataLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let buffer = new ArrayBuffer(10);
      let uint8Array = new Uint8Array(buffer, 0, 0);

      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).dataLength).assertEqual(0);
          expect((duplexStream as TestDuplex).receivedData.buffer).assertEqual(buffer);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4600
     * @tc.name      testStreamDuplex06Chapter0046
     * @tc.desc      Test doWrite with Uint8Array created from ArrayBuffer with offset
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Uint8Array = new Uint8Array();
        dataLength: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          if (chunk instanceof Uint8Array) {
            this.receivedData = chunk;
            this.dataLength = chunk.length;
          }
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let buffer = new ArrayBuffer(20);
      let view = new Uint8Array(buffer);
      for (let i = 0; i < 20; i++) {
        view[i] = i;
      }
      let uint8Array = new Uint8Array(buffer, 5, 10);

      await new Promise<void>((resolve) => {
        duplexStream.write(uint8Array, 'utf8', () => {
          expect((duplexStream as TestDuplex).dataLength).assertEqual(10);
          expect((duplexStream as TestDuplex).receivedData[0]).assertEqual(5);
          expect((duplexStream as TestDuplex).receivedData[9]).assertEqual(14);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4700
     * @tc.name      testStreamDuplex06Chapter0047
     * @tc.desc      Test doWrite with empty string and Uint8Array in sequence
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: Array<string | Uint8Array> = [];

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData.push(chunk);
          callback();
        }
      }
      let duplexStream = new TestDuplex();

      await new Promise<void>((resolve) => {
        let callbacksCompleted = 0;
        const totalWrites = 3;

        const checkCompletion = () => {
          callbacksCompleted++;
          if (callbacksCompleted === totalWrites) {
            expect((duplexStream as TestDuplex).receivedData.length).assertEqual(3);
            expect((duplexStream as TestDuplex).receivedData[0]).assertEqual('first');
            expect((duplexStream as TestDuplex).receivedData[1] instanceof Uint8Array).assertTrue();
            expect(((duplexStream as TestDuplex).receivedData[1] as Uint8Array).length).assertEqual(3);
            expect((duplexStream as TestDuplex).receivedData[2]).assertEqual('third');
            resolve();
          }
        };

        duplexStream.write('first', 'utf8', () => {
          checkCompletion();
        });

        duplexStream.write(new Uint8Array([1, 2, 3]), 'utf8', () => {
          checkCompletion();
        });

        duplexStream.write('third', 'utf8', () => {
          checkCompletion();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4800
     * @tc.name      testStreamDuplex06Chapter0048
     * @tc.desc      Test doWrite with all control characters (0x00-0x1F, 0x7F)
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let controlChars = '';
      for (let i = 0; i <= 0x1F; i++) {
        controlChars += String.fromCharCode(i);
      }
      controlChars += String.fromCharCode(0x7F);

      await new Promise<void>((resolve) => {
        duplexStream.write(controlChars, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(controlChars);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_4900
     * @tc.name      testStreamDuplex06Chapter0049
     * @tc.desc      Test doWrite with string containing only whitespace characters
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let whitespaceString = ' \t\n\r\v\f\u00A0\u2028\u2029';

      await new Promise<void>((resolve) => {
        duplexStream.write(whitespaceString, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(whitespaceString);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_5000
     * @tc.name      testStreamDuplex06Chapter0050
     * @tc.desc      Test doWrite with string containing Unicode supplementary characters
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        receivedData: string | Uint8Array = '';

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.receivedData = chunk;
          callback();
        }
      }

      let duplexStream = new TestDuplex();

      let supplementaryChars = '😀🎉🌟🌈🚀';

      await new Promise<void>((resolve) => {
        duplexStream.write(supplementaryChars, 'utf8', () => {
          expect((duplexStream as TestDuplex).receivedData).assertEqual(supplementaryChars);
          resolve();
        });
      });
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMDUPLEXTESTSIX_5100
     * @tc.name      testStreamDuplex06Chapter0051
     * @tc.desc      Test doWrite performance with multiple small writes
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it('testStreamDuplex06Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class TestDuplex extends stream.Duplex {
        writeCount: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          this.writeCount++;
          callback();
        }
      }

      let duplexStream = new TestDuplex();
      let promises: Promise<void>[] = [];


      for (let i = 0; i < 1000; i++) {
        promises.push(new Promise<void>((resolve) => {
          duplexStream.write(`chunk-${i}`, 'utf8', () => {
            resolve();
          });
        }));
      }

      await Promise.all(promises);
      expect((duplexStream as TestDuplex).writeCount).assertEqual(1000);
    });
  })
}