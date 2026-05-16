/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import buffer from "@ohos.buffer";
export default function BufferTest() {
describe('BufferTest', function () {

  /**
   * @tc.name   testAlloc0010
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00100
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.alloc(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name   testAlloc0011
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00200
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(10).fill("ab$#", encode);
      expect(buf.length).assertEqual(10);
    }
  });

  /**
   * @tc.name   testAlloc0012
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00300
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name   testAlloc0013
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00400
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.alloc(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testAlloc0014
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00500
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(0).fill("ab$#", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.name   testAlloc0015
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00600
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf1 = buffer.alloc(10);
    let buf = buffer.alloc(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testAlloc0016
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00700
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let buf = buffer.alloc(-5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                      'negative. Received value is: -5');
    }
  });

   /**
    * @tc.name   testAlloc0017
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00800
    * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it("testAlloc0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(10, "ab$#", encode);
      expect(buf.length).assertEqual(10);
    }
  });

   /**
    * @tc.name   testAlloc0018
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_00900
    * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it("testAlloc0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.alloc(0, "ab$#", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.name   testAlloc0019
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01000
   * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAlloc0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.alloc(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0020
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01100
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.allocUninitializedFromPool(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0021
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01200
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.allocUninitializedFromPool(10).fill("abcd", encode);
      expect(buf.length).assertEqual(10);
    }
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0022
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01300
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(10).fill(buf1);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0023
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01400
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.allocUninitializedFromPool(0);
    expect(buf.length).assertEqual(0);
  });

   /**
    * @tc.name   testAllocUninitializedFromPool0024
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01500
    * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it("testAllocUninitializedFromPool0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.allocUninitializedFromPool(0).fill("abcd", encode);
      expect(buf.length).assertEqual(0);
    }
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0025
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01600
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf1 = buffer.allocUninitializedFromPool(10);
    let buf = buffer.allocUninitializedFromPool(0).fill(buf1);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0026
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01700
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    try {
      let buf = buffer.allocUninitializedFromPool(-5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                      'negative. Received value is: -5');
    }
  });

  /**
   * @tc.name   testAllocUninitializedFromPool0029
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01800
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testAllocUninitializedFromPool0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let buf = buffer.allocUninitializedFromPool(5.5);
    expect(buf.length).assertEqual(5);
  });

  /**
   * @tc.name   testByteLength0030
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_01900
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testByteLength0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let byteLen = buffer.byteLength("abcd");
    expect(byteLen).assertEqual(4);
  });

  /**
   * @tc.name   testByteLength0031
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02000
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testByteLength0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let byteLen = buffer.byteLength("测试");
    expect(byteLen).assertEqual(6);
  });

  /**
   * @tc.name   testByteLength0032
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02100
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testByteLength0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let byteLen = buffer.byteLength("$&@*%");
    expect(byteLen).assertEqual(5);
  });

  /**
   * @tc.name   testByteLength0033
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02200
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testByteLength0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let result = [4, 4, 8, 8, 4, 4, 4, 8, 8, 3, 3, 2];
    for (let i = 0, len = encodeArr.length; i< len; i++) {
      let byteLen = buffer.byteLength("abcd", encodeArr[i]);
      expect(byteLen).assertEqual(result[i]);
    }
  });

     /**
      * @tc.name   testByteLength0034
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02300
      * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it("testByteLength0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
        let byteLen = buffer.byteLength(10);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('Parameter error. The type of "string" must be string or Buffer, ' +
                                        'ArrayBuffer. Received value is: number');
      }
    });
  
  /**
   * @tc.name   testByteLength0035
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02400
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("testByteLength0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let uintarr = new Uint8Array(2);
    uintarr[0] = 21;
    uintarr[1] = 31;
    let byteLen = buffer.byteLength(uintarr.buffer)
    expect(byteLen).assertEqual(2);
  });

  /**
   * @tc.name   testIsBuffer0040
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02500
   * @tc.desc   Returns true if obj is a Buffer, false otherwise
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsBuffer0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(1);
    let flag = buffer.isBuffer(buf);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIsBuffer0045
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02600
   * @tc.desc   Returns true if obj is a Buffer, false otherwise
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsBuffer0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let obj = new Object(1);
    let flag = buffer.isBuffer(obj);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name   testIsEncoding0050
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02700
   * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEncoding0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let flag = buffer.isEncoding("utf8");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIsEncoding0053
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02800
   * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEncoding0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let flag = buffer.isEncoding(encode);
      expect(flag).assertEqual(true);
    }
  });

  /**
   * @tc.name   testIsEncoding0056
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_02900
   * @tc.desc   Returns true if encoding is the name of a supported character encoding, or false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIsEncoding0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let flag = buffer.isEncoding('gbk');
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name   testStaticCompare0060
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03000
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(1);
  });

  /**
   * @tc.name   testStaticCompare0061
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03100
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1235");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

  /**
   * @tc.name   testStaticCompare0062
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03200
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试一");
    let buf2 = buffer.from("测试二");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(-1);
  });

   /**
    * @tc.name   testStaticCompare0063
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03300
    * @tc.desc   Compares buf1 to buf2.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testStaticCompare0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试$&*");
    let buf2 = buffer.from("测试$&*");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.name   testStaticCompare0064
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03400
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1236");
    let res = buffer.compare(buf1, buf2);
    expect(res).assertEqual(0);
  });

  /**
   * @tc.name   testStaticCompare0065
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03500
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf2 = buffer.from("1236");
    try {
      let res = buffer.compare(10, buf2);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "buf1" must be Buffer or Uint8Array. Received ' +
                                      'value is: string');
    }
  });

  /**
   * @tc.name   testStaticCompare0066
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03600
   * @tc.desc   Compares buf1 to buf2.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testStaticCompare0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buffer.compare(buf1, 10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "buf2" must be Buffer or Uint8Array. Received ' +
                                      'value is: string');
    }
  });

  /**
   * @tc.name   testConcat0070
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03700
   * @tc.desc   Returns a new `Buffer` which is the result of concatenating
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConcat0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("12361235");
  });

  /**
   * @tc.name   testConcat0071
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03800
   * @tc.desc   Returns a new `Buffer` which is the result of concatenating
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConcat0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试");
    let buf2 = buffer.from("$&*");
    let buf = buffer.concat([buf1, buf2]);
    let str = buf.toString();
    expect(str).assertEqual("测试$&*");
  });

  /**
   * @tc.name   testConcat0072
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_03900
   * @tc.desc   Returns a new `Buffer` which is the result of concatenating
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConcat0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.concat("test string");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "list" must be Array. Received value is: string');
    }
  });

   /**
    * @tc.name   testConcat0073
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04000
    * @tc.desc   Returns a new `Buffer` which is the result of concatenating
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testConcat0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123$");
    let buf2 = buffer.from("*35");
    let buf3 = buffer.concat([buf1, buf2]);
    let buf = buffer.alloc(5).fill(buf3);
    let str = buf.toString();
    expect(str).assertEqual("123$*");
  });

  /**
   * @tc.name   testConcat0074
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04100
   * @tc.desc   Returns a new `Buffer` which is the result of concatenating
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConcat0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123$");
    let buf2 = buffer.from("*35");
    try {
      let buf = buffer.concat([buf1, buf2], -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }
  });

  /**
   * @tc.name   testConcat0075
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04200
   * @tc.desc   Returns a new `Buffer` which is the result of concatenating
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testConcat0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uintarr = new Uint8Array(4);
    uintarr[0] = 0x31;
    uintarr[1] = 0x32;
    uintarr[2] = 0x33;
    uintarr[3] = 0x35;
    let buf1 = buffer.from("1236");
    let buf = buffer.concat([buf1, uintarr])
    let str = buf.toString()
    expect(str).assertEqual("12361235");
  });

  /**
   * @tc.name   testTranscode0080
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04300
   * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testTranscode0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf = buffer.transcode(buf1, "ascii", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.name   testTranscode0081
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04400
   * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testTranscode0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试");
    let buf = buffer.transcode(buf1, "utf8", "ucs2");
    let str = buf.toString("ucs2")
    expect(str).assertEqual("测试");
  });

   /**
    * @tc.name   testTranscode0082
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04500
    * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testTranscode0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.transcode(10, "utf8", "ucs2");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "source" must be Buffer or Uint8Array. Received ' +
                                      'value is: number');
    }
  });

   /**
    * @tc.name   testTranscode0083
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04600
    * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testTranscode0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试");
    try {
      let buf = buffer.transcode(buf1, 0, "ucs2");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "fromEnc" must be string. Received value is: ' +
                                      'number');
    }
  });

   /**
    * @tc.name   testTranscode0084
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04700
    * @tc.desc   Re-encodes the given Buffer or Uint8Array instance from one character encoding to another.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testTranscode0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试");
    try {
      let buf = buffer.transcode(buf1, "utf8", 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "toEnc" must be string. Received value is: ' +
                                      'number');
    }
  });

  /**
   * @tc.name   testFill0090
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04800
   * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFill0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(3).fill("abc");
    let str = buf.toString();
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name   testFill0091
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_04900
   * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFill0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
  });

  /**
   * @tc.name   testFill0092
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05000
   * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFill0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(3).fill("$*$");
    let str = buf.toString();
    expect(str).assertEqual("$*$");
  });

  /**
   * @tc.name   testFill0093
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05100
   * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFill0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }

  });

  /**
   * @tc.name   testFill0094
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05200
   * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFill0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", 0, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "end" is out of range. It must be >= 0 and <= 3. Received value is: 5');
    }
  });

   /**
    * @tc.name   testFill0095
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05300
    * @tc.desc   Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testFill0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.alloc(3).fill("$*$", 0, 2, "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'code is unknown');
    }
  });

  /**
   * @tc.name   testWrite0100
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05400
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(5);
    let offset = buf.write("abcde", "latin1");
    expect(offset).assertEqual(5);
    let str = buf.toString();
    expect(str).assertEqual("abcde");
  });

  /**
   * @tc.name   testWrite0101
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05500
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(6);
    let offset = buf.write("测试", "utf8");
    expect(offset).assertEqual(6);
    let str = buf.toString();
    expect(str).assertEqual("测试");
  });

  /**
   * @tc.name   testWrite0102
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05600
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    let offset = buf.write("!@#$%^&*", "ascii");
    expect(offset).assertEqual(8);
    let str = buf.toString("ascii");
    expect(str).assertEqual("!@#$%^&*");
  });

   /**
    * @tc.name   testWrite0103
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05700
    * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testWrite0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", "utf9");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'utf9 is unknown');
    }
  });

  /**
   * @tc.name   testWrite0104
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05800
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "str" must be string. Received value is: number');
    }
  });

  /**
   * @tc.name   testWrite0105
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_05900
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 7. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWrite0106
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06000
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", 1, 9);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: 9');
    }
  });

  /**
   * @tc.name   testWrite0107
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06100
   * @tc.desc   Writes string to buf at offset according to the character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWrite0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(8);
    try {
      let offset = buf.write("abcde", 1, "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'code is unknown');
    }
  });

  /**
   * @tc.name   testCompare0110
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06200
   * @tc.desc   Compares buf with target and returns a number indicating whether buf comes before, after,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCompare0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.compare(buf2);
    expect(res).assertEqual(1);
  });

   /**
    * @tc.name   testCompare0111
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06300
    * @tc.desc   Compares buf with target and returns a number indicating whether buf comes before, after,
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testCompare0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buf1.compare(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "target" must be Buffer or Uint8Array. Received ' +
                                      'value is: number');
    }
  });

   /**
    * @tc.name   testCompare0112
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06400
    * @tc.desc   Compares buf with target and returns a number indicating whether buf comes before, after,
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testCompare0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    try {
      let res = buf1.compare(buf2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967296. Received value is: -1');
    }
  });

  /**
   * @tc.name   testEquals0120
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06500
   * @tc.desc   Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEquals0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name   testEquals0121
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06600
   * @tc.desc   Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEquals0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236测试");
    let buf2 = buffer.from("1236测试");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(true);
  });

  /**
   * @tc.name   testEquals0122
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06700
   * @tc.desc   Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEquals0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("O@O");
    let buf2 = buffer.from("O^O");
    let res = buf1.equals(buf2);
    expect(res).assertEqual(false);
  });

  /**
   * @tc.name   testEquals0123
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06800
   * @tc.desc   Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEquals0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    try {
      let res = buf1.equals("1236");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "otherBuffer" must be Buffer or Uint8Array. ' +
                                      'Received value is: string');
    }
  });

  /**
   * @tc.name   testSubarray0130
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_06900
   * @tc.desc   Returns a new Buffer that references the same memory as the original,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubarray0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(0, 3);
    let str = buf.toString();
    expect(str).assertEqual("123");
  });

  /**
   * @tc.name   testSubarray0133
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07000
   * @tc.desc   Returns a new Buffer that references the same memory as the original,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubarray0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(3, 4);
    let str = buf.toString();
    expect(str).assertEqual("6");
  });

  /**
   * @tc.name   testSubarray0136
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07100
   * @tc.desc   Returns a new Buffer that references the same memory as the original,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubarray0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(-3, 0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testSubarray0139
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07200
   * @tc.desc   Returns a new Buffer that references the same memory as the original,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSubarray0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf = buf1.subarray(6, 9);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testCopy0140
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07300
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let buf2 = buffer.from("1235");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.name   testCopy0141
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07400
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abcdefg");
    let buf2 = buffer.from("1235789");
    let num = buf1.copy(buf2, 2, 1, 3);
    expect(num).assertEqual(2);
    let str = buf2.toString();
    expect(str).assertEqual("12bc789");
  });

  /**
   * @tc.name   testCopy0143
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07500
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123656");
    let buf2 = buffer.from("1235");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("1236");
  });

   /**
    * @tc.name   testCopy0144
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07600
    * @tc.desc   Copies data from a region of buf to a region in target,
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testCopy0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123656");
    let buf2 = buffer.from("1235");
    try {
      let num = buf1.copy(buf2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testCopy0145
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07700
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123656");
    try {
      let num = buf1.copy(10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "target" must be Buffer or Uint8Array. Received ' +
                                      'value is: number');
    }
  });

  /**
   * @tc.name   testCopy0146
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07800
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("ab$#");
    let buf2 = buffer.from("123556");
    let num = buf1.copy(buf2);
    expect(num).assertEqual(4);
    let str = buf2.toString();
    expect(str).assertEqual("ab$#56");
  });

  /**
   * @tc.name   testToString0150
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_07900
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let str = buf1.toString();
    expect(str).assertEqual("1236");
  });

  /**
   * @tc.name   testToString0151
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08000
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("张三");
    let str = buf1.toString();
    expect(str).assertEqual("张三");
  });

  /**
   * @tc.name   testToString0152
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08100
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("binary");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name   testToString0153
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08200
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ascii");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name   testToString0154
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08300
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("base64");
    expect(str).assertEqual("YWJj");
  });

  /**
   * @tc.name   testToString0155
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08400
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("hex");
    expect(str).assertEqual("616263");
  });

  /**
   * @tc.name   testToString0156
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08500
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("latin1");
    expect(str).assertEqual("abc");
  });

  /**
   * @tc.name   testToString0157
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08600
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("ucs2");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.name   testToString0158
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08700
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let str = buf1.toString("utf16le");
    expect(str).assertEqual("扡");
  });

  /**
   * @tc.name   testToString0159
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08800
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("!@#$%^&*");
    let str = buf1.toString();
    expect(str).assertEqual("!@#$%^&*");
  });

  /**
   * @tc.name   testToJSON0160
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_08900
   * @tc.desc   Returns a JSON representation of buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToJSON0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1236");
    let obj = buf1.toJSON();
    expect(obj.data.join("")).assertEqual("49505154");
  });

  /**
   * @tc.name   testIndexOf0170
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09000
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3");
    expect(index).assertEqual(1);
  });

  /**
   * @tc.name   testIndexOf0171
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09100
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("3", 2);
    expect(index).assertEqual(3);
  });

  /**
   * @tc.name   testIndexOf0173
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09200
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23");
    expect(index).assertEqual(2);
  });

  /**
   * @tc.name   testIndexOf0174
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09300
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let index = buf1.indexOf("@");
    expect(index).assertEqual(20);
  });

  /**
   * @tc.name   testIndexOf0175
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09400
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.indexOf("23", 3);
    expect(index).assertEqual(5);
  });

  /**
   * @tc.name   testIndexOf0176
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09500
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.indexOf("a");
    expect(index).assertEqual(-1);
  });

   /**
    * @tc.name   testIndexOf0177
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09600
    * @tc.desc   Returns true if value was found in buf, false otherwise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testIndexOf0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                      'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
      let index = buf.indexOf("ab", 0, encode);
      expect(index).assertEqual(-1);
    }
  });

  /**
   * @tc.name   testIndexOf0178
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09700
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.indexOf(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "value" must be string or number, Buffer, ' +
                                      'Uint8Array. Received value is: boolean');
    }
  });

  /**
   * @tc.name   testIndexOf0179
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09800
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.indexOf("a", "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'code is unknown');
    }
  });

  /**
   * @tc.name   testLastIndexOf0180
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_09900
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3");
    expect(index).assertEqual(3);
  });

  /**
   * @tc.name   testLastIndexOf0181
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10000
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("3", 2);
    expect(index).assertEqual(1);
  });

  /**
   * @tc.name   testLastIndexOf0183
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10100
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23");
    expect(index).assertEqual(5);
  });

  /**
   * @tc.name   testLastIndexOf0184
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10200
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23", 3);
    expect(index).assertEqual(2);
  });

  /**
   * @tc.name   testLastIndexOf0186
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10300
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let index = buf1.lastIndexOf("a");
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name   testLastIndexOf0187
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10400
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                      'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    let buf = buffer.from("13236");
    for (const encode of encodeArr) {
      let index = buf.lastIndexOf("ab", 0, encode);
      expect(index).assertEqual(-1);
    }
  });

  /**
   * @tc.name   testLastIndexOf0188
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10500
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.lastIndexOf(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "value" must be string or number, Buffer, ' +
                                      'Uint8Array. Received value is: boolean');
    }
  });

  /**
   * @tc.name   testLastIndexOf0189
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10600
   * @tc.desc   The index of the last occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testLastIndexOf0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    try {
      let index = buf1.lastIndexOf("a", "code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'code is unknown');
    }
  });

  /**
   * @tc.name   testIncludes0190
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10700
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIncludes0191
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10800
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("3", 2);
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIncludes0193
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_10900
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIncludes0194
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11000
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("32", 2);
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name   testIncludes0195
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11100
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("测试特殊字符$#@!");
    let flag = buf1.includes("#@");
    expect(flag).assertEqual(true);
    flag = buf1.includes("测试");
    expect(flag).assertEqual(true);
  });

  /**
   * @tc.name   testIncludes0196
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11200
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    let flag = buf1.includes("abc");
    expect(flag).assertEqual(false);
  });

  /**
   * @tc.name   testIncludes0197
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11300
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let encodeArr = ['utf8', 'utf-8', 'ucs2', 'ucs-2', 'ascii', 'latin1', 'binary',
                     'utf16le', 'utf-16le', 'base64', 'base64url', 'hex'];
    for (const encode of encodeArr) {
      let buf = buffer.from("13236");
      let flag = buf.includes("abc", 0, encode);
      expect(flag).assertEqual(false);
    }
  });

  /**
   * @tc.name   testIncludes0198
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11400
   * @tc.desc   Returns true if value was found in buf, false otherwise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIncludes0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236");
    try {
      let flag = buf1.includes(true);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "value" must be string or number, Buffer, ' +
                                      'Uint8Array. Received value is: boolean');
    }
  });
 
  /**
   * @tc.name   testSwap160200
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11500
   * @tc.desc   Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSwap160200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1323");
    buf1.swap16();
    let str = buf1.toString("hex");
    expect(str).assertEqual("33313332");
  });

  /**
   * @tc.name   testSwap160201
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11600
   * @tc.desc   Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSwap160201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("132");
    try {
      buf1.swap16();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The buffer size must be a multiple of 16-bits');
    }
  });

  /**
   * @tc.name   testSwap320210
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11700
   * @tc.desc   Interprets buf as an array of unsigned 32-bit integers and swaps the byte order in-place.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSwap320210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1234");
    buf1.swap32();
    let str = buf1.toString();
    expect(str).assertEqual("4321");
  });

   /**
    * @tc.name   testswap320211
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11800
    * @tc.desc   Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testswap320211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("132");
    try {
      buf1.swap32();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The buffer size must be a multiple of 32-bits');
    }
  });

  /**
   * @tc.name   testSwap640220
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_11900
   * @tc.desc   Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testSwap640220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("12345678");
    buf1.swap64();
    let str = buf1.toString();
    expect(str).assertEqual("87654321");
  });

   /**
    * @tc.name   testSwap640221
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12000
    * @tc.desc   Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testSwap640221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1234567");
    try {
      buf1.swap64();
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The buffer size must be a multiple of 64-bits');
    }
  });

  /**
   * @tc.name   testKeys0230
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12100
   * @tc.desc   Creates and returns an iterator of buf keys (indices).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testKeys0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1234");
    let keys = buf1.keys();
    let index = 0;
    for (const key of keys) {
      expect(key).assertEqual(index);
      index++;
    }
  });

  /**
   * @tc.name   testKeys0235
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12200
   * @tc.desc   Creates and returns an iterator of buf keys (indices).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testKeys0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let keys = buf1.keys();
    let index = 0;
    for (const key of keys) {
      expect(key).assertEqual(index);
      index++;
    }
  });

  /**
   * @tc.name   testValues0240
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12300
   * @tc.desc   Creates and returns an iterator for buf values (bytes).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testValues0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1234");
    let keys = buf1.values();
    let va = 49;
    for (const value of keys) {
      expect(value).assertEqual(va);
      va++;
    }
  });

  /**
   * @tc.name   testValues0245
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12400
   * @tc.desc   Creates and returns an iterator for buf values (bytes).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testValues0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let keys = buf1.values();
    let va = 0x31;
    for (const value of keys) {
      expect(value).assertEqual(va);
      va++;
    }
  });

  /**
   * @tc.name   testEntries0250
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12500
   * @tc.desc   Creates and returns an iterator of [index, byte] pairs from the contents of buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("1234");
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
      expect(key).assertEqual(index);
      expect(value).assertEqual(va);
      va++;
      index++;
    }
  });

  /**
   * @tc.name   testEntries0255
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12600
   * @tc.desc   Creates and returns an iterator of [index, byte] pairs from the contents of buf
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testEntries0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uarr = new Uint8Array(4);
    uarr[0] = 0x31;
    uarr[1] = 0x32;
    uarr[2] = 0x33;
    uarr[3] = 0x34;
    let buf1 = buffer.from(uarr);
    let entries = buf1.entries();
    let va = 49, index = 0;
    for (const [key, value] of entries) {
      expect(key).assertEqual(index);
      expect(value).assertEqual(va);
      va++;
      index++;
    }
  });

  /**
   * @tc.name   testfrom0260
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12700
   * @tc.desc   Copies the passed buffer data onto a new Buffer instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uarr = new Uint8Array(3);
    uarr[0] = 0x12;
    uarr[1] = 0x34;
    uarr[2] = 0x56;
    let buf = buffer.from(uarr);
    let str = buf.toString("hex");
    expect(str).assertEqual("123456");
  });

  /**
   * @tc.name   testfrom0261
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12800
   * @tc.desc   Allocates a new Buffer using an array of bytes in the range 0 – 255.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
    let str = buf.toString("hex");
    expect(str).assertEqual("627566666572");
  });

  /**
   * @tc.name   testfrom0262
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_12900
   * @tc.desc   This creates a view of the ArrayBuffer without copying the underlying memory.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const arr = new Uint8Array(2);
    arr[0] = 97;
    arr[1] = 98;
    const buf = buffer.from(arr.buffer);
    arr[0] = 99
    buf[1] = 100
    let str = buf.toString("hex");
    expect(str).assertEqual("6364");
    expect(arr[1]).assertEqual(100);
  });

  /**
   * @tc.name   testfrom0263
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13000
   * @tc.desc   This creates a view of the ArrayBuffer without copying the underlying memory.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const arr = new Uint8Array(2);
    arr[0] = 97;
    arr[1] = 98;
    const buf = buffer.from(arr.buffer, 1);
    buf[0] = 99;
    let str = buf.toString("hex");
    expect(str).assertEqual("63");
    expect(arr[1]).assertEqual(99);
    expect(buf[0]).assertEqual(99);
  });

  /**
   * @tc.name   testfrom0264
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13100
   * @tc.desc   Copies the passed buffer data onto a new Buffer instance.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const buf1 = buffer.from('buffer');
    const buf2 = buffer.from(buf1);
    buf1[0] = 0x61;
    let str = buf1.toString();
    expect(str).assertEqual("auffer");
    str = buf2.toString();
    expect(str).assertEqual("buffer");
  });

  /**
   * @tc.name   testfrom0265
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13200
   * @tc.desc   Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const buf1 = buffer.from('this is a test');
    let str = buf1.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.name   testfrom0266
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13300
   * @tc.desc   Creates a new Buffer containing string. The encoding parameter identifies the character encoding
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
  });

  /**
   * @tc.name   testfrom0267
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13400
   * @tc.desc   For the object whose value returned by valueof() function is strictly equal to object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const buf = buffer.from(new String('this is a test'));
    let str = buf.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.name   testfrom0268
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13500
   * @tc.desc   For the object whose value returned by valueof() function is strictly equal to object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    class Foo {
      [Symbol.toPrimitive]() {
        return 'this is a test';
      }
    }
    const buf = buffer.from(new Foo(), 'utf8');
    let str = buf.toString();
    expect(str).assertEqual("this is a test");
  });

  /**
   * @tc.name   testfrom0269
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13600
   * @tc.desc   Create a new buffer containing a newline character string. Creating using base64 encoding
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const str = `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
    const buf = buffer.from(str, 'base64');
    let ref = buf.readInt8(buf.length - 1);
    expect(ref).assertEqual(114);
  });
  
  /**
   * @tc.name   testBlobConstructor0270
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13700
   * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobConstructor0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let promise = blob2.text();
    promise.then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name   testBlobConstructor0271
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13800
   * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobConstructor0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let arrBuf = new ArrayBuffer(3);
    let uint8arr = new Uint8Array(arrBuf);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let blob2 = new buffer.Blob([arrBuf], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name   testBlobConstructor0272
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_13900
   * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobConstructor0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let uint8arr = new Uint8Array(3);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let blob2 = new buffer.Blob([uint8arr], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name   testBlobConstructor0273
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14000
   * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobConstructor0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let arrBuf = new ArrayBuffer(3);
    let uint8arr = new Uint8Array(arrBuf);
    uint8arr[0] = 97;
    uint8arr[1] = 98;
    uint8arr[2] = 99;
    let view = new DataView(arrBuf);
    let blob2 = new buffer.Blob([view], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name   testBlobConstructor0274
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14100
   * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobConstructor0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    let blob = new buffer.Blob([blob2]);
    blob.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

   /**
    * @tc.name   testBlobConstructor0275
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14200
    * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testBlobConstructor0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    try {
      let blob = new buffer.Blob(["a", "b", "c"], 10);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "options" must be Object. Received value is: ' +
                                      'number');
    }
  });

   /**
    * @tc.name   testBlobConstructor0276
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14300
    * @tc.desc   Creates a new Blob object containing a concatenation of the given sources.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testBlobConstructor0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    try {
      let blob = new buffer.Blob("abc", { type: "new type", endings: "transparent" });
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "sources" must be Iterable. Received value is: ' +
                                      'string');
    }
  });

  /**
   * @tc.name   testBlobArrayBuffer0280
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14400
   * @tc.desc   Returns a promise that fulfills with an <ArrayBuffer> containing a copy of the Blob data.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobArrayBuffer0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    blob2.arrayBuffer().then((value) => {
      let arr = new Uint8Array(value)
      for (let i = 0, len = arr.length; i < len; i++) {
        expect(arr[i]).assertEqual(97 + i);
      }
    });
  });

  /**
   * @tc.name   testBlobText0290
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14500
   * @tc.desc   Returns a promise that fulfills with the contents of the Blob decoded as a UTF-8 string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobText0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let blob2 = new buffer.Blob(["a", "b", "c"], { type: "new type", endings: "transparent" });
    blob2.text().then((value) => {
      expect(value).assertEqual("abc");
    });
  });

  /**
   * @tc.name   testBlobSlice0300
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14600
   * @tc.desc   Creates and returns a new Blob containing a subset of this Blob objects data.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobSlice0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
    let blob2 = new buffer.Blob(["c", "b", "a"], { type: "new type", endings: "transparent" });
    let blob = blob2.slice(0, 1);
    blob.arrayBuffer().then((value) => {
      let arr = new Uint8Array(value)
      expect(arr[0]).assertEqual(99);
    });
  });

  /**
   * @tc.name   testWriteInt32BE0310
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14700
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32BE0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32BE(0x12345678, 0);
    expect(ref).assertEqual(4);

  });

  /**
   * @tc.name   testWriteInt32BE0311
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14800
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32BE0311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteInt32BE0312
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_14900
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32BE0312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
    }
  });

  /**
   * @tc.name   testWriteInt32BE0313
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15000
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32BE0313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

   /**
    * @tc.name   testWriteInt32BE0314
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15100
    * @tc.desc   Writes value to buf at the specified offset as big-endian.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testWriteInt32BE0314", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32BE("string", 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "value" must be number. Received value is: ' +
                                      'string');
    }
  });

  /**
   * @tc.name   testWriteInt32LE0320
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15200
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32LE0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    let ref = buf.writeInt32LE(0x12345678, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteInt32LE0321
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15300
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32LE0321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteInt32LE0322
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15400
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32LE0322", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x123456789, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
    }
  });

  /**
   * @tc.name   testWriteInt32LE0323
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15500
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt32LE0323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    try {
      let ref = buf.writeInt32LE(0x12345678, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteInt16BE0330
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15600
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16BE0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16BE(0x7bca, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name   testWriteInt16BE0331
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15700
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16BE0331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteInt16BE0332
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15800
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16BE0332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
    }
  });

  /**
   * @tc.name   testWriteInt16BE0333
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_15900
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16BE0333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16BE(0x7bca, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteInt16LE0340
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16000
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16LE0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    let ref = buf.writeInt16LE(0x1234, 0);
    expect(ref).assertEqual(2);

  });

  /**
   * @tc.name   testWriteInt16LE0341
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16100
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16LE0341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x7bca, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteInt16LE0342
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16200
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16LE0342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x123456, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
    }
  });

  /**
   * @tc.name   testWriteInt16LE0343
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16300
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt16LE0343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    try {
      let ref = buf.writeInt16LE(0x1234, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteInt80350
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16400
   * @tc.desc   Writes value to buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt80350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(2, 0);
    expect(ref).assertEqual(1);
  });

  /**
   * @tc.name   testWriteInt80351
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16500
   * @tc.desc   Writes value to buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt80351", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(2, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteInt80352
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16600
   * @tc.desc   Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt80352", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    try {
      let ref = buf.writeInt8(0x13245, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 78405');
    }
  });

  /**
   * @tc.name   testWriteInt80353
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16700
   * @tc.desc   Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteInt80353", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    let ref = buf.writeInt8(0x2, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name   testWriteUInt16BE0360
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16800
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16BE0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name   testWriteUInt16BE0361
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_16900
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16BE0361", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
    }
  });

  /**
   * @tc.name   testWriteUInt16BE0362
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17000
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16BE0362", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16BE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteUInt16BE0363
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17100
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16BE0363", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.name   testWriteUInt16LE0370
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17200
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16LE0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 0);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name   testWriteUInt16LE0371
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17300
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16LE0371", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdeadfc, 0);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
    }
  });

  /**
   * @tc.name   testWriteUInt16LE0372
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17400
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16LE0372", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt16LE(0xdead, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteUInt16LE0373
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17500
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt16LE0373", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(0xdead, 1);
    expect(ref).assertEqual(3);
  });

  /**
   * @tc.name   testWriteUInt32BE0380
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17600
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32BE0380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32BE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteUInt32BE0381
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17700
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32BE0381", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteUInt32BE0382
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17800
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32BE0382", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32BE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteUInt32LE0390
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_17900
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32LE0390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32LE(0xfeedface, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteUInt32LE0391
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18000
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32LE0391", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteUInt32LE0392
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18100
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt32LE0392", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt32LE(0xfeedface, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteUInt80400
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18200
   * @tc.desc   Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt80400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 3);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteUInt80401
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18300
   * @tc.desc   Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt80401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUInt8(0x42, -1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
    }
  });

  /**
   * @tc.name   testWriteUInt80402
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18400
   * @tc.desc   Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUInt80402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt8(0x42, 1);
    expect(ref).assertEqual(2);
  });

  /**
   * @tc.name   testWriteUIntBE0410
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18500
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntBE0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntBE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteUIntBE0411
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18600
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntBE0411", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
    }
  });

  /**
   * @tc.name   testWriteUIntBE0412
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18700
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntBE0412", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntBE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteUIntLE0420
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18800
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntLE0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntLE(0x13141516, 0, 4);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteUIntLE0421
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_18900
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntLE0421", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 0, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
    }
  });

  /**
   * @tc.name   testWriteUIntLE0422
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19000
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntLE0422", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeUIntLE(0x13141516, 1, 4);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteUIntLE0423
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19100
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteUIntLE0423", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(5);
    let ref = buf.writeUIntLE(0x13141516, 1, 4);
    expect(ref).assertEqual(5);
  });

  /**
   * @tc.name   testWriteIntBE0430
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19200
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteIntBE0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.name   testWriteIntBE0431
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19300
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteIntBE0431", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteIntLE0440
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19400
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteIntLE0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
    expect(ref).assertEqual(6);
  });

  /**
   * @tc.name   testWriteIntLE0441
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19500
   * @tc.desc   Writes byteLength bytes of value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteIntLE0441", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    try {
      let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteDoubleBE0450
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19600
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteDoubleBE0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleBE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteDoubleBE0451
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19700
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteDoubleBE0451", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleBE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteDoubleLE0460
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19800
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteDoubleLE0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeDoubleLE(123.456, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteDoubleLE0461
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_19900
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteDoubleLE0461", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeDoubleLE(123.456, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteFloatBE0470
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20000
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteFloatBE0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeFloatBE(0xcabcbcbc, 0);
    expect(ref).assertEqual(4);
  });

  /**
   * @tc.name   testWriteFloatBE0471
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20100
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteFloatBE0471", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatBE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
    }
  });

  /**
   * @tc.name   testWriteFloatLE0480
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20200
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteFloatLE0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(16);
    let ref = buf.writeFloatLE(0xcabcbcbc, 12);
    expect(ref).assertEqual(16);
  });

  /**
   * @tc.name   testWriteFloatLE0481
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20300
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteFloatLE0481", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    try {
      let ref = buf.writeFloatLE(0xcabcbcbc, 5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
    }
  });

  /**
   * @tc.name   testWriteBigInt64BE0490
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20400
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigInt64BE0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteBigInt64BE0491
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20500
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigInt64BE0491", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteBigInt64LE0500
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20600
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigInt64LE0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigInt64LE(0x0102030405060708n, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteBigInt64LE0501
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20700
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigInt64LE0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigInt64LE(0x0102030405060708n, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteBigUInt64BE0510
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20800
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigUInt64BE0510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteBigUInt64BE0511
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_20900
   * @tc.desc   Writes value to buf at the specified offset as big-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigUInt64BE0511", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testWriteBigUInt64LE0520
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21000
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigUInt64LE0520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
    expect(ref).assertEqual(8);
  });

  /**
   * @tc.name   testWriteBigUInt64LE0521
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21100
   * @tc.desc   Writes value to buf at the specified offset as little-endian.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testWriteBigUInt64LE0521", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    try {
      let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadInt32BE0530
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21200
   * @tc.desc   Reads a signed, big-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt32BE0530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32BE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name   testReadInt32BE0531
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21300
   * @tc.desc   Reads a signed, big-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt32BE0531", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
      let ref = buf.readInt32BE(1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

   /**
    * @tc.name   testReadInt32BE0532
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21400
    * @tc.desc   Reads a signed, big-endian 32-bit integer from buf at the specified offset.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testReadInt32BE0532", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
      let ref = buf.readInt32BE("1");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "offset" must be number. Received value is: ' +
                                      'string');
    }
  });

  /**
   * @tc.name   testReadInt32LE0540
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21500
   * @tc.desc   Reads a signed, little-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt32LE0540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32LE(0).toString(16);
    expect(ref).assertEqual("78563412");
  });

  /**
   * @tc.name   testReadInt32LE0541
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21600
   * @tc.desc   Reads a signed, little-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt32LE0541", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    try {
      let ref = buf.readInt32LE(1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadInt16BE0550
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21700
   * @tc.desc   Reads a signed, big-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt16BE0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    let ref = buf.readInt16BE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name   testReadInt16BE0551
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21800
   * @tc.desc   Reads a signed, big-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt16BE0551", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    try {
      let ref = buf.readInt16BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadInt16LE0560
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_21900
   * @tc.desc   Reads a signed, little-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt16LE0560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    let ref = buf.readInt16LE(0).toString(16);
    expect(ref).assertEqual("3412");
  });

  /**
   * @tc.name   testReadInt16LE0561
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22000
   * @tc.desc   Reads a signed, little-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt16LE0561", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    try {
      let ref = buf.readInt16LE(1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadInt80570
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22100
   * @tc.desc   Reads a signed 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt80570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    buf.writeInt8(0x12);
    let ref = buf.readInt8(0).toString(16);
    expect(ref).assertEqual("12");
  });

  /**
   * @tc.name   testReadInt80571
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22200
   * @tc.desc   Reads a signed 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadInt80571", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(2);
    buf.writeInt8(0x12);
    try {
      let ref = buf.readInt8(2).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
    }
  });

  /**
   * @tc.name   testReadUInt16BE0580
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22300
   * @tc.desc   Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt16BE0580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16BE(0x1234, 0);
    let ref = buf.readUInt16BE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name   testReadUInt16BE0581
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22400
   * @tc.desc   Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt16BE0581", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16BE(0x1234, 0);
    try {
      let ref = buf.readUInt16BE(3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
    }
  });

  /**
   * @tc.name   testReadUInt16LE0590
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22500
   * @tc.desc   Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt16LE0590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16LE(0x1234, 0);
    let ref = buf.readUInt16LE(0).toString(16);
    expect(ref).assertEqual("1234");
  });

  /**
   * @tc.name   testReadUInt16LE0591
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22600
   * @tc.desc   Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt16LE0591", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16LE(0x1234, 0);
    try {
      let ref = buf.readUInt16LE(3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
    }
  });

  /**
   * @tc.name   testReadUInt32BE0600
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22700
   * @tc.desc   Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt32BE0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32BE(0x12345678, 0);
    let ref = buf.readUInt32BE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name   testReadUInt32BE0601
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22800
   * @tc.desc   Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt32BE0601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32BE(0x12345678, 0);
    try {
      let ref = buf.readUInt32BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadUInt32LE0610
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_22900
   * @tc.desc   Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt32LE0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    let ref = buf.readUInt32LE(0).toString(16);
    expect(ref).assertEqual("12345678");
  });

  /**
   * @tc.name   testReadUInt32LE0611
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23000
   * @tc.desc   Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt32LE0611", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    try {
      let ref = buf.readUInt32LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadUInt80620
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23100
   * @tc.desc   Reads an unsigned 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt80620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt8(0x42);
    let ref = buf.readUInt8(0).toString(16);
    expect(ref).assertEqual("42");
  });

  /**
   * @tc.name   testReadUInt80621
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23200
   * @tc.desc   Reads an unsigned 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUInt80621", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt8(0x42);
    try {
      let ref = buf.readUInt8(4).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: 4');
    }
  });

  /**
   * @tc.name   testReadUIntBE0630
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23300
   * @tc.desc   Reads an unsigned 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUIntBE0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntBE(0x13141516, 0, 4);
    let ref = buf.readUIntBE(0, 3).toString(16);
    expect(ref).assertEqual("131415");
  });

  /**
   * @tc.name   testReadUIntBE0631
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23400
   * @tc.desc   Reads an unsigned 8-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUIntBE0631", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntBE(0x13141516, 0, 4);
    try {
      let ref = buf.readUIntBE(2, 3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
    }
  });

  /**
   * @tc.name   testReadUIntLE0640
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23500
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUIntLE0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntLE(0x13141516, 0, 4);
    let ref = buf.readUIntLE(0, 3).toString(16);
    expect(ref).assertEqual("141516");
  });

  /**
   * @tc.name   testReadUIntLE0641
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23600
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadUIntLE0641", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntLE(0x13141516, 0, 4);
    try {
      let ref = buf.readUIntLE(2, 3).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
    }
  });

  /**
   * @tc.name   testReadIntBE0650
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23700
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadIntBE0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntBE(0x123456789011, 0, 6);
    let ref = buf.readIntBE(0, 5).toString(16);
    expect(ref).assertEqual("1234567890");
  });

  /**
   * @tc.name   testReadIntBE0651
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23800
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadIntBE0651", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntBE(0x123456789011, 0, 6);
    try {
      let ref = buf.readIntBE(2, 5).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
    }
  });

  /**
   * @tc.name   testReadIntLE0660
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_23900
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadIntLE0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntLE(0x123456789011, 0, 6);
    let ref = buf.readIntLE(0, 5).toString(16);
    expect(ref).assertEqual("3456789011");
  });

  /**
   * @tc.name   testReadIntLE0661
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24000
   * @tc.desc   Reads byteLength number of bytes from buf at the specified offset and interprets
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadIntLE0661", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntLE(0x123456789011, 0, 6);
    try {
      let ref = buf.readIntLE(2, 5).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
    }
  });

  /**
   * @tc.name   testReadDoubleBE0670
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24100
   * @tc.desc   Reads a 64-bit, big-endian double from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadDoubleBE0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    let ref = buf.readDoubleBE();
    expect(ref).assertEqual(123.456);
  });

  /**
   * @tc.name   testReadDoubleBE0671
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24200
   * @tc.desc   Reads a 64-bit, big-endian double from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadDoubleBE0671", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    try {
      let ref = buf.readDoubleBE(1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadDoubleLE0680
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24300
   * @tc.desc   Reads a 64-bit, little-endian double from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadDoubleLE0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleLE(123.456, 0);
    let ref = buf.readDoubleLE();
    expect(ref).assertEqual(123.456);
  });

  /**
   * @tc.name   testReadDoubleLE0681
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24400
   * @tc.desc   Reads a 64-bit, little-endian double from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadDoubleLE0681", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleLE(123.456, 0);
    try {
      let ref = buf.readDoubleLE(1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadFloatBE0690
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24500
   * @tc.desc   Reads a 32-bit, big-endian float from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadFloatBE0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatBE(0xcabcbcbc, 0);
    let ref = buf.readFloatBE(0).toString(16);
    expect(ref).assertEqual("cabcbd00");
  });

  /**
   * @tc.name   testReadFloatBE0691
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24600
   * @tc.desc   Reads a 32-bit, big-endian float from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadFloatBE0691", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatBE(0xcabcbcbc, 0);
    try {
      let ref = buf.readFloatBE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadFloatLE0700
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24700
   * @tc.desc   Reads a 32-bit, little-endian float from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadFloatLE0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    let ref = buf.readFloatLE(0).toString(16);
    expect(ref).assertEqual("cabcbd00");
  });

  /**
   * @tc.name   testReadFloatLE0701
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24800
   * @tc.desc   Reads a 32-bit, little-endian float from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadFloatLE0701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    try {
      let ref = buf.readFloatLE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadBigInt64BE0710
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_24900
   * @tc.desc   Reads a signed, big-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigInt64BE0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64BE(0).toString(16);
    expect(ref).assertEqual("102030405060708");
  });

  /**
   * @tc.name   testReadBigInt64BE0711
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25000
   * @tc.desc   Reads a signed, big-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigInt64BE0711", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    try {
      let ref = buf.readBigInt64BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadBigInt64LE0720
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25100
   * @tc.desc   Reads a signed, little-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigInt64LE0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64LE(0).toString(16);
    expect(ref).assertEqual("807060504030201");
  });

  /**
   * @tc.name   testReadBigInt64LE0721
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25200
   * @tc.desc   Reads a signed, little-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigInt64LE0721", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    try {
      let ref = buf.readBigInt64LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadBigUInt64BE0730
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25300
   * @tc.desc   Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigUInt64BE0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64BE(0).toString(16);
    expect(ref).assertEqual("decafafecacefade");
  });

  /**
   * @tc.name   testReadBigUInt64BE0731
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25400
   * @tc.desc   Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigUInt64BE0731", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    try {
      let ref = buf.readBigUInt64BE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testReadBigUInt64LE0740
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25500
   * @tc.desc   Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigUInt64LE0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64LE(0).toString(16);
    expect(ref).assertEqual("defacecafefacade");
  });

  /**
   * @tc.name   testReadBigUInt64LE0741
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25600
   * @tc.desc   Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testReadBigUInt64LE0741", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    try {
      let ref = buf.readBigUInt64LE(1).toString(16);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
    }
  });

  /**
   * @tc.name   testBufferLength0750
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25700
   * @tc.desc   Returns the number of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferLength0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("1236");
    let len = buf.length;
    expect(len).assertEqual(4);
  });

  /**
   * @tc.name   testBufferLength0751
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25800
   * @tc.desc   Returns the number of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferLength0751", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("1236");
    try {
      buf.length = 10;
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('length cannot be set for the buffer that has only a getter');
    }
  });

  /**
   * @tc.name   testBufferLength0752
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_25900
   * @tc.desc   Returns the number of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferLength0752", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("测试特殊字符$#@!");
    let len = buf.length;
    expect(len).assertEqual(22);
  });

  /**
   * @tc.name   testBufferByteOffset0755
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26000
   * @tc.desc   Returns the offset of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferByteOffset0755", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("1236");
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name   testBufferByteOffset0756
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26100
   * @tc.desc   Returns the offset of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferByteOffset0756", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name   testBufferByteOffset0757
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26200
   * @tc.desc   Returns the offset of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferByteOffset0757", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitializedFromPool(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });
  
  /**
   * @tc.name   testBufferByteOffset0758
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26300
   * @tc.desc   Returns the offset of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferByteOffset0758", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitialized(10);
    let offset = buf.byteOffset;
    expect(offset >= 0).assertTrue();
  });

  /**
   * @tc.name   testBufferByteOffset0759
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26400
   * @tc.desc   Returns the offset of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferByteOffset0759", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("1236");
    try {
      buf.byteOffset = 3;
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('byteOffset cannot be set for the buffer that has only a getter');
    }
  });

  /**
   * @tc.name   testBlobSize0760
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26500
   * @tc.desc   The total size of the Blob in bytes.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobSize0760", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let blob = new buffer.Blob(["a", "b", "c"]);
    let size = blob.size;
    expect(size).assertEqual(3);
  });

  /**
   * @tc.name   testBlobSize0761
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26600
   * @tc.desc   The total size of the Blob in bytes.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobSize0761", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let blob = new buffer.Blob([]);
    let size = blob.size;
    expect(size).assertEqual(0);
  });

  /**
   * @tc.name   testBlobSize0762
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26700
   * @tc.desc   The total size of the Blob in bytes.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobSize0762", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let blob = new buffer.Blob(["测试", "$#", "c"]);
    let size = blob.size;
    expect(size).assertEqual(9);
  });

  /**
   * @tc.name   testBlobType0770
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26800
   * @tc.desc   The content-type of the Blob.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobType0770", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let blob = new buffer.Blob(["a", "b", "c"], { type: "mime", endings: "transparent" });
    let type = blob.type;
    expect(type).assertEqual("mime");
  });

  /**
   * @tc.name   testBlobType0771
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_26900
   * @tc.desc   The content-type of the Blob.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBlobType0771", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let blob = new buffer.Blob(["a", "b", "c"]);
    let type = blob.type;
    expect(type).assertEqual("");
  });

  /**
   * @tc.name   testAllocUninitialized0780
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27000
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAllocUninitialized0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitialized(10);
    expect(buf.length).assertEqual(10);
  });

  /**
   * @tc.name   testAllocUninitialized0781
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27100
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAllocUninitialized0781", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.allocUninitialized(0);
    expect(buf.length).assertEqual(0);
  });

  /**
   * @tc.name   testAllocUninitialized0782
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27200
   * @tc.desc   Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testAllocUninitialized0782", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf = buffer.allocUninitialized(-5);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                      'negative. Received value is: -5');
    }
  });

   /**
    * @tc.name   testfrom0783
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27300
    * @tc.desc   For the object whose value returned by valueof() function is strictly equal to object
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testfrom0783", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      const buf = buffer.from(10);
    } catch (err) {
      expect(err.code).assertEqual(401);
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, ' +
                                      'Array-like. Received value is: number');
    }
  });

  /**
   * @tc.name   testBufferBuffer0784
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27400
   * @tc.desc   Returns the number of bytes in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testBufferBuffer0784", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.from("1236");
    let buf1 = buffer.from("123");
    try {
      buf.buffer = buf1;
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('buffer cannot be set for the buffer that has only a getter');
    }
  });

  /**
   * @tc.name   testToString0785
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27500
   * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testToString0785", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    try {
      let str = buf1.toString("code");
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                      'code is unknown');
    }
  });

  /**
   * @tc.name   testfrom0786
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27600
   * @tc.desc   For the object whose value returned by valueof() function is strictly equal to object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0786", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let arrayBuffer = new ArrayBuffer(5);
    let array = new Int8Array(arrayBuffer);
    array[0] = '1';
    array[1] = '2';
    array[2] = '3';
    array[3] = '4';
    array[4] = '5';
    try {
      const buf = buffer.from(arrayBuffer, 6, 1);
    } catch (err) {
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: 6');
    }
  });

  /**
   * @tc.name   testfrom0787
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27700
   * @tc.desc   The buffer handles a uint8array and decodes it with base64 and base64url.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testfrom0787', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let array = new Uint8Array([252,11,3,67,237,118,91,177,43]);
    let buf = buffer.from(array);
    let strUrl = buf.toString("base64url");
    let str = buf.toString("base64");
    expect(strUrl).assertEqual("_AsDQ-12W7Er");
    expect(str).assertEqual("/AsDQ+12W7Er");

    array = new Uint8Array([2,192,254,253,5,132,69]);
    buf = buffer.from(array);
    strUrl = buf.toString("base64url");
    str= buf.toString("base64");
    expect(strUrl).assertEqual("AsD-_QWERQ");
    expect(str).assertEqual("AsD+/QWERQ==");

    array = new Uint8Array([215,109,211,97,72,142,167,241]);
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

    array = new Uint8Array([252,97]);
    buf = buffer.from(array);
    strUrl = buf.toString("base64url");
    str = buf.toString("base64");
    expect(strUrl).assertEqual("_GE");
    expect(str).assertEqual("/GE=");

    array = new Uint8Array([252,97,142]);
    buf = buffer.from(array);
    strUrl = buf.toString("base64url");
    str = buf.toString("base64");
    expect(strUrl).assertEqual("_GGO");
    expect(str).assertEqual("/GGO");
  });

  /**
   * @tc.name   testByteLength0036
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27800
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testByteLength0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abc");
    let byteLen = buffer.byteLength(buf1);
    expect(byteLen).assertEqual(3);
  });
    
  /**
   * @tc.name   testByteLength0037
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_27900
   * @tc.desc   Returns the byte length of a string when encoded using `encoding`.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testByteLength0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.alloc(8);
    let byteLen = buffer.byteLength(buf1);
    expect(byteLen).assertEqual(8);
  });

   /**
    * @tc.name   testToString0038
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28000
    * @tc.desc   Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testToString0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let str = "abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
    let strbuf = buffer.from(str, "latin1");
    let toStr = strbuf.toString("latin1");
    expect(toStr).assertEqual("abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ");
   });

   /**
    * @tc.name   testLastIndexOf30000
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28100
    * @tc.desc   The index of the last occurrence of value in buf.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testLastIndexOf30000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("13236235");
    let index = buf1.lastIndexOf("23", 9999999999999);
    expect(index).assertEqual(5);
   });

   /**
    * @tc.name   testIncludes30010
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28200
    * @tc.desc   Returns true if value was found in buf, false otherwise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testIncludes30010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abcdefghigk");
    let flag = buf1.includes("f", -3);
    expect(flag).assertEqual(false);
   });

   /**
    * @tc.name   testIncludes30020
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28300
    * @tc.desc   Returns true if value was found in buf, false otherwise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testIncludes30020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abcdefghigk");
    let flag = buf1.includes("f", 9999999999999);
    expect(flag).assertEqual(false);
   });

   /**
    * @tc.name   testIncludes30030
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28400
    * @tc.desc   Returns true if value was found in buf, false otherwise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testIncludes30030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("abcdefghigk");
    let flag = buf1.includes("f", -9999999999999);
    expect(flag).assertEqual(true);
   });

   /**
    * @tc.name   testAlloc30040
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28500
    * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testAlloc30040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10, '');
    expect(buf.length).assertEqual(10);
   });

   /**
    * @tc.name   testAlloc30050
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28600
    * @tc.desc   Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("testAlloc30050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(20).fill('');
    expect(buf.length).assertEqual(20);
   });

  /**
   * @tc.name   testIndexOf30060
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28700
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf30060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123456789abcdefg");
    let index = buf1.indexOf("3", -1);
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name   testIndexOf30070
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28800
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf30070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123456789abcdefg");
    let index = buf1.indexOf("3", 99999999999999);
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name   testIndexOf30080
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_28900
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf30080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("123456789abcdefg");
    let index = buf1.indexOf("3", -99999999999999);
    expect(index).assertEqual(2);
  });

  /**
   * @tc.name   testIndexOf30090
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29000
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf30090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("This is a buffer");
    let index = buf1.indexOf("is", -5);
    expect(index).assertEqual(-1);
  });

  /**
   * @tc.name   testIndexOf30100
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29100
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testIndexOf30100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.from("This is a buffer");
    let index = buf1.indexOf("f", -20);
    expect(index).assertEqual(12);
  });

  /**
   * @tc.name   testFrom30110
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29200
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFrom30110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf1 = buffer.from(null);
    } catch(err) {
      let errStr = 'Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like, string, object. Received value is: null';
      expect(err.code).assertEqual(401);
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual(errStr);
    }
  });

  /**
   * @tc.name   testFrom30120
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29300
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFrom30120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let buf1 = buffer.from(undefined);
    } catch(err) {
      let errStr = 'Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined';
      expect(err.code).assertEqual(401);
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual(errStr);
    }
  });

  /**
   * @tc.name   testFrom30130
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29400
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFrom30130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let dateObj = new Date();
    let buf1 = buffer.from(dateObj, 0, 5);
    expect(buf1.length > 0).assertTrue();
  });

  /**
   * @tc.name   testFrom30140
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29500
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFrom30140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let obj = new Map()
      let buf1 = buffer.from(obj, 0, 5);
    } catch(err) {
      let errStr = 'Parameter error. The type of "value" must be Buffer or ArrayBuffer, Array, Array-like. Received value is: Map';
      expect(err.code).assertEqual(401);
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual(errStr);
    }
  });

  /**
   * @tc.name   testFrom30150
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29600
   * @tc.desc   The index of the first occurrence of value in buf.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testFrom30150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let arrBuf = new ArrayBuffer(10);
      let buf1 = buffer.from(arrBuf, -1);
    } catch(err) {
      let errStr = 'The value of "byteOffset" is out of range. It must be >= 0 and <= 10. Received value is: -1';
      expect(err.code).assertEqual(10200001);
      expect(err.name).assertEqual('BusinessError');
      expect(err.message).assertEqual(errStr);
    }
  });

  /**
   * @tc.name   testCopy0147
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29700
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 8);
    expect(num).assertEqual(2);
    let str = uint8array.toString();
    expect(str).assertEqual("0,0,0,0,0,0,0,0,1,2");
  });

  /**
   * @tc.name   testCopy0148
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29800
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 0, 3);
    expect(num).assertEqual(4);
    let str = uint8array.toString();
    expect(str).assertEqual("4,5,6,7,0,0,0,0,0,0");
  });

  /**
   * @tc.name   testCopy0149
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_29900
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 0, 3, 255);
    expect(num).assertEqual(4);
    let str = uint8array.toString();
    expect(str).assertEqual("4,5,6,7,0,0,0,0,0,0");
  });

  /**
   * @tc.name   testCopy0150
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30000
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 100, 3, 255);
    expect(num).assertEqual(0);
    let str = uint8array.toString();
    expect(str).assertEqual("0,0,0,0,0,0,0,0,0,0");
  });

  /**
   * @tc.name   testCopy0151
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30100
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let uint8array = new Uint8Array(10).fill(0);
      const buf = buffer.from([1,2,3,4,5,6,7]);
      let num = buf.copy(uint8array, -1, 3, 100);
    } catch (err) {
        expect(err.code).assertEqual(10200001);
    }
  });

  /**
   * @tc.name   testCopy0152
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30200
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 0, 9, 1);
    expect(num).assertEqual(0);
    let str = uint8array.toString();
    expect(str).assertEqual("0,0,0,0,0,0,0,0,0,0");
  });

  /**
   * @tc.name   testCopy0153
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30300
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(0);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7]);
    let num = buf.copy(uint8array, 9, 1, 5);
    expect(num).assertEqual(1);
    let str = uint8array.toString();
    expect(str).assertEqual("0,0,0,0,0,0,0,0,0,2");
  });

  /**
   * @tc.name   testCopy0154
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30400
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    try {
      let uint8array = new Uint8Array(10).fill(0);
      const buf = buffer.from([1,2,3,4,5,6,7]);
      let num = buf.copy(uint8array, 2, 3, -1);
    } catch (err) {
        expect(err.code).assertEqual(10200001);
    }
  });

  /**
   * @tc.name   testCopy0155
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30500
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let uint8array = new Uint8Array(10).fill(9);
    const buf = buffer.from([1,2,3,4,5,6,7]);
    let num = buf.copy(uint8array, 9, 1, undefined);
    expect(num).assertEqual(1);
    let str = uint8array.toString();
    expect(str).assertEqual("9,9,9,9,9,9,9,9,9,2");
  });

  /**
   * @tc.name   testCopy0156
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30600
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf1 = buffer.alloc(1024);
    let buf2 = buffer.alloc(512);
    let cntr = 0;
    // copy 512 bytes, from 0 to 512.
    buf1.fill(++cntr);
    buf2.fill(++cntr);
    let copied = buf1.copy(buf2, 0, 0, 1024);
    expect(copied).assertEqual(512);
    for (let i = 0; i < buf2.length; i++) {
      if(cntr - 1 != buf2[i]) {
        expect(copied).assertEqual(0);
      }
    }
  });

  /**
   * @tc.name   testCopy0157
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30700
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    let buf1 = buffer.alloc(10).fill('!');
    for (let i = 0; i < 10; i++) {
      buf[i] = i + 97;
    }
    let len = buf.copy(buf1, 0, 4, 10);
    expect(len).assertEqual(6);
    expect(buf1.toString()).assertEqual('efghij!!!!');
  });

  /**
   * @tc.name   testCopy0158
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30800
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    for (let i = 0; i < 10; i++) {
      buf[i] = i + 97;
    }
    let len = buf.copy(buf, 0, 4, 10);
    expect(len).assertEqual(6);
    expect(buf.toString()).assertEqual('efghijghij');
  });

  /**
   * @tc.name   testCopy0159
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_30900
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    for (let i = 0; i < 10; i++) {
      buf[i] = i + 97;
    }
    let len = buf.copy(buf, 2, 4);
    expect(len).assertEqual(6);
    expect(buf.toString()).assertEqual('abefghijij');
  });

  /**
   * @tc.name   testCopy0160
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31000
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    for (let i = 0; i < 10; i++) {
      buf[i] = i + 97;
    }
    let len = buf.copy(buf, 2);
    expect(len).assertEqual(8);
    expect(buf.toString()).assertEqual('ababcdefgh');
  });

  /**
   * @tc.name   testCopy0161
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31100
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testCopy0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let buf = buffer.alloc(10);
    for (let i = 0; i < 10; i++) {
      buf[i] = i + 97;
    }
    let len = buf.copy(buf, 8);
    expect(len).assertEqual(2);
    expect(buf.toString()).assertEqual('abcdefghab');
  });

  /**
   * @tc.name   testfrom0788
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31200
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0788", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let sharedArr = new SharedArrayBuffer(20)
    let uint8Arr = new Uint8Array(sharedArr);
    uint8Arr[16] = 9;
    let bufObj = buffer.from(sharedArr, 0, 20);
    uint8Arr[15] = 10;
    expect(bufObj.length).assertEqual(20);
    expect(JSON.stringify(bufObj)).assertEqual('{"type":"Buffer","data":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,9,0,0,0]}');
  });

  /**
   * @tc.name   testfrom0789
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31300
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0789", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let sharedArr = new SharedArrayBuffer(10)
    let uint8Arr = new Uint8Array(sharedArr);
    uint8Arr[9] = 9;
    let bufObj = buffer.from(sharedArr, 5, 5);
    uint8Arr[1] = 10;
    expect(bufObj.length).assertEqual(5);
    expect(JSON.stringify(bufObj)).assertEqual('{"type":"Buffer","data":[0,0,0,0,9]}');
  });

  /**
   * @tc.name   testfrom0790
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31400
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let sharedArr = new SharedArrayBuffer(1000)
    let bufObj = buffer.from(sharedArr, 5, undefined);
    expect(bufObj.length).assertEqual(995);
  });

  /**
   * @tc.name   testfrom0791
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31500
   * @tc.desc   Copies data from a region of buf to a region in target,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testfrom0791", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let sharedArr = new SharedArrayBuffer(10)
    let bufObj = buffer.from(sharedArr, undefined, 6);
    expect(bufObj.length).assertEqual(6);
  });

       /**
        * @tc.name   testfrom0792
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31600
        * @tc.desc   Create a new buffer containing parameter is non integer
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it("testfrom0792", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let ab = new ArrayBuffer(100);
        let buf = buffer.from(ab, 1.2, 1.2);
        let res = buf.toString('hex');
        expect(res).assertEqual('00');
    });
  
    /**
     * @tc.name   testfrom0793
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31700
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0793", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let ab = new ArrayBuffer(100);
        let buf = buffer.from(ab, 1, 1.2);
        let res = buf.toString('hex');
        expect(res).assertEqual('00');
    });
  
       /**
        * @tc.name   testfrom0794
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31800
        * @tc.desc   Create a new buffer containing parameter is non integer
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it("testfrom0794", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let ab = new ArrayBuffer(100);
        let buf = buffer.from(ab, 1.2, 1);
        let res = buf.toString('hex');
        expect(res).assertEqual('00');
    });
  
    /**
     * @tc.name   testfrom0795
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_31900
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0795", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let ab = new ArrayBuffer(100);
        let buf = buffer.from(ab, 9.9, 9.9);
        let res = buf.toString('hex');
        expect(res).assertEqual('000000000000000000');
    });
  
     /**
      * @tc.name   testfrom0796
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_32000
      * @tc.desc   Create a new buffer containing parameter is non integer
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it("testfrom0796", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let ab = new ArrayBuffer(100);
      let buf = buffer.from(ab, 2.9, 2.9);
      let res = buf.toString('hex');
      expect(res).assertEqual('0000');
    });

    /**
     * @tc.name   testfrom0275
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_32700
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let buf = buffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('buffer', -4)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -5)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -6)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -7)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 1)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', 5)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 6)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 15)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 19)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 20)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 23)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 9999)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -20)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', -999)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', -1)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -22)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer')).assertEqual(17);
    });

    /**
     * @tc.name   testfrom0276
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_32800
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let buf = buffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('is',undefined)).assertEqual(12);
      expect(buf.lastIndexOf('is', null, 'utf8')).assertEqual(-1);
      expect(buf.lastIndexOf('is', 20, 'utf16le')).assertEqual(-1);
      expect(buf.lastIndexOf('is', 1)).assertEqual(-1);
    });

    /**
     * @tc.name   testfrom0277
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_32900
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let buf = buffer.from([11,12,13,14,15,16,17,18,19])
      expect(buf.lastIndexOf(13,-1)).assertEqual(2);
      expect(buf.lastIndexOf(13,-999)).assertEqual(-1);
      expect(buf.lastIndexOf(13,2)).assertEqual(2);
      expect(buf.lastIndexOf(13,3)).assertEqual(2);
      expect(buf.lastIndexOf(14,8)).assertEqual(3);
      expect(buf.lastIndexOf(20,15)).assertEqual(-1);
    });

    /**
     * @tc.name   testfrom0278
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BUFFER_33000
     * @tc.desc   Create a new buffer containing parameter is non integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfrom0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let buf = buffer.from([11,12,13,14,15,16,17,18,19]);
        let buf1 = buffer.from([1,2,3,4,5,6,8,9,19])
        buf.compare(buf1, 2, 9, -8, 8);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });
})}