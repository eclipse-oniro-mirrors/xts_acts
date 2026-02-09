/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import buffer from '@ohos.buffer';
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';


let TAG = "testAlloc0001";

class parse {
  text: string = ''
}
class Foo {
  valueOf1() {
    return 'this is a test';
  }

  toString1() {
    return 'this is a test';
  }
}
function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function BufferTest1() {
  describe('bufferTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testAlloc0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
     * @tc.desc   Testing alloc interface with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0001";
      try {
        let size = 10;
        let buf = buffer.alloc(size);
        expect(String(buf.length)).assertEqual(String(size));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testAlloc0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
     * @tc.desc   Testing alloc for buffer with value '4294967296'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0002";
      try {
        let size = 100;
        let buf = buffer.alloc(size);
        expect(String(buf.length)).assertEqual('100');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testAlloc0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0500
     * @tc.desc   Testing alloc for buffer,the second parameter is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0005";
      try {
        let buf = buffer.alloc(10, ' ');
        expect(String(buf.length)).assertEqual('10');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAlloc0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
     * @tc.desc   Testing alloc for buffer,the second parameter is buffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0007";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(10, buf1);
        expect(String(buf.length)).assertEqual('10');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAlloc0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_08000
     * @tc.desc   Testing alloc for parameter with value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0010";
      try {
        let buf = buffer.alloc(0);
        expect(String(buf.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAlloc0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
     * @tc.desc   Testing alloc for parameter with value (0，bufferOBJ).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0012";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(0).fill(buf1);
        let flag = buffer.alloc(0, buf);
        expect(String(flag.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAlloc0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1300
     * @tc.desc   Testing alloc for buffer with value -5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0013";
      try {
        buffer.alloc(-5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('401');
      }
    });

    /**
     * @tc.name   testAlloc0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
     * @tc.desc   Testing alloc for buffer with value 5.5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAlloc0014";
      try {
        let buf = buffer.alloc(5.5 as int);
        expect(String(buf.length)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitialized0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0100
     * @tc.desc   Testing allocUninitialized for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitialized0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitialized0001";
      try {
        let buf = buffer.allocUninitialized(10);
        expect(String(buf.length)).assertEqual('10');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitialized0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0200
     * @tc.desc   Testing allocUninitialized for buffer with value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitialized0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitialized0002";
      try {
        let buf = buffer.allocUninitialized(0);
        expect(String(buf.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitialized0003
     * @tc.number testAllocUninitialized0003
     * @tc.desc   Testing allocUninitialized for buffer with value -5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitialized0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitialized0003";
      try {
        let buf = buffer.allocUninitialized(-5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('401');
      }
    });

    /**
     * @tc.name   testAllocUninitialized0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0400
     * @tc.desc   Testing allocUninitialized for buffer with value 5.5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitialized0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitialized0004";
      try {
        let buf = buffer.allocUninitialized(5.5 as int);
        expect(String(buf.length)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0100
     * @tc.desc   Testing allocUninitializedFromPool for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitializedFromPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitializedFromPool0001";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        expect(String(buf.length)).assertEqual('10');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0200
     * @tc.desc   Testing allocUninitializedFromPool for buffer with value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitializedFromPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitializedFromPool0002";
      try {
        let buf = buffer.allocUninitializedFromPool(0);
        expect(String(buf.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0300
     * @tc.desc   Testing allocUninitializedFromPool for buffer with value -5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitializedFromPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitializedFromPool0003";
      try {
        let buf = buffer.allocUninitializedFromPool(-5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('401');
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /**
     * @tc.name   testAllocUninitializedFromPool0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0400
     * @tc.desc   Testing allocUninitializedFromPool for buffer with value 5.5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAllocUninitializedFromPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testAllocUninitializedFromPool0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5.5 as int);
        expect(String(buf.length)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0100
     * @tc.desc   Testing byteLength for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0001";
      try {
        let byteLen = buffer.byteLength("abcd");
        expect(String(byteLen)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0200
     * @tc.desc   Testing byteLength for buffer with value '测试'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0002";
      try {
        let byteLen = buffer.byteLength("测试");
        expect(String(byteLen)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0300
     * @tc.desc   Testing byteLength for buffer with value '$&@*%'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0003";
      try {
        let byteLen = buffer.byteLength("$&@*%");
        expect(String(byteLen)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0600
     * @tc.desc   Testing byteLength for buffer with uint8array objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0006";
      try {
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let byteLen = buffer.byteLength(uintarr.buffer as ArrayBuffer);
        expect(String(byteLen)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0700
     * @tc.desc   Testing byteLength for buffer with buffer objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0007";
      try {
        let buf1 = buffer.from("abc");
        let byteLen = buffer.byteLength(buf1);
        expect(String(byteLen)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0800
     * @tc.desc   Testing byteLength for buffer with buffer objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0008";
      try {
        let buf1 = buffer.alloc(8);
        let byteLen = buffer.byteLength(buf1);
        expect(String(byteLen)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testByteLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0900
     * @tc.desc   Testing byteLength for buffer with value empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testByteLength0009";
      try {
        let buf1 = buffer.from("");
        let byteLen = buffer.byteLength(buf1);
        expect(String(byteLen)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0100
     * @tc.desc   Testing isBuffer for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0001";
      try {
        let buf = buffer.alloc(1);
        let flag = buffer.isBuffer(buf);
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0200
     * @tc.desc   Testing isBuffer for buffer with object value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0002";
      try {
        let obj = new Object();
        let flag = buffer.isBuffer(obj);
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0300
     * @tc.name testIsBuffer0003
     * @tc.desc Testing isBuffer for buffer with value '[]'.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testIsBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0003";
      try {
        let src: Array<string> = []
        let flag = buffer.isBuffer(src);
        expect(flag).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0400
     * @tc.desc   Testing isBuffer for buffer with value string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0004";
      try {
        let flag = buffer.isBuffer('ABC');
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0500
     * @tc.desc   Testing isBuffer for buffer with value empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0005";
      try {
        let flag = buffer.isBuffer('');
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsBuffer0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0600
     * @tc.desc   testing alloc for buffer with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsBuffer0006";
      try {
        let flag = buffer.isBuffer(5);
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0100
     * @tc.desc   Testing isEncoding for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsEncoding0001";
      try {
        let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let flag = buffer.isEncoding(encode);
          expect(String(flag)).assertEqual(String(true));
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0200
     * @tc.desc   Testing isEncoding for buffer with value gbk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsEncoding0002";
      try {
        let flag = buffer.isEncoding('gbk');
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIsEncoding0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0300
     * @tc.desc   Testing isEncoding for buffer with value empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIsEncoding0003";
      try {
        let flag = buffer.isEncoding('');
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });
  
    /**
     * @tc.name   testStaticCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0100
     * @tc.desc   Testing compare with value '1235' and '1236'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0200
     * @tc.desc   Testing compare with value '1236' and '1235'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0002";
      try {
        let buf1 = buffer.from("1235");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0300
     * @tc.desc   Testing compare with value '测试一' and '测试二'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0003";
      try {
        let buf1 = buffer.from("测试一");
        let buf2 = buffer.from("测试二");
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0400
     * @tc.desc   Testing compare with value '测试$&*' and '测试$&*'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0004";
      try {
        let buf1 = buffer.from("测试$&*");
        let buf2 = buffer.from("测试$&*");
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0500
     * @tc.desc   Testing compare with value '1236' and '1236'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0005";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1000
     * @tc.desc   Testing compare with value buffer and buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0010";
      let buf1 = buffer.from("1");
      let buf2 = buffer.from("abc");
      try {
        let res = buffer.compare(buf1, buf2);
        expect(String(res)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testStaticCompare0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1100
     * @tc.desc   Testing compare with value buffer and uint8array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStaticCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testStaticCompare0011";
      try {
        let buf1 = buffer.from("1abc");
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let buf2 = buffer.from(uintarr.buffer as ArrayBuffer);
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
     * @tc.desc   Testing compare with value '1236' and '1235'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.compare(buf2);
        expect(String(res)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
     * @tc.desc   Testing compare with value (1236,1235,-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCompare0003";
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      try {
        let res = buf1.compare(buf2, -1);
        expect(false).assertFalse()
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testConcat0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0100
     * @tc.desc   Testing concat with value '1236, 1235'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testConcat0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(String(str)).assertEqual("12361235");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testConcat0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0200
     * @tc.desc   Testing concat with value '测试, $&*'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testConcat0002";
      try {
        let buf1 = buffer.from("测试");
        let buf2 = buffer.from("$&*");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(String(str)).assertEqual("测试$&*");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testConcat0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0400
     * @tc.desc   Testing concat with value 'buffer, buffer'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testConcat0004";
      try {
        let buf1 = buffer.from("123$");
        let buf2 = buffer.from("*35");
        let buf3 = buffer.concat([buf1, buf2]);
        let buf = buffer.alloc(5).fill(buf3);
        let str = buf.toString();
        expect(String(str)).assertEqual("123$*");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testConcat0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0500
     * @tc.desc   Testing concat with value 'buffer,-1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testConcat0005";
      let buf1 = buffer.from("123$");
      let buf2 = buffer.from("*35");
      try {
        let buf = buffer.concat([buf1, buf2], -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /**
     * @tc.name   testTranscode0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0100
     * @tc.desc   Testing transcode with value 'buf1, "ascii", "ucs2"'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testTranscode0001";
      try {
        let buf1 = buffer.from("1236");
        let buf = buffer.transcode(buf1, "ascii", "ucs2");
        let str = buf.toString("ucs2");
        expect(String(str)).assertEqual("1236");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testTranscode0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0200
     * @tc.desc   Testing transcode with value 'buf1, "utf8", "ucs2"'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testTranscode0002";
      try {
        let buf1 = buffer.from("测试");
        let buf = buffer.transcode(buf1, "utf8", "ucs2");
        let str = buf.toString("ucs2");
        expect(String(str)).assertEqual("测试");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFill0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_0100
     * @tc.desc   Testing fill with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFill0001";
      try {
        let buf = buffer.alloc(3).fill("abc");
        let str = buf.toString();
        expect(String(str)).assertEqual("abc");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFill0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_0200
     * @tc.desc   Testing fill with value '('F1刘FG', 0, 10, codeType)'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFill0002";
      try {
        const buf1 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");
    
        let buf2 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ascii');
        str = buf2.toString("hex");
        expect(String(str)).assertEqual("46311846474631184647");
    
        let buf3 = buffer.alloc(10).fill('F1FG', 0, 10, 'base64');
        str = buf3.toString("hex");
        expect(String(str)).assertEqual("17514617514617514617");
    
        let buf4 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'binary');
        str = buf4.toString("hex");
        expect(String(str)).assertEqual("46311846474631184647");
    
        let buf5 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'latin1');
        str = buf5.toString("hex");
        expect(String(str)).assertEqual("46311846474631184647");
    
        let buf6 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ucs2');
        str = buf6.toString("hex");
        expect(String(str)).assertEqual("46003100185246004700");
    
        let buf7 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'utf8');
        str = buf7.toString("hex");
        expect(String(str)).assertEqual("4631e5889846474631e5");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFill0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_0300
     * @tc.desc   Testing fill with value '$*$'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFill0003";
      try {
        let buf = buffer.alloc(3).fill("$*$");
        let str = buf.toString();
        expect(String(str)).assertEqual("$*$");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFill0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_0400
     * @tc.desc   Testing fill with value '"$*$", -1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFill0004";
      try {
        let buf = buffer.alloc(3).fill("$*$", -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testFill0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_0500
     * @tc.desc   Testing fill with value '"$*$", 0, 5'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFill0005";
      try {
        let buf = buffer.alloc(3).fill("$*$", 0, 5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWrite0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Write_0600
     * @tc.desc   Testing the write interface with a normal value 'abcde' and an out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWrite0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Write_0700
     * @tc.desc   Testing the write interface with a normal value 'abcde', a normal 'offset' value of 1, and an out-of-range 'length' value of 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", 1, 9);
        expect(false).assertFalse()
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWrite0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Write_0900
     * @tc.desc   Testing the write interface with normal value ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWrite0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWrite0009";
      try {
        let buf = buffer.alloc(0);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.message)).assertEqual('The buffer length is 0, and writing data is not allowed');
      }
    });

    /**
     * @tc.name   testWriteBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.desc   Testing the writeBigInt64BE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        expect(String(ref)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.desc   Testing the writeBigInt64BE interface with a normal value 0x0102030405060708n and an out-of-range 'offset' value of 1, where 'offset' must be >= 0 and <= 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 1);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0100
     * @tc.desc   Testing the writeBigInt64LE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        expect(String(ref)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0200
     * @tc.desc   Testing the writeBigInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigInt64LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });
  
    /**
     * @tc.name   testWriteBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.desc   Testing the writeInt16BE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64BE(BigInt(0x7ecafafecacefade), 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigUInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.desc   Testing the writeInt16BE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(BigInt(-0x2135050135310522), 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testWriteBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0100
     * @tc.desc   Testing the writeBigUInt64LE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64LE(BigInt(0x7ecafafecacefade), 0);
        expect(String(ref)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteBigUInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0200
     * @tc.desc   Testing the writeBigUInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteBigUInt64LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(BigInt(-0x2135050135310522), 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0100
     * @tc.desc   Testing the writeDoubleBE interface with two parameters: 123.456 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleBE(123.456, 0);
        expect(String(ref)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }

    });

    /**
     * @tc.name   testWriteDoubleBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0200
     * @tc.desc   Testing the writeDoubleBE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(123.456, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0100
     * @tc.desc   Testing the writeDoubleLE interface with two parameters: 123.456 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleLE(123.456, 0);
        expect(String(ref)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteDoubleLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0200
     * @tc.desc   Testing the writeDoubleLE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteDoubleLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(123.456, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0100
     * @tc.desc   Testing the writeFloatBE interface with two parameters: 0xcabcbcbc and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeFloatBE(0xcabcbcbc, 0);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteFloatBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0200
     * @tc.desc   Testing the writeFloatBE interface with an out-of-range 'offset' value of 5, where 'offset' must be >= 0 and <= 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(0xcabcbcbc, 5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0100
     * @tc.desc   Testing the writeFloatLE interface with two parameters: 0xcabcbcbc and 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(16);
        let ref = buf.writeFloatLE(0xcabcbcbc, 12);
        expect(String(ref)).assertEqual('16');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteFloatLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0200
     * @tc.desc   Testing the writeFloatLE interface with a normal value of 0xcabcbcbc and an out-of-range 'offset' value of 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteFloatLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(0xcabcbcbc, 5);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0100
     * @tc.desc   Testing the writeInt8 interface with value to buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        let ref = buf.writeInt8(2, 0);
        expect(String(ref)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0200
     * @tc.desc   Testing the writeInt8 interface with value 2 and an out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(2, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0300
     * @tc.desc   Testing the writeInt8 interface with two parameters: 0x13245 and out of range "value" 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(0x13245, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0100
     * @tc.desc   Testing the writeInt16BE interface with two parameters: 0x7bca and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16BE(0x7bca, 0);
        expect(String(ref)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0200
     * @tc.desc   Testing the writeInt16BE interface with out of range "offset" -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0300
     * @tc.desc   Testing the writeInt16BE interface with out of range "value" 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x123456, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0400
     * @tc.desc   Testing the writeInt16BE interface with out of range "offset" 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0100
     * @tc.desc   Testing the writeInt16LE interface with two parameters: 0x1234 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16LE(0x1234, 0);
        expect(String(ref)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0200
     * @tc.desc   Testing the writeInt16LE interface with out-of-range 'offset' value of -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x7bca, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0300
     * @tc.desc   Testing the writeInt16LE interface with out of range "value" 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x123456, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt16LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0400
     * @tc.desc   Testing the writeInt16LE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt16LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x1234, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0100
     * @tc.desc   Testing the writeInt32BE interface with two parameters: 0x12345678 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32BE(0x12345678, 0);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0200
     * @tc.desc   Testing the writeInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0300
     * @tc.desc   Testing the writeInt32BE interface with out of range "value" 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x123456789, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0400
     * @tc.desc   Testing the writeInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0100
     * @tc.desc   Testing the writeInt32LE interface with two parameters: 0x12345678 and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32LE(0x12345678, 0);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0200
     * @tc.desc   Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0300
     * @tc.desc   Testing the writeInt32LE interface with out of range "value" 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x123456789, 0)
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteInt32LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0400
     * @tc.desc   Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteInt32LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0100
     * @tc.desc   Testing the writeIntBE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
        expect(String(ref)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteIntBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0200
     * @tc.desc   Testing the writeIntBE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteIntBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0300
     * @tc.desc   Testing the writeIntBE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntBE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, -1, 6);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0100
     * @tc.desc   Testing the writeIntLE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
        expect(String(ref)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteIntLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0200
     * @tc.desc   Testing the writeIntLE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteIntLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0100
     * @tc.desc   Testing the writeUInt8 interface with two parameters: 0x42 and 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 3);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0200
     * @tc.desc   Testing the writeUInt8 interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(0x42, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0300
     * @tc.desc   Testing the writeUInt8 interface with two parameters: 0x42 and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 1);
        expect(String(ref)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0100
     * @tc.desc   Testing the writeUInt16BE interface with two parameters: 0xdead and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 0);
        expect(String(ref)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0200
     * @tc.desc   Testing the writeUInt16BE interface with out-of-range "value"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdeadfc, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0300
     * @tc.desc   Testing the writeUInt16BE interface with  out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdead, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt16BE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0400
     * @tc.desc   Testing the writeUInt16BE interface with two parameters: 0xdead and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16BE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt16BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 1);
        expect(String(ref)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });
 
    /**
     * @tc.name   testWriteUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0100
     * @tc.desc   Testing the writeUInt16LE interface with two parameters: 0xdead and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 0);
        expect(String(ref)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0200
     * @tc.desc   Testing the writeUInt16LE interface with out-of-range "value"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdeadfc, 0);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0300
     * @tc.desc   Testing the writeUInt16LE interface with  out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdead, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt16LE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0400
     * @tc.desc   Testing the writeUInt16LE interface with two parameters: 0xdead and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt16LE0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt16LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 1);
        expect(String(ref)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt32BE001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0100
     * @tc.desc   Testing the writeUInt32BE interface with two parameters: 0xfeedface and 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt32BE001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32BE(0x7eedface, 0);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0200
     * @tc.desc   Testing the writeUInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt32BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0300
     * @tc.desc   Testing the writeUInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWriteUInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0100
     * @tc.desc   Testing writeUInt32LE with value '0xfeedface, 0'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0x7eedface, 0);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0200
     * @tc.desc   Testing writeUInt32LE with value '0xfeedface, -1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt32LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, -1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUInt32LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0300
     * @tc.desc   Testing writeUInt32LE with value '0xfeedface, 1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0100
     * @tc.desc   Testing writeUIntBE with value '0x13141516, 0, 4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 4);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUIntBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0200
     * @tc.desc   Testing writeUIntBE with value '0x13141516, 0, 1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 1);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUIntBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0300
     * @tc.desc   Testing writeUIntBE with value '0x13141516, 1, 4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUIntBE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0400
     * @tc.desc   Testing writeUIntBE with value '0x13141516, 1, 4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect(String(ref)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0100
     * @tc.desc   Testing writeUIntLE with value '0x13141516, 0, 4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 4);
        expect(String(ref)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testWriteUIntLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0200
     * @tc.desc   Testing writeUIntLE with value '0x13141516, 0, 1'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 1);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUIntLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0300
     * @tc.desc   Testing writeUIntLE with value '0x13141516, 1, 4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testWriteUIntLE0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0400
     * @tc.desc   Testing writeUIntLE with value 'buffer.allocUninitializedFromPool(5),1,4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUIntLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWriteUIntLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect(String(ref)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0100
     * @tc.desc   Testing readBigInt64BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x0102030405060700), 0);
        let ref = BigInt(buf.readBigInt64BE(0)).toString(16);
        expect(String(ref)).assertEqual("102030405060700");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0200
     * @tc.desc   Testing readBigInt64BE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        let ref = BigInt(buf.readBigInt64BE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadBigInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0300
     * @tc.desc   Testing readBigInt64BE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x0102030405060700));
        let ref = BigInt(buf.readBigInt64BE(undefined)).toString(16);
        expect(String(ref)).assertEqual("102030405060700");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0100
     * @tc.desc   Testing readBigInt64LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x0102030405060700), 0);
        let ref = BigInt(buf.readBigInt64LE(0)).toString(16);
        expect(String(ref)).assertEqual("7060504030201");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0200
     * @tc.desc   Testing readBigInt64LE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        let ref = BigInt(buf.readBigInt64LE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadBigUInt64BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0100
     * @tc.desc   Testing readBigUInt64BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64BE(0)).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigUInt64BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0200
     * @tc.desc   Testing readBigUInt64BE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(-0x2135050135310522), 0);
        let ref = Double(buf.readBigUInt64BE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadBigUInt64BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0300
     * @tc.desc   Testing readBigUInt64BE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64BE(undefined)).toString(16);
        expect(string(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigUInt64LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0100
     * @tc.desc   Testing readBigUInt64LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64LE(0)).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadBigUInt64LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0200
     * @tc.desc   Testing readBigUInt64LE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(-0x2135050135310522), 0);
        let ref = Double(buf.readBigUInt64LE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadBigUInt64LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0300
     * @tc.desc   Testing readBigUInt64LE for buffer with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadBigUInt64LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64LE(undefined)).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0100
     * @tc.desc   Testing readDoubleBE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE();
        expect(String(ref)).assertEqual('123.456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0200
     * @tc.desc   Testing readDoubleBE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadDoubleBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0300
     * @tc.desc   Testing readDoubleBE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(undefined);
        expect(String(ref)).assertEqual('123.456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0100
     * @tc.desc   Testing readDoubleLE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE();
        expect(String(ref)).assertEqual('123.456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadDoubleLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0200
     * @tc.desc   Testing readDoubleLE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadDoubleLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0300
     * @tc.desc   Testing readDoubleLE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadDoubleLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(undefined);
        expect(String(ref)).assertEqual('123.456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0100
     * @tc.desc   Testing readFloatBE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatBE(0)).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0200
     * @tc.desc   Testing readFloatBE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = Double(buf.readFloatBE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadFloatBE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0300
     * @tc.desc   Testing readFloatBE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatBE(undefined)).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0100
     * @tc.desc   Testing readFloatLE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatLE(0)).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadFloatLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0200
     * @tc.desc   Testing readFloatLE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadFloatLE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0300
     * @tc.desc   Testing readFloatLE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadFloatLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatLE(undefined)).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT_0100
     * @tc.desc   Testing readInt8 for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = Double(buf.readInt8(0)).toString(16);
        expect(String(ref)).assertEqual("12");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT_0200
     * @tc.desc   Testing readInt8 for buffer with value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(2);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT_0300
     * @tc.desc   Testing readInt8 for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = Double(buf.readInt8(undefined)).toString(16);
        expect(String(ref)).assertEqual("12");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0100
     * @tc.desc   Testing readInt16BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = Double(buf.readInt16BE(0)).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0200
     * @tc.desc   Testing readInt16BE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt16BE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = Double(buf.readInt16BE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0100
     * @tc.desc   Testing readInt16LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt16LE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = Double(buf.readInt16LE(0)).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0200
     * @tc.desc   Testing readInt16LE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt16LE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = Double(buf.readInt16LE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });
    /**
     * @tc.name   testReadInt16LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0300
     * @tc.desc   Testing readInt16LE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt16LE0003";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = Double(buf.readInt16LE(undefined)).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0100
     * @tc.desc   Testing readInt32BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = Double(buf.readInt32BE(0)).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0200
     * @tc.desc   Testing readInt32BE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt32BE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0100
     * @tc.desc   Testing readInt32LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = Double(buf.readInt32LE(0)).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0200
     * @tc.desc   Testing readInt32LE for buffer with value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadInt32LE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = Double(buf.readInt32LE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0100
     * @tc.desc   Testing readIntBE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = Double(buf.readIntBE(0, 5)).toString(16);
        expect(ref).assertEqual("1234567890");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadIntBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0200
     * @tc.desc   Testing readIntBE for buffer with value '(2, 5)'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = Double(buf.readIntBE(2, 5)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0100
     * @tc.desc   Testing readIntLE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = Double(buf.readIntLE(0, 5)).toString(16);
        expect(ref).assertEqual("3456789011");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadIntLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0200
     * @tc.desc   Testing readIntLE for buffer with value '(2, 5)'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadIntLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = Double(buf.readIntLE(2, 5)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadUInt80001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0100
     * @tc.desc   Testing readUInt8 for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = Double(buf.readUInt8(0)).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt80002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0200
     * @tc.desc   Testing readUInt8 for buffer with value '4'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = Double(buf.readUInt8(4)).toString(16);
        expect(false).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadUInt80003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0300
     * @tc.desc   Testing readUInt8 for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = Double(buf.readUInt8(undefined)).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0100
     * @tc.desc   Testing readUInt16BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = Double(buf.readUInt16BE(0)).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0200
     * @tc.desc   Testing readUInt16BE for buffer with value '3'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt16BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = Double(buf.readUInt16BE(3)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadUInt16BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0300
     * @tc.desc   Testing readUInt16BE for buffer with value undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt16BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(undefined);
        expect(ref).assertEqual(4660);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEquals0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0100
     * @tc.desc   Test the equals interface by two identical buffers which content is numerical string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEquals0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.equals(buf2);
        expect(String(res)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testEquals0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0200
     * @tc.desc   Test the equals interface by two identical buffers which content is include chinese string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEquals0002";
      try {
        let buf1 = buffer.from("1236测试");
        let buf2 = buffer.from("1236测试");
        let res = buf1.equals(buf2);
        expect(String(res)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testEquals0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0300
     * @tc.desc   Test the equals interface by two different buffers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEquals0003";
      try {
        let buf1 = buffer.from("O@O");
        let buf2 = buffer.from("O^O");
        let res = buf1.equals(buf2);
        expect(String(res)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testEquals0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0600
     * @tc.desc   Test the equals interface by two different type buffers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEquals0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEquals0006"
      let buf = buffer.from("ABC");
      try {
        let res = buf.equals(new Uint8Array([21, 31]));
        expect(res).assertFalse()
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testSubarray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0100
     * @tc.desc   Test the subarray interface by pass the parameter start is 0 and end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSubarray0001";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(0, 3);
        let str = subBuf.toString();
        expect(String(str)).assertEqual("123");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
      ;
    });
    /**
     * @tc.name   testSubarray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0200
     * @tc.desc   Test the subarray interface by pass the parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSubarray0002";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(undefined);
        let str = subBuf.toString();
        expect(String(str)).assertEqual("1236");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
      ;
    });

    /**
     * @tc.name   testSubarray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0400
     * @tc.desc   Test the subarray interface by pass the parameter start is 3 and end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSubarray0004";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(3, 4);
        let str = buf.toString();
        expect(String(str)).assertEqual("6");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
      ;
    });

    /**
     * @tc.name   testSubarray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0500
     * @tc.desc   Test the subarray interface by pass the parameter start is -3 and end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSubarray0005";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(-3, 0);
        expect(String(buf.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testSubarray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0600
     * @tc.desc   Test the subarray interface by pass the parameter start is 6 and end is 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSubarray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSubarray0006";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(6, 9);
        expect(String(subBuf.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });
    /**
     * @tc.name   testCopy0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0100
     * @tc.desc   Test the copy interface by copying one buffer of numeric string type  to other buffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let num = buf1.copy(buf2);
        expect(String(num)).assertEqual('4');
        let str = buf2.toString();
        expect(String(str)).assertEqual("1236");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
      ;
    });

    /**
     * @tc.name   testCopy0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0200
     * @tc.desc   Test the copy interface by copying one buffer of chinese string type  to other buffer of numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0002";
      try {
        let buf1 = buffer.from("abcdefg");
        let buf2 = buffer.from("1235789");
        let num = buf1.copy(buf2, 2, 1, 3);
        expect(String(num)).assertEqual('2');
        let str = buf2.toString();
        expect(String(str)).assertEqual("12bc789");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
      ;
    });
    /**
     * @tc.name   testCopy0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0300
     * @tc.desc   Test the copy interface by copying one buffer of special string type  to other buffer of empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0003";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(0);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testCopy0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0400
     * @tc.desc   Test the copy interface by copying one buffer which length is large than another to other buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0004";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = buffer.from("1235");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(String(str)).assertEqual("1236");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail()
      }
    });

    /**
     * @tc.name   testCopy0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0500
     * @tc.desc   Test the copy interface by copying one buffer to other buffer,and passing the parameter sourceStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0005";
      let buf1 = buffer.from("123656");
      let buf2 = buffer.from("1235");
      try {
        buf1.copy(buf2, -1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testCopy0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0600
     * @tc.desc   Test the copy interface by copying one buffer which length is smaller than another to other buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0006";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("123556");
        let num = buf1.copy(buf2);
        expect(String(num)).assertEqual('4');
        let str = buf2.toString();
        expect(String(str)).assertEqual("ab$#56");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCopy0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_0900
     * @tc.desc   Test the copy interface by copying one buffer of string type to other buffer of array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCopy0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testCopy0009";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = new Uint8Array([21, 31]);
        let num = buf1.copy(buf2);
        expect(num).assertEqual(2);
        let str = '';
        for (const codePoint of buf2) {
          str += String.fromCharCode(codePoint.toInt());
        }
        expect(str).assertEqual("12")
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0100
     * @tc.desc   Test the toString interface by source buffer of numerical string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0001";
      try {
        let buf = buffer.from("1236");
        let str = buf.toString();
        expect(String(str)).assertEqual("1236");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0200
     * @tc.desc   Test the toString interface by source buffer of chinese string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0002";
      try {
        let buf = buffer.from("张三");
        let str = buf.toString();
        expect(String(str)).assertEqual("张三");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0300
     * @tc.desc   Test the toString interface by passing the parameter encoding to "binary".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0003";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary");
        expect(String(str)).assertEqual("abc");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0400
     * @tc.desc   Test the toString interface by passing the parameter encoding to "ascii".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0004";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ascii");
        expect(String(str)).assertEqual("abc");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0500
     * @tc.desc   Test the toString interface by passing the parameter encoding to "base64".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0005";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("base64");
        expect(String(str)).assertEqual("YWJj");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0600
     * @tc.desc   Test the toString interface by passing the parameter encoding to "hex".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0006";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("hex");
        expect(String(str)).assertEqual("616263");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0700
     * @tc.desc   Test the toString interface by passing the parameter encoding to "latin1".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0007";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("latin1");
        expect(String(str)).assertEqual("abc");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0800
     * @tc.desc   Test the toString interface by passing the parameter encoding to "ucs2".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0008";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ucs2");
        expect(String(str)).assertEqual("扡");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0900
     * @tc.desc   Test the toString interface by passing the parameter encoding to "utf16le".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0009";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("utf16le");
        expect(String(str)).assertEqual("扡");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1000
     * @tc.desc   Test the toString interface by source buffer of special string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0010";
      try {
        let buf = buffer.from("!@#$%^&*");
        let str = buf.toString();
        expect(String(str)).assertEqual("!@#$%^&*");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testToString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1100
     * @tc.desc   Test the toString interface by source buffer of long string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0011";
      try {
        let str =
          "abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîï" +
            "ðñòóôõö÷øùúûüýþÿ"
        let buf = buffer.from(str, "latin1");
        let toStr = buf.toString("latin1");
        expect(String(toStr))
          .assertEqual("abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëì" +
            "íîïðñòóôõö÷øùúûüýþÿ");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1300
     * @tc.desc   Test the toString interface by passing the parameter encoding to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0013";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString(undefined);
        expect(String(str)).assertEqual("abc");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToString0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1500
     * @tc.desc   Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0015";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, 2);
        expect(String(str)).assertEqual("b");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testToString0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1600
     * @tc.desc   Test the toString interface by passing the parameter encoding to "binary", start to -1, and end to 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0016";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", -1, 2);
        expect(String(str)).assertEqual("ab");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testToString0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1700
     * @tc.desc   Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testToString0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0017";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, -2);
        expect(String(str)).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0100
     * @tc.desc   Test the indexOf interface by passing the parameter value to a character string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3");
        expect(String(index)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0200
     * @tc.desc   Test the indexOf interface by passing the parameter value to a character string, and byteOffset to 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3", 2);
        expect(String(index)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0300
     * @tc.desc   Test the indexOf interface by passing the parameter value to two character string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23");
        expect(String(index)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0400
     * @tc.desc   Test the indexOf interface by passing the parameter value to special string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0004";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let index = buf.indexOf("@");
        expect(String(index)).assertEqual('20');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0500
     * @tc.desc   Test the indexOf interface by passing the parameter value to two character string, and byteOffset to 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0005";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23", 3);
        expect(String(index)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0600
     * @tc.desc   Test the indexOf interface by passing the parameter value which is not in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0006";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("a");
        expect(String(index)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0700
     * @tc.desc   Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.indexOf("ab", 0, encode);
          expect(String(index)).assertEqual('-1');
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0800
     * @tc.desc   Test the indexOf interface by passing the parameter value to empty string,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0008";
      try {
        let buf = buffer.from("123");
        let index = buf.indexOf("");
        expect(String(index)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testIndexOf0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0900
     * @tc.desc   Test the indexOf interface by passing the parameter value to one space string,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIndexOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIndexOf0009";
      try {
        let buf = buffer.from("123 ");
        let index = buf.indexOf(" ");
        expect(String(index)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0100
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3");
        expect(String(index)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0200
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3", 2);
        expect(String(index)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0300
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23");
        expect(String(index)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0400
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0004";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23", 3);
        expect(String(index)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0500
     * @tc.desc   Test the lastIndexOf interface by passing the parameter value which is not in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0005";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("a");
        expect(String(index)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0600
     * @tc.desc   Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0006";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.lastIndexOf("ab", 0, encode);
          expect(String(index)).assertEqual('-1');
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLastIndexOf0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0700
     * @tc.desc   Test the indexOf interface by passing the parameter value to empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0007"
      let buf = buffer.from("123");
      try {
        let index = buf.lastIndexOf("");
        expect(String(index)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testLastIndexOf0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0800
     * @tc.desc   Test the indexOf interface by passing the parameter value to space string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0008"
      let buf = buffer.from("123 ");
      try {
        let index = buf.lastIndexOf(" ");
        expect(String(index)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
  
    /**
     * @tc.name   testLastIndexOf0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1300
     * @tc.desc   Test the indexOf interface by passing the parameter offset to abnormal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testLastIndexOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testLastIndexOf0013"
      let buf = buffer.from("13236235");
      try {
        let index = buf.lastIndexOf("23", 9999999);
        expect(String(index)).assertEqual('5');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testIncludes0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.desc   Test the includes interface by passing the parameter value to a numerical string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0001";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3");
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.desc   Test the includes interface by passing the parameter value to a numerical string which is in the buffer,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0002";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3", 2);
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.desc   Test the includes interface by passing the parameter value to two numerical string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0003";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32");
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.desc   Test the includes interface by passing the parameter value to two numerical string which is in the buffer,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0004";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", 2);
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.desc   Test the includes interface by passing the parameter value to special string which is in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0005";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let flag = buf.includes("#@");
        expect(String(flag)).assertEqual('true');
        flag = buf.includes("测试");
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.desc   Test the includes interface by passing the parameter value to string which is not in the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0006";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("abc");
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testIncludes0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.desc   Test the includes interface by passing the parameter value to string which is not in the buffer,and byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let buf = buffer.from("13236");
          let flag = buf.includes("abc", 0, encode);
          expect(String(flag)).assertEqual('false');
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFalse();
      }
    });

    /**
     * @tc.name   testIncludes0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.desc   Test the includes interface by passing the parameter value to number but source buffer of string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0008";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes(32 as double);
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testIncludes0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.desc   Test the includes interface by passing the parameter value to empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0009";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("");
        expect(String(flag)).assertEqual(String(true));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
  
    /**
     * @tc.name   testIncludes0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1200
     * @tc.desc   Test the includes interface by passing the parameter value which is in the source buffer and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0012";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", -1);
        expect(String(flag)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testIncludes0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1300
     * @tc.desc   Test the includes interface by passing the parameter value which is in the source buffer and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testIncludes0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testIncludes0013";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", undefined);
        expect(String(flag)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSwap160001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0100
     * @tc.desc   Test the swap16 interface by source buffer which size is multiple of 16-bits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap160001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap160001";
      try {
        let buf = buffer.from("1323");
        buf.swap16();
        let str = buf.toString("hex");
        expect(String(str)).assertEqual("33313332");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSwap160002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0200
     * @tc.desc   Test the swap16 interface by source buffer which size is not multiple of 16-bits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap160002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap160002";
      let buf = buffer.from("132");
      try {
        buf.swap16();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200009');
      }
    });
    /**
     * @tc.name   testSwap160003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0300
     * @tc.desc   Test the swap16 interface by source buffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap160003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap160003";
      try {
        let buf = buffer.from("");
        buf.swap16();
        let str = buf.toString();
        expect(String(str)).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testSwap320001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0100
     * @tc.desc   Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap320001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap320001";
      try {
        let buf1 = buffer.from("1234");
        buf1.swap32();
        let str = buf1.toString();
        expect(String(str)).assertEqual("4321");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSwap320002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0200
     * @tc.desc   Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap320002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap320002";
      let buf = buffer.from("132");
      try {
        buf.swap32();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200009');
      }
    });
    /**
     * @tc.name   testSwap320003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0300
     * @tc.desc   Test the swap32 interface by source buffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap320003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap320003";
      try {
        let buf = buffer.from("");
        buf.swap32();
        let str = buf.toString();
        expect(String(str)).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testSwap640001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0100
     * @tc.desc   Test the swap64 interface by source buffer which size is multiple of 64-bits .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap640001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap640001";
      try {
        let buf = buffer.from("12345678");
        buf.swap64();
        let str = buf.toString();
        expect(String(str)).assertEqual("87654321");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSwap640002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0200
     * @tc.desc   Test the swap64 interface by source buffer which size is not multiple of 64-bits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap640002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap640002";
      let buf = buffer.from("1234567");
      try {
        buf.swap64();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200009');
      }
    });
    /**
     * @tc.name   testSwap640003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0300
     * @tc.desc   Test the swap64 interface by source buffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSwap640003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSwap640003";
      try {
        let buf = buffer.from("");
        buf.swap64();
        let str = buf.toString();
        expect(String(str)).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0100
     * @tc.desc   Test the keys interface by source buffer which created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testKeys0001";
      try {
        let buf = buffer.from("1234");
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(String(key)).assertEqual(String(index));
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0200
     * @tc.desc   Test the keys interface by source buffer created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testKeys0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf = buffer.from(uArr);
        let keys = buf.keys();
        let index = 0;
        for (const key of keys) {
          expect(String(key)).assertEqual(String(index));
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0300
     * @tc.desc   Test the keys interface by source buffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testKeys0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testKeys0003";
      try {
        let buf = buffer.from("");
        let keys = buf.keys();
        expect(isIteratorEmpty(keys)).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0100
     * @tc.desc   Test the values interface by source buffer which created from string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testValues0001";
      try {
        let buf = buffer.from("1234");
        let values = buf.values();
        let va = 49;
        for (const value of values) {
          expect(String(value)).assertEqual(String(va));
          va++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0200
     * @tc.desc   Test the values interface by source buffer which created from uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testValues0002";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf = buffer.from(uArr);
        let values = buf.values();
        let va = 0x31;
        for (const value of values) {
          expect(String(value)).assertEqual(String(va));
          va++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0300
     * @tc.desc   Test the values interface by source buffer which size is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testValues0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testValues0003";
      try {
        let buf = buffer.from("");
        let values = buf.values();
        expect(isIteratorEmpty(values)).assertTrue()
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0100
     * @tc.desc   Test the entries interface by source buffer which created from string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEntries0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEntries0001";
      try {
        let buf = buffer.from("1234");
        let entries = buf.entries();
        let va = 49, index = 0;
        for (const entry of entries) {
          expect(String(entry[0])).assertEqual(String(index));
          expect(String(entry[1])).assertEqual(String(va));
          va++;
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0200
     * @tc.desc   Test the entries interface by source buffer which created from Uint8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testEntries0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testEntries0001";
      try {
        let uArr = new Uint8Array(4);
        uArr[0] = 0x31;
        uArr[1] = 0x32;
        uArr[2] = 0x33;
        uArr[3] = 0x34;
        let buf1 = buffer.from(uArr);
        let entries = buf1.entries();
        let va = 49, index = 0;
        for (const entry of entries) {
          expect(String(entry[0])).assertEqual(String(index));
          expect(String(entry[1])).assertEqual(String(va));
          va++;
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0100
     * @tc.desc   Test the from interface by Coping the passed buffer data onto a new Buffer instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0001";
      try {
        let uArr = new Uint8Array(3);
        uArr[0] = 0x12;
        uArr[1] = 0x34;
        uArr[2] = 0x56;
        let buf = buffer.from(uArr);
        let str = buf.toString("hex");
        expect(String(str)).assertEqual("123456");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0200
     * @tc.desc   Test the from interface by Allocatting a new Buffer using an array of bytes in the range 0 – 255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0002";
      try {
        const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let str = buf.toString("hex");
        expect(String(str)).assertEqual("627566666572");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0300
     * @tc.desc   Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0003";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = buffer.from(arr.buffer);
        arr[0] = 99
        buf[1] = 100
        let str = buf.toString("hex");
        expect(str).assertEqual("6364");
        expect(arr[1]).assertEqual(100);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0400
     * @tc.desc   Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0004";
      try {
        const arr = new Uint8Array(2);
        arr[0] = 97;
        arr[1] = 98;
        const buf = buffer.from(arr.buffer, 1);
        buf[0] = 99;
        let str = buf.toString("hex");
        expect(str).assertEqual("63");
        expect(arr[1]).assertEqual(99);
        expect(buf[0]).assertEqual(99);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0500
     * @tc.desc   Test the from interface by Copping the passed buffer data onto a new Buffer instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0005";
      try {
        const buf1 = buffer.from('buffer');
        const buf2 = buffer.from(buf1);
        buf1[0] = 0x61;
        let str = buf1.toString();
        expect(str).assertEqual("auffer");
        str = buf2.toString();
        expect(str).assertEqual("buffer");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0600
     * @tc.desc   Test the from interface by Creatting a new Buffer containing string. The encoding parameter identifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0006";
      try {
        const buf1 = buffer.from('this is a test');
        let str = buf1.toString();
        expect(String(str)).assertEqual("this is a test");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0700
     * @tc.desc   Test the from interface by creatting a new Buffer containing string. The encoding parameter identifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0007";
      try {
        const buf1 = buffer.from('F1刘FG', 'hex');
        let str = buf1.toString('hex');
        expect(String(str)).assertEqual("f1");
    
        let buf2 = buffer.from("F1FG", "ascii")
        str = buf2.toString("ascii");
        expect(String(str)).assertEqual("F1FG");
    
        let buf3 = buffer.from("F1FG刘", "base64")
        str = buf3.toString("base64");
        expect(String(str)).assertEqual("F1FG");
    
        let buf4 = buffer.from("F1FG刘", "base64url")
        str = buf4.toString("base64url");
        expect(String(str)).assertEqual("F1FG");
    
        let buf5 = buffer.from("F1FG", "binary")
        str = buf5.toString("binary");
        expect(String(str)).assertEqual("F1FG");
    
        let buf6 = buffer.from("F1FG", "latin1")
        str = buf6.toString("latin1");
        expect(String(str)).assertEqual("F1FG");
    
        let buf7 = buffer.from("F1FG刘", "ucs2")
        str = buf7.toString("ucs2");
        expect(String(str)).assertEqual("F1FG刘");
    
        let buf8 = buffer.from("F1FG刘", "utf16le")
        str = buf8.toString("utf16le");
        expect(String(str)).assertEqual("F1FG刘");
    
        let buf9 = buffer.from("F1FG刘", "ucs2")
        str = buf9.toString("ucs2");
        expect(String(str)).assertEqual("F1FG刘");
    
        let buf10 = buffer.from("F1FG刘", "utf-8")
        str = buf10.toString("utf-8");
        expect(String(str)).assertEqual("F1FG刘");
    
        let buf11 = buffer.from("F1FG刘", "utf8")
        str = buf11.toString("utf8");
        expect(String(str)).assertEqual("F1FG刘");
    
        let buf12 = buffer.from("AsD-_QWEr", "base64url")
        str = buf12.toString("hex");
        expect(String(str)).assertEqual("02c0fefd0584");
    
        let buf13 = buffer.from("AsDQWEr134", "base64url")
        str = buf13.toString("hex");
        expect(String(str)).assertEqual("02c0d0584af5df");
    
        let buf14 = buffer.from("_AsDQ-12W7Er_", "base64url")
        str = buf14.toString("hex");
        expect(String(str)).assertEqual("fc0b0343ed765bb12b");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0800
     * @tc.desc   Test the from interface For the object whose value returned by valueof() function is strictly equal to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0008";
      try {
        const buf = buffer.from(new String('this is a test'));
        let str = buf.toString();
        expect(String(str)).assertEqual("this is a test");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFrom0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_0900
     * @tc.desc   Test the from interface for the object whose value returned by valueof() function is strictly equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0009";
      let foo = new Foo();
      try {
        const buf = buffer.from(foo, 'utf8', 0);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "input" must be Buffer or ArrayBuffer, Array, Array-like');
      }
    });

    /**
     * @tc.name   testFrom0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1000
     * @tc.desc   Test the from interface by creating a new buffer containing a newline character string. Creating using
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0010";
      try {
        const str =
          `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
        const buf = buffer.from(str, 'base64');
        let ref = buf.readInt8(buf.length - 1);
        expect(String(ref)).assertEqual('114');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1300
     * @tc.name testFrom0013
     * @tc.desc Test the from interface by pass the parameter byteOffset is outside of the range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testFrom0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0013";
      let arrayBuffer = new ArrayBuffer(5);
      let array = new Int8Array(arrayBuffer);
      array[0] = 1;
      array[1] = 2;
      array[2] = 3;
      array[3] = 4;
      array[4] = 5;
      try {
        buffer.from(arrayBuffer, 6, 1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });
    /**
     * @tc.name   testFrom0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1400
     * @tc.desc   Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0014";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf);
        let str = buf1.toString();
        expect(str).assertEqual("ab");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testFrom0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1500
     * @tc.desc   Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0015";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf, -1, -1);
        let str = buf1.toString();
        expect(String(str)).assertEqual("ab");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testFrom0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1600
     * @tc.desc   Test the from interface by The buffer handles a uint8array and decodes it with base64 and base64url.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = 'TestFrom0016';
      try {
        let array = new Uint8Array([252, 11, 3, 67, 237, 118, 91, 177, 43]);
        let buf = buffer.from(array);
        let strUrl = buf.toString("base64url");
        let str = buf.toString("base64");
        expect(String(strUrl)).assertEqual("_AsDQ-12W7Er");
        expect(String(str)).assertEqual("/AsDQ+12W7Er");

        array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(String(strUrl)).assertEqual('AsD-_QWERQ');
        expect(String(str)).assertEqual("AsD+/QWERQ==");

        array = new Uint8Array([215, 109, 211, 97, 72, 142, 167, 241]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(String(strUrl)).assertEqual("123TYUiOp_E");
        expect(String(str)).assertEqual("123TYUiOp/E=");

        array = new Uint8Array([252]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(String(strUrl)).assertEqual("_A");
        expect(String(str)).assertEqual("/A==");

        array = new Uint8Array([252, 97]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(String(strUrl)).assertEqual("_GE");
        expect(String(str)).assertEqual("/GE=");

        array = new Uint8Array([252, 97, 142]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(String(strUrl)).assertEqual("_GGO");
        expect(String(str)).assertEqual("/GGO");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testFrom0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FROM_1700
     * @tc.desc   Test the from interface by Creating a new Buffer containing empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testFrom0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testFrom0017";
      try {
        const buf = buffer.from("");
        let str = buf.toString();
        expect(String(str)).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0100
     * @tc.desc   Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = "testBlobConstructor0001";
        try {
          let option: buffer.BlobOptions = {
            type: "new type", endings: "transparent"
          }
          let sources: string[] = ["a", "b", "c"];
          let blob2 = new buffer.Blob(sources, option);
          let promise = blob2.text();
          await promise.then((value: string) => {
            try {
              expect(value).assertEqual("abc");
            } catch (err) {
              err = err as BusinessError;
              console.error(`${TAG} err is ${err}`);
            }
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} err is ${err}`);
          expect(false).assertFail();
        }
        done();
      });

    /**
     * @tc.name   testBlobConstructor0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0500
     * @tc.desc   Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobConstructor0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      TAG = "testBlobConstructor0005";
      try {
        let option: buffer.BlobOptions = {
          type: "new type", endings: "transparent"
        };
        let sources:string[] =  ["a", "b", "c"];
        let blob2 = new buffer.Blob(sources, option);
        let blob = new buffer.Blob([blob2]);
        await blob.text().then((value:string) => {
          try {
            expect(String(value)).assertEqual("abc");
          } catch (err) {
            err = err as BusinessError;
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testBlobConstructor0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0600
     * @tc.desc   Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = "testBlobConstructor0006";
        try {
          new buffer.Blob(["a", "b", "c"]);
          expect(false).assertFalse();
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} err is ${err}`);
          expect(String(err.code)).assertEqual('401');
        }
        done()
      });

    /**
     * @tc.name   testBlobText0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBTEXT_0100
     * @tc.desc   Test the text interface by buffer fulfills with the contents of the Blob decoded as a UTF-8 string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobText0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      TAG = "testBlobText0001";
      try {
        let option: buffer.BlobOptions = {
          type: "new type", endings: "transparent"
        };
        let sources:string[] =  ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        await blob.text().then((value:string) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            err = err as BusinessError;
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testBlobSize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0100
     * @tc.desc   Test the size interface by creating buffer which length is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobSize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobSize0001";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(String(size)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobSize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0200
     * @tc.desc   Test the size interface by creating buffer which length is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobSize0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobSize0002";
      try {
        let blob = new buffer.Blob([]);
        let size = blob.size;
        expect(String(size)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobSize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0300
     * @tc.desc   Test the size interface by creating buffer which length is 3 and content include chinese string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobSize0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobSize0003";
      try {
        let sources = ["测试", "$#", "c"];
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(String(size)).assertEqual('9');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobType0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBTYPE_0200
     * @tc.desc   Test the type interface by creating buffer which type is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobType0002";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let type = blob.type;
        expect(type).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testBlobLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0100
     * @tc.desc   Test the type interface by creating buffer which length is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobLength0001";
      try {
        let buf = buffer.from("1236");
        let len = buf.length;
        expect(String(len)).assertEqual('4');
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0300
     * @tc.desc   Test the type interface by creating buffer which content include chinese and special string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobLength0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobLength0003";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let len = buf.length;
        expect(String(len)).assertEqual('22');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobByteOffset0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0100
     * @tc.desc   Test the byteOffset interface by creating buffer by "from" interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobByteOffset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobByteOffset0001";
      try {
        let buf = buffer.from("1236");
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobByteOffset0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0200
     * @tc.desc   Test the byteOffset interface by creating buffer by "alloc" interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobByteOffset0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobByteOffset0002";
      try {
        let buf = buffer.alloc(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobByteOffset0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0300
     * @tc.desc   Test the byteOffset interface by creating buffer by "allocUninitializedFromPool" interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobByteOffset0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobByteOffset0003";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testBlobByteOffset0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0400
     * @tc.desc   Test the byteOffset interface by creating buffer by "allocUninitialized" interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBlobByteOffset0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBlobByteOffset0004";
      try {
        let buf = buffer.allocUninitialized(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0100
     * @tc.desc   Test the readUInt16LE interface by Reading an unsigned, little-endian 16-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt16LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = Double(buf.readUInt16LE(0)).toString(16);
        expect(String(ref)).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt16LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0200
     * @tc.desc   Test the readUInt16LE interface by passing the parameter offset out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt16LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt16LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      try {
        buf.readUInt16LE(3);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testReadUInt32BE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0100
     * @tc.desc   Test the readUInt32BE interface by Reading an unsigned, big-endian 32-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32BE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = Double(buf.readUInt32BE(0)).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('401');
      }
    });

    /**
     * @tc.name   testReadUInt32BE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0200
     * @tc.desc   Test the readUInt32BE interface by passing the parameter offset out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32BE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32BE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      try {
        Double(buf.readUInt32BE(1)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.name   testReadUInt32BE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0300
     * @tc.desc   Test the readUInt32BE interface by passing the parameter offset to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32BE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = Double(buf.readUInt32BE(undefined)).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(String(err.code)).assertEqual('401');
      }
    });

    /**
     * @tc.name   testReadUInt32LE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0100
     * @tc.desc   Test the readUInt32LE interface by Reading an unsigned, little-endian 32-bit integer from buf at the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32LE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = Double(buf.readUInt32LE(0)).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUInt32LE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0200
     * @tc.desc   Test the readUInt32LE interface by passing the parameter offset out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32LE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      try {
        Double(buf.readUInt32LE(1)).toString(16);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.name   testReadUInt32LE0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0300
     * @tc.desc   Test the readUInt32LE interface by passing the parameter offset to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUInt32LE0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = Double(buf.readUInt32LE(undefined)).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testReadUIntBE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0100
     * @tc.desc   Test the readUIntBE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntBE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntBE(0x13141516, 0, 4);
        let ref = Double(buf.readUIntBE(0, 3)).toString(16);
        expect(String(ref)).assertEqual("131415");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUIntBE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0200
     * @tc.desc   Test the readUIntBE interface by passing the parameter offset out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntBE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUIntBE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(2, 3);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testReadUIntLE0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0100
     * @tc.desc   Test the readUIntLE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntLE0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntLE(0x13141516, 0, 4);
        let ref = Double(buf.readUIntLE(0, 3)).toString(16);
        expect(String(ref)).assertEqual("141516");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testReadUIntLE0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0200
     * @tc.desc   Test the readUIntLE interface by passing the parameter offset out of range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testReadUIntLE0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testReadUIntLE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        Double(buf.readUIntLE(2, 3)).toString(16);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testBufferCompare0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0100
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0001";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let buf2 = buffer.from([8, 7, 6, 5, 4, 3, 2, 1]);
        let result = buf1.compare(buf2);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testBufferCompare0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0200
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0002";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 8);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testBufferCompare0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0300
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0003";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 0, 5);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testBufferCompare0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0400
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0004";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 0, 6, 4);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testBufferCompare0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0500
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0005";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, 5, 9, 0, 4);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testBufferCompare0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0500
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0006";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, Infinity.toInt(), 9, 0, 4);
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001')
      }
    })

    /**
     * @tc.name   testBufferCompare0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_COMPARE_0600
     * @tc.desc   Test BUFFER.COMPARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBufferCompare0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testBufferCompare0007";
      try {
        let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf2 = buffer.from([5, 6, 7, 8, 9, 1, 2, 3, 4]);
        let result = buf1.compare(buf2, Infinity.toInt(), 9, 0, 4);
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200001')
      }
    })

    /**
     * @tc.name   testRead0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0100
     * @tc.desc   Testing readBigUInt64BE for null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64BE()).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testRead0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0200
     * @tc.desc   Testing readBigInt64LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(BigInt(0x01020304050607), 0);
        let ref = BigInt(buf.readBigInt64LE()).toString(16);
        expect(String(ref)).assertEqual("706050403020100");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0300
     * @tc.desc   Testing readBigUInt64BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64BE()).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0400
     * @tc.desc   Testing readBigUInt64LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(0x3dfacefeedface), 0);
        let ref = BigInt(buf.readBigUInt64LE()).toString(16);
        expect(String(ref)).assertEqual("3dfacefeedface");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testRead0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0500
     * @tc.desc   Testing readFloatBE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatBE()).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0600
     * @tc.desc   Testing readFloatLE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0x7abcbcbc, 0);
        let ref = Double(buf.readFloatLE()).toString(16);
        expect(String(ref)).assertEqual("7abcbc80");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0700
     * @tc.desc   Testing readInt8 for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0007";
      try {
        const str =
          `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
        const buf = buffer.from(str, 'base64');
        let ref = buf.readInt8();
        expect(String(ref)).assertEqual('48');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0800
     * @tc.desc   Testing readInt16BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0008";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = Double(buf.readInt16BE()).toString(16);
        expect(String(ref)).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_0900
     * @tc.desc   Testing readInt16LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0009";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = Double(buf.readInt16LE()).toString(16);
        expect(String(ref)).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1000
     * @tc.desc   Testing readInt32BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0010";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = Double(buf.readInt32BE()).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1100
     * @tc.desc   Testing readInt32LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0011";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = Double(buf.readInt32LE()).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1200
     * @tc.desc   Testing readUInt8 for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0012";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = Double(buf.readUInt8()).toString(16);
        expect(String(ref)).assertEqual("42");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testRead0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1300
     * @tc.desc   Testing readUInt16BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0013";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = Double(buf.readUInt16BE()).toString(16);
        expect(String(ref)).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} is fail,err is ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testRead0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1400
     * @tc.desc   Testing readUInt16BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0014";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = Double(buf.readUInt16LE()).toString(16);
        expect(String(ref)).assertEqual("1234");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testRead0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1500
     * @tc.desc   Testing readUInt32BE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0015";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = Double(buf.readUInt32BE()).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testRead0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_READ_1600
     * @tc.desc   Testing readUInt32LE for buffer with normal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testRead0016";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = Double(buf.readUInt32LE()).toString(16);
        expect(String(ref)).assertEqual("12345678");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testToString0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_1800
     * @tc.desc   Testing toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0018";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8');
        expect(String(encodeURI(ref))).assertEqual("%01%02%03%04");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testToString0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_1900
     * @tc.desc   Testing toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0019";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8', 1);
        expect(String(encodeURI(ref))).assertEqual("%02%03%04");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testToString0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_2000
     * @tc.desc   Testing toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0020";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString('utf8', 1, 2);
        expect(String(encodeURI(ref))).assertEqual("%02");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testToString0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTING_2100
     * @tc.desc   Testing toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testToString0021";
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let ref = buf.toString();
        expect(String(encodeURI(ref))).assertEqual("%01%02%03%04");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testWrite0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0100
     * @tc.desc   Testing write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWrite0001";
      try {
        let buf = buffer.alloc(256);
        let len = buf.write('\u00bd + \u00bc = \u00be', 0);
        expect(encodeURI(String(len))).assertEqual("12");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testWrite0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0200
     * @tc.desc   Testing write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWrite0002";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 8);
        expect(String(length)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testWrite0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0300
     * @tc.desc   Testing write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWrite0003";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 0, 1);
        expect(String(length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testWrite0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WRITE_0400
     * @tc.desc   Testing write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testWrite0004";
      try {
        let buffer1 = buffer.alloc(10);
        let length = buffer1.write('abcd', 0, 3, "utf-8");
        expect(String(length)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testSlice0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0100
     * @tc.desc   Testing slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSlice0001";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice();
        expect(String(result.size)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testSlice0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0200
     * @tc.desc   Testing slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSlice0002";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice(1);
        expect(String(result.size)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testSlice0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0300
     * @tc.desc   Testing slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSlice0003";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c', "d"]);
        let result = blob.slice(1, 2);
        expect(String(result.size)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.name   testSlice0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SLICE_0400
     * @tc.desc   Testing slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      TAG = "testSlice0004";
      try {
        let blob: buffer.Blob = new buffer.Blob(['a', 'b', 'c']);
        let result = blob.slice(1, 2, "Number");
        expect(String(result.size)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} err is ${err}`);
        expect(false).assertFail();
      }
    })
  })
}