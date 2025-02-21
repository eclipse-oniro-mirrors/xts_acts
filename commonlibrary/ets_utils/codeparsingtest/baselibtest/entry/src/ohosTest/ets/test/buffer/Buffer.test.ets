/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

let TAG = "testAlloc0001";

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function BufferTest() {
  describe('bufferTest', () => {

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0100
    * @tc.name       : testAlloc0001
    * @tc.desc       : Testing alloc interface with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0001', 0, () => {
      TAG = "testAlloc0001";
      try {
        let size = 10;
        let buf = buffer.alloc(size);
        expect(buf.length).assertEqual(size);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0200
    * @tc.name       : testAlloc0002
    * @tc.desc       : Testing alloc for buffer with value '4294967296'
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0002', 0, () => {
      TAG = "testAlloc0002";
      try {
        let size = 4294967296;
        let buf = buffer.alloc(size);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    })

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0300
    * @tc.name       : testAlloc0003
    * @tc.desc       : Testing alloc for parameter with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0003', 0, () => {
      TAG = "testAlloc0003";
      try {
        buffer.alloc(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /*
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0400
     * @tc.name       : testAlloc0004
     * @tc.desc       : Testing alloc for parameter with value null.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAlloc0004', 0, () => {
      TAG = "testAlloc0004";
      try {
        buffer.alloc(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0500
    * @tc.name       : testAlloc0005
    * @tc.desc       : Testing alloc for buffer,the second parameter is empty string.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0005', 0, () => {
      TAG = "testAlloc0005";
      try {
        let buf = buffer.alloc(10, ' ');
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0600
    * @tc.name       : testAlloc0006
    * @tc.desc       : Testing alloc for buffer,the second parameter is null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0006', 0, () => {
      TAG = "testAlloc0006";
      try {
        let buf = buffer.alloc(10, null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0700
    * @tc.name       : testAlloc0007
    * @tc.desc       : Testing alloc for buffer,the second parameter is buffer type.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0007', 0, () => {
      TAG = "testAlloc0007";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(10, buf1);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_0900
    * @tc.name       : testAlloc0009
    * @tc.desc       : Testing alloc,the second and third parameter is string and null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0009', 0, () => {
      TAG = "testAlloc0009";
      try {
        let buf = buffer.alloc(10, "ab$#", null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1000
    * @tc.name       : testAlloc0010
    * @tc.desc       : Testing alloc for parameter with value 0.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0010', 0, () => {
      TAG = "testAlloc0010";
      try {
        let buf = buffer.alloc(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1200
    * @tc.name       : testAlloc0012
    * @tc.desc       : Testing alloc for parameter with value (0，bufferOBJ).
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0012', 0, () => {
      TAG = "testAlloc0012";
      try {
        let buf1 = buffer.alloc(10);
        let buf = buffer.alloc(0).fill(buf1);
        let flag = buffer.alloc(0, buf);
        expect(flag.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1300
    * @tc.name       : testAlloc0013
    * @tc.desc       : Testing alloc for buffer with value -5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0013', 0, () => {
      TAG = "testAlloc0013";
      try {
        buffer.alloc(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOC_1400
    * @tc.name       : testAlloc0014
    * @tc.desc       : Testing alloc for buffer with value 5.5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAlloc0014', 0, () => {
      TAG = "testAlloc0014";
      try {
        let buf = buffer.alloc(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0100
    * @tc.name       : testAllocUninitialized0001
    * @tc.desc       : Testing allocUninitialized for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0001', 0, () => {
      TAG = "testAllocUninitialized0001";
      try {
        let buf = buffer.allocUninitialized(10);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0200
    * @tc.name       : testAllocUninitialized0002
    * @tc.desc       : Testing allocUninitialized for buffer with value 0.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0002', 0, () => {
      TAG = "testAllocUninitialized0002";
      try {
        let buf = buffer.allocUninitialized(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : testAllocUninitialized0003
    * @tc.name       : testAllocUninitialized0003
    * @tc.desc       : Testing allocUninitialized for buffer with value -5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0003', 0, () => {
      TAG = "testAllocUninitialized0003";
      try {
        let buf = buffer.allocUninitialized(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0400
    * @tc.name       : testAllocUninitialized0004
    * @tc.desc       : Testing allocUninitialized for buffer with value 5.5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0004', 0, () => {
      TAG = "testAllocUninitialized0004";
      try {
        let buf = buffer.allocUninitialized(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0500
    * @tc.name       : testAllocUninitialized0005
    * @tc.desc       : Testing allocUninitialized for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0005', 0, () => {
      TAG = "testAllocUninitialized0005";
      try {
        let buf = buffer.allocUninitialized(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZED_0600
    * @tc.name       : testAllocUninitialized0006
    * @tc.desc       : Testing allocUninitialized for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitialized0006', 0, () => {
      TAG = "testAllocUninitialized0006";
      try {
        let buf = buffer.allocUninitialized(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0100
    * @tc.name       : testAllocUninitializedFromPool0001
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0001', 0, () => {
      TAG = "testAllocUninitializedFromPool0001";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0200
    * @tc.name       : testAllocUninitializedFromPool0002
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with value 0.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0002', 0, () => {
      TAG = "testAllocUninitializedFromPool0002";
      try {
        let buf = buffer.allocUninitializedFromPool(0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0300
    * @tc.name       : testAllocUninitializedFromPool0003
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with value -5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0003', 0, () => {
      TAG = "testAllocUninitializedFromPool0003";
      try {
        let buf = buffer.allocUninitializedFromPool(-5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0400
    * @tc.name       : testAllocUninitializedFromPool0004
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with value 5.5.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0004', 0, () => {
      TAG = "testAllocUninitializedFromPool0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5.5);
        expect(buf.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0500
    * @tc.name       : testAllocUninitializedFromPool0005
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0005', 0, () => {
      TAG = "testAllocUninitializedFromPool0005";
      try {
        let buf = buffer.allocUninitializedFromPool(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ALLOCUNINITIALIZEDFROMPOOL_0600
    * @tc.name       : testAllocUninitializedFromPool0006
    * @tc.desc       : Testing allocUninitializedFromPool for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testAllocUninitializedFromPool0006', 0, () => {
      TAG = "testAllocUninitializedFromPool0006";
      try {
        let buf = buffer.allocUninitializedFromPool(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0100
    * @tc.name       : testByteLength0001
    * @tc.desc       : Testing byteLength for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0001', 0, () => {
      TAG = "testByteLength0001";
      try {
        let byteLen = buffer.byteLength("abcd");
        expect(byteLen).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0200
    * @tc.name       : testByteLength0002
    * @tc.desc       : Testing byteLength for buffer with value '测试'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0002', 0, () => {
      TAG = "testByteLength0002";
      try {
        let byteLen = buffer.byteLength("测试");
        expect(byteLen).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0300
    * @tc.name       : testByteLength0003
    * @tc.desc       : Testing byteLength for buffer with value '$&@*%'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0003', 0, () => {
      TAG = "testByteLength0003";
      try {
        let byteLen = buffer.byteLength("$&@*%");
        expect(byteLen).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0600
    * @tc.name       : testByteLength0006
    * @tc.desc       : Testing byteLength for buffer with uint8array objects.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0006', 0, () => {
      TAG = "testByteLength0006";
      try {
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let byteLen = buffer.byteLength(uintarr.buffer);
        expect(byteLen).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0700
    * @tc.name       : testByteLength0007
    * @tc.desc       : Testing byteLength for buffer with buffer objects.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0007', 0, () => {
      TAG = "testByteLength0007";
      try {
        let buf1 = buffer.from("abc");
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0800
    * @tc.name       : testByteLength0008
    * @tc.desc       : Testing byteLength for buffer with buffer objects.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0008', 0, () => {
      TAG = "testByteLength0008";
      try {
        let buf1 = buffer.alloc(8);
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_0900
    * @tc.name       : testByteLength0009
    * @tc.desc       : Testing byteLength for buffer with value empty string.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0009', 0, () => {
      TAG = "testByteLength0009";
      try {
        let buf1 = buffer.from("");
        let byteLen = buffer.byteLength(buf1);
        expect(byteLen).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_1000
    * @tc.name       : testByteLength0010
    * @tc.desc       : Testing byteLength for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0010', 0, () => {
      TAG = "testByteLength0010";
      try {
        let byteLen = buffer.byteLength(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BYTELENGTH_1100
    * @tc.name       : testByteLength0011
    * @tc.desc       : Testing byteLength for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testByteLength0011', 0, () => {
      TAG = "testByteLength0011";
      try {
        let byteLen = buffer.byteLength(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0100
    * @tc.name       : testIsBuffer0001
    * @tc.desc       : Testing isBuffer for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0001', 0, () => {
      TAG = "testIsBuffer0001";
      try {
        let buf = buffer.alloc(1);
        let flag = buffer.isBuffer(buf);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0200
    * @tc.name       : testIsBuffer0002
    * @tc.desc       : Testing isBuffer for buffer with object value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0002', 0, () => {
      TAG = "testIsBuffer0002";
      try {
        let obj = new Object(1);
        let flag = buffer.isBuffer(obj);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0300
    * @tc.name       : testIsBuffer0003
    * @tc.desc       : Testing isBuffer for buffer with value '[]'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0003', 0, () => {
      TAG = "testIsBuffer0003";
      try {
        let flag = buffer.isBuffer([]);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0400
    * @tc.name       : testIsBuffer0004
    * @tc.desc       : Testing isBuffer for buffer with value string type.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0004', 0, () => {
      TAG = "testIsBuffer0004";
      try {
        let flag = buffer.isBuffer('ABC');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0500
    * @tc.name       : testIsBuffer0005
    * @tc.desc       : Testing isBuffer for buffer with value empty string.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0005', 0, () => {
      TAG = "testIsBuffer0005";
      try {
        let flag = buffer.isBuffer('');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0600
    * @tc.name       : testIsBuffer0006
    * @tc.desc       : testing alloc for buffer with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0006', 0, () => {
      TAG = "testIsBuffer0006";
      try {
        let flag = buffer.isBuffer(5);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0700
    * @tc.name       : testIsBuffer0007
    * @tc.desc       : Testing isBuffer for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0007', 0, () => {
      TAG = "testIsBuffer0007";
      try {
        let flag = buffer.isBuffer(undefined);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISBUFFER_0800
    * @tc.name       : testIsBuffer0008
    * @tc.desc       : Testing isBuffer for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsBuffer0008', 0, () => {
      TAG = "testIsBuffer0008";
      try {
        let flag = buffer.isBuffer(null);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0100
    * @tc.name       : testIsEncoding0001
    * @tc.desc       : Testing isEncoding for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsEncoding0001', 0, () => {
      TAG = "testIsEncoding0001";
      try {
        let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let flag = buffer.isEncoding(encode);
          expect(flag).assertEqual(true);
        }
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0200
    * @tc.name       : testIsEncoding0002
    * @tc.desc       : Testing isEncoding for buffer with value gbk.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsEncoding0002', 0, () => {
      TAG = "testIsEncoding0002";
      try {
        let flag = buffer.isEncoding('gbk');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0300
    * @tc.name       : testIsEncoding0003
    * @tc.desc       : Testing isEncoding for buffer with value empty string.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsEncoding0003', 0, () => {
      TAG = "testIsEncoding0003";
      try {
        let flag = buffer.isEncoding('');
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0400
    * @tc.name       : testIsEncoding0004
    * @tc.desc       : Testing isEncoding for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsEncoding0004', 0, () => {
      TAG = "testIsEncoding0004";
      try {
        let flag = buffer.isEncoding(undefined);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISCODEING_0500
    * @tc.name       : testIsEncoding0005
    * @tc.desc       : Testing isEncoding for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsEncoding0005', 0, () => {
      TAG = "testIsEncoding0005";
      try {
        let flag = buffer.isEncoding(null);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0100
    * @tc.name       : testStaticCompare0001
    * @tc.desc       : Testing compare with value '1235' and '1236'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0001', 0, () => {
      TAG = "testStaticCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0200
    * @tc.name       : testStaticCompare0002
    * @tc.desc       : Testing compare with value '1236' and '1235'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0002', 0, () => {
      TAG = "testStaticCompare0002";
      try {
        let buf1 = buffer.from("1235");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0300
    * @tc.name       : testStaticCompare0003
    * @tc.desc       : Testing compare with value '测试一' and '测试二'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0003', 0, () => {
      TAG = "testStaticCompare0003";
      try {
        let buf1 = buffer.from("测试一");
        let buf2 = buffer.from("测试二");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0400
    * @tc.name       : testStaticCompare0004
    * @tc.desc       : Testing compare with value '测试$&*' and '测试$&*'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0004', 0, () => {
      TAG = "testStaticCompare0004";
      try {
        let buf1 = buffer.from("测试$&*");
        let buf2 = buffer.from("测试$&*");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0500
    * @tc.name       : testStaticCompare0005
    * @tc.desc       : Testing compare with value '1236' and '1236'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0005', 0, () => {
      TAG = "testStaticCompare0005";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1236");
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0800
    * @tc.name       : testStaticCompare0008
    * @tc.desc       : Testing compare with value undefined and undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0008', 0, () => {
      TAG = "testStaticCompare0008";
      try {
        let res = buffer.compare(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_0900
    * @tc.name       : testStaticCompare0009
    * @tc.desc       : Testing compare with value null and null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0009', 0, () => {
      TAG = "testStaticCompare0009";
      try {
        let res = buffer.compare(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1000
    * @tc.name       : testStaticCompare0010
    * @tc.desc       : Testing compare with value buffer and buffer.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0010', 0, () => {
      TAG = "testStaticCompare0010";
      let buf1 = buffer.from("1");
      let buf2 = buffer.from("abc");
      try {
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STATICCOMPARE_1100
    * @tc.name       : testStaticCompare0011
    * @tc.desc       : Testing compare with value buffer and uint8array type.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStaticCompare0011', 0, () => {
      TAG = "testStaticCompare0011";
      try {
        let buf1 = buffer.from("1abc");
        let uintarr = new Uint8Array(2);
        uintarr[0] = 21;
        uintarr[1] = 31;
        let buf2 = buffer.from(uintarr.buffer);
        let res = buffer.compare(buf1, buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0100
    * @tc.name       : testCompare0001
    * @tc.desc       : Testing compare with value '1236' and '1235'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCompare0001', 0, () => {
      TAG = "testCompare0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_COMPARE_0300
    * @tc.name       : testCompare0003
    * @tc.desc       : Testing compare with value (1236,1235,-1).
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCompare0003', 0, () => {
      TAG = "testCompare0003";
      let buf1 = buffer.from("1236");
      let buf2 = buffer.from("1235");
      try {
        let res = buf1.compare(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0100
    * @tc.name       : testConcat0001
    * @tc.desc       : Testing concat with value '1236, 1235'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConcat0001', 0, () => {
      TAG = "testConcat0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("12361235");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0200
    * @tc.name       : testConcat0002
    * @tc.desc       : Testing concat with value '测试, $&*'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConcat0002', 0, () => {
      TAG = "testConcat0002";
      try {
        let buf1 = buffer.from("测试");
        let buf2 = buffer.from("$&*");
        let buf = buffer.concat([buf1, buf2]);
        let str = buf.toString();
        expect(str).assertEqual("测试$&*");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0400
    * @tc.name       : testConcat0004
    * @tc.desc       : Testing concat with value 'buffer, buffer'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConcat0004', 0, () => {
      TAG = "testConcat0004";
      try {
        let buf1 = buffer.from("123$");
        let buf2 = buffer.from("*35");
        let buf3 = buffer.concat([buf1, buf2]);
        let buf = buffer.alloc(5).fill(buf3);
        let str = buf.toString();
        expect(str).assertEqual("123$*");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0500
    * @tc.name       : testConcat0005
    * @tc.desc       : Testing concat with value 'buffer,-1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testConcat0005', 0, () => {
      TAG = "testConcat0005";
      let buf1 = buffer.from("123$");
      let buf2 = buffer.from("*35");
      try {
        let buf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_CONTACT_0700
     * @tc.name       : testConcat0007
     * @tc.desc       : Testing concat with value 'undefined, undefined'.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConcat0007', 0, () => {
      TAG = "testConcat0007";
      try {
        let buf = buffer.concat(undefined, undefined);
        let str = buf.toString();
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.error(`${TAG} is fail,err is ${err}`);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0100
    * @tc.name       : testTranscode0001
    * @tc.desc       : Testing transcode with value 'buf1, "ascii", "ucs2"'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTranscode0001', 0, () => {
      TAG = "testTranscode0001";
      try {
        let buf1 = buffer.from("1236");
        let buf = buffer.transcode(buf1, "ascii", "ucs2");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0200
    * @tc.name       : testTranscode0002
    * @tc.desc       : Testing transcode with value 'buf1, "utf8", "ucs2"'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTranscode0002', 0, () => {
      TAG = "testTranscode0002";
      try {
        let buf1 = buffer.from("测试");
        let buf = buffer.transcode(buf1, "utf8", "ucs2");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("测试");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0600
    * @tc.name       : testTranscode0006
    * @tc.desc       : Testing transcode with value 'undefined, "utf8", "ascii"'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTranscode0006', 0, () => {
      TAG = "testTranscode0006";
      try {
        let buf = buffer.transcode(undefined, "utf8", "ascii");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TRANSCODE_0700
    * @tc.name       : testTranscode0007
    * @tc.desc       : Testing transcode with value 'null, "utf8", "ascii"'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTranscode0007', 0, () => {
      TAG = "testTranscode0007";
      try {
        let buf = buffer.transcode(null, "utf8", "ascii");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0100
    * @tc.name       : testFill0001
    * @tc.desc       : Testing fill with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFill0001', 0, () => {
      TAG = "testFill0001";
      try {
        let buf = buffer.alloc(3).fill("abc");
        let str = buf.toString();
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0200
    * @tc.name       : testFill0002
    * @tc.desc       : Testing fill with value '('F1刘FG', 0, 10, codeType)'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFill0002', 0, () => {
      TAG = "testFill0002";
      try {
        const buf1 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1f1f1f1f1f1f1f1f1f1");

        let buf2 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ascii');
        str = buf2.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf3 = buffer.alloc(10).fill('F1FG', 0, 10, 'base64');
        str = buf3.toString("hex");
        expect(str).assertEqual("17514617514617514617");

        let buf4 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'binary');
        str = buf4.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf5 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'latin1');
        str = buf5.toString("hex");
        expect(str).assertEqual("46311846474631184647");

        let buf6 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'ucs2');
        str = buf6.toString("hex");
        expect(str).assertEqual("46003100185246004700");

        let buf7 = buffer.alloc(10).fill('F1刘FG', 0, 10, 'utf8');
        str = buf7.toString("hex");
        expect(str).assertEqual("4631e5889846474631e5");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0300
    * @tc.name       : testFill0003
    * @tc.desc       : Testing fill with value '$*$'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFill0003', 0, () => {
      TAG = "testFill0003";
      try {
        let buf = buffer.alloc(3).fill("$*$");
        let str = buf.toString();
        expect(str).assertEqual("$*$");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0400
    * @tc.name       : testFill0004
    * @tc.desc       : Testing fill with value '"$*$", -1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFill0004', 0, () => {
      TAG = "testFill0004";
      try {
        let buf = buffer.alloc(3).fill("$*$", -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FILL_0500
    * @tc.name       : testFill0005
    * @tc.desc       : Testing fill with value '"$*$", 0, 5'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFill0005', 0, () => {
      TAG = "testFill0005";
      try {
        let buf = buffer.alloc(3).fill("$*$", 0, 5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0600
     * @tc.name: testWrite0006
     * @tc.desc: Testing the write interface with a normal value 'abcde' and an out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWrite0006", 0, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0700
     * @tc.name: testWrite0007
     * @tc.desc: Testing the write interface with a normal value 'abcde', a normal 'offset' value of 1, and an out-of-range 'length' value of 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWrite0007", 0, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write("abcde", 1, 9);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_0900
     * @tc.name: testWrite0009
     * @tc.desc: Testing the write interface with normal value ''.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWrite0009", 0, () => {
      TAG = "testWrite0009";
      try {
        let buf = buffer.alloc(0);
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_1000
     * @tc.name: testWrite0010
     * @tc.desc: Testing the write interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWrite0010", 0, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_Write_1100
     * @tc.name: testWrite0011
     * @tc.desc: Testing the write interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWrite0011", 0, () => {
      let buf = buffer.alloc(8);
      try {
        let offset = buf.write(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.name: testWriteBigInt64BE0001
     * @tc.desc: Testing the writeBigInt64BE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64BE0001", 0, () => {
      TAG = "testWriteBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.name: testWriteBigInt64BE0002
     * @tc.desc: Testing the writeBigInt64BE interface with a normal value 0x0102030405060708n and an out-of-range 'offset' value of 1, where 'offset' must be >= 0 and <= 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64BE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0300
     * @tc.name: testWriteBigInt64BE0003
     * @tc.desc: Testing the writeBigInt64BE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64BE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0400
     * @tc.name: testWriteBigInt64BE0004
     * @tc.desc: Testing the writeBigInt64BE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64BE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0100
     * @tc.name: testWriteBigInt64LE0001
     * @tc.desc: Testing the writeBigInt64LE interface with two parameters: 0x0102030405060708n and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64LE0001", 0, () => {
      TAG = "testWriteBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigInt64LE(0x0102030405060708n, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0200
     * @tc.name: testWriteBigInt64LE0002
     * @tc.desc: Testing the writeBigInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64LE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(0x0102030405060708n, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0300
     * @tc.name: testWriteBigInt64LE0003
     * @tc.desc: Testing the writeBigInt64LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64LE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64LE_0400
     * @tc.name: testWriteBigInt64LE0004
     * @tc.desc: Testing the writeBigInt64LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigInt64LE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0100
     * @tc.name: testWriteBigUInt64BE0001
     * @tc.desc: Testing the writeInt16BE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64BE0001", 0, () => {
      TAG = "testWriteBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0200
     * @tc.name: testWriteBigUInt64BE0002
     * @tc.desc: Testing the writeInt16BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64BE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0300
     * @tc.name: testWriteBigUInt64BE0003
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64BE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteBigInt64BE_0400
     * @tc.name: testWriteBigUInt64BE0004
     * @tc.desc: Testing the writeInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64BE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0100
     * @tc.name: testWriteBigUInt64LE0001
     * @tc.desc: Testing the writeBigUInt64LE interface with two parameters: 0xdecafafecacefaden and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64LE0001", 0, () => {
      TAG = "testWriteBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0200
     * @tc.name: testWriteBigUInt64LE0002
     * @tc.desc: Testing the writeBigUInt64LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64LE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0300
     * @tc.name: testWriteBigUInt64LE0003
     * @tc.desc: Testing the writeBigUInt64LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64LE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BigUInt64LE_0400
     * @tc.name: testWriteBigUInt64LE0004
     * @tc.desc: Testing the writeBigUInt64LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteBigUInt64LE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0100
     * @tc.name: testWriteDoubleBE0001
     * @tc.desc: Testing the writeDoubleBE interface with two parameters: 123.456 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleBE0001", 0, () => {
      TAG = "testWriteDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleBE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0200
     * @tc.name: testWriteDoubleBE0002
     * @tc.desc: Testing the writeDoubleBE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleBE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(123.456, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0300
     * @tc.name: testWriteBigInt64BE0003
     * @tc.desc: Testing the writeDoubleBE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleBE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleBE_0400
     * @tc.name: testWriteBigInt64BE0004
     * @tc.desc: Testing the writeDoubleBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleBE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0100
     * @tc.name: testWriteDoubleLE0001
     * @tc.desc: Testing the writeDoubleLE interface with two parameters: 123.456 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleLE0001", 0, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let ref = buf.writeDoubleLE(123.456, 0);
        expect(ref).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0200
     * @tc.name: testWriteDoubleLE0002
     * @tc.desc: Testing the writeDoubleLE interface with a normal value of 123.456 and an out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleLE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(123.456, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0300
     * @tc.name: testWriteDoubleLE0003
     * @tc.desc: Testing the writeDoubleLE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleLE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteDoubleLE_0400
     * @tc.name: testWriteDoubleLE0004
     * @tc.desc: Testing the writeDoubleBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteDoubleLE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0100
     * @tc.name: testWriteFloatBE0001
     * @tc.desc: Testing the writeFloatBE interface with two parameters: 0xcabcbcbc and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatBE0001", 0, () => {
      TAG = "testWriteFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeFloatBE(0xcabcbcbc, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0200
     * @tc.name: testWriteFloatBE0002
     * @tc.desc: Testing the writeFloatBE interface with an out-of-range 'offset' value of 5, where 'offset' must be >= 0 and <= 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatBE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(0xcabcbcbc, 5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0300
     * @tc.name: testWriteFloatBE0003
     * @tc.desc: Testing the writeFloatBE interface with undefined .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatBE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatBE_0400
     * @tc.name: testWriteFloatBE0004
     * @tc.desc: Testing the writeFloatBE interface with null .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatBE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0100
     * @tc.name: testWriteFloatLE0001
     * @tc.desc: Testing the writeFloatLE interface with two parameters: 0xcabcbcbc and 12.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatLE0001", 0, () => {
      TAG = "testWriteFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(16);
        let ref = buf.writeFloatLE(0xcabcbcbc, 12);
        expect(ref).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0200
     * @tc.name: testWriteFloatLE0002
     * @tc.desc: Testing the writeFloatLE interface with a normal value of 0xcabcbcbc and an out-of-range 'offset' value of 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatLE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(0xcabcbcbc, 5);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0300
     * @tc.name: testWriteFloatLE0003
     * @tc.desc: Testing the writeFloatLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatLE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteFloatLE_0400
     * @tc.name: testWriteFloatLE0004
     * @tc.desc: Testing the writeFloatLE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteFloatLE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0100
     * @tc.name: testWriteInt80001
     * @tc.desc: Testing the writeInt8 interface with value to buf at the specified offset.
     *           value must be a valid signed 8-bit integer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt80001", 0, () => {
      TAG = "testWriteInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        let ref = buf.writeInt8(2, 0);
        expect(ref).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0200
     * @tc.name: testWriteInt80002
     * @tc.desc: Testing the writeInt8 interface with value 2 and an out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt80002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(2, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0300
     * @tc.name: testWriteInt80003
     * @tc.desc: Testing the writeInt8 interface with two parameters: 0x13245 and out of range "value" 0
     *           it must be >= -128 and <= 127. Received value is: 78405.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt80003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(0x13245, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0400
     * @tc.name: testWriteInt80004
     * @tc.desc: Testing the writeInt8 interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt80004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt8_0500
     * @tc.name: testWriteInt80005
     * @tc.desc: Testing the writeInt8 interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt80005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0100
     * @tc.name: testWriteInt16BE0001
     * @tc.desc: Testing the writeInt16BE interface with two parameters: 0x7bca and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0001", 0, () => {
      TAG = "testWriteInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16BE(0x7bca, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0200
     * @tc.name: testWriteInt16BE0002
     * @tc.desc: Testing the writeInt16BE interface with out of range "offset" -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0002", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0300
     * @tc.name: testWriteInt16BE0003
     * @tc.desc: Testing the writeInt16BE interface with out of range "value" 0
     *           It must be >= -32768 and <= 32767. Received value is: 1193046.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0003", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x123456, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0400
     * @tc.name: testWriteInt16BE0004
     * @tc.desc: Testing the writeInt16BE interface with out of range "offset" 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0004", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0500
     * @tc.name: testWriteInt16BE0005
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0005", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16BE_0600
     * @tc.name: testWriteInt16BE0006
     * @tc.desc: Testing the writeInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16BE0006", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0100
     * @tc.name: testWriteInt16LE0001
     * @tc.desc: Testing the writeInt16LE interface with two parameters: 0x1234 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0001", 0, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.alloc(2);
        let ref = buf.writeInt16LE(0x1234, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0200
     * @tc.name: testWriteInt16LE0002
     * @tc.desc: Testing the writeInt16LE interface with out-of-range 'offset' value of -1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0002", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x7bca, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0300
     * @tc.name: testWriteInt16LE0003
     * @tc.desc: Testing the writeInt16LE interface with out of range "value" 0
     *           It must be >= -32768 and <= 32767. Received value is: 1193046.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0003", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x123456, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0400
     * @tc.name: testWriteInt16LE0004
     * @tc.desc: Testing the writeInt16LE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0004", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x1234, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0500
     * @tc.name: testWriteInt16LE0005
     * @tc.desc: Testing the writeInt16LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0005", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt16LE_0600
     * @tc.name: testWriteInt16LE0006
     * @tc.desc: Testing the writeInt16LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt16LE0006", 0, () => {
      let buf = buffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0100
     * @tc.name: testWriteInt32BE0001
     * @tc.desc: Testing the writeInt32BE interface with two parameters: 0x12345678 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0001", 0, () => {
      TAG = "testWriteInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32BE(0x12345678, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0200
     * @tc.name: testWriteInt32BE0002
     * @tc.desc: Testing the writeInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0002", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0300
     * @tc.name: testWriteInt32BE0003
     * @tc.desc: Testing the writeInt32BE interface with out of range "value" 0
     *           It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0003", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x123456789, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0400
     * @tc.name: testWriteInt32BE0004
     * @tc.desc: Testing the writeInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0004", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0600
     * @tc.name: testWriteInt32BE0006
     * @tc.desc: Testing the writeInt32BE function with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0006", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32BE_0700
     * @tc.name: testWriteInt32BE0007
     * @tc.desc: Testing the writeInt32BE function with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32BE0007", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0100
     * @tc.name: testWriteInt32LE0001
     * @tc.desc: Testing the writeInt32LE interface with two parameters: 0x12345678 and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0001", 0, () => {
      TAG = "testWriteInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        let ref = buf.writeInt32LE(0x12345678, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0200
     * @tc.name: testWriteInt32LE0002
     * @tc.desc: Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0002", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0300
     * @tc.name: testWriteInt32LE0003
     * @tc.desc: Testing the writeInt32LE interface with out of range "value" 0
     *           It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0003", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x123456789, 0)
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0400
     * @tc.name: testWriteInt32LE0004
     * @tc.desc: Testing the writeInt32LE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0004", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0500
     * @tc.name: testWriteInt32LE0005
     * @tc.desc: Testing the writeInt32LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0005", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteInt32LE_0600
     * @tc.name: testWriteInt32LE0006
     * @tc.desc: Testing the writeInt32LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteInt32LE0006", 0, () => {
      let buf = buffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0100
     * @tc.name: testWriteIntBE0001
     * @tc.desc: Testing the writeIntBE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntBE0001", 0, () => {
      TAG = "testWriteIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0200
     * @tc.name: testWriteIntBE0002
     * @tc.desc: Testing the writeIntBE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntBE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0300
     * @tc.name: testWriteIntBE0003
     * @tc.desc: Testing the writeIntBE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntBE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, -1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0400
     * @tc.name: testWriteIntBE0004
     * @tc.desc: Testing the writeIntBE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntBE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(undefined, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntBE_0500
     * @tc.name: testWriteIntBE0005
     * @tc.desc: Testing the writeIntBE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntBE0005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(null, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0100
     * @tc.name: testWriteIntLE0001
     * @tc.desc: Testing the writeIntLE interface with three parameters: 0x1234567890ab, 0, 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntLE0001", 0, () => {
      TAG = "testWriteIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
        expect(ref).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0200
     * @tc.name: testWriteIntLE0002
     * @tc.desc: Testing the writeIntLE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntLE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0300
     * @tc.name: testWriteIntLE0003
     * @tc.desc: Testing the writeIntLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntLE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(undefined, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteIntLE_0400
     * @tc.name: testWriteIntLE0004
     * @tc.desc: Testing the writeIntLE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteIntLE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(null, 0, 6);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0100
     * @tc.name: testWriteUInt80001
     * @tc.desc: Testing the writeUInt8 interface with two parameters: 0x42 and 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt80001", 0, () => {
      TAG = "testWriteUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 3);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0200
     * @tc.name: testWriteUInt80002
     * @tc.desc: Testing the writeUInt8 interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt80002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(0x42, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0300
     * @tc.name: testWriteUInt80003
     * @tc.desc: Testing the writeUInt8 interface with two parameters: 0x42 and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt80003", 0, () => {
      TAG = "testWriteUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt8(0x42, 1);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0400
     * @tc.name: testWriteUInt80004
     * @tc.desc: Testing the writeUInt8 interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt80004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt8_0500
     * @tc.name: testWriteUInt80005
     * @tc.desc: Testing the writeUInt8 interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt80005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0100
     * @tc.name: testWriteUInt16BE0001
     * @tc.desc: Testing the writeUInt16BE interface with two parameters: 0xdead and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0001", 0, () => {
      TAG = "testWriteUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0200
     * @tc.name: testWriteUInt16BE0002
     * @tc.desc: Testing the writeUInt16BE interface with out-of-range "value"
     *           It must be >= 0 and <= 65535. Received value is: 14593532.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdeadfc, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0300
     * @tc.name: testWriteUInt16BE0003
     * @tc.desc: Testing the writeUInt16BE interface with  out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdead, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0400
     * @tc.name: testWriteUInt16BE0004
     * @tc.desc: Testing the writeUInt16BE interface with two parameters: 0xdead and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0004", 0, () => {
      TAG = "testWriteUInt16BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16BE(0xdead, 1);
        expect(ref).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0500
     * @tc.name: testWriteUInt16BE0005
     * @tc.desc: Testing the writeInt16BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16BE_0600
     * @tc.name: testWriteUInt16BE0006
     * @tc.desc: Testing the writeUInt16BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16BE0006", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0100
     * @tc.name: testWriteUInt16LE0001
     * @tc.desc: Testing the writeUInt16LE interface with two parameters: 0xdead and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0001", 0, () => {
      TAG = "testWriteUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 0);
        expect(ref).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0200
     * @tc.name: testWriteUInt16LE0002
     * @tc.desc: Testing the writeUInt16LE interface with out-of-range "value"
     *           It must be >= 0 and <= 65535. Received value is: 14593532.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdeadfc, 0);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0300
     * @tc.name: testWriteUInt16LE0003
     * @tc.desc: Testing the writeUInt16LE interface with  out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdead, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0400
     * @tc.name: testWriteUInt16LE0004
     * @tc.desc: Testing the writeUInt16LE interface with two parameters: 0xdead and 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0004", 0, () => {
      TAG = "testWriteUInt16LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt16LE(0xdead, 1);
        expect(ref).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0500
     * @tc.name: testWriteUInt16LE0005
     * @tc.desc: Testing the writeUInt16LE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt16LE_0600
     * @tc.name: testWriteUInt16LE0006
     * @tc.desc: Testing the writeUInt16LE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt16LE0006", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0100
     * @tc.name: testWriteUInt32BE0001
     * @tc.desc: Testing the writeUInt32BE interface with two parameters: 0xfeedface and 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt32BE001", 0, () => {
      TAG = "testWriteDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32BE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0200
     * @tc.name: testWriteUInt32BE0002
     * @tc.desc: Testing the writeUInt32BE interface with out-of-range 'offset' value of -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt32BE0002", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0300
     * @tc.name: testWriteUInt32BE0003
     * @tc.desc: Testing the writeUInt32BE interface with out-of-range 'offset' value of 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt32BE0003", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0400
     * @tc.name: testWriteUInt32BE0004
     * @tc.desc: Testing the writeUInt32BE interface with undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt32BE0004", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_WriteUInt32BE_0500
     * @tc.name: testWriteUInt32BE0005
     * @tc.desc: Testing the writeUInt32BE interface with null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testWriteUInt32BE0005", 0, () => {
      let buf = buffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0100
    * @tc.name       : testWriteUInt32LE0001
    * @tc.desc       : Testing writeUInt32LE with value '0xfeedface, 0'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUInt32LE0001', 0, () => {
      TAG = "testWriteUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 0);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0200
    * @tc.name       : testWriteUInt32LE0002
    * @tc.desc       : Testing writeUInt32LE with value '0xfeedface, -1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUInt32LE0002', 0, () => {
      TAG = "testWriteUInt32LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0300
    * @tc.name       : testWriteUInt32LE0003
    * @tc.desc       : Testing writeUInt32LE with value '0xfeedface, 1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUInt32LE0003', 0, () => {
      TAG = "testWriteUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(0xfeedface, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0400
    * @tc.name       : testWriteUInt32LE0004
    * @tc.desc       : Testing writeUInt32LE with value 'undefined'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUInt32LE0004', 0, () => {
      TAG = "testWriteUInt32LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINT32LE_0500
    * @tc.name       : testWriteUInt32LE0005
    * @tc.desc       : Testing writeUInt32LE with value 'null'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUInt32LE0005', 0, () => {
      TAG = "testWriteUInt32LE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUInt32LE(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0100
    * @tc.name       : testWriteUIntBE0001
    * @tc.desc       : Testing writeUIntBE with value '0x13141516, 0, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0001', 0, () => {
      TAG = "testWriteUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 4);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0200
    * @tc.name       : testWriteUIntBE0002
    * @tc.desc       : Testing writeUIntBE with value '0x13141516, 0, 1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0002', 0, () => {
      TAG = "testWriteUIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 0, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0300
    * @tc.name       : testWriteUIntBE0003
    * @tc.desc       : Testing writeUIntBE with value '0x13141516, 1, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0003', 0, () => {
      TAG = "testWriteUIntBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0400
    * @tc.name       : testWriteUIntBE0004
    * @tc.desc       : Testing writeUIntBE with value '0x13141516, 1, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0004', 0, () => {
      TAG = "testWriteUIntBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
        expect(ref).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0500
    * @tc.name       : testWriteUIntBE0005
    * @tc.desc       : Testing writeUIntBE with value 'undefined, 1, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0005', 0, () => {
      TAG = "testWriteUIntBE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(undefined, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTBE_0600
    * @tc.name       : testWriteUIntBE0006
    * @tc.desc       : Testing writeUIntBE with value 'null, 1, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntBE0006', 0, () => {
      TAG = "testWriteUIntBE0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntBE(null, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0100
    * @tc.name       : testWriteUIntLE0001
    * @tc.desc       : Testing writeUIntLE with value '0x13141516, 0, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0001', 0, () => {
      TAG = "testWriteUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 4);
        expect(ref).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0200
    * @tc.name       : testWriteUIntLE0002
    * @tc.desc       : Testing writeUIntLE with value '0x13141516, 0, 1'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0002', 0, () => {
      TAG = "testWriteUIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 0, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0300
    * @tc.name       : testWriteUIntLE0003
    * @tc.desc       : Testing writeUIntLE with value '0x13141516, 1, 4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0003', 0, () => {
      TAG = "testWriteUIntLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0400
    * @tc.name       : testWriteUIntLE0004
    * @tc.desc       : Testing writeUIntLE with value 'buffer.allocUninitializedFromPool(5),1,4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0004', 0, () => {
      TAG = "testWriteUIntLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(5);
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
        expect(ref).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0500
    * @tc.name       : testWriteUIntLE0005
    * @tc.desc       : Testing writeUIntLE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0005', 0, () => {
      TAG = "testWriteUIntLE0005";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(undefined, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEUINTLE_0600
    * @tc.name       : testWriteUIntLE0006
    * @tc.desc       : Testing writeUIntLE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWriteUIntLE0006', 0, () => {
      TAG = "testWriteUIntLE0006";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let ref = buf.writeUIntLE(null, 1, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0100
    * @tc.name       : testReadBigInt64BE0001
    * @tc.desc       : Testing readBigInt64BE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64BE0001', 0, () => {
      TAG = "testReadBigInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64BE(0).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0200
    * @tc.name       : testReadBigInt64BE0002
    * @tc.desc       : Testing readBigInt64BE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64BE0002', 0, () => {
      TAG = "testReadBigInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0300
    * @tc.name       : testReadBigInt64BE0003
    * @tc.desc       : Testing readBigInt64BE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64BE0003', 0, () => {
      TAG = "testReadBigInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64BE(undefined).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64BE_0400
    * @tc.name       : testReadBigInt64BE0004
    * @tc.desc       : Testing readBigInt64BE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64BE0004', 0, () => {
      TAG = "testReadBigInt64BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64BE(null).toString(16);
        expect(ref).assertEqual("102030405060708");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0100
    * @tc.name       : testReadBigInt64LE0001
    * @tc.desc       : Testing readBigInt64LE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64LE0001', 0, () => {
      TAG = "testReadBigInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64LE(0).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0200
    * @tc.name       : testReadBigInt64LE0002
    * @tc.desc       : Testing readBigInt64LE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64LE0002', 0, () => {
      TAG = "testReadBigInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n, 0);
        let ref = buf.readBigInt64LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0300
    * @tc.name       : testReadBigInt64LE0003
    * @tc.desc       : Testing readBigInt64LE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64LE0003', 0, () => {
      TAG = "testReadBigInt64LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64LE(undefined).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGINT64LE_0400
    * @tc.name       : testReadBigInt64LE0004
    * @tc.desc       : Testing readBigInt64LE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigInt64LE0004', 0, () => {
      TAG = "testReadBigInt64LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64BE(0x0102030405060708n);
        let ref = buf.readBigInt64LE(null).toString(16);
        expect(ref).assertEqual("807060504030201");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0100
    * @tc.name       : testReadBigUInt64BE0001
    * @tc.desc       : Testing readBigUInt64BE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64BE0001', 0, () => {
      TAG = "testReadBigUInt64BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(0).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0200
    * @tc.name       : testReadBigUInt64BE0002
    * @tc.desc       : Testing readBigUInt64BE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64BE0002', 0, () => {
      TAG = "testReadBigUInt64BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0300
    * @tc.name       : testReadBigUInt64BE0003
    * @tc.desc       : Testing readBigUInt64BE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64BE0003', 0, () => {
      TAG = "testReadBigUInt64BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(undefined).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_WRITEBIGUINT64BE_0400
    * @tc.name       : testReadBigUInt64BE0004
    * @tc.desc       : Testing readBigUInt64BE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64BE0004', 0, () => {
      TAG = "testReadBigUInt64BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64BE(null).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0100
    * @tc.name       : testReadBigUInt64LE0001
    * @tc.desc       : Testing readBigUInt64LE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64LE0001', 0, () => {
      TAG = "testReadBigUInt64LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(0).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0200
    * @tc.name       : testReadBigUInt64LE0002
    * @tc.desc       : Testing readBigUInt64LE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64LE0002', 0, () => {
      TAG = "testReadBigUInt64LE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0300
    * @tc.name       : testReadBigUInt64BE0003
    * @tc.desc       : Testing readBigUInt64LE for buffer with undefined value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64LE0003', 0, () => {
      TAG = "testReadBigUInt64LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(undefined).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READBIGUINT64LE_0400
    * @tc.name       : testReadBigUInt64LE0004
    * @tc.desc       : Testing readBigUInt64LE for buffer with null value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadBigUInt64LE0004', 0, () => {
      TAG = "testReadBigUInt64LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
        let ref = buf.readBigUInt64LE(null).toString(16);
        expect(ref).assertEqual("decafafecacefade");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0100
    * @tc.name       : testReadDoubleBE0001
    * @tc.desc       : Testing readDoubleBE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleBE0001', 0, () => {
      TAG = "testReadDoubleBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE();
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0200
    * @tc.name       : testReadDoubleBE0002
    * @tc.desc       : Testing readDoubleBE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleBE0002', 0, () => {
      TAG = "testReadDoubleBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0300
    * @tc.name       : testReadDoubleBE0003
    * @tc.desc       : Testing readDoubleBE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleBE0003', 0, () => {
      TAG = "testReadDoubleBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(undefined);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLEBE_0400
    * @tc.name       : testReadDoubleBE0004
    * @tc.desc       : Testing readDoubleBE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleBE0004', 0, () => {
      TAG = "testReadDoubleBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        let ref = buf.readDoubleBE(null);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0100
    * @tc.name       : testReadDoubleLE0001
    * @tc.desc       : Testing readDoubleLE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleLE0001', 0, () => {
      TAG = "testReadDoubleLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE();
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0200
    * @tc.name       : testReadDoubleLE0002
    * @tc.desc       : Testing readDoubleLE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleLE0002', 0, () => {
      TAG = "testReadDoubleLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0300
    * @tc.name       : testReadDoubleLE0003
    * @tc.desc       : Testing readDoubleLE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleLE0003', 0, () => {
      TAG = "testReadDoubleLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(undefined);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READDOUBLELE_0400
    * @tc.name       : testReadDoubleLE0004
    * @tc.desc       : Testing readDoubleLE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadDoubleLE0004', 0, () => {
      TAG = "testReadDoubleLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(123.456, 0);
        let ref = buf.readDoubleLE(null);
        expect(ref).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0100
    * @tc.name       : testReadFloatBE0001
    * @tc.desc       : Testing readFloatBE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatBE0001', 0, () => {
      TAG = "testReadFloatBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(0).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0200
    * @tc.name       : testReadFloatBE0002
    * @tc.desc       : Testing readFloatBE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatBE0002', 0, () => {
      TAG = "testReadFloatBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0300
    * @tc.name       : testReadFloatBE0003
    * @tc.desc       : Testing readFloatBE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatBE0003', 0, () => {
      TAG = "testReadFloatBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(undefined).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATBE_0400
    * @tc.name       : testReadFloatBE0004
    * @tc.desc       : Testing readFloatBE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatBE0004', 0, () => {
      TAG = "testReadFloatBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatBE(0xcabcbcbc, 0);
        let ref = buf.readFloatBE(null).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0100
    * @tc.name       : testReadFloatLE0001
    * @tc.desc       : Testing readFloatLE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatLE0001', 0, () => {
      TAG = "testReadFloatLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(0).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0200
    * @tc.name       : testReadFloatLE0002
    * @tc.desc       : Testing readFloatLE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatLE0002', 0, () => {
      TAG = "testReadFloatLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0300
    * @tc.name       : testReadFloatLE0003
    * @tc.desc       : Testing readFloatLE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatLE0003', 0, () => {
      TAG = "testReadFloatLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(undefined).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READFLOATLE_0400
    * @tc.name       : testReadFloatLE0004
    * @tc.desc       : Testing readFloatLE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadFloatLE0004', 0, () => {
      TAG = "testReadFloatLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeFloatLE(0xcabcbcbc, 0);
        let ref = buf.readFloatLE(null).toString(16);
        expect(ref).assertEqual("cabcbd00");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT_0100
    * @tc.name       : testReadInt80001
    * @tc.desc       : Testing readInt8 for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt80001', 0, () => {
      TAG = "testReadInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(0).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT_0200
    * @tc.name       : testReadInt80002
    * @tc.desc       : Testing readInt8 for buffer with value 2.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt80002', 0, () => {
      TAG = "testReadInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(2).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT_0300
    * @tc.name       : testReadInt80003
    * @tc.desc       : Testing readInt8 for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt80003', 0, () => {
      TAG = "testReadInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(undefined).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT_0400
    * @tc.name       : testReadInt80004
    * @tc.desc       : Testing readInt8 for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt80004', 0, () => {
      TAG = "testReadInt80004";
      try {
        let buf = buffer.allocUninitializedFromPool(2);
        buf.writeInt8(0x12);
        let ref = buf.readInt8(null).toString(16);
        expect(ref).assertEqual("12");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0100
    * @tc.name       : testReadInt16BE0001
    * @tc.desc       : Testing readInt16BE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16BE0001', 0, () => {
      TAG = "testReadInt16BE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0200
    * @tc.name       : testReadInt16BE0002
    * @tc.desc       : Testing readInt16BE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16BE0002', 0, () => {
      TAG = "testReadInt16BE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0300
    * @tc.name       : testReadInt16BE0003
    * @tc.desc       : Testing readInt16BE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16BE0003', 0, () => {
      TAG = "testReadInt16BE0003";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16BE_0400
    * @tc.name       : testReadInt16BE0004
    * @tc.desc       : Testing readInt16BE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16BE0004', 0, () => {
      TAG = "testReadInt16BE0004";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16BE(0x1234, 0);
        let ref = buf.readInt16BE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0100
    * @tc.name       : testReadInt16LE0001
    * @tc.desc       : Testing readInt16LE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16LE0001', 0, () => {
      TAG = "testReadInt16LE0001";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0200
    * @tc.name       : testReadInt16LE0002
    * @tc.desc       : Testing readInt16LE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16LE0002', 0, () => {
      TAG = "testReadInt16LE0002";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0300
    * @tc.name       : testReadInt16LE0003
    * @tc.desc       : Testing readInt16LE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16LE0003', 0, () => {
      TAG = "testReadInt16LE0003";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT16LE_0400
    * @tc.name       : testReadInt16LE0004
    * @tc.desc       : Testing readInt16LE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt16LE0004', 0, () => {
      TAG = "testReadInt16LE0004";
      try {
        let buf = buffer.alloc(2);
        buf.writeInt16LE(0x1234, 0);
        let ref = buf.readInt16LE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0100
    * @tc.name       : testReadInt32BE0001
    * @tc.desc       : Testing readInt32BE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32BE0001', 0, () => {
      TAG = "testReadInt32BE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0200
    * @tc.name       : testReadInt32BE0002
    * @tc.desc       : Testing readInt32BE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32BE0002', 0, () => {
      TAG = "testReadInt32BE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0400
    * @tc.name       : testReadInt32BE0004
    * @tc.desc       : Testing readInt32BE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32BE0004', 0, () => {
      TAG = "testReadInt32BE0004";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32BE_0500
    * @tc.name       : testReadInt32BE0005
    * @tc.desc       : Testing readInt32BE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32BE0005', 0, () => {
      TAG = "testReadInt32BE0005";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32BE(0x12345678, 0);
        let ref = buf.readInt32BE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0100
    * @tc.name       : testReadInt32LE0001
    * @tc.desc       : Testing readInt32LE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32LE0001', 0, () => {
      TAG = "testReadInt32LE0001";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0200
    * @tc.name       : testReadInt32LE0002
    * @tc.desc       : Testing readInt32LE for buffer with value 1.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32LE0002', 0, () => {
      TAG = "testReadInt32LE0002";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0300
    * @tc.name       : testReadInt32LE0003
    * @tc.desc       : Testing readInt32LE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32LE0003', 0, () => {
      TAG = "testReadInt32LE0003";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINT32LE_0400
    * @tc.name       : testReadInt32LE0004
    * @tc.desc       : Testing readInt32LE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadInt32LE0004', 0, () => {
      TAG = "testReadInt32LE0004";
      try {
        let buf = buffer.alloc(4);
        buf.writeInt32LE(0x12345678, 0);
        let ref = buf.readInt32LE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0100
    * @tc.name       : testReadIntBE0001
    * @tc.desc       : Testing readIntBE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntBE0001', 0, () => {
      TAG = "testReadIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(0, 5).toString(16);
        expect(ref).assertEqual("1234567890");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0200
    * @tc.name       : testReadIntBE0002
    * @tc.desc       : Testing readIntBE for buffer with value '(2, 5)'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntBE0002', 0, () => {
      TAG = "testReadIntBE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(2, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0300
    * @tc.name       : testReadIntBE0003
    * @tc.desc       : Testing readIntBE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntBE0003', 0, () => {
      TAG = "testReadIntBE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(undefined, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTBE_0400
    * @tc.name       : testReadIntBE0004
    * @tc.desc       : Testing readIntBE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntBE0004', 0, () => {
      TAG = "testReadIntBE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntBE(0x123456789011, 0, 6);
        let ref = buf.readIntBE(null, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0100
    * @tc.name       : testReadIntLE0001
    * @tc.desc       : Testing readIntLE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntLE0001', 0, () => {
      TAG = "testReadIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(0, 5).toString(16);
        expect(ref).assertEqual("3456789011");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0200
    * @tc.name       : testReadIntLE0002
    * @tc.desc       : Testing readIntLE for buffer with value '(2, 5)'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntLE0002', 0, () => {
      TAG = "testReadIntLE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(2, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0300
    * @tc.name       : testReadIntLE0003
    * @tc.desc       : Testing readIntLE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntLE0003', 0, () => {
      TAG = "testReadIntLE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(undefined, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READINTLE_0400
    * @tc.name       : testReadIntLE0004
    * @tc.desc       : Testing readIntLE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadIntLE0004', 0, () => {
      TAG = "testReadIntLE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(6);
        buf.writeIntLE(0x123456789011, 0, 6);
        let ref = buf.readIntLE(null, 5).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0100
    * @tc.name       : testReadIntLE0001
    * @tc.desc       : Testing readUInt8 for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt80001', 0, () => {
      TAG = "testReadUInt80001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(0).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0200
    * @tc.name       : testReadIntLE0002
    * @tc.desc       : Testing readUInt8 for buffer with value '4'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt80002', 0, () => {
      TAG = "testReadUInt80002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(4).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0300
    * @tc.name       : testReadIntLE0003
    * @tc.desc       : Testing readUInt8 for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt80003', 0, () => {
      TAG = "testReadUInt80003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(undefined).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT8_0400
    * @tc.name       : testReadIntLE0004
    * @tc.desc       : Testing readUInt8 for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt80004', 0, () => {
      TAG = "testReadUInt80004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0x42);
        let ref = buf.readUInt8(null).toString(16);
        expect(ref).assertEqual("42");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0100
    * @tc.name       : testReadUInt16BE0001
    * @tc.desc       : Testing readUInt16BE for buffer with normal value.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt16BE0001', 0, () => {
      TAG = "testReadUInt16BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0200
    * @tc.name       : testReadUInt16BE0002
    * @tc.desc       : Testing readUInt16BE for buffer with value '3'.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt16BE0002', 0, () => {
      TAG = "testReadUInt16BE0002";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0300
    * @tc.name       : testReadUInt16BE0003
    * @tc.desc       : Testing readUInt16BE for buffer with value undefined.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt16BE0003', 0, () => {
      TAG = "testReadUInt16BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /*
    * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_READUINT16BE_0400
    * @tc.name       : testReadUInt16BE0004
    * @tc.desc       : Testing readUInt16BE for buffer with value null.
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testReadUInt16BE0004', 0, () => {
      TAG = "testReadUInt16BE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x1234, 0);
        let ref = buf.readUInt16BE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0100
     * @tc.name: testEquals0001
     * @tc.desc: Test the equals interface by two identical buffers which content is numerical string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testEquals0001", 0, () => {
      TAG = "testEquals0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0200
     * @tc.name: testEquals0002
     * @tc.desc: Test the equals interface by two identical buffers which content is include chinese string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEquals0002", 0, () => {
      TAG = "testEquals0002";
      try {
        let buf1 = buffer.from("1236测试");
        let buf2 = buffer.from("1236测试");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0300
     * @tc.name: testEquals0003
     * @tc.desc: Test the equals interface by two different buffers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEquals0003", 0, () => {
      TAG = "testEquals0003";
      try {
        let buf1 = buffer.from("O@O");
        let buf2 = buffer.from("O^O");
        let res = buf1.equals(buf2);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0400
     * @tc.name: testEquals0004
     * @tc.desc: Test the equals interface by passing the parameter undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEquals0004", 0, () => {
      TAG = "testEquals0004";
      let buf = buffer.from("test");
      try {
        buf.equals(undefined);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0500
     * @tc.name: testEquals0005
     * @tc.desc: Test the equals interface by passing the parameter null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEquals0005", 0, () => {
      TAG = "testEquals0005";
      let buf = buffer.from("test");
      try {
        buf.equals(null);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_EQUALS_0600
     * @tc.name: testEquals0006
     * @tc.desc: Test the equals interface by two different type buffers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEquals0006", 0, () => {
      TAG = "testEquals0006"
      let buf = buffer.from("ABC");
      try {
        let res = buf.equals(new Uint8Array([21, 31]));
        expect(res).assertFalse()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0100
     * @tc.name: testSubarray0001
     * @tc.desc: Test the subarray interface by pass the parameter start is 0 and end is 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0001", 0, () => {
      TAG = "testSubarray0001";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(0, 3);
        let str = subBuf.toString();
        expect(str).assertEqual("123");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0200
     * @tc.name: testSubarray0002
     * @tc.desc: Test the subarray interface by pass the parameter undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0002", 0, () => {
      TAG = "testSubarray0002";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(undefined);
        let str = subBuf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0300
     * @tc.name: testSubarray0003
     * @tc.desc: Test the subarray interface by pass the parameter null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0003", 0, () => {
      TAG = "testSubarray0003";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(null);
        let str = subBuf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0400
     * @tc.name: testSubarray0004
     * @tc.desc: Test the subarray interface by pass the parameter start is 3 and end is 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0004", 0, () => {
      TAG = "testSubarray0004";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(3, 4);
        let str = buf.toString();
        expect(str).assertEqual("6");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0500
     * @tc.name: testSubarray0005
     * @tc.desc: Test the subarray interface by pass the parameter start is -3 and end is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0005", 0, () => {
      TAG = "testSubarray0005";
      try {
        let buf1 = buffer.from("1236");
        let buf = buf1.subarray(-3, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SUBARRAR_0600
     * @tc.name: testSubarray0006
     * @tc.desc: Test the subarray interface by pass the parameter start is 6 and end is 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSubarray0006", 0, () => {
      TAG = "testSubarray0006";
      try {
        let buf = buffer.from("1236");
        let subBuf = buf.subarray(6, 9);
        expect(subBuf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0100
     * @tc.name: testCopy0001
     * @tc.desc: Test the copy interface by copying one buffer of numeric string type  to other buffer of numeric
     *           string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0001", 0, () => {
      TAG = "testCopy0001";
      try {
        let buf1 = buffer.from("1236");
        let buf2 = buffer.from("1235");
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0200
     * @tc.name: testCopy0002
     * @tc.desc: Test the copy interface by copying one buffer of chinese string type  to other buffer of numeric
     *           string type,and setting the parameter targetStart to 2,sourceStart to 1,sourceStart to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0002", 0, () => {
      TAG = "testCopy0002";
      try {
        let buf1 = buffer.from("abcdefg");
        let buf2 = buffer.from("1235789");
        let num = buf1.copy(buf2, 2, 1, 3);
        expect(num).assertEqual(2);
        let str = buf2.toString();
        expect(str).assertEqual("12bc789");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
      ;
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0300
     * @tc.name: testCopy0003
     * @tc.desc: Test the copy interface by copying one buffer of special string type  to other buffer of empty
     *           string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0003", 0, () => {
      TAG = "testCopy0003";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0400
     * @tc.name: testCopy0004
     * @tc.desc: Test the copy interface by copying one buffer which length is large than another to other buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0004", 0, () => {
      TAG = "testCopy0004";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = buffer.from("1235");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0500
     * @tc.name: testCopy0005
     * @tc.desc: Test the copy interface by copying one buffer to other buffer,and passing the parameter sourceStart
     *           to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0005", 0, () => {
      TAG = "testCopy0005";
      let buf1 = buffer.from("123656");
      let buf2 = buffer.from("1235");
      try {
        buf1.copy(buf2, -1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0600
     * @tc.name: testCopy0006
     * @tc.desc: Test the copy interface by copying one buffer which length is smaller than another to other buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0006", 0, () => {
      TAG = "testCopy0006";
      try {
        let buf1 = buffer.from("ab$#");
        let buf2 = buffer.from("123556");
        let num = buf1.copy(buf2);
        expect(num).assertEqual(4);
        let str = buf2.toString();
        expect(str).assertEqual("ab$#56");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0700
     * @tc.name: testCopy0007
     * @tc.desc: Test the copy interface by passing the parameter target undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0007", 0, () => {
      TAG = "testCopy0007";
      try {
        let buf = buffer.from("12356");
        buf.copy(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0800
     * @tc.name: testCopy0008
     * @tc.desc: Test the copy interface by passing the parameter target null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0008", 0, () => {
      TAG = "testCopy0008";
      try {
        let buf = buffer.from("12356");
        buf.copy(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_COPY_0900
     * @tc.name: testCopy0009
     * @tc.desc: Test the copy interface by copying one buffer of string type to other buffer of array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testCopy0009", 0, () => {
      TAG = "testCopy0009";
      try {
        let buf1 = buffer.from("123656");
        let buf2 = new Uint8Array([21, 31]);
        let num = buf1.copy(buf2);
        expect(num).assertEqual(2);
        let str = '';
        for (const codePoint of buf2) {
          str += String.fromCharCode(codePoint);
        }
        expect(str).assertEqual("12")
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0100
     * @tc.name: testToString0001
     * @tc.desc: Test the toString interface by source buffer of numerical string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0001", 0, () => {
      TAG = "testToString0001";
      try {
        let buf = buffer.from("1236");
        let str = buf.toString();
        expect(str).assertEqual("1236");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0200
     * @tc.name: testToString0002
     * @tc.desc: Test the toString interface by source buffer of chinese string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0002", 0, () => {
      TAG = "testToString0002";
      try {
        let buf = buffer.from("张三");
        let str = buf.toString();
        expect(str).assertEqual("张三");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0300
     * @tc.name: testToString0003
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0003", 0, () => {
      TAG = "testToString0003";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0400
     * @tc.name: testToString0004
     * @tc.desc: Test the toString interface by passing the parameter encoding to "ascii".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0004", 0, () => {
      TAG = "testToString0004";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ascii");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0500
     * @tc.name: testToString0005
     * @tc.desc: Test the toString interface by passing the parameter encoding to "base64".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0005", 0, () => {
      TAG = "testToString0005";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("base64");
        expect(str).assertEqual("YWJj");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0600
     * @tc.name: testToString0006
     * @tc.desc: Test the toString interface by passing the parameter encoding to "hex".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0006", 0, () => {
      TAG = "testToString0006";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("hex");
        expect(str).assertEqual("616263");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0700
     * @tc.name: testToString0007
     * @tc.desc: Test the toString interface by passing the parameter encoding to "latin1".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0007", 0, () => {
      TAG = "testToString0007";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("latin1");
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0800
     * @tc.name: testToString0008
     * @tc.desc: Test the toString interface by passing the parameter encoding to "ucs2".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0008", 0, () => {
      TAG = "testToString0008";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("ucs2");
        expect(str).assertEqual("扡");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_0900
     * @tc.name: testToString0009
     * @tc.desc: Test the toString interface by passing the parameter encoding to "utf16le".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0009", 0, () => {
      TAG = "testToString0009";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("utf16le");
        expect(str).assertEqual("扡");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1000
     * @tc.name: testToString0010
     * @tc.desc: Test the toString interface by source buffer of special string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0010", 0, () => {
      TAG = "testToString0010";
      try {
        let buf = buffer.from("!@#$%^&*");
        let str = buf.toString();
        expect(str).assertEqual("!@#$%^&*");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1100
     * @tc.name: testToString0011
     * @tc.desc: Test the toString interface by source buffer of long string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0011", 0, () => {
      TAG = "testToString0011";
      try {
        let str =
          "abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîï" +
            "ðñòóôõö÷øùúûüýþÿ"
        let strbuf = buffer.from(str, "latin1");
        let toStr = strbuf.toString("latin1");
        expect(toStr)
          .assertEqual("abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëì" +
            "íîïðñòóôõö÷øùúûüýþÿ");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1200
     * @tc.name: testToString0012
     * @tc.desc: Test the toString interface by passing the parameter encoding to illegal value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0012", 0, () => {
      TAG = "testToString0012"
      let buf = buffer.from("abc");
      try {
        buf.toString("code");
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1300
     * @tc.name: testToString0013
     * @tc.desc: Test the toString interface by passing the parameter encoding to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0013", 0, () => {
      TAG = "testToString0013";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString(undefined);
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1500
     * @tc.name: testToString0014
     * @tc.desc: Test the toString interface by passing the parameter encoding to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0014", 0, () => {
      TAG = "testToString0014";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString(null);
        expect(str).assertEqual("abc");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1500
     * @tc.name: testToString0015
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0015", 0, () => {
      TAG = "testToString0015";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, 2);
        expect(str).assertEqual("b");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1600
     * @tc.name: testToString0016
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to -1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0016", 0, () => {
      TAG = "testToString0016";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", -1, 2);
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOSTRING_1700
     * @tc.name: testToString0017
     * @tc.desc: Test the toString interface by passing the parameter encoding to "binary", start to 1, and end to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToString0017", 0, () => {
      TAG = "testToString0017";
      try {
        let buf = buffer.from("abc");
        let str = buf.toString("binary", 1, -2);
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_TOJSON_0100
     * @tc.name: testToJSON0001
     * @tc.desc: Test the toJSON interface source buffer of numerical string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testToJSON0001", 0, () => {
      TAG = "testToJSON0001";
      try {
        let buf = buffer.from("1236");
        let obj = buf.toJSON();
        expect(JSON.parse(JSON.stringify(obj)).data.join("")).assertEqual("49505154");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0100
     * @tc.name: testIndexOf0001
     * @tc.desc: Test the indexOf interface by passing the parameter value to a character string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0001", 0, () => {
      TAG = "testIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3");
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0200
     * @tc.name: testIndexOf0002
     * @tc.desc: Test the indexOf interface by passing the parameter value to a character string, and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0002", 0, () => {
      TAG = "testIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("3", 2);
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0300
     * @tc.name: testIndexOf0003
     * @tc.desc: Test the indexOf interface by passing the parameter value to two character string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0003", 0, () => {
      TAG = "testIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23");
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0400
     * @tc.name: testIndexOf0004
     * @tc.desc: Test the indexOf interface by passing the parameter value to special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0004", 0, () => {
      TAG = "testIndexOf0004";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let index = buf.indexOf("@");
        expect(index).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0500
     * @tc.name: testIndexOf0005
     * @tc.desc: Test the indexOf interface by passing the parameter value to two character string, and byteOffset to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0005", 0, () => {
      TAG = "testIndexOf0005";
      try {
        let buf = buffer.from("13236235");
        let index = buf.indexOf("23", 3);
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0600
     * @tc.name: testIndexOf0006
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0006", 0, () => {
      TAG = "testIndexOf0006";
      try {
        let buf = buffer.from("13236");
        let index = buf.indexOf("a");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0700
     * @tc.name: testIndexOf0007
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * encode is "BufferEncoding".
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0007", 0, () => {
      TAG = "testIndexOf0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.indexOf("ab", 0, encode);
          expect(index).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0800
     * @tc.name: testIndexOf0008
     * @tc.desc: Test the indexOf interface by passing the parameter value to empty string,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0008", 0, () => {
      TAG = "testIndexOf0008";
      try {
        let buf = buffer.from("123");
        let index = buf.indexOf("");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_0900
     * @tc.name: testIndexOf0009
     * @tc.desc: Test the indexOf interface by passing the parameter value to one space string,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0009", 0, () => {
      TAG = "testIndexOf0009";
      try {
        let buf = buffer.from("123 ");
        let index = buf.indexOf(" ");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_1000
     * @tc.name: testIndexOf0010
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0010", 0, () => {
      TAG = "testIndexOf0010"
      let buf = buffer.from("123");
      try {
        buf.indexOf(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INDEXOF_1100
     * @tc.name: testIndexOf0011
     * @tc.desc: Test the indexOf interface by passing the parameter value to null,
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIndexOf0011", 0, () => {
      TAG = "testIndexOf0011"
      let buf = buffer.from("123");
      try {
        buf.indexOf(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0100
     * @tc.name: testLastIndexOf0001
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0001", 0, () => {
      TAG = "testLastIndexOf0001";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0200
     * @tc.name: testLastIndexOf0002
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to a character string which is in the buffer
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0002", 0, () => {
      TAG = "testLastIndexOf0002";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("3", 2);
        expect(index).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0300
     * @tc.name: testLastIndexOf0003
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0003", 0, () => {
      TAG = "testLastIndexOf0003";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23");
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0400
     * @tc.name: testLastIndexOf0004
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value to two character string which is in the buffer
     * and byteOffset to 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0004", 0, () => {
      TAG = "testLastIndexOf0004";
      try {
        let buf = buffer.from("13236235");
        let index = buf.lastIndexOf("23", 3);
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0500
     * @tc.name: testLastIndexOf0005
     * @tc.desc: Test the lastIndexOf interface by passing the parameter value which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0005", 0, () => {
      TAG = "testLastIndexOf0005";
      try {
        let buf = buffer.from("13236");
        let index = buf.lastIndexOf("a");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0600
     * @tc.name: testLastIndexOf0006
     * @tc.desc: Test the indexOf interface by passing the parameter value which is not in the buffer,and byteOffset to 0,
     * and encode to "BufferEncoding"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0006", 0, () => {
      TAG = "testLastIndexOf0006";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        let buf = buffer.from("13236");
        for (const encode of encodeArr) {
          let index = buf.lastIndexOf("ab", 0, encode);
          expect(index).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0700
     * @tc.name: testLastIndexOf0007
     * @tc.desc: Test the indexOf interface by passing the parameter value to empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0007", 0, () => {
      TAG = "testLastIndexOf0007"
      let buf = buffer.from("123");
      try {
        let index = buf.lastIndexOf("");
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0800
     * @tc.name: testLastIndexOf0008
     * @tc.desc: Test the indexOf interface by passing the parameter value to space string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0008", 0, () => {
      TAG = "testLastIndexOf0008"
      let buf = buffer.from("123 ");
      try {
        let index = buf.lastIndexOf(" ");
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0900
     * @tc.name: testLastIndexOf0009
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0009", 0, () => {
      TAG = "testLastIndexOf0009";
      let buf = buffer.from("123 ");
      try {
        buf.lastIndexOf(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1000
     * @tc.name: testLastIndexOf0010
     * @tc.desc: Test the indexOf interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0010", 0, () => {
      TAG = "testLastIndexOf0010";
      let buf = buffer.from("123 ");
      try {
        buf.lastIndexOf(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1300
     * @tc.name: testLastIndexOf0013
     * @tc.desc: Test the indexOf interface by passing the parameter offset to abnormal value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testLastIndexOf0013", 0, () => {
      TAG = "testLastIndexOf0013"
      let buf = buffer.from("13236235");
      try {
        let index = buf.lastIndexOf("23", 9999999);
        expect(index).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0100
     * @tc.name: testIncludes0001
     * @tc.desc: Test the includes interface by passing the parameter value to a numerical string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0001", 0, () => {
      TAG = "testIncludes0001";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0200
     * @tc.name: testIncludes0002
     * @tc.desc: Test the includes interface by passing the parameter value to a numerical string which is in the buffer,
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0002", 0, () => {
      TAG = "testIncludes0002";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("3", 2);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0300
     * @tc.name: testIncludes0003
     * @tc.desc: Test the includes interface by passing the parameter value to two numerical string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0003", 0, () => {
      TAG = "testIncludes0003";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0400
     * @tc.name: testIncludes0004
     * @tc.desc: Test the includes interface by passing the parameter value to two numerical string which is in the buffer,
     * and byteOffset to 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0004", 0, () => {
      TAG = "testIncludes0004";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", 2);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0500
     * @tc.name: testIncludes0005
     * @tc.desc: Test the includes interface by passing the parameter value to special string which is in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0005", 0, () => {
      TAG = "testIncludes0005";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let flag = buf.includes("#@");
        expect(flag).assertEqual(true);
        flag = buf.includes("测试");
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0600
     * @tc.name: testIncludes0006
     * @tc.desc: Test the includes interface by passing the parameter value to string which is not in the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0006", 0, () => {
      TAG = "testIncludes0006";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("abc");
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0700
     * @tc.name: testIncludes0007
     * @tc.desc: Test the includes interface by passing the parameter value to string which is not in the buffer,and byteOffset
     * to 0, encode to "BufferEncoding"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0007", 0, () => {
      TAG = "testIncludes0007";
      try {
        let encodeArr: buffer.BufferEncoding[] = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
          'utf16le', 'base64', 'base64url', 'hex'];
        for (const encode of encodeArr) {
          let buf = buffer.from("13236");
          let flag = buf.includes("abc", 0, encode);
          expect(flag).assertEqual(false);
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0800
     * @tc.name: testIncludes0008
     * @tc.desc: Test the includes interface by passing the parameter value to number but source buffer of string type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0008", 0, () => {
      TAG = "testIncludes0008";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes(32);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_0900
     * @tc.name: testIncludes0009
     * @tc.desc: Test the includes interface by passing the parameter value to empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0009", 0, () => {
      TAG = "testIncludes0009";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("");
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1000
     * @tc.name: testIncludes0010
     * @tc.desc: Test the includes interface by passing the parameter value to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0010", 0, () => {
      TAG = "testIncludes0010";
      try {
        let buf = buffer.from("13236");
        buf.includes(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1100
     * @tc.name: testIncludes0011
     * @tc.desc: Test the includes interface by passing the parameter value to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0011", 0, () => {
      TAG = "testIncludes0011";
      try {
        let buf = buffer.from("13236");
        buf.includes(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1200
     * @tc.name: testIncludes0012
     * @tc.desc: Test the includes interface by passing the parameter value which is in the source buffer and
     *           byteOffset to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0012", 0, () => {
      TAG = "testIncludes0012";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", -1);
        expect(flag).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_INCLUDES_1300
     * @tc.name: testIncludes0013
     * @tc.desc: Test the includes interface by passing the parameter value which is in the source buffer and
     *           and byteOffset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testIncludes0013", 0, () => {
      TAG = "testIncludes0013";
      try {
        let buf = buffer.from("13236");
        let flag = buf.includes("32", undefined);
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0100
     * @tc.name: testSwap160001
     * @tc.desc: Test the swap16 interface by source buffer which size is multiple of 16-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap160001", 0, () => {
      TAG = "testSwap160001";
      try {
        let buf = buffer.from("1323");
        buf.swap16();
        let str = buf.toString("hex");
        expect(str).assertEqual("33313332");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0200
     * @tc.name: testSwap160002
     * @tc.desc: Test the swap16 interface by source buffer which size is not multiple of 16-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap160002", 0, () => {
      TAG = "testSwap160002";
      let buf = buffer.from("132");
      try {
        buf.swap16();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP16_0300
     * @tc.name: testSwap160003
     * @tc.desc: Test the swap16 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap160003", 0, () => {
      TAG = "testSwap160003";
      try {
        let buf = buffer.from("");
        buf.swap16();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0100
     * @tc.name: testSwap320001
     * @tc.desc: Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap320001", 0, () => {
      TAG = "testSwap320001";
      try {
        let buf1 = buffer.from("1234");
        buf1.swap32();
        let str = buf1.toString();
        expect(str).assertEqual("4321");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0200
     * @tc.name: testSwap320002
     * @tc.desc: Test the swap32 interface by source buffer which size is multiple of 32-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap320002", 0, () => {
      TAG = "testSwap320002";
      let buf = buffer.from("132");
      try {
        buf.swap32();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP32_0300
     * @tc.name: testSwap320003
     * @tc.desc: Test the swap32 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap320003", 0, () => {
      TAG = "testSwap320003";
      try {
        let buf = buffer.from("");
        buf.swap32();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0100
     * @tc.name: testSwap640001
     * @tc.desc: Test the swap64 interface by source buffer which size is multiple of 64-bits .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap640001", 0, () => {
      TAG = "testSwap640001";
      try {
        let buf = buffer.from("12345678");
        buf.swap64();
        let str = buf.toString();
        expect(str).assertEqual("87654321");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0200
     * @tc.name: testSwap640002
     * @tc.desc: Test the swap64 interface by source buffer which size is not multiple of 64-bits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap640002", 0, () => {
      TAG = "testSwap640002";
      let buf = buffer.from("1234567");
      try {
        buf.swap64();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200009);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_SWAP64_0300
     * @tc.name: testSwap640003
     * @tc.desc: Test the swap64 interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testSwap640003", 0, () => {
      TAG = "testSwap640003";
      try {
        let buf = buffer.from("");
        buf.swap64();
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0100
     * @tc.name: testKeys0001
     * @tc.desc: Test the keys interface by source buffer which created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testKeys0001", 0, () => {
      TAG = "testKeys0001";
      try {
        let buf = buffer.from("1234");
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0200
     * @tc.name: testKeys0002
     * @tc.desc: Test the keys interface by source buffer created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testKeys0002", 0, () => {
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
          expect(key).assertEqual(index);
          index++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_KEYS_0300
     * @tc.name: testKeys0003
     * @tc.desc: Test the keys interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testKeys0003", 0, () => {
      TAG = "testKeys0003";
      try {
        let buf = buffer.from("");
        let keys = buf.keys();
        expect(isIteratorEmpty(keys)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0100
     * @tc.name: testValues0001
     * @tc.desc: Test the values interface by source buffer which created from string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testValues0001", 0, () => {
      TAG = "testValues0001";
      try {
        let buf = buffer.from("1234");
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0200
     * @tc.name: testValues0002
     * @tc.desc: Test the values interface by source buffer which created from uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testValues0002", 0, () => {
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
          expect(value).assertEqual(va);
          va++;
        }
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_VALUES_0300
     * @tc.name: testValues0003
     * @tc.desc: Test the values interface by source buffer which size is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testValues0003", 0, () => {
      TAG = "testValues0003";
      try {
        let buf = buffer.from("");
        let values = buf.values();
        expect(isIteratorEmpty(values)).assertTrue()
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0100
     * @tc.name: testEntries0001
     * @tc.desc: Test the entries interface by source buffer which created from string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEntries0001", 0, () => {
      TAG = "testEntries0001";
      try {
        let buf = buffer.from("1234");
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_ENTRIES_0200
     * @tc.name: testEntries0002
     * @tc.desc: Test the entries interface by source buffer which created from Uint8Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testEntries0002", 0, () => {
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0100
     * @tc.name: testFrom0001
     * @tc.desc: Test the from interface by Coping the passed buffer data onto a new Buffer instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0001", 0, () => {
      TAG = "testFrom0001";
      try {
        let uArr = new Uint8Array(3);
        uArr[0] = 0x12;
        uArr[1] = 0x34;
        uArr[2] = 0x56;
        let buf = buffer.from(uArr);
        let str = buf.toString("hex");
        expect(str).assertEqual("123456");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0200
     * @tc.name: testFrom0002
     * @tc.desc: Test the from interface by Allocatting a new Buffer using an array of bytes in the range 0 – 255.
     *           Array entries outside that range will be truncated to fit into it.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0002", 0, () => {
      TAG = "testFrom0002";
      try {
        const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let str = buf.toString("hex");
        expect(str).assertEqual("627566666572");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0300
     * @tc.name: testFrom0003
     * @tc.desc: Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0003", 0, () => {
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
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0400
     * @tc.name: testFrom0004
     * @tc.desc: Test the from interface by creatting a view of the ArrayBuffer without copying the underlying memory.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0004", 0, () => {
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
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0500
     * @tc.name: testFrom0005
     * @tc.desc: Test the from interface by Copping the passed buffer data onto a new Buffer instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0005", 0, () => {
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
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0600
     * @tc.name: testFrom0006
     * @tc.desc: Test the from interface by Creatting a new Buffer containing string. The encoding parameter identifies
     *           the character encoding to be used when converting string into bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0006", 0, () => {
      TAG = "testFrom0006";
      try {
        const buf1 = buffer.from('this is a test');
        let str = buf1.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0700
     * @tc.name: testFrom0007
     * @tc.desc: Test the from interface by creatting a new Buffer containing string. The encoding parameter identifies
     * the character encoding to be used when converting string into bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0007", 0, () => {
      TAG = "testFrom0007";
      try {
        const buf1 = buffer.from('F1刘FG', 'hex');
        let str = buf1.toString('hex');
        expect(str).assertEqual("f1");

        let buf2 = buffer.from("F1FG", "ascii")
        str = buf2.toString("ascii");
        expect(str).assertEqual("F1FG");

        let buf3 = buffer.from("F1FG刘", "base64")
        str = buf3.toString("base64");
        expect(str).assertEqual("F1FG");

        let buf4 = buffer.from("F1FG刘", "base64url")
        str = buf4.toString("base64url");
        expect(str).assertEqual("F1FG");

        let buf5 = buffer.from("F1FG", "binary")
        str = buf5.toString("binary");
        expect(str).assertEqual("F1FG");

        let buf6 = buffer.from("F1FG", "latin1")
        str = buf6.toString("latin1");
        expect(str).assertEqual("F1FG");

        let buf7 = buffer.from("F1FG刘", "ucs2")
        str = buf7.toString("ucs2");
        expect(str).assertEqual("F1FG刘");

        let buf8 = buffer.from("F1FG刘", "utf16le")
        str = buf8.toString("utf16le");
        expect(str).assertEqual("F1FG刘");

        let buf9 = buffer.from("F1FG刘", "ucs2")
        str = buf9.toString("ucs2");
        expect(str).assertEqual("F1FG刘");

        let buf10 = buffer.from("F1FG刘", "utf-8")
        str = buf10.toString("utf-8");
        expect(str).assertEqual("F1FG刘");

        let buf11 = buffer.from("F1FG刘", "utf8")
        str = buf11.toString("utf8");
        expect(str).assertEqual("F1FG刘");

        let buf12 = buffer.from("AsD-_QWEr", "base64url")
        str = buf12.toString("hex");
        expect(str).assertEqual("02c0fefd0584");

        let buf13 = buffer.from("AsDQWEr134", "base64url")
        str = buf13.toString("hex");
        expect(str).assertEqual("02c0d0584af5df");

        let buf14 = buffer.from("_AsDQ-12W7Er_", "base64url")
        str = buf14.toString("hex");
        expect(str).assertEqual("fc0b0343ed765bb12b");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0800
     * @tc.name: testFrom0008
     * @tc.desc: Test the from interface For the object whose value returned by valueof() function is strictly equal to
     *           object or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0008", 0, () => {
      TAG = "testFrom0008";
      try {
        const buf = buffer.from(new String('this is a test'));
        let str = buf.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_0900
     * @tc.name: testFrom0009
     * @tc.desc: Test the from interface for the object whose value returned by valueof() function is strictly equal
     *            to object or supports symbol To primitive object, a new buffer instance is created.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0009", 0, () => {
      TAG = "testFrom0009";
      try {
        class Foo {
          valueOf() {
            return 'this is a test';
          }

          toString() {
            return 'this is a test';
          }
        }

        let foo = new Foo();
        const buf = buffer.from(foo, 'utf8', 0);
        let str = buf.toString();
        expect(str).assertEqual("this is a test");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1000
     * @tc.name: testFrom0010
     * @tc.desc: Test the from interface by creating a new buffer containing a newline character string. Creating using
     *            base64 encoding
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0010", 0, () => {
      TAG = "testFrom0010";
      try {
        const str =
          `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
        const buf = buffer.from(str, 'base64');
        let ref = buf.readInt8(buf.length - 1);
        expect(ref).assertEqual(114);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1100
     * @tc.name: testFrom0011
     * @tc.desc: Test the from interface by pass the parameter array to undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0011", 0, () => {
      TAG = "testFrom0011";
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1200
     * @tc.name: testFrom0012
     * @tc.desc: Test the from interface by pass the parameter array to null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0012", 0, () => {
      TAG = "testFrom0012";
      try {
        buffer.from(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1300
     * @tc.name: testFrom0013
     * @tc.desc: Test the from interface by pass the parameter byteOffset is outside of the range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0013", 0, () => {
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
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1400
     * @tc.name: testFrom0014
     * @tc.desc: Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0014", 0, () => {
      TAG = "testFrom0014";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf, -1);
        let str = buf1.toString();
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1500
     * @tc.name: testFrom0015
     * @tc.desc: Test the from interface by copping a buffer which is created from "Uint8Array" and pass byteOffset to -1
     *           and lenrth to -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0015", 0, () => {
      TAG = "testFrom0015";
      try {
        let buf = new Uint8Array([97, 98]);
        const buf1 = buffer.from(buf, -1, -1);
        let str = buf1.toString();
        expect(str).assertEqual("ab");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1600
     * @tc.name: testFrom0016
     * @tc.desc: Test the from interface by The buffer handles a uint8array and decodes it with base64 and base64url.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0016", 0, () => {
      TAG = 'TestFrom0016';
      try {
        let array = new Uint8Array([252, 11, 3, 67, 237, 118, 91, 177, 43]);
        let buf = buffer.from(array);
        let strUrl = buf.toString("base64url");
        let str = buf.toString("base64");
        expect(strUrl).assertEqual("_AsDQ-12W7Er");
        expect(str).assertEqual("/AsDQ+12W7Er");

        array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("AsD-_QWERQ");
        expect(str).assertEqual("AsD+/QWERQ==");

        array = new Uint8Array([215, 109, 211, 97, 72, 142, 167, 241]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("123TYUiOp_E");
        expect(str).assertEqual("123TYUiOp/E=");

        array = new Uint8Array([252]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_A");
        expect(str).assertEqual("/A==");

        array = new Uint8Array([252, 97]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_GE");
        expect(str).assertEqual("/GE=");

        array = new Uint8Array([252, 97, 142]);
        buf = buffer.from(array);
        strUrl = buf.toString("base64url");
        str = buf.toString("base64");
        expect(strUrl).assertEqual("_GGO");
        expect(str).assertEqual("/GGO");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_FROM_1700
     * @tc.name: testFrom0017
     * @tc.desc: Test the from interface by Creating a new Buffer containing empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testFrom0017", 0, () => {
      TAG = "testFrom0017";
      try {
        const buf = buffer.from("");
        let str = buf.toString();
        expect(str).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0100
     * @tc.name: testBlobConstructor0001
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0001", 0, async () => {
      TAG = "testBlobConstructor0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        }
        let sources = ["a", "b", "c"];
        let blob2 = new buffer.Blob(sources, option);
        let promise = blob2.text();
        await promise.then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0200
     * @tc.name: testBlobConstructor0002
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0002", 0, async () => {
      TAG = "testBlobConstructor0002";
      try {
        let arrBuf = new ArrayBuffer(3);
        let uint8arr = new Uint8Array(arrBuf);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        }
        let blob2 = new buffer.Blob([arrBuf], option);
        await blob2.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0300
     * @tc.name: testBlobConstructor0003
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0003", 0, async () => {
      TAG = "testBlobConstructor0003";
      try {
        let uint8arr = new Uint8Array(3);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let blob2 = new buffer.Blob([uint8arr], option);
        await blob2.text().then((value) => {
          try {
            expect(value).assertEqual("979899");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0400
     * @tc.name: testBlobConstructor0004
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0004", 0, async () => {
      TAG = "testBlobConstructor0004";
      try {
        let arrBuf = new ArrayBuffer(3);
        let uint8arr = new Uint8Array(arrBuf);
        uint8arr[0] = 97;
        uint8arr[1] = 98;
        uint8arr[2] = 99;
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let view = new DataView(arrBuf);
        let blob2 = new buffer.Blob([view], option);
        await blob2.text().then((value) => {
          try{
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0500
     * @tc.name: testBlobConstructor0005
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0005", 0, async () => {
      TAG = "testBlobConstructor0005";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob2 = new buffer.Blob(sources, option);
        let blob = new buffer.Blob([blob2]);
        await blob.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBCONSTRUCTOR_0600
     * @tc.name: testBlobConstructor0006
     * @tc.desc: Test the from interface by Creating a new Blob object containing a concatenation of the given sources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobConstructor0006", 0, async () => {
      TAG = "testBlobConstructor0006";
      try {
        new buffer.Blob(["a", "b", "c"], 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBARRAYBUFFER_0100
     * @tc.name: testBlobArrayBuffer0100
     * @tc.desc: Test the arrayBuffer interface by blob fulfills with an <ArrayBuffer> containing a copy of the Blob data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobArrayBuffer0100", 0, async () => {
      TAG = "testBlobArrayBuffer0100";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let source = ["a", "b", "c"]
        let blob = new buffer.Blob(source, option);
        await blob.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value)
            for (let i = 0, len = arr.length; i < len; i++) {
              expect(arr[i]).assertEqual(97 + i);
            }
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTEXT_0100
     * @tc.name: testBlobText0001
     * @tc.desc: Test the text interface by buffer fulfills with the contents of the Blob decoded as a UTF-8 string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobText0001", 0, async () => {
      TAG = "testBlobText0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        await blob.text().then((value) => {
          try {
            expect(value).assertEqual("abc");
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSLICE_0100
     * @tc.name: testBlobSlice0001
     * @tc.desc: Test the slice interface by passing the parameter start to 0,end to 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobSlice0001", 0, async () => {
      TAG = "testBlobSlice0001";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let blobSlice = blob.slice(0, 1);
        await blobSlice.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value);
            expect(arr[0]).assertEqual(97);
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSLICE_0200
     * @tc.name: testBlobSlice0002
     * @tc.desc: Test the slice interface by passing the parameter start to -1,end to 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobSlice0002", 0, async () => {
      TAG = "testBlobSlice0002";
      try {
        let option: Options = {
          type: "new type", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let blobSlice = blob.slice(-1, 0);
        await blobSlice.arrayBuffer().then((value) => {
          try {
            let arr = new Uint8Array(value)
            expect(arr[0]).assertEqual(99);
          } catch (err) {
            console.error(`${TAG} err is ${err}`);
          }
        });
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0100
     * @tc.name: testBlobSize0001
     * @tc.desc: Test the size interface by creating buffer which length is 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobSize0001", 0, () => {
      TAG = "testBlobSize0001";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(size).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0200
     * @tc.name: testBlobSize0002
     * @tc.desc: Test the size interface by creating buffer which length is 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobSize0002", 0, () => {
      TAG = "testBlobSize0002";
      try {
        let blob = new buffer.Blob([]);
        let size = blob.size;
        expect(size).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBSIZE_0300
     * @tc.name: testBlobSize0003
     * @tc.desc: Test the size interface by creating buffer which length is 3 and content include chinese string
     *           、special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobSize0003", 0, () => {
      TAG = "testBlobSize0003";
      try {
        let sources = ["测试", "$#", "c"];
        let blob = new buffer.Blob(sources);
        let size = blob.size;
        expect(size).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTYPE_0100
     * @tc.name: testBlobType0001
     * @tc.desc: Test the type interface by creating buffer which type is mine.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobType0001", 0, () => {
      TAG = "testBlobType0001";
      try {
        let option: Options = {
          type: "mime", endings: "transparent"
        };
        let sources = ["a", "b", "c"];
        let blob = new buffer.Blob(sources, option);
        let type = blob.type;
        expect(type).assertEqual("mime");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBTYPE_0200
     * @tc.name: testBlobType0002
     * @tc.desc: Test the type interface by creating buffer which type is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobType0002", 0, () => {
      TAG = "testBlobType0002";
      try {
        let sources = ["a", "b", "c"]
        let blob = new buffer.Blob(sources);
        let type = blob.type;
        expect(type).assertEqual("");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0100
     * @tc.name: testBlobLength0001
     * @tc.desc: Test the type interface by creating buffer which length is 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobLength0001", 0, () => {
      TAG = "testBlobLength0001";
      try {
        let buf = buffer.from("1236");
        let len = buf.length;
        expect(len).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0200
     * @tc.name: testBlobLength0002
     * @tc.desc: Test the type interface by assigning a value to length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobLength0002", 0, () => {
      TAG = "testBlobLength0002";
      let buf = buffer.from("1236");
      try {
        buf.length = 10;
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200013);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBLEGTH_0300
     * @tc.name: testBlobLength0003
     * @tc.desc: Test the type interface by creating buffer which content include chinese and special string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobLength0003", 0, () => {
      TAG = "testBlobLength0003";
      try {
        let buf = buffer.from("测试特殊字符$#@!");
        let len = buf.length;
        expect(len).assertEqual(22);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0100
     * @tc.name: testBlobByteOffset0001
     * @tc.desc: Test the byteOffset interface by creating buffer by "from" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobByteOffset0001", 0, () => {
      TAG = "testBlobByteOffset0001";
      try {
        let buf = buffer.from("1236");
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0200
     * @tc.name: testBlobByteOffset0002
     * @tc.desc: Test the byteOffset interface by creating buffer by "alloc" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobByteOffset0002", 0, () => {
      TAG = "testBlobByteOffset0002";
      try {
        let buf = buffer.alloc(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0300
     * @tc.name: testBlobByteOffset0003
     * @tc.desc: Test the byteOffset interface by creating buffer by "allocUninitializedFromPool" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobByteOffset0003", 0, () => {
      TAG = "testBlobByteOffset0003";
      try {
        let buf = buffer.allocUninitializedFromPool(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0400
     * @tc.name: testBlobByteOffset0004
     * @tc.desc: Test the byteOffset interface by creating buffer by "allocUninitialized" interface.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobByteOffset0004", 0, () => {
      TAG = "testBlobByteOffset0004";
      try {
        let buf = buffer.allocUninitialized(10);
        let offset = buf.byteOffset;
        expect(offset >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_BLOBBYTEOFFSET_0500
     * @tc.name: testBlobByteOffset0005
     * @tc.desc: Test the byteOffset interface by creating buffer assign a value to 'byteOffset'.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testBlobByteOffset0005", 0, () => {
      TAG = "testBlobByteOffset0005";
      let buf = buffer.from("1236");
      try {
        buf.byteOffset = 3;
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200013);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0100
     * @tc.name: testReadUInt16LE0001
     * @tc.desc: Test the readUInt16LE interface by Reading an unsigned, little-endian 16-bit integer from buf at the
     *           specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt16LE0001", 0, () => {
      TAG = "testReadUInt16LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(0).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0200
     * @tc.name: testReadUInt16LE0002
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt16LE0002", 0, () => {
      TAG = "testReadUInt16LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      try {
        buf.readUInt16LE(3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0300
     * @tc.name: testReadUInt16LE0003
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt16LE0003", 0, () => {
      TAG = "testReadUInt16LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(undefined).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT16LE_0400
     * @tc.name: testReadUInt16LE0004
     * @tc.desc: Test the readUInt16LE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt16LE0004", 0, () => {
      TAG = "testReadUInt16LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x1234, 0);
        let ref = buf.readUInt16LE(null).toString(16);
        expect(ref).assertEqual("1234");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0100
     * @tc.name: testReadUInt32BE0001
     * @tc.desc: Test the readUInt32BE interface by Reading an unsigned, big-endian 32-bit integer from buf at the
     *           specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32BE0001", 0, () => {
      TAG = "testReadUInt32BE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0200
     * @tc.name: testReadUInt32BE0002
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32BE0002", 0, () => {
      TAG = "testReadUInt32BE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      try {
        buf.readUInt32BE(1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0300
     * @tc.name: testReadUInt32BE0003
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32BE0003", 0, () => {
      TAG = "testReadUInt32BE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32BE_0400
     * @tc.name: testReadUInt32BE0004
     * @tc.desc: Test the readUInt32BE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32BE0004", 0, () => {
      TAG = "testReadUInt32BE0004-";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x12345678, 0);
        let ref = buf.readUInt32BE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0100
     * @tc.name: testReadUInt32LE0001
     * @tc.desc: Test the readUInt32LE interface by Reading an unsigned, little-endian 32-bit integer from buf at the
     *           specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32LE0001", 0, () => {
      TAG = "testReadUInt32LE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(0).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0200
     * @tc.name: testReadUInt32LE0002
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32LE0002", 0, () => {
      TAG = "testReadUInt32LE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      try {
        buf.readUInt32LE(1).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0300
     * @tc.name: testReadUInt32LE0003
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32LE0003", 0, () => {
      TAG = "testReadUInt32LE0003";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(undefined).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINT32LE_0400
     * @tc.name: testReadUInt32LE0004
     * @tc.desc: Test the readUInt32LE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUInt32LE0004", 0, () => {
      TAG = "testReadUInt32LE0004";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x12345678, 0);
        let ref = buf.readUInt32LE(null).toString(16);
        expect(ref).assertEqual("12345678");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0100
     * @tc.name: testReadUIntBE0001
     * @tc.desc: Test the readUIntBE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntBE0001", 0, () => {
      TAG = "testReadUIntBE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntBE(0x13141516, 0, 4);
        let ref = buf.readUIntBE(0, 3).toString(16);
        expect(ref).assertEqual("131415");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0200
     * @tc.name: testReadUIntBE0002
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntBE0002", 0, () => {
      TAG = "testReadUIntBE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(2, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0300
     * @tc.name: testReadUIntBE0003
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntBE0003", 0, () => {
      TAG = "testReadUIntBE0003";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(undefined, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTBE_0400
     * @tc.name: testReadUIntBE0004
     * @tc.desc: Test the readUIntBE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntBE0004", 0, () => {
      TAG = "testReadUIntBE0004";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        buf.readUIntBE(null, 3).toString(16);
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0100
     * @tc.name: testReadUIntLE0001
     * @tc.desc: Test the readUIntLE interface by reading an unsigned 8-bit integer from buf at the specified offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntLE0001", 0, () => {
      TAG = "testReadUIntLE0001";
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUIntLE(0x13141516, 0, 4);
        let ref = buf.readUIntLE(0, 3).toString(16);
        expect(ref).assertEqual("141516");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0200
     * @tc.name: testReadUIntLE0002
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset out of range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntLE0002", 0, () => {
      TAG = "testReadUIntLE0002";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(2, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0300
     * @tc.name: testReadUIntLE0003
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset to undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntLE0003", 0, () => {
      TAG = "testReadUIntLE0003";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(undefined, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_BASE_READUINTLE_0400
     * @tc.name: testReadUIntLE0004
     * @tc.desc: Test the readUIntLE interface by passing the parameter offset to null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it("testReadUIntLE0004", 0, () => {
      TAG = "testReadUIntLE0004";
      let buf = buffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        buf.readUIntLE(null, 3).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })
  })
}