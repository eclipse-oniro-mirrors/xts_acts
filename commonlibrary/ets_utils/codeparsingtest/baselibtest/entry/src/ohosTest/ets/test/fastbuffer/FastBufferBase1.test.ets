/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import fastbuffer from '@ohos.fastbuffer';
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let TAG = "testAlloc0001";

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface Options {
  type: string,
  endings: string,
}

export default function FastBufferBaseTest1() {
  describe('fastbufferBaseTest1', () => {
    afterEach(async (done: Function) => {
      await sleep(20);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      done();
    })
    /**
     * @tc.name   testAlloc0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0100
     * @tc.desc   Testing alloc interface with normal size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0001";
      try {
        let size = 5;
        let buf = fastbuffer.alloc(size);
        expect(buf.length).assertEqual(size);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAlloc0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0200
     * @tc.desc   Testing alloc for fastbuffer with size '4294967296'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0002";
      try {
        let size = 4294967296;
        let buf = fastbuffer.alloc(size);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testAlloc0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0300
     * @tc.desc   Testing alloc for parameter with size and fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0003";
      try {
        let buf = fastbuffer.alloc(5, 'a');
        let str = buf.toString();
        expect(str).assertEqual('aaaaa');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAlloc0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0400
     * @tc.desc   Testing alloc for parameter with size and fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0004";
      try {
        let buf = fastbuffer.alloc(5, 'abc', 'utf8');
        let str = buf.toString();
        expect(str).assertEqual('abcab');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAlloc0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0500
     * @tc.desc   Testing alloc for parameter with size negetive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0005";
      try {
        let buf = fastbuffer.alloc(-1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testAlloc0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_0600
     * @tc.desc   Testing alloc for parameter with size and string base64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAlloc0006";
      try {
        let buf = fastbuffer.alloc(11, 'aGVsbG8gd29ybGQ=', 'base64');
        expect(buf.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitialized0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_0100
     * @tc.desc   Testing allocUninitialized interface with normal size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitialized0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitialized0001";
      try {
        let size = 5;
        let buf = fastbuffer.allocUninitialized(size);
        expect(buf.length).assertEqual(size);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testAllocUninitialized0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_0200
     * @tc.desc   Testing allocUninitialized for fastbuffer with size '4294967296'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitialized0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitialized0002";
      try {
        let size = 4294967296;
        let buf = fastbuffer.allocUninitialized(size);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testAllocUninitialized0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_0500
     * @tc.desc   Testing allocUninitialized for parameter with size negetive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitialized0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitialized0005";
      try {
        let buf = fastbuffer.allocUninitialized(-1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_FROM_POOL_0100
     * @tc.desc   Testing allocUninitializedFromPool interface with normal size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitializedFromPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitializedFromPool0001";
      try {
        let size = 5;
        let buf = fastbuffer.allocUninitializedFromPool(size);
        expect(buf.length).assertEqual(size);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocUninitializedFromPool0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_FROM_POOL_0200
     * @tc.desc   Testing allocUninitializedFromPool for fastbuffer with size '4294967296'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitializedFromPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitializedFromPool0002";
      try {
        let size = 4294967296;
        let buf = fastbuffer.allocUninitializedFromPool(size);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testAllocUninitializedFromPool0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ALLOC_UNINITIALIZED_FROM_POOL_0500
     * @tc.desc   Testing allocUninitializedFromPool for parameter with size negetive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllocUninitializedFromPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testAllocUninitializedFromPool0005";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(-1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0100
     * @tc.desc   Testing byteLength for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0001";
      try {
        let byteLen = fastbuffer.byteLength("buffer");
        expect(byteLen).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0200
     * @tc.desc   Testing byteLength for fastbuffer with value '测试'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0002";
      try {
        let byteLen = fastbuffer.byteLength("测试");
        expect(byteLen).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0300
     * @tc.desc   Testing byteLength for fastbuffer with value '!@#$%'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0003";
      try {
        let byteLen = fastbuffer.byteLength("!@#$%");
        expect(byteLen).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0400
     * @tc.desc   Testing byteLength for fastbuffer with uint8array objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0006";
      try {
        let uintarr = new Uint8Array(2);
        uintarr[0] = 114;
        uintarr[1] = 115;
        let byteLen = fastbuffer.byteLength(uintarr.buffer);
        expect(byteLen).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0500
     * @tc.desc   Testing byteLength for fastbuffer with fastbuffer objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0007";
      try {
        let buf1 = fastbuffer.from("qwert");
        let byteLen = fastbuffer.byteLength(buf1);
        expect(byteLen).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BYTELENGTH_0600
     * @tc.desc   Testing byteLength for fastbuffer with value '\u00bd + \u00bc = \u00be'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testByteLength0008";
      try {
        let str = '\u00bd + \u00bc = \u00be';
        expect(fastbuffer.byteLength(str, 'utf-8')).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0100
     * @tc.desc   Testing isBuffer for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0001";
      try {
        let buf = fastbuffer.alloc(4);
        let flag = fastbuffer.isBuffer(buf);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0200
     * @tc.desc   Testing isBuffer for fastbuffer with object value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0002";
      try {
        let obj = new Object(2);
        let flag = fastbuffer.isBuffer(obj);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0300
     * @tc.desc   Testing isBuffer for fastbuffer with value '[]'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0003";
      try {
        let flag = fastbuffer.isBuffer([1, 2, 3]);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0400
     * @tc.desc   Testing isBuffer for fastbuffer with value fastbuffer.from('foo').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0004";
      try {
        let flag = fastbuffer.isBuffer(fastbuffer.from('foo'));
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0500
     * @tc.desc   Testing isBuffer for fastbuffer with value empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0005";
      try {
        let flag = fastbuffer.isBuffer('');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISBUFFER_0600
     * @tc.desc   testing alloc for fastbuffer with uint8array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      TAG = "testIsBuffer0006";
      try {
        let flag = fastbuffer.isBuffer(new Uint8Array(3));
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISCODEING_0100
     * @tc.desc   Testing isEncoding for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0001";
      try {
        let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let flag = fastbuffer.isEncoding(encode);
          expect(flag).assertEqual(true);
        }
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISCODEING_0200
     * @tc.desc   Testing isEncoding for fastbuffer with value utf-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0002";
      try {
        let flag = fastbuffer.isEncoding('utf-8');
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISCODEING_0300
     * @tc.desc   Testing isEncoding for fastbuffer with value 'abcd'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0003";
      try {
        let flag = fastbuffer.isEncoding('abcd');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISCODEING_0400
     * @tc.desc   Testing isEncoding for fastbuffer with value 'utf/8'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0004";
      try {
        let flag = fastbuffer.isEncoding('utf/8');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ISCODEING_0500
     * @tc.desc   Testing isEncoding for fastbuffer with value null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIsEncoding0005";
      try {
        let flag = fastbuffer.isEncoding(null);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0100
     * @tc.desc   Testing compare with value '1234' and '0123'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0001";
      try {
        let buf1 = fastbuffer.from("1234");
        let buf2 = fastbuffer.from("0123");
        let res = fastbuffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0200
     * @tc.desc   Testing compare with value '514' and '114'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0002";
      try {
        let buf1 = fastbuffer.from("514");
        let buf2 = fastbuffer.from("114");
        let res = fastbuffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0300
     * @tc.desc   Testing compare with value '比较一' and '比较二'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0003";
      try {
        let buf1 = fastbuffer.from("比较一");
        let buf2 = fastbuffer.from("比较二");
        let res = fastbuffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0400
     * @tc.desc   Testing compare with value '比较$&*' and '比较$&*'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0004";
      try {
        let buf1 = fastbuffer.from("比较$&*");
        let buf2 = fastbuffer.from("比较$&*");
        let res = fastbuffer.compare(buf1, buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0500
     * @tc.desc   Testing compare with value '1abc' and  and uint8array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0005";
      try {
        let buf1 = fastbuffer.from("1abc");
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let res = fastbuffer.compare(buf1, uintarr);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_STATICCOMPARE_0600
     * @tc.desc   Testing compare with value undefined and undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testStaticCompare0006";
      try {
        let res = fastbuffer.compare(undefined, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0100
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0001";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 5, 9, 0, 4);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0200
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0002";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 0, 6, 4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0300
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0003";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 5, 6, 5);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0400
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] out of bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0004";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 5, 6, 2, 1);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0500
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] out of bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0005";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 5, 5);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0600
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] out of bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0006";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 6, 5, 2, 1);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0700
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] one parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0007";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 1);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0800
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] two parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0008";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 1, 2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_0900
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] three parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0009";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 1, 2, 3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testCompare0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COMPARE_1000
     * @tc.desc   Testing compare with [1, 2, 3, 4, 5, 6, 7, 8, 9] and [5, 6, 7, 8, 9, 1, 2, 3, 4] four parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCompare0010";
      try {
        let buf1 = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = fastbuffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let res = buf1.compare(buf2, 1, 2, 3, 4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testConcat0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0100
     * @tc.desc   Testing concat with value '1145, 1414'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0001";
      try {
        let buf1 = fastbuffer.from("1145");
        let buf2 = fastbuffer.from("1414");
        let buf = fastbuffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("11451414");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConcat0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0200
     * @tc.desc   Testing concat with value '测测, #￥&*'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0002";
      try {
        let buf1 = fastbuffer.from("测测");
        let buf2 = fastbuffer.from("#￥&*");
        let buf = fastbuffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("测测#￥&*");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConcat0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0300
     * @tc.desc   Testing concat with value 'qwert, asdfg'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0003";
      try {
        let buf1 = fastbuffer.from("qwert");
        let buf2 = fastbuffer.from("asdfg");
        let buf3 = fastbuffer.concat([buf1, buf2]);
        let buf = fastbuffer.alloc(5).fill(buf3);
        let str = buf.toString();
        expect(str).assertEqual("qwert");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConcat0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0400
     * @tc.desc   Testing concat with value 'qwert, asdfg' test truncate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0004";
      let buf1 = fastbuffer.from("qwertyu");
      let buf2 = fastbuffer.from("asdfghj");
      try {
        let buf = fastbuffer.concat([buf1, buf2], 4);
        let str = buf.toString();
        expect(str).assertEqual("qwer");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConcat0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0500
     * @tc.desc   Testing concat with value 'qwert, asdfg' test out of length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0005";
      let buf1 = fastbuffer.from("qwertyu");
      let buf2 = fastbuffer.from("asdfghj");
      try {
        let buf = fastbuffer.concat([buf1, buf2], 20);
        let str = buf.toString('utf-8', 0, 14);
        expect(str).assertEqual("qwertyuasdfghj");
        expect(buf.length).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConcat0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_CONTACT_0600
     * @tc.desc   Testing concat with value 'ab, ab' test out of length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testConcat0006";
      let arr1 = new Uint8Array([97, 98]);
      let arr2 = new Uint8Array([97, 98]);
      try {
        let buf = fastbuffer.concat([arr1, arr2]);
        let str = buf.toString();
        expect(str).assertEqual("abab");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_0100
     * @tc.desc   Testing fill with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0001";
      try {
        let buf = fastbuffer.alloc(10).fill("xz");
        let str = buf.toString();
        expect(str).assertEqual("xzxzxzxzxz");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_0200
     * @tc.desc   Testing fill with value '('F1刘FG', 0, 10, codeType)'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0002";
      try {
        const buf1 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");

        let buf2 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'ascii');
        str = buf2.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf3 = fastbuffer.alloc(10).fill('F1FG', 0, 10, 'base64');
        str = buf3.toString("hex");
        expect(str).assertEqual("17514617514617514617");

        let buf4 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'binary');
        str = buf4.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf5 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'latin1');
        str = buf5.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf6 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'ucs2');
        str = buf6.toString("hex");
        expect(str).assertEqual("46003100185246004700");

        let buf7 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'utf8');
        str = buf7.toString("hex");
        expect(str).assertEqual("4631e5889846474631e5");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_0300
     * @tc.desc   Testing fill with value '!@#'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0003";
      try {
        let buf = fastbuffer.alloc(3).fill("!@#");
        let str = buf.toString();
        expect(str).assertEqual("!@#");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_0400
     * @tc.desc   Testing fill with value, offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0004";
      try {
        let buf = fastbuffer.alloc(6).fill("$*$", 0);
        let str = buf.toString();
        expect(str).assertEqual("$*$$*$");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_0500
     * @tc.desc   Testing fill with value, offset, end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFill0005";
      try {
        let buf = fastbuffer.alloc(6).fill("$*$", 0, 3);
        let str = buf.toString('utf-8', 0, 3);
        expect(str).assertEqual("$*$");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFill1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FILL_1100
     * @tc.desc   Testing the fill interface with value, offset, end, encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFill1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        let buf = fastbuffer.alloc(6).fill("$*$", 0, null, 'utf8');
        let str = buf.toString();
        expect(str).assertEqual("$*$$*$");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0100
     * @tc.desc   Testing the write interface with utf8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        let buf = fastbuffer.alloc(256);
        let len = buf.write('\u00bd + \u00bc = \u00be', 0);
        let str = buf.toString('utf-8', 0, len);
        expect(str).assertEqual("½ + ¼ = ¾");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0200
     * @tc.desc   Testing the write interface with normal value ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWrite0002";
      try {
        let buf = fastbuffer.alloc(0);
        let offset = buf.write("");
        expect(offset).assertEqual(0);
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0300
     * @tc.desc   Testing the write interface with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.alloc(10);
      try {
        let offset = buf.write('abcd', 0);
        let str = buf.toString('utf-8', 0, 4);
        expect(str).assertEqual("abcd");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0400
     * @tc.desc   Testing the write interface with normal value out of bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.alloc(10);
      try {
        let offset = buf.write('abcd', 8);
        expect(offset).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0500
     * @tc.desc   Testing the write interface with normal value, offset, length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.alloc(10);
      try {
        let offset = buf.write('abcdefgh', 0, 4);
        expect(offset).assertEqual(4);
        let str = buf.toString('utf-8', 0, 4);
        expect(str).assertEqual("abcd");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWrite0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_Write_0600
     * @tc.desc   Testing the write interface with normal value, offset, length, encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.alloc(10);
      try {
        let offset = buf.write('abcdefgh', 0, 4, 'utf8');
        expect(offset).assertEqual(4);
        let str = buf.toString('utf-8', 0, 4);
        expect(str).assertEqual("abcd");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteBigInt64BE_0100
     * @tc.desc   Testing the writeBigInt64BE interface with two parameters: BigInt(0x0102030405060708) and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigInt64BE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteBigInt64LE_0100
     * @tc.desc   Testing the writeBigInt64LE interface with two parameters: BigInt(0x0102030405060708) and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigInt64LE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteBigUInt64BE_0100
     * @tc.desc   Testing the writeInt16BE interface with two parameters: BigInt(0xdecafafecacefade) and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigUInt64BE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64BE(BigInt(0xdecafafecacefade), 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_BigUInt64LE_0100
     * @tc.desc   Testing the writeBigUInt64LE interface with two parameters: BigInt(0xdecafafecacefade) and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteBigUInt64LE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64LE(BigInt(0xdecafafecacefade), 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteDoubleBE_0100
     * @tc.desc   Testing the writeDoubleBE interface with two parameters: 123.456 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleBE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleBE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteDoubleLE_0100
     * @tc.desc   Testing the writeDoubleLE interface with two parameters: 123.456 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleLE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteFloatBE_0100
     * @tc.desc   Testing the writeFloatBE interface with two parameters: 0xcafebabe and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteFloatBE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeFloatBE(0xcafebabe, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteFloatLE_0100
     * @tc.desc   Testing the writeFloatLE interface with two parameters: 0xcafebabe and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteFloatLE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(8);
        let ref = buf.writeFloatLE(0xcafebabe, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt8_0100
     * @tc.desc   Testing the writeInt8 interface with value to buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt80001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(2);
        let ref = buf.writeInt8(2, 0);
        expect(ref).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt8_0200
     * @tc.desc   Testing the writeInt8 interface with value to buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(-2, 0);
        expect(ref).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt16BE_0100
     * @tc.desc   Testing the writeInt16BE interface with two parameters: 0x0102 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt16BE0001";
      try {
        let buf = fastbuffer.alloc(2);
        let ref = buf.writeInt16BE(0x0102, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt16LE_0100
     * @tc.desc   Testing the writeInt16LE interface with two parameters: 0x0304 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = fastbuffer.alloc(2);
        let ref = buf.writeInt16LE(0x0304, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt32BE_0100
     * @tc.desc   Testing the writeInt32BE interface with two parameters: 0x01020304 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt32BE0001";
      try {
        let buf = fastbuffer.alloc(4);
        let ref = buf.writeInt32BE(0x01020304, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteInt32LE_0100
     * @tc.desc   Testing the writeInt32LE interface with two parameters: 0x05060708 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteInt32LE0001";
      try {
        let buf = fastbuffer.alloc(4);
        let ref = buf.writeInt32LE(0x05060708, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteIntBE_0100
     * @tc.desc   Testing the writeIntBE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteIntBE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteIntLE_0100
     * @tc.desc   Testing the writeIntLE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteIntLE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt8_0100
     * @tc.desc   Testing the writeUInt8 interface with two parameters: 0x42 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt80001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x3, 0);
        expect(ref).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt8_0200
     * @tc.desc   Testing the writeUInt8 interface with 0x4 and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt80002";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x4, 1);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt8_0300
     * @tc.desc   Testing the writeUInt8 interface with two parameters: 0x23 and 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt80003";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x23, 2);
        expect(ref).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt80004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt8_0400
     * @tc.desc   Testing the writeUInt8 interface with two parameters: 0x42 and 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 3);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt16BE_0100
     * @tc.desc   Testing the writeUInt16BE interface with two parameters: 0xdead and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16BE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt16BE_0200
     * @tc.desc   Testing the writeUInt16BE interface with two parameters: 0xbeef and 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xbeef, 2);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt16LE_0100
     * @tc.desc   Testing the writeUInt16LE interface with two parameters: 0xdead and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt16LE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WriteUInt16LE_0200
     * @tc.desc   Testing the writeUInt16LE interface with two parameters: 0xbeef and 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xbeef, 2);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt32BE0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WRITEUINT32BE_0100
     * @tc.desc   Testing the writeUInt32BE interface with two parameters: 0xfeedface and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt32BE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32BE0100";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32BE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WRITEUINT32LE_0100
     * @tc.desc   Testing writeUInt32LE with value '0xfeedface, 0'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUInt32LE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WRITEUINTBE_0100
     * @tc.desc   Testing writeUIntBE with value '0x1234567890ab, 0, 6'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntBE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(6);
        let ref = buf.writeUIntBE(0x13141516, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testWriteUIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WRITEUINTLE_0100
     * @tc.desc   Testing writeUIntLE with value '0x1234567890ab, 0, 6'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testWriteUIntLE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(6);
        let ref = buf.writeUIntLE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READBIGINT64BE_0100
     * @tc.desc   Testing readBigInt64BE for fastbuffer with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64BE0001";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigInt64BE(0).toString();
        expect(ref).assertEqual("7161960797921896816");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_WRITEBIGINT64LE_0100
     * @tc.desc   Testing readBigInt64LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigInt64LE0001";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigInt64LE(0).toString();
        expect(ref).assertEqual("8100120198111388771");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READBIGUINT64BE_0100
     * @tc.desc   Testing readBigUInt64BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64BE0001";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigUInt64BE(0).toString();
        expect(ref).assertEqual("7161960797921896816");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READBIGUINT64LE_0100
     * @tc.desc   Testing readBigUInt64LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadBigUInt64LE0001";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigUInt64LE(0).toString();
        expect(ref).assertEqual("8100120198111388771");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READDOUBLEBE_0100
     * @tc.desc   Testing readDoubleBE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleBE0001";
      try {
        let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let ref = buf.readDoubleBE(0).toString();
        expect(ref).assertEqual('8.20788039913184e-304');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READDOUBLELE_0100
     * @tc.desc   Testing readDoubleLE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadDoubleLE0001";
      try {
        let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let ref = buf.readDoubleLE(0).toString();
        expect(ref).assertEqual('5.447603722011605e-270');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READFLOATBE_0100
     * @tc.desc   Testing readFloatBE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatBE0001";
      try {
        let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let ref = buf.readFloatBE(0).toString();
        expect(ref).assertEqual("2.387939260590663e-38");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READFLOATLE_0100
     * @tc.desc   Testing readFloatLE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadFloatLE0001";
      try {
        let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let ref = buf.readFloatLE(0).toString();
        expect(ref).assertEqual("1.539989614439558e-36");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINT_0100
     * @tc.desc   Testing readInt8 for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt80001";
      try {
        let buf = fastbuffer.from([-1, 5]);
        let ref1 = buf.readInt8(0).toString();
        let ref2 = buf.readInt8(1).toString();
        expect(ref1).assertEqual('-1');
        expect(ref2).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINT16BE_0100
     * @tc.desc   Testing readInt16BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16BE0001";
      try {
        let buf = fastbuffer.from([0, 5]);
        let ref = buf.readInt16BE(0).toString();
        expect(ref).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINT16LE_0100
     * @tc.desc   Testing readInt16LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt16LE0001";
      try {
        let buf = fastbuffer.from([0, 5]);
        let ref = buf.readInt16LE(0).toString();
        expect(ref).assertEqual("1280");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINT32BE_0100
     * @tc.desc   Testing readInt32BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32BE0001";
      try {
        let buf = fastbuffer.from([0, 0, 0, 5]);
        let ref = buf.readInt32BE(0).toString();
        expect(ref).assertEqual("5");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINT32LE_0100
     * @tc.desc   Testing readInt32LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadInt32LE0001";
      try {
        let buf = fastbuffer.from([0, 0, 0, 5]);
        let ref = buf.readInt32LE(0).toString();
        expect(ref).assertEqual("83886080");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINTBE_0100
     * @tc.desc   Testing readIntBE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0001";
      try {
        let buf = fastbuffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(0, 5).toString(16);
        expect(ref).assertEqual("1234567890");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadIntBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINTBE_0200
     * @tc.desc   Testing readIntBE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntBE0002";
      try {
        let buf = fastbuffer.from("ab");
        let num = buf.readIntBE(0, 1).toString();
        expect(num).assertEqual("97");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READINTLE_0001
     * @tc.desc   Testing readIntLE for fastbuffer with [0x12, 0x34, 0x56, 0x78, 0x90, 0xab].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadIntLE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let ref = buf.readIntLE(0, 6).toString(16);
        expect(ref).assertEqual("-546f87a9cbee");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt80100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINT8_0100
     * @tc.desc   Testing readUInt8 for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt80100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt80100";
      try {
        let buf = fastbuffer.from([1, -2]);
        let ref1 = buf.readUInt8(0).toString();
        let ref2 = buf.readUInt8(1).toString();
        expect(ref1).assertEqual("1");
        expect(ref2).assertEqual("254");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINT16BE_0100
     * @tc.desc   Testing readUInt16BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16BE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56]);
        let ref = buf.readUInt16BE(0).toString(16);
        expect(ref).assertEqual("1234");
        ref = buf.readUInt16BE(1).toString(16);
        expect(ref).assertEqual("3456");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEquals0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_EQUALS_0100
     * @tc.desc   Test the equals interface by two identical buffers which content is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0001";
      try {
        let buf1 = fastbuffer.from("qwert");
        let buf2 = fastbuffer.from("12345");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testEquals0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_EQUALS_0200
     * @tc.desc   Test the equals interface by two identical buffers which content is include chinese string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEquals0002";
      try {
        let buf1 = fastbuffer.from("1236测试");
        let buf2 = fastbuffer.from("1236测试");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testSubarray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_SUBARRAR_0100
     * @tc.desc   Test the subarray interface by pass the parameter start is 0 and end is 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testSubarray0001";
      try {
        let buf1 = fastbuffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(0, 5);
        let str = buf2.toString('ascii', 0, buf2.length);
        expect(str).assertEqual("abcde");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testCopy0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COPY_0100
     * @tc.desc   Test the copy interface by copying one fastbuffer of numeric string type to other fastbuffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0001";
      try {
        let buf1 = fastbuffer.from("1236114515");
        let buf2 = fastbuffer.from("1235");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });

    /**
     * @tc.name   testCopy0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COPY_0200
     * @tc.desc   Test the copy interface by copying one fastbuffer of chinese string type  to other fastbuffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0002";
      try {
        let buf1 = fastbuffer.from("abcdefg");
        let buf2 = fastbuffer.from("1235789");
        let num = buf1.copy(buf2, 5, 1, 3);
        expect(num).assertEqual(2);
        let str = buf2.toString();
        expect(str).assertEqual("12357bc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testCopy0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COPY_0300
     * @tc.desc   Test the copy interface by copying one fastbuffer of chinese string type  to other fastbuffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0003";
      try {
        let buf1 = fastbuffer.from("abcdefg");
        let buf2 = fastbuffer.from("1235789");
        let num = buf1.copy(buf2, 5, 1);
        expect(num).assertEqual(2);
        let str = buf2.toString();
        expect(str).assertEqual("12357bc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testCopy0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COPY_0400
     * @tc.desc   Test the copy interface by copying one fastbuffer of chinese string type  to other fastbuffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0004";
      try {
        let buf1 = fastbuffer.from("abcdefg");
        let buf2 = fastbuffer.from("1235789");
        let num = buf1.copy(buf2, 5);
        expect(num).assertEqual(2);
        let str = buf2.toString();
        expect(str).assertEqual("12357ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testCopy0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_COPY_0500
     * @tc.desc   Test the copy interface by copying one fastbuffer of chinese string type  to other fastbuffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testCopy0005";
      try {
        let buf1 = fastbuffer.allocUninitializedFromPool(26);
        let buf2 = fastbuffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 8, 16, 20);
        let str = buf2.toString('ascii', 0, 25);
        expect(str).assertEqual("!!!!!!!!qrst!!!!!!!!!!!!!");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0200
     * @tc.desc   Test the toString interface by source fastbuffer of chinese string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0002";
      try {
        let buf1 = fastbuffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        let str = buf1.toString('utf-8');
        expect(str).assertEqual("abcdefghijklmnopqrstuvwxyz");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0300
     * @tc.desc   Test the toString interface by passing the parameter encoding to "binary".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0003";
      try {
        let buf = fastbuffer.from("abcde");
        let str = buf.toString("binary");
        expect(str).assertEqual("abcde");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0400
     * @tc.desc   Test the toString interface by passing the parameter encoding to "ascii".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0004";
      try {
        let buf = fastbuffer.from("abcde");
        let str = buf.toString("ascii");
        expect(str).assertEqual("abcde");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0500
     * @tc.desc   Test the toString interface by passing the parameter encoding to "base64".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0005";
      try {
        let buf = fastbuffer.from("abc");
        let str = buf.toString("base64");
        expect(str).assertEqual("YWJj");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0600
     * @tc.desc   Test the toString interface by passing the parameter encoding to "hex".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0006";
      try {
        let buf = fastbuffer.from("def");
        let str = buf.toString("hex");
        expect(str).assertEqual("646566");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0700
     * @tc.desc   Test the toString interface by passing the parameter encoding to "latin1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0007";
      try {
        let buf = fastbuffer.from("abcde");
        let str = buf.toString("latin1");
        expect(str).assertEqual("abcde");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0800
     * @tc.desc   Test the toString interface by passing the parameter encoding with encoding, start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0008";
      try {
        let buf = fastbuffer.from("abcde");
        let str = buf.toString("utf8", 2);
        expect(str).assertEqual("cde");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOSTRING_0900
     * @tc.desc   Test the toString interface by passing the parameter encoding with encoding, start, end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToString0009";
      try {
        let buf = fastbuffer.from("abcde");
        let str = buf.toString("utf8", 2, 4);
        expect(str).assertEqual("cd");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testToJSON0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_TOJSON_0100
     * @tc.desc   Test the toJSON interface source fastbuffer of numerical string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToJSON0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testToJSON0001";
      try {
        let buf1 = fastbuffer.from([0x1, 0x2, 0x3, 0x4, 0x5]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual('{"type":"FastBuffer","data":[1,2,3,4,5]}');
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INDEXOF_0100
     * @tc.desc   Test the indexOf interface by passing the parameter value to a character string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0001";
      try {
        let buf = fastbuffer.from("13236qwerty");
        let index = buf.indexOf("3");
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INDEXOF_0200
     * @tc.desc   Test the indexOf interface by passing the parameter value to a character string, and byteOffset to 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0002";
      try {
        let buf = fastbuffer.from("13236qwert");
        let index = buf.indexOf("3", 2);
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INDEXOF_0300
     * @tc.desc   Test the indexOf interface by passing the parameter value, byteOffset, encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0003";
      try {
        let buf = fastbuffer.from("13236qwert");
        let index = buf.indexOf("3", 2, 'utf8');
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INDEXOF_0400
     * @tc.desc   Test the indexOf interface base test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIndexOf0004";
      try {
        let buf = fastbuffer.from('this is a buffer');
        let index = buf.indexOf('this');
        expect(index).assertEqual(0);
        index = buf.indexOf('is');
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_LASTINDEXOF_0100
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to a character string which is in the fastbuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0001";
      try {
        let buf = fastbuffer.from("13236qwert");
        let index = buf.lastIndexOf("3");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_LASTINDEXOF_0200
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0002";
      try {
        let buf = fastbuffer.from("13236qwerty");
        let index = buf.lastIndexOf("3", 2);
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_LASTINDEXOF_0300
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value, offset, encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0003";
      try {
        let buf = fastbuffer.from("13236qwerty");
        let index = buf.lastIndexOf("3", 2, 'utf8');
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_LASTINDEXOF_0400
     * @tc.desc   Test the lastIndexOf interface base test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testLastIndexOf0004";
      try {
        let buf = fastbuffer.from('this buffer is a buffer');
        let index = buf.lastIndexOf('this');
        expect(index).assertEqual(0);
        index = buf.lastIndexOf('buffer')
        expect(index).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INCLUDES_0100
     * @tc.desc   Test the includes interface by passing the parameter value to a numerical string which is in the fastbuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0001";
      try {
        let buf = fastbuffer.from("13236qwerty");
        let flag = buf.includes("3");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INCLUDES_0200
     * @tc.desc   Test the includes interface by passing the parameter value to a numerical string which is in the buffer,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0002";
      try {
        let buf = fastbuffer.from("13qwrqwt236");
        let flag = buf.includes("3", 2);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INCLUDES_0300
     * @tc.desc   Test the includes interface by passing the parameter value to two numerical string which is in the fastbuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0003";
      try {
        let buf = fastbuffer.from("13asgsdv236");
        let flag = buf.includes("32");
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_INCLUDES_0500
     * @tc.desc   Test the includes interface by passing the parameter value to string which is in the fastbuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testIncludes0005";
      try {
        let buf = fastbuffer.from('this is a buffer');
        let flag = buf.includes('this');
        expect(flag).assertEqual(true);
        flag = buf.includes('be');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_KEYS_0100
     * @tc.desc   Test the keys interface by source fastbuffer which created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0001";
      try {
        let buf = fastbuffer.from("1234567");
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(key).assertEqual(index);
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_KEYS_0200
     * @tc.desc   Test the keys interface by source fastbuffer created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x114;
        uArr[1] = 0x415;
        uArr[2] = 0x191;
        uArr[3] = 0x81;
        let buf = fastbuffer.from(uArr);
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(key).assertEqual(index);
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_KEYS_0300
     * @tc.desc   Test the keys interface by source fastbuffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testKeys0003";
      try {
        let buf = fastbuffer.from("");
        let keys = buf.keys();
        expect(isIteratorEmpty(keys)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_VALUES_0100
     * @tc.desc   Test the values interface by source fastbuffer which created from string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0001";
      try {
        let buf = fastbuffer.from("1234567");
        let values = buf.values();
        let va = 49;
        for (const value of values) {
          expect(value).assertEqual(va);
          va++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_VALUES_0200
     * @tc.desc   Test the values interface by source fastbuffer which created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x41;
        uArr[1] = 0x42;
        uArr[2] = 0x43;
        uArr[3] = 0x44;
        let buf = fastbuffer.from(uArr);
        let values = buf.values();
        let va = 0x41;
        for (const value of values) {
          expect(value).assertEqual(va);
          va++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_VALUES_0300
     * @tc.desc   Test the values interface by source fastbuffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testValues0003";
      try {
        let buf = fastbuffer.from("");
        let values = buf.values();
        expect(isIteratorEmpty(values)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_ENTRIES_0100
     * @tc.desc   Test the entries interface by source fastbuffer which created from string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEntries0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testEntries0001";
      try {
        let buf = fastbuffer.from("1234567");
        let entries = buf.entries();
        let va = 49, index = 0;
        for (const entry of entries) {
          expect(entry[0]).assertEqual(index);
          expect(entry[1]).assertEqual(va);
          va++;
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
 
    /**
     * @tc.name   testFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0100
     * @tc.desc   Test the from interface by Coping the passed fastbuffer data onto a new Buffer instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0001";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x12;
        uArr[1] = 0x34;
        uArr[2] = 0x56;
        uArr[3] = 0x78;
        let buf = fastbuffer.from(uArr);
        let str = buf.toString("hex");
        expect(str).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0200
     * @tc.desc   Test the from interface by Allocatting a new Buffer using an array of bytes in the range 0 – 255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0002";
      try {
        const buf = fastbuffer.from([0x63, 0x74, 0x77, 0x66, 0x65, 0x82]);
        let str = buf.toString("hex");
        expect(str).assertEqual("637477666582");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0300
     * @tc.desc   Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0003";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = fastbuffer.from(arr.buffer);
        arr[0] = 99
        buf[1] = 100
        let str = buf.toString("hex");
        expect(str).assertEqual("6364");
        expect(arr[1]).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0400
     * @tc.desc   Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0004";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = fastbuffer.from(arr.buffer, 1);
        buf[0] = 100;
        let str = buf.toString("hex");
        expect(str).assertEqual("64");
        expect(arr[1]).assertEqual(100);
        expect(buf[0]).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0500
     * @tc.desc   Test the from interface by Copping the passed fastbuffer data onto a new Buffer instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0005";
      try {
        const buf1 = fastbuffer.from('auffer');
        const buf2 = fastbuffer.from(buf1);
        buf1[0] = 0x63;
        let str = buf1.toString();
        expect(str).assertEqual("cuffer");
        str = buf2.toString();
        expect(str).assertEqual("auffer");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_0600
     * @tc.desc   Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0006";
      try {
        const arr = new Uint8Array(4);
        arr[0] = 97;
        arr[1] = 98;
        arr[2] = 99;
        arr[3] = 100;
        const buf = fastbuffer.from(arr.buffer, 1, 1);
        buf[0] = 100;
        let str = buf.toString("hex");
        expect(str).assertEqual("64");
        expect(arr[1]).assertEqual(100);
        expect(buf[0]).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_1100
     * @tc.desc   Test the from interface by pass the parameter array to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0011";
      try {
        fastbuffer.from(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFrom0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_1200
     * @tc.desc   Test the from interface by pass the parameter array to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0012";
      try {
        fastbuffer.from(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFrom0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_1400
     * @tc.desc   Test the from interface create by uint8array base test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0014";
      try {
        let uint8Array = new Uint8Array(10);
        let buf3 = fastbuffer.from(uint8Array);
        buf3.fill(1)
        expect(uint8Array.toString()).assertEqual('1,1,1,1,1,1,1,1,1,1');
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFrom0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_FROM_1500
     * @tc.desc   Test the from interface create by hex string base test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testFrom0015";
      try {
        let buf1 = fastbuffer.from('this is a test');
        let buf2 = fastbuffer.from('7468697320697320612074c3a97374', 'hex');
        expect(buf1.toString()).assertEqual('this is a test');
        expect(buf2.toString()).assertEqual('this is a tést');
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINT16LE_0100
     * @tc.desc   Test the readUInt16LE interface by Reading an unsigned, little-endian 16-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt16LE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56]);
        let ref = buf.readUInt16LE(0).toString(16);
        expect(ref).assertEqual("3412");
        ref = buf.readUInt16LE(1).toString(16);
        expect(ref).assertEqual("5634");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINT32BE_0100
     * @tc.desc   Test the readUInt32BE interface by Reading an unsigned, big-endian 32-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32BE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56, 0x78]);
        let ref = buf.readUInt32BE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testReadUInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINT32LE_0100
     * @tc.desc   Test the readUInt32LE interface by Reading an unsigned, little-endian 32-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUInt32LE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56, 0x78]);
        let ref = buf.readUInt32LE(0).toString(16);
        expect(ref).assertEqual("78563412");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINTBE_0100
     * @tc.desc   Test the readUIntBE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntBE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let ref = buf.readUIntBE(0, 6).toString(16);
        expect(ref).assertEqual("1234567890ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testReadUIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READUINTLE_0100
     * @tc.desc   Test the readUIntLE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testReadUIntLE0001";
      try {
        let buf = fastbuffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
        let ref = buf.readUIntLE(0, 6).toString(16);
        expect(ref).assertEqual("ab9078563412");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRead0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READ_0100
     * @tc.desc   Testing readBigUInt64BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0001";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigUInt64BE(0).toString();
        expect(ref).assertEqual("7161960797921896816");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRead0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READ_0200
     * @tc.desc   Testing readBigInt64LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0002";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigInt64LE(0).toString();
        expect(ref).assertEqual("8100120198111388771");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRead0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READ_0300
     * @tc.desc   Testing readBigInt64BE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0003";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigInt64BE(0).toString();
        expect(ref).assertEqual("7161960797921896816");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testRead0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FASTBUFFER_READ_0400
     * @tc.desc   Testing readBigUInt64LE for fastbuffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      TAG = "testRead0004";
      try {
        let buf = fastbuffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        let ref = buf.readBigUInt64LE(0).toString();
        expect(ref).assertEqual("8100120198111388771");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAlloc0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_00100
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.alloc(10);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.name   testAlloc0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_00300
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf1 = fastbuffer.alloc(10);
      let buf = fastbuffer.alloc(10).fill(buf1);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.name   testAlloc0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_00400
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.alloc(0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.name   testAlloc0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_00600
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf1 = fastbuffer.alloc(10);
      let buf = fastbuffer.alloc(0).fill(buf1);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.name   testAlloc0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_00700
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let buf = fastbuffer.alloc(-5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                        'negative. Received value is: -5');
      }
    });

    /**
     * @tc.name   testAlloc0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01000
     * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAlloc0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.alloc(5.5);
      expect(buf.length).assertEqual(5);
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01100
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.allocUninitializedFromPool(10);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01300
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf1 = fastbuffer.allocUninitializedFromPool(10);
      let buf = fastbuffer.allocUninitializedFromPool(10).fill(buf1);
      expect(buf.length).assertEqual(10);
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01400
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.allocUninitializedFromPool(0);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01600
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf1 = fastbuffer.allocUninitializedFromPool(10);
      let buf = fastbuffer.allocUninitializedFromPool(0).fill(buf1);
      expect(buf.length).assertEqual(0);
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01700
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let buf = fastbuffer.allocUninitializedFromPool(-5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                        'negative. Received value is: -5');
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01800
     * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAllocUninitializedFromPool0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let buf = fastbuffer.allocUninitializedFromPool(5.5);
      expect(buf.length).assertEqual(5);
    });

    /**
     * @tc.name   testByteLength0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_01900
     * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testByteLength0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let byteLen = fastbuffer.byteLength("abcd");
      expect(byteLen).assertEqual(4);
    });

    /**
     * @tc.name   testByteLength0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02000
     * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testByteLength0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let byteLen = fastbuffer.byteLength("测试");
      expect(byteLen).assertEqual(6);
    });

    /**
     * @tc.name   testByteLength0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02100
     * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testByteLength0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let byteLen = fastbuffer.byteLength("$&@*%");
      expect(byteLen).assertEqual(5);
    });
    
    /**
     * @tc.name   testByteLength0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02400
     * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testByteLength0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let uintarr = new Uint8Array(2);
      uintarr[0] = 21;
      uintarr[1] = 31;
      let byteLen = fastbuffer.byteLength(uintarr.buffer)
      expect(byteLen).assertEqual(2);
    });

    /**
     * @tc.name   testIsBuffer0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02500
     * @tc.desc   Returns true if obj is a Buffer, false otherwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsBuffer0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(1);
      let flag = fastbuffer.isBuffer(buf);
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.name   testIsBuffer0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02600
     * @tc.desc   Returns true if obj is a Buffer, false otherwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsBuffer0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new Object(1);
      let flag = fastbuffer.isBuffer(obj);
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.name   testIsEncoding0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02700
     * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEncoding0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = fastbuffer.isEncoding("utf8");
      expect(flag).assertEqual(true);
    });

    /**
     * @tc.name   testIsEncoding0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02800
     * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEncoding0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                      'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
      for (const encode of encodeArr) {
        let flag = fastbuffer.isEncoding(encode);
        expect(flag).assertEqual(true);
      }
    });

    /**
     * @tc.name   testIsEncoding0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_02900
     * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEncoding0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = fastbuffer.isEncoding('gbk');
      expect(flag).assertEqual(false);
    });

    /**
     * @tc.name   testStaticCompare0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03000
     * @tc.desc   Compares buf1 to buf2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStaticCompare0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      let res = fastbuffer.compare(buf1, buf2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.name   testStaticCompare0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03100
     * @tc.desc   Compares buf1 to buf2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStaticCompare0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1235");
      let buf2 = fastbuffer.from("1236");
      let res = fastbuffer.compare(buf1, buf2);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testStaticCompare0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03200
     * @tc.desc   Compares buf1 to buf2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStaticCompare0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试一");
      let buf2 = fastbuffer.from("测试二");
      let res = fastbuffer.compare(buf1, buf2);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testStaticCompare0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03300
     * @tc.desc   Compares buf1 to buf2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStaticCompare0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试$&*");
      let buf2 = fastbuffer.from("测试$&*");
      let res = fastbuffer.compare(buf1, buf2);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testStaticCompare0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03400
     * @tc.desc   Compares buf1 to buf2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStaticCompare0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1236");
      let res = fastbuffer.compare(buf1, buf2);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testConcat0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03700
     * @tc.desc   Returns a new `Buffer` which is the result of concatenating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConcat0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      let buf = fastbuffer.concat([buf1, buf2]);
      let str = buf.toString();
      expect(str).assertEqual("12361235");
    });

    /**
     * @tc.name   testConcat0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_03800
     * @tc.desc   Returns a new `Buffer` which is the result of concatenating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConcat0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试");
      let buf2 = fastbuffer.from("$&*");
      let buf = fastbuffer.concat([buf1, buf2]);
      let str = buf.toString();
      expect(str).assertEqual("测试$&*");
    });

    /**
     * @tc.name   testConcat0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04000
     * @tc.desc   Returns a new `Buffer` which is the result of concatenating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConcat0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123$");
      let buf2 = fastbuffer.from("*35");
      let buf3 = fastbuffer.concat([buf1, buf2]);
      let buf = fastbuffer.alloc(5).fill(buf3);
      let str = buf.toString();
      expect(str).assertEqual("123$*");
    });

    /**
     * @tc.name   testConcat0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04100
     * @tc.desc   Returns a new `Buffer` which is the result of concatenating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConcat0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123$");
      let buf2 = fastbuffer.from("*35");
      try {
        let buf = fastbuffer.concat([buf1, buf2], -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testTranscode0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04300
     * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTranscode0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf = fastbuffer.transcode(buf1, "ascii", "ucs2");
      let str = buf.toString("ucs2")
      expect(str).assertEqual("1236");
    });

    /**
     * @tc.name   testTranscode0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04400
     * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTranscode0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试");
      let buf = fastbuffer.transcode(buf1, "utf8", "ucs2");
      let str = buf.toString("ucs2")
      expect(str).assertEqual("测试");
    });

    /**
     * @tc.name   testFill0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04800
     * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFill0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(3).fill("abc");
      let str = buf.toString();
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.name   testFill0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_04900
     * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testFill0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf1 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
      let str = buf1.toString('hex');
      expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");

      let buf2 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'ascii');
      str = buf2.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf3 = fastbuffer.alloc(10).fill('F1FG', 0, 10, 'base64');
      str = buf3.toString("hex");
      expect(str).assertEqual("17514617514617514617");

      let buf4 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'binary');
      str = buf4.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf5 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'latin1');
      str = buf5.toString("hex");
      expect(str).assertEqual("46311846474631184647");

      let buf6 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'ucs2');
      str = buf6.toString("hex");
      expect(str).assertEqual("46003100185246004700");

      let buf7 = fastbuffer.alloc(10).fill('F1刘FG', 0, 10, 'utf8');
      str = buf7.toString("hex");
      expect(str).assertEqual("4631e5889846474631e5");
    });
  })
}