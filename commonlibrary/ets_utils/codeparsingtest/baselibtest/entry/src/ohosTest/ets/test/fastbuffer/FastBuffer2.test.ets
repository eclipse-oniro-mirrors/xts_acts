/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import buffer from "@ohos.fastbuffer";

export default function ActsFastBufferTest() {
  describe("ActsFastBufferTest", () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0100
     * @tc.name       : testFastBufferAlloc0001
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0001';
      try {
        let buf1 = buffer.alloc(0);
        expect(buf1.length).assertEqual(0);
        expect(buf1.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0200
     * @tc.name       : testFastBufferAlloc0002
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0002';
      try {
        let buf2 = buffer.alloc(3, 'a');
        expect(buf2.length).assertEqual(3);
        expect(buf2.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0300
     * @tc.name       : testFastBufferAlloc0003
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0003';
      try {
        let buf3 = buffer.alloc(5, buffer.from('hello'));
        const result = buf3.toString();
        console.log(`${TAG}result${result}`);
        expect(buf3.toString()).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0400
     * @tc.name       : testFastBufferAlloc0004
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0004';
      try {
        let buf4 = buffer.alloc(0, 0);
        const result = buf4.toString();
        console.log(`${TAG}result${result}`);
        expect(buf4.length).assertEqual(0);
        expect(buf4.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0500
     * @tc.name       : testFastBufferAlloc0005
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0005';
      try {
        let buf5 = buffer.alloc(0, -1);
        expect(buf5.length).assertEqual(0);
        expect(buf5.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0600
     * @tc.name       : testFastBufferAlloc0006
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0006';
      try {
        let buf6 = buffer.alloc(0, Infinity);
        expect(buf6.length).assertEqual(0);
        expect(buf6.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0700
     * @tc.name       : testFastBufferAlloc0007
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0007';
      try {
        let buf7 = buffer.alloc(0, -Infinity);
        expect(buf7.length).assertEqual(0);
        expect(buf7.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0800
     * @tc.name       : testFastBufferAlloc0008
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0008';
      try {
        let buf8 = buffer.alloc(3, 1);
        expect(buf8.length).assertEqual(3);
        for (let i = 0; i < buf8.length; i++) {
          expect(buf8[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_0900
     * @tc.name       : testFastBufferAlloc0009
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0009';
      try {
        let buf9 = buffer.alloc(3, '');
        expect(buf9.length).assertEqual(3);
        for (let i = 0; i < buf9.length; i++) {
          expect(buf9[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1000
     * @tc.name       : testFastBufferAlloc0010
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0010';
      try {
        let buf10 = buffer.alloc(3, undefined);
        expect(buf10.length).assertEqual(3);
        for (let i = 0; i < buf10.length; i++) {
          expect(buf10[i]).assertEqual(0);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1100
     * @tc.name       : testFastBufferAlloc0011
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0011';
      try {
        let buf11 = buffer.alloc(11, 'aGVsbG8gd29ybGQ=', 'base64');
        console.log(`${TAG} buf11:${buf11.toString()}`);
        expect(buf11.length).assertEqual(11);
        expect(buf11.toString()).assertEqual('hello world');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1200
     * @tc.name       : testFastBufferAlloc0012
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0012';
      try {
        let buf12 = buffer.alloc(3, 'hello', 'utf8');
        expect(buf12.length).assertEqual(3);
        expect(buf12.toString()).assertEqual('hel');
        expect(buf12.toString('base64')).assertEqual('aGVs');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1300
     * @tc.name       : testFastBufferAlloc0013
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0013';
      try {
        let buf = buffer.alloc(0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1400
     * @tc.name       : testFastBufferAlloc0014
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0014';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1500
     * @tc.name       : testFastBufferAlloc0015
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0015';
      try {
        let buf = buffer.alloc(0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1600
     * @tc.name       : testFastBufferAlloc0016
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0016';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1700
     * @tc.name       : testFastBufferAlloc0017
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0017';
      try {
        let buf = buffer.alloc(0, -1, 'utf-8');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ALLOC_1800
     * @tc.name       : testFastBufferAlloc0018
     * @tc.desc       : Test the function of the interface Alloc.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferAlloc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferAlloc0018';
      try {
        let buf = buffer.alloc(0, -1, 'base64');
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0100
     * @tc.name       : testFastBufferByteLength0001
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0001';
      try {
        let str = '\u00bd + \u00bc = \u00be'
        const res = buffer.byteLength(str);
        expect(res).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0200
     * @tc.name       : testFastBufferByteLength0002
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0002';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0300
     * @tc.name       : testFastBufferByteLength0003
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0003';
      try {
        let uint8Array = new Uint8Array([0x74, 0x79, 0x70, 0x65, 0x64]);
        const res = buffer.byteLength(uint8Array);
        expect(res).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0400
     * @tc.name       : testFastBufferByteLength0004
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0004';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        let dataView = new DataView(arrayBuffer);
        const res = buffer.byteLength(dataView);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0500
     * @tc.name       : testFastBufferByteLength0005
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0005';
      try {
        let arrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength(arrayBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0600
     * @tc.name       : testFastBufferByteLength0006
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0006';
      try {
        const sharedBuffer = new SharedArrayBuffer(8);
        expect(buffer.byteLength(sharedBuffer)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0700
     * @tc.name       : testFastBufferByteLength0007
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0007';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'utf8');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0800
     * @tc.name       : testFastBufferByteLength0008
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0008';
      try {
        let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        const res = buffer.byteLength(buf, 'base64');
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_0900
     * @tc.name       : testFastBufferByteLength0009
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0009';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView);
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_1000
     * @tc.name       : testFastBufferByteLength0010
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testFastBufferByteLength0010';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'utf8');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_BYTE_LENGTH_1100
     * @tc.name       : testFastBufferByteLength0011
     * @tc.desc       : Test the function of the interface ByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferByteLength0011';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const dataView = new DataView(arrayBuffer);
        dataView.setUint8(0, 104);
        dataView.setUint8(1, 101);
        dataView.setUint8(2, 108);
        dataView.setUint8(3, 108);
        dataView.setUint8(4, 111);
        let buf = buffer.byteLength(dataView, 'base64');
        expect(buf).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0100
     * @tc.name       : testFastBufferConcat0001
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0001';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf = buffer.concat([buf1, buf2]);
        expect(buf.length).assertEqual(8);
        expect(buf.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0200
     * @tc.name       : testFastBufferConcat0002
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFastBufferConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0002';
      try {
        let uint8Arr1 = new Uint8Array([1, 2, 3, 4]);
        let uint8Arr2 = new Uint8Array([5, 6, 7, 8]);
        let buf3 = buffer.concat([uint8Arr1, uint8Arr2]);
        expect(buf3.toString('hex')).assertEqual('0102030405060708');
        expect(buf3.length).assertEqual(8);
        expect(buf3.toString('utf8')).assertEqual('\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0300
     * @tc.name       : testFastBufferConcat0003
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0003';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf4 = buffer.concat([buf1, buf2], undefined);
        expect(buf4.toString('hex')).assertEqual('3132333461626364');
        expect(buf4.length).assertEqual(8);
        expect(buf4.toString('utf8')).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0400
     * @tc.name       : testFastBufferConcat0004
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0004';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        let buf5 = buffer.concat([buf1, buf2], 0);
        expect(buf5.toString()).assertEqual('1234abcd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0500
     * @tc.name       : testFastBufferConcat0005
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0005';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967295. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0600
     * @tc.name       : testFastBufferConcat0006
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      6
      const TAG = 'testFastBufferConcat0006';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967295. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0700
     * @tc.name       : testFastBufferConcat0007
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0007';
      try {
        let buf1 = buffer.from("1234");
        let buf2 = buffer.from("abcd");
        buffer.concat([buf1, buf2], -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967295. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0800
     * @tc.name       : testFastBufferConcat0008
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level
     */
    it('testFastBufferConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0008';
      try {
        let buf1 = buffer.from("L234");
        let buf2 = buffer.from("abcd");
        let buf3 = buffer.concat([buf1, buf2], 1);
        expect(buf3.toString()).assertEqual('L');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_0900
     * @tc.name       : testFastBufferConcat0009
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0009';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "totalLength" is out of range. It must be >= 0 and <= 4294967295. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_CONCAT_1000
     * @tc.name       : testFastBufferConcat0010
     * @tc.desc       : Test the function of the interface Concat.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferConcat0010';
      try {
        const arr1 = new Uint8Array([104, 101, 108, 108, 111]);
        const arr2 = new Uint8Array([119, 111, 114, 108, 100]);
        const buf1 = buffer.from(arr1);
        const buf2 = buffer.from(arr2);
        const concatBuf = buffer.concat([buf1, buf2], 1);
        expect(concatBuf.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0100
     * @tc.name       : testFastBufferFrom10001
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10001';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf1 = buffer.from(ab1);
        expect(buf1.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0200
     * @tc.name       : testFastBufferFrom10002
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10002';
      try {
        const ab2 = new SharedArrayBuffer(8);
        const buf2 = buffer.from(ab2);
        expect(buf2.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0300
     * @tc.name       : testFastBufferFrom10003
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10003';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf3 = buffer.from(ab1, undefined);
        expect(buf3.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0400
     * @tc.name       : testFastBufferFrom10004
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10004';
      try {
        const ab1 = new ArrayBuffer(8);
        const buf4 = buffer.from(ab1, 0);
        expect(buf4.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0500
     * @tc.name       : testFastBufferFrom10005
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10005';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0600
     * @tc.name       : testFastBufferFrom10006
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10006';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0700
     * @tc.name       : testFastBufferFrom10007
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10007';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0800
     * @tc.name       : testFastBufferFrom10008
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10008';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 4, 0);
        expect(res.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_0900
     * @tc.name       : testFastBufferFrom10009
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10009';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_1000
     * @tc.name       : testFastBufferFrom10010
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10010';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: Infinity')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_1100
     * @tc.name       : testFastBufferFrom10011
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10011';
      try {
        const ab1 = new ArrayBuffer(8);
        buffer.from(ab1, 0, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 8. Received value is: -Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_1200
     * @tc.name       : testFastBufferFrom10012
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10012';
      try {
        const ab1 = new ArrayBuffer(8);
        const res = buffer.from(ab1, 0, 1);
        expect(ab1.byteLength).assertEqual(8);
        expect(res.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_1300
     * @tc.name       : testFastBufferFrom10013
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10013';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM1_1400
     * @tc.name       : testFastBufferFrom10014
     * @tc.desc       : Test the function of the interface From1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom10014';
      try {
        const arrayBuffer = new ArrayBuffer(5);
        const uint8Array = new Uint8Array(arrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111]);
        const buf = buffer.from(arrayBuffer, Infinity, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: Infinity');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0100
     * @tc.name       : testFastBufferFrom20001
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20001';
      try {
        const buf1 = buffer.from('test');
        const buf2 = buffer.from(buf1);
        expect(buf2.toString()).assertEqual('test');
        buf1[0] = 'T'.charCodeAt(0);
        expect(buf2.toString()).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0200
     * @tc.name       : testFastBufferFrom20002
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20002';
      try {
        const uint8Arr = new Uint8Array([1, 2, 3]);
        const buf3 = buffer.from(uint8Arr);
        const result: number[] = [];
        for (let i = 0; i < buf3.length; i++) {
          result.push(buf3[i]);
        }
        console.log(`${TAG} result: ${result}`);
        expect(result.join(',')).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0300
     * @tc.name       : testFastBufferFrom20003
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20003';
      try {
        const result = buffer.from('invalid');
        expect(result.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0400
     * @tc.name       : testFastBufferFrom20004
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20004';
      try {
        buffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The type of "value" must be FastBuffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0500
     * @tc.name       : testFastBufferFrom20005
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20005';
      try {
        const emptyBuf = buffer.from(new Uint8Array(0));
        expect(emptyBuf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0600
     * @tc.name       : testFastBufferFrom20006
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20006';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0700
     * @tc.name       : testFastBufferFrom20007
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20007';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM2_0800
     * @tc.name       : testFastBufferFrom20008
     * @tc.desc       : Test the function of the interface From2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom20008';
      try {
        const sharedArrayBuffer = new SharedArrayBuffer(10);
        const uint8Array = new Uint8Array(sharedArrayBuffer);
        uint8Array.set([104, 101, 108, 108, 111, 119, 111, 114, 108, 100]);
        const buf = buffer.from(sharedArrayBuffer, 0, 0);
        expect(buf.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM4_0100
     * @tc.name       : testFastBufferFrom40001
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom40001';
      try {
        let buf = buffer.from('this is a test');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM4_0200
     * @tc.name       : testFastBufferFrom40002
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom40002';
      try {
        let buf = buffer.from('abc', 'base64');
        expect(buf.toString()).assertEqual('i·');
        expect(buf.length).assertEqual(2);
        expect(buf.toString('base64')).assertEqual('abc=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FROM4_0300
     * @tc.name       : testFastBufferFrom40003
     * @tc.desc       : Test the function of the interface From4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFrom40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFrom40003';
      try {
        let buf = buffer.from('this is a test', 'utf-8');
        expect(buf.length).assertEqual(14);
        expect(buf.toString()).assertEqual('this is a test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COMPARE_0100
     * @tc.name       : testFastBufferCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCompare0001';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = buffer.from('0123');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COMPARE_0200
     * @tc.name       : testFastBufferCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCompare0002';
      try {
        let buf1 = buffer.from('1234');
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let res = buf1.compare(buf2);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COMPARE_0300
     * @tc.name       : testFastBufferCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCompare0003';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = buffer.from('1234');
        let res = buf2.compare(buf1);
        console.info(Number(res).toString());
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COMPARE_0400
     * @tc.name       : testFastBufferCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCompare0004';
      try {
        let buf1 = new Uint8Array([1, 2, 3, 4]);
        let buf2 = new Uint8Array([1, 2, 3, 4]);
        let buf1Buffer = buffer.from(buf1);
        let buf2Buffer = buffer.from(buf2);
        let res = buf1Buffer.compare(buf2Buffer);
        console.info(Number(res).toString());
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0100
     * @tc.name       : testFastBufferTranscode0001
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0001';
      try {
        let buf = buffer.from('€')
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.toString()).assertEqual('€');
        expect(newBuf.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0200
     * @tc.name       : testFastBufferTranscode0002
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0002';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString()).assertEqual('aGVsbG8gd29ybGQ=');
        expect(newBuf.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0300
     * @tc.name       : testFastBufferTranscode0003
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0003';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        console.log(`${TAG} newBuf:${newBuf}`);
        expect(newBuf.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0400
     * @tc.name       : testFastBufferTranscode0004
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0004';
      try {
        let buf = buffer.from('hello world');
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString()).assertEqual('hello world');
        expect(newBuf.length).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0500
     * @tc.name       : testFastBufferTranscode0005
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0005';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'base64');
        expect(newBuf.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0600
     * @tc.name       : testFastBufferTranscode0006
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0006';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'base64', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0700
     * @tc.name       : testFastBufferTranscode0007
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0007';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'base64');
        expect(newBuf.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TRANSCODE_0800
     * @tc.name       : testFastBufferTranscode0008
     * @tc.desc       : Test the function of the interface Transcode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferTranscode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferTranscode0008';
      try {
        let buf = new Uint8Array([1, 2, 3, 4]);
        let newBuf = buffer.transcode(buf, 'utf-8', 'utf-8');
        expect(newBuf.toString('utf-8')).assertEqual('1,2,3,4');
        expect(newBuf.length).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0100
     * @tc.name       : testFastBufferFill0001
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0001';
      try {
        const buf = buffer.allocUninitializedFromPool(5);
        buf.fill(0x41);
        const result = buf.toString('utf-8');
        expect(result).assertEqual('AAAAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0200
     * @tc.name       : testFastBufferFill0002
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0002';
      try {
        const buf = buffer.allocUninitializedFromPool(3);
        buf.fill('a');
        expect(buf.toString()).assertEqual('aaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0300
     * @tc.name       : testFastBufferFill0003
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0003';
      try {
        let buf1 = buffer.from([1])
        let buf2 = buffer.allocUninitializedFromPool(4);
        buf2.fill(buf1)
        for (let i = 0; i < buf2.length; i++) {
          expect(buf2[i]).assertEqual(1);
        }
        let expectedBuf = buffer.from([1, 1, 1, 1]);
        expect(buf2.equals(expectedBuf)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0400
     * @tc.name       : testFastBufferFill0004
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0004';
      try {
        let uint = new Uint8Array([0x48, 0x49]);
        let buf = buffer.allocUninitializedFromPool(5);
        buf.fill(uint);
        let expectedBuf = buffer.from([72, 73, 72, 73, 72]);
        expect(buf.equals(expectedBuf)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0500
     * @tc.name       : testFastBufferFill0005
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0005';
      try {
        const buf = buffer.alloc(3)
        buf.fill(3)
        const res = buffer.from([3, 3, 3]);
        expect(buf.equals(res)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0600
     * @tc.name       : testFastBufferFill0006
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0006';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', 0);
        expect(buf.toString()).assertEqual('DDDDDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0700
     * @tc.name       : testFastBufferFill0007
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0007';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 6. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0800
     * @tc.name       : testFastBufferFill0008
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0008';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 6. Received value is: inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_0900
     * @tc.name       : testFastBufferFill0009
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0009';
      try {
        const buf = buffer.alloc(6);
        buf.fill('D', -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 6. Received value is: -inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1000
     * @tc.name       : testFastBufferFill0010
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0010';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 1);
        expect(buf.toString()).assertEqual('\x00AA');
        expect(buf[1]).assertEqual(0x41);
        expect(buf[2]).assertEqual(0x41);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1100
     * @tc.name       : testFastBufferFill0011
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0011';
      try {
        const buf = buffer.alloc(3)
        buf.fill('A', 0, 0);
        expect(buf.toString()).assertEqual('\x00\x00\x00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1200
     * @tc.name       : testFastBufferFill0012
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0012';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, 5, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1300
     * @tc.name       : testFastBufferFill0013
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0013';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, 5, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1400
     * @tc.name       : testFastBufferFill0014
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0014';
      try {
        const buf = buffer.alloc(5);
        buf.fill(0x4B, 5, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "end" is out of range. It must be >= 0 and <= 5. Received value is: -inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1500
     * @tc.name       : testFastBufferFill0015
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0015';
      try {
        const buf = buffer.alloc(3);
        buf.fill('A', 0, 1);
        expect(buf.toString()).assertEqual('A\x00\x00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1600
     * @tc.name       : testFastBufferFill0016
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0016';
      try {
        const buf = buffer.alloc(5);
        buf.fill('A', 0, 5, 'base64');
        expect(buf.toString('base64')).assertEqual('AAAAAAA=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FILL_1700
     * @tc.name       : testFastBufferFill0017
     * @tc.desc       : Test the function of the interface Fill.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFill0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFill0017';
      try {
        const buf = buffer.alloc(5);
        buf.fill('a', 0, 5, 'utf8');
        expect(buf.toString('utf8')).assertEqual('aaaaa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0100
     * @tc.name       : testFastBufferFastBufferCompare0001
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0001';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        expect(buf1.compare(buf2)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0200
     * @tc.name       : testFastBufferFastBufferCompare0002
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0002';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([0, 2, 3]);
        expect(buf1.compare(u8)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0300
     * @tc.name       : testFastBufferFastBufferCompare0003
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0003';
      try {
        const buf1 = buffer.from([3, 2, 1]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, 0);
        expect(buf1.compare(buf2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0400
     * @tc.name       : testFastBufferFastBufferCompare0004
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0004';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0500
     * @tc.name       : testFastBufferFastBufferCompare0005
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0005';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 3. Received value is: inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0600
     * @tc.name       : testFastBufferFastBufferCompare0006
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0006';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, -Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 3. Received value is: -inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0700
     * @tc.name       : testFastBufferFastBufferCompare0007
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0007';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([3, 2, 1]);
        const result = buf1.compare(buf2, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0800
     * @tc.name       : testFastBufferFastBufferCompare0008
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0008';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_0900
     * @tc.name       : testFastBufferFastBufferCompare0009
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0009';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, 0);
        const result = buf1.compare(buf2);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1000
     * @tc.name       : testFastBufferFastBufferCompare0010
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0010';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1100
     * @tc.name       : testFastBufferFastBufferCompare0011
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0011';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3, 4]);
        const result = buf1.compare(buf2, undefined, Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 4. Received value is: inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1200
     * @tc.name       : testFastBufferFastBufferCompare0012
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0012';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, -Infinity);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetEnd" is out of range. It must be >= 0 and <= 3. Received value is: -inf');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1300
     * @tc.name       : testFastBufferFastBufferCompare0013
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0013';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1400
     * @tc.name       : testFastBufferFastBufferCompare0014
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0014';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([4, 5, 6]);
        buf1.compare(buf2, undefined, undefined);
        expect(buf1.compare(buf2, undefined, undefined)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1500
     * @tc.name       : testFastBufferFastBufferCompare0015
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0015';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1600
     * @tc.name       : testFastBufferFastBufferCompare0016
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0016';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1700
     * @tc.name       : testFastBufferFastBufferCompare0017
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0017';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 3. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1800
     * @tc.name       : testFastBufferFastBufferCompare0018
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0018';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        buf1.compare(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 3. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_1900
     * @tc.name       : testFastBufferFastBufferCompare0019
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0019';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, 1);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2000
     * @tc.name       : testFastBufferFastBufferCompare0020
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0020';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2100
     * @tc.name       : testFastBufferFastBufferCompare0021
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0021';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 0);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2200
     * @tc.name       : testFastBufferFastBufferCompare0022
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0022';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -1);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2300
     * @tc.name       : testFastBufferFastBufferCompare0023
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0023';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2400
     * @tc.name       : testFastBufferFastBufferCompare0024
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0024';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 3. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_FASTBUFFERCOMPARE_2500
     * @tc.name       : testFastBufferFastBufferCompare0025
     * @tc.desc       : Test the function of the interface Compare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferFastBufferCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferFastBufferCompare0025';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const buf2 = buffer.from([1, 2, 3]);
        const result = buf1.compare(buf2, undefined, undefined, undefined, 1);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0100
     * @tc.name       : testFastBufferCopy0001
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0200
     * @tc.name       : testFastBufferCopy0002
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0002';
      try {
        const buf1 = buffer.alloc(26);
        for (let i = 0; i < 26; i++) {
          buf1[i] = i + 97;
        }
        const buf2 = new Uint8Array(26);
        buf1.copy(buf2);
        for (let i = 0; i < 26; i++) {
          expect(buf2[i]).assertEqual(97 + i);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0300
     * @tc.name       : testFastBufferCopy0003
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0400
     * @tc.name       : testFastBufferCopy0004
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0004';
      try {
        let buf1 = buffer.alloc(6);
        let buf2 = buffer.alloc(6).fill('!');
        buf1.copy(buf2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0500
     * @tc.name       : testFastBufferCopy0005
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0600
     * @tc.name       : testFastBufferCopy0006
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0700
     * @tc.name       : testFastBufferCopy0007
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, 1);
        expect(buf2.toString()).assertEqual('!abcdefghijklmnopqrstuvwxy');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0800
     * @tc.name       : testFastBufferCopy0008
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_0900
     * @tc.name       : testFastBufferCopy0009
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 0);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1000
     * @tc.name       : testFastBufferCopy0010
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1100
     * @tc.name       : testFastBufferCopy0011
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1200
     * @tc.name       : testFastBufferCopy0012
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0012';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1300
     * @tc.name       : testFastBufferCopy0013
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0013';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, 1);
        expect(buf2.toString()).assertEqual('bcdefghijklmnopqrstuvwxyz!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1400
     * @tc.name       : testFastBufferCopy0014
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0014';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1500
     * @tc.name       : testFastBufferCopy0015
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0015';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 0);
        expect(buf2.toString()).assertEqual('!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1600
     * @tc.name       : testFastBufferCopy0016
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0016';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 26. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1700
     * @tc.name       : testFastBufferCopy0017
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0017';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 26. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1800
     * @tc.name       : testFastBufferCopy0018
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0018';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, -Infinity);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "sourceEnd" is out of range. It must be >= 0 and <= 26. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_1900
     * @tc.name       : testFastBufferCopy0019
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0019';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, 1);
        expect(buf2.toString()).assertEqual('a!!!!!!!!!!!!!!!!!!!!!!!!!');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_COPY_2000
     * @tc.name       : testFastBufferCopy0020
     * @tc.desc       : Test the function of the interface Copy.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferCopy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferCopy0020';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        let buf2 = buffer.allocUninitializedFromPool(26).fill('!');
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        buf1.copy(buf2, undefined, undefined, undefined);
        expect(buf2.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_EQUALS_0100
     * @tc.name       : testFastBufferEquals0001
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferEquals001';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = buffer.from('414243', 'hex');
        const result = buf1.equals(buf2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_EQUALS_0200
     * @tc.name       : testFastBufferEquals0002
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferEquals0002';
      try {
        const buf1 = buffer.from('ABC');
        const buf2 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(buf2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_EQUALS_0300
     * @tc.name       : testFastBufferEquals0003
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferEquals0003';
      try {
        const buf1 = buffer.from([1, 2, 3]);
        const u8 = new Uint8Array([1, 2, 3]);
        const result = buf1.equals(u8);
        expect(result).assertEqual(true);
        expect([...u8].indexOf(2)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_EQUALS_0400
     * @tc.name       : testFastBufferEquals0004
     * @tc.desc       : Test the function of the interface Equals.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferEquals0004';
      try {
        const target = buffer.from([1, 2, 3, 4]);
        const source = buffer.from([3, 4, 5]);
        expect(target.equals(source)).assertEqual(
          target[3] === source[0]
        );
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0100
     * @tc.name       : testFastBufferIncludes0001
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0001';
      try {
        let buf = buffer.from('hello world');
        expect(buf.includes('hello')).assertTrue();
        expect(buf.includes('be')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0200
     * @tc.name       : testFastBufferIncludes0002
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        expect(buf.includes(1)).assertTrue();
        expect(buf.includes(5)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0300
     * @tc.name       : testFastBufferIncludes0003
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0003';
      try {
        let buf = buffer.from('hello world');
        let searchBuf = buffer.from('world');
        expect(buf.includes(searchBuf)).assertTrue();
        expect(buf.includes(buffer.from('test'))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0400
     * @tc.name       : testFastBufferIncludes0004
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0004';
      try {
        let buf = buffer.from('hello world');
        let arr = new Uint8Array([0x68, 0x65]);
        expect(buf.includes(arr)).assertTrue();
        expect(buf.includes(new Uint8Array([0x7a]))).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0500
     * @tc.name       : testFastBufferIncludes0005
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0005';
      try {
        let buf = buffer.from('hello');
        const result = buf.includes('hello', 0);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0600
     * @tc.name       : testFastBufferIncludes0006
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0006';
      try {
        let buf = buffer.from('abcdefg');
        buf.includes('def', -1);
        expect(buf.includes('def', -1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0700
     * @tc.name       : testFastBufferIncludes0007
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', Infinity)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0800
     * @tc.name       : testFastBufferIncludes0008
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('c', -Infinity)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_0900
     * @tc.name       : testFastBufferIncludes0009
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', 1)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1000
     * @tc.name       : testFastBufferIncludes0010
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.includes('a', undefined)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1100
     * @tc.name       : testFastBufferIncludes0011
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0011';
      try {

        let buf = buffer.from('test');
        expect(buf.includes('dGVzdA==', undefined, 'base64')).assertTrue();
        expect(buf.includes('abcd', undefined, 'base64')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1200
     * @tc.name       : testFastBufferIncludes0012
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0012';
      try {
        let buf = buffer.from('你好');
        expect(buf.includes('你好', undefined, 'utf-8')).assertTrue();
        expect(buf.includes('hello', undefined, 'utf-8')).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1300
     * @tc.name       : testFastBufferIncludes0013
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0013';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity);
        expect(includesTrue).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1400
     * @tc.name       : testFastBufferIncludes0014
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0014';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includesTrue).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1500
     * @tc.name       : testFastBufferIncludes0015
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'utf-8');
        expect(includesTrue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1600
     * @tc.name       : testFastBufferIncludes0016
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = buffer.from([102, 103]);
        const includesTrue = buf.includes(subBuf, 1, 'base64');
        expect(includesTrue).assertEqual(true)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1700
     * @tc.name       : testFastBufferIncludes0017
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1800
     * @tc.name       : testFastBufferIncludes0018
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'utf-8');
        expect(includes).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_1900
     * @tc.name       : testFastBufferIncludes0019
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, Infinity, 'base64');
        expect(includes).assertEqual(false)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_2000
     * @tc.name       : testFastBufferIncludes0020
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1, 'utf-8');
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INCLUDES_2100
     * @tc.name       : testFastBufferIncludes0021
     * @tc.desc       : Test the function of the interface Includes.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIncludes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIncludes0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const subBuf = 103;
        const includes = buf.includes(subBuf, 1);
        expect(includes).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0100
     * @tc.name       : testFastBufferIndexOf0001
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0001';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this');
        expect(result).assertEqual(0);
        expect(buf.indexOf('is')).assertEqual(2);
        expect(buf.indexOf('a')).assertEqual(8);
        expect(buf.indexOf('buffer')).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0200
     * @tc.name       : testFastBufferIndexOf0002
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0002';
      try {
        let buf = buffer.from([1, 2, 3, 4]);
        let result = buf.indexOf(3);
        expect(result).assertEqual(2);
        expect(buf.indexOf(4)).assertEqual(3);
        expect(buf.indexOf(1)).assertEqual(0);
        expect(buf.indexOf(5)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0300
     * @tc.name       : testFastBufferIndexOf0003
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0003';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6]);
        let buf1 = buffer.from([1, 2, 3]);
        let result = buf.indexOf(buf1);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0400
     * @tc.name       : testFastBufferIndexOf0004
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0004';
      try {
        let buf = buffer.from('this');
        let uint8Arr = new Uint8Array([0x74]);
        let result = buf.indexOf(uint8Arr);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0500
     * @tc.name       : testFastBufferIndexOf0005
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0005';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', 0).toString()).assertEqual('0');
        expect(buf.indexOf('is', 0).toString()).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0600
     * @tc.name       : testFastBufferIndexOf0006
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0006';
      try {
        let buf = buffer.from([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let buf1 = buffer.from([0, 1, 2, 3, 4, 5]);
        expect(buf.indexOf(buf1, -1)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0700
     * @tc.name       : testFastBufferIndexOf0007
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0007';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', Infinity);
        buf.indexOf('is', Infinity);
        expect(buf.indexOf('this', Infinity)).assertEqual(-1);
        expect(buf.indexOf('is', Infinity)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0800
     * @tc.name       : testFastBufferIndexOf0008
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0008';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', -Infinity);
        buf.indexOf('is', -Infinity);
        expect(buf.indexOf('this', -Infinity)).assertEqual(0);
        expect(buf.indexOf('is', -Infinity)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_0900
     * @tc.name       : testFastBufferIndexOf0009
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0009';
      try {
        let buf = buffer.from('this is a buffer');
        buf.indexOf('this', 1);
        buf.indexOf('is', 1);
        expect(buf.indexOf('this', 1)).assertEqual(-1);
        expect(buf.indexOf('is', 1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1000
     * @tc.name       : testFastBufferIndexOf0010
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0010';
      try {
        let buf = buffer.from('this is a buffer');
        let result = buf.indexOf('this', undefined);
        expect(result).assertEqual(0);
        expect(buf.indexOf('is', undefined)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1100
     * @tc.name       : testFastBufferIndexOf0011
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0011';
      try {
        let buf = buffer.from('hello this is a buffer');
        let base64Value = 'aGVsbG8=';
        let result = buf.indexOf(base64Value, undefined, 'base64');
        expect(result).assertEqual(0);
        expect(buf.indexOf('this', undefined, 'base64')).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1200
     * @tc.name       : testFastBufferIndexOf0012
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0012';
      try {
        let buf = buffer.from('this is a buffer');
        expect(buf.indexOf('this', undefined, 'utf-8')).assertEqual(0);
        expect(buf.indexOf('is', undefined, 'utf-8')).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1300
     * @tc.name       : testFastBufferIndexOf0013
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0013';
      try {
        let buf = buffer.from('test');
        let emptyBuf = buffer.alloc(0);
        let result = buf.indexOf(emptyBuf);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1400
     * @tc.name       : testFastBufferIndexOf0014
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const index = buf.indexOf('World', 1, 'utf-8');
        expect(index).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1500
     * @tc.name       : testFastBufferIndexOf0015
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1600
     * @tc.name       : testFastBufferIndexOf0016
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1700
     * @tc.name       : testFastBufferIndexOf0017
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1800
     * @tc.name       : testFastBufferIndexOf0018
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_1900
     * @tc.name       : testFastBufferIndexOf0019
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2000
     * @tc.name       : testFastBufferIndexOf0020
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2100
     * @tc.name       : testFastBufferIndexOf0021
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2200
     * @tc.name       : testFastBufferIndexOf0022
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0022';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2300
     * @tc.name       : testFastBufferIndexOf0023
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0023';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2400
     * @tc.name       : testFastBufferIndexOf0024
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0024';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2500
     * @tc.name       : testFastBufferIndexOf0025
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0025';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2600
     * @tc.name       : testFastBufferIndexOf0026
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level
     */
    it('testFastBufferIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0026';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2700
     * @tc.name       : testFastBufferIndexOf0027
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0027';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2800
     * @tc.name       : testFastBufferIndexOf0028
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0028';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_2900
     * @tc.name       : testFastBufferIndexOf0029
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0029';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3000
     * @tc.name       : testFastBufferIndexOf0030
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0030';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3100
     * @tc.name       : testFastBufferIndexOf0031
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0031';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3200
     * @tc.name       : testFastBufferIndexOf0032
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0032';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = buffer.from([101, 102])
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3300
     * @tc.name       : testFastBufferIndexOf0033
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0033';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3400
     * @tc.name       : testFastBufferIndexOf0034
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0034';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3500
     * @tc.name       : testFastBufferIndexOf0035
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0035';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3600
     * @tc.name       : testFastBufferIndexOf0036
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0036';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3700
     * @tc.name       : testFastBufferIndexOf0037
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level
     */
    it('testFastBufferIndexOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0037';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3800
     * @tc.name       : testFastBufferIndexOf0038
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0038';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, Infinity, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_3900
     * @tc.name       : testFastBufferIndexOf0039
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0039';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_4000
     * @tc.name       : testFastBufferIndexOf0040
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0040';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_4100
     * @tc.name       : testFastBufferIndexOf0041
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0041';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, -Infinity, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_4200
     * @tc.name       : testFastBufferIndexOf0042
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_4300
     * @tc.name       : testFastBufferIndexOf0043
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0043';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_INDEX_OF_4400
     * @tc.name       : testFastBufferIndexOf0044
     * @tc.desc       : Test the function of the interface IndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferIndexOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferIndexOf0042';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = new Uint8Array([101, 102]);
        const index = buf.indexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0100
     * @tc.name       : testFastBufferLastIndexOf0001
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0001';
      try {
        let buf = buffer.from('this buffer is a buffer');
        expect(buf.lastIndexOf('buffer')).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0200
     * @tc.name       : testFastBufferLastIndexOf0002
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0002';
      try {
        let buf = buffer.from([1, 23, 4, 6, 3, 45, 4, 5, 55, 16, 66, 2]);
        expect(buf.lastIndexOf(6)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0300
     * @tc.name       : testFastBufferLastIndexOf0003
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0003';
      try {
        let valueBuf = buffer.from('buffer');
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(valueBuf);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0400
     * @tc.name       : testFastBufferLastIndexOf0004
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0004';
      try {
        let uintArr = new Uint8Array([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
        let mainBuf = buffer.from('this buffer is a buffer');
        const result = mainBuf.lastIndexOf(uintArr);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(17);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0500
     * @tc.name       : testFastBufferLastIndexOf0005
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0005';
      try {
        let buf = buffer.from('abcabc');
        expect(buf.lastIndexOf('abc', 0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0600
     * @tc.name       : testFastBufferLastIndexOf0006
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0006';
      try {
        let buf = buffer.from('abcdef');
        expect(buf.lastIndexOf('cd', -1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0700
     * @tc.name       : testFastBufferLastIndexOf0007
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0007';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', Infinity)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0800
     * @tc.name       : testFastBufferLastIndexOf0008
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0008';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', -Infinity)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_0900
     * @tc.name       : testFastBufferLastIndexOf0009
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0009';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', 1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1000
     * @tc.name       : testFastBufferLastIndexOf0010
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0010';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1100
     * @tc.name       : testFastBufferLastIndexOf0011
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0011';
      try {
        let valueBase64 = 'YmFzZTY0';
        let buf = buffer.from('base64', 'utf8');
        expect(buf.lastIndexOf(valueBase64, undefined, 'base64')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1200
     * @tc.name       : testFastBufferLastIndexOf0012
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0012';
      try {
        let buf = buffer.from('abc');
        expect(buf.lastIndexOf('a', undefined, 'utf8')).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1300
     * @tc.name       : testFastBufferLastIndexOf0013
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0013';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'utf-8');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1400
     * @tc.name       : testFastBufferLastIndexOf0014
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0014';
      try {
        const buf = buffer.from('Hello World');
        const value = 'World';
        const index = buf.lastIndexOf(value, 1, 'base64');
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1500
     * @tc.name       : testFastBufferLastIndexOf0015
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0015';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1600
     * @tc.name       : testFastBufferLastIndexOf0016
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0016';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf8');
        expect(index).assertEqual(0)

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1700
     * @tc.name       : testFastBufferLastIndexOf0017
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0017';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, 0, 'utf-8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /*
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1800
     * @tc.name       : testFastBufferLastIndexOf0018
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     *
     */
    it('testFastBufferLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0018';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_1900
     * @tc.name       : testFastBufferLastIndexOf0019
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0019';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, -1, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_2000
     * @tc.name       : testFastBufferLastIndexOf0020
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0020';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'base64');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_LAST_INDEX_OF_2100
     * @tc.name       : testFastBufferLastIndexOf0021
     * @tc.desc       : Test the function of the interface LastIndexOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferLastIndexOf0021';
      try {
        const buf = buffer.from([101, 102, 103, 104]);
        const value = 101;
        const index = buf.lastIndexOf(value, Infinity, 'utf8');
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0100
     * @tc.name       : testFastBufferReadBigInt64BE0001
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        expect(buf.readBigInt64BE().toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0200
     * @tc.name       : testFastBufferReadBigInt64BE0002
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0300
     * @tc.name       : testFastBufferReadBigInt64BE0003
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64BE(expectedValue, 1);
        expect(buf.readBigInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0400
     * @tc.name       : testFastBufferReadBigInt64BE0004
     * @tc.desc       : Test the function of the interface readBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_ READ_0500
     * @tc.name       : testFastBufferReadBigInt64LE0001
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64LE0001';
      try {
        let buf = buffer.alloc(8);
        const expectedValue = BigInt("0x0102030405060708");
        buf.writeBigInt64LE(expectedValue, 0);
        const actualValue = buf.readBigInt64LE();
        expect(actualValue.toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0600
     * @tc.name       : testFastBufferReadBigInt64LE0002
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0700
     * @tc.name       : testFastBufferReadBigInt64LE0003
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigInt64LE(expectedValue, 1);
        expect(buf.readBigInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0800
     * @tc.name       : testFastBufferReadBigInt64LE0004
     * @tc.desc       : Test the function of the interface ReadBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigInt64LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_0900
     * @tc.name       : testFastBufferReadBigUInt64BE0001
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64BE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64BE(0).toString());
        expect(buf.readBigUInt64BE(0).toString()).assertEqual('7161960797921896816');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1000
     * @tc.name       : testFastBufferReadBigUInt64BE0002
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64BE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64BE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64BE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1100
     * @tc.name       : testFastBufferReadBigUInt64BE0003
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64BE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64BE(expectedValue, 1);
        expect(buf.readBigUInt64BE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1200
     * @tc.name       : testFastBufferReadBigUInt64BE0004
     * @tc.desc       : Test the function of the interface ReadBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64BE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1300
     * @tc.name       : testFastBufferReadBigUInt64LE0001
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64LE0001';
      try {
        let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
          0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
        console.info(buf.readBigUInt64LE(0).toString());
        expect(buf.readBigUInt64LE(0).toString()).assertEqual('8100120198111388771');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1400
     * @tc.name       : testFastBufferReadBigUInt64LE0002
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64LE0002';
      try {
        let buf = buffer.alloc(8)
        buf.writeBigUInt64LE(BigInt(0x0102030405060708), 0);
        expect(buf.readBigUInt64LE(0).toString()).assertEqual(BigInt(0x0102030405060708).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1500
     * @tc.name       : testFastBufferReadBigUInt64LE0003
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64LE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = BigInt(0x0203040506070809);
        buf.writeBigUInt64LE(expectedValue, 1);
        expect(buf.readBigUInt64LE(1).toString()).assertEqual(expectedValue.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1600
     * @tc.name       : testFastBufferReadBigUInt64LE0004
     * @tc.desc       : Test the function of the interface ReadBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadBigUInt64LE0004';
      try {
        let buf = buffer.alloc(8)
        buf.readBigUInt64LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1700
     * @tc.name       : testFastBufferReadDoubleBE0001
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(123.456, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(123.456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1800
     * @tc.name       : testFastBufferReadDoubleBE0002
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleBE0002';
      try {
        const buf = buffer.alloc(8);
        buf.writeDoubleBE(0, 0);
        const result = buf.readDoubleBE();
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_1900
     * @tc.name       : testFastBufferReadDoubleBE0003
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleBE0003';
      try {
        let buf = buffer.alloc(9);
        const expectedValue = 123.456;
        buf.writeDoubleBE(expectedValue, 1);
        const actualValue = buf.readDoubleBE(1);
        expect(actualValue).assertEqual(expectedValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2000
     * @tc.name       : testFastBufferReadDoubleBE0004
     * @tc.desc       : Test the function of the interface readDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleBE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2100
     * @tc.name       : testFastBufferReadDoubleLE0001
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleLE0001';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readDoubleLE().toString());
        expect(buf.readDoubleLE().toString()).assertEqual('5.447603722011605e-270');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2200
     * @tc.name       : testFastBufferReadDoubleLE0002
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleLE0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        let result = buf1.writeDoubleLE(123.456, 0);
        console.info("result = " + result);
        expect(buf1.readDoubleLE(0).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2300
     * @tc.name       : testFastBufferReadDoubleLE0003
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleLE0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(9);
        buf1.writeDoubleLE(123.456, 1);
        expect(buf1.readDoubleLE(1).toString()).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2400
     * @tc.name       : testFastBufferReadDoubleLE0004
     * @tc.desc       : Test the function of the interface readDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadDoubleLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(8);
        buf1.readDoubleLE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2500
     * @tc.name       : testFastBufferReadFloatBE0001
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatBE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatBE(123.456, 0);
        const result = buf.readFloatBE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2600
     * @tc.name       : testFastBufferReadFloatBE0002
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatBE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatBE(0).toString());
        expect(buf.readFloatBE(0).toString()).assertEqual('2.387939260590663e-38');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2700
     * @tc.name       : testFastBufferReadFloatBE0003
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatBE0003';
      try {
        const buf = buffer.alloc(5);
        const value = 789.12;
        buf.writeFloatBE(value, 1);
        const readValue = buf.readFloatBE(1);
        expect(readValue).assertClose(value, 0.001);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2800
     * @tc.name       : testFastBufferReadFloatBE0004
     * @tc.desc       : Test the function of the interface readFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatBE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatBE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_2900
     * @tc.name       : testFastBufferReadFloatLE0001
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatLE0001';
      try {
        const buf = buffer.alloc(8);
        buf.writeFloatLE(123.456, 0);
        const result = buf.readFloatLE();
        expect(result).assertEqual(123.45600128173828);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3000
     * @tc.name       : testFastBufferReadFloatLE0002
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatLE0002';
      try {
        let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
        console.info(buf.readFloatLE(0).toString());
        expect(buf.readFloatLE(0).toString()).assertEqual('1.539989614439558e-36');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3100
     * @tc.name       : testFastBufferReadFloatLE0003
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatLE0003';
      try {
        const buf = buffer.alloc(5)
        const expectedValue = 50.125;
        buf.writeFloatLE(expectedValue, 1);
        const actualValue = buf.readFloatLE(1);
        expect(actualValue).assertClose(expectedValue, 1e-6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3200
     * @tc.name       : testFastBufferReadFloatLE0004
     * @tc.desc       : Test the function of the interface readFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadFloatLE0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readFloatLE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3300
     * @tc.name       : testFastBufferReadInt80001
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt80001';
      try {
        const buf = buffer.from([-42, 100]);
        const value = buf.readInt8();
        const result = value.toString();
        console.log(`${TAG} result is ${result}`);
        expect(result).assertEqual('-42');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3400
     * @tc.name       : testFastBufferReadInt80002
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt80002';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(0).toString()).assertEqual('-1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3500
     * @tc.name       : testFastBufferReadInt80003
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt80003';
      try {
        let buf = buffer.from([-1, 5]);
        expect(buf.readInt8(1).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3600
     * @tc.name       : testFastBufferReadInt80004
     * @tc.desc       : Test the function of the interface readInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt80004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(4);
        buf1.readInt8(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3700
     * @tc.name       : testFastBufferReadInt16BE001
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34]);
        expect(buf.readInt16BE().toString()).assertEqual('4660');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3800
     * @tc.name       : testFastBufferReadInt16BE002
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16BE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16BE(0).toString()).assertEqual('5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_3900
     * @tc.name       : testFastBufferReadInt16BE003
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        expect(buf.readInt16BE(1).toString()).assertEqual('13398');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4000
     * @tc.name       : testFastBufferReadInt16BE004
     * @tc.desc       : Test the function of the interface readInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16BE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4100
     * @tc.name       : testFastBufferReadInt16LE001
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16LE001';
      try {
        let buf = buffer.from([0, 5]);
        console.info(buf.readInt16LE().toString());
        expect(buf.readInt16LE().toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4200
     * @tc.name       : testFastBufferReadInt16LE002
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16LE002';
      try {
        let buf = buffer.from([0, 5]);
        expect(buf.readInt16LE(0).toString()).assertEqual('1280');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4300
     * @tc.name       : testFastBufferReadInt16LE003
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16LE003';
      try {
        let buf = buffer.from([0, 5, 10]);
        let result = buf.readInt16LE(1);
        expect(result).assertEqual(2565);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4400
     * @tc.name       : testFastBufferReadInt16LE004
     * @tc.desc       : Test the function of the interface readInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt16LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt16LE004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(2);
        buf1.readInt16LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4500
     * @tc.name       : testFastBufferReadInt32BE001
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32BE001';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32BE().toString());
        expect(buf.readInt32BE().toString()).assertEqual('65541');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4600
     * @tc.name       : testFastBufferReadInt32BE002
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32BE002';
      try {
        let buf1 = buffer.alloc(4);
        let result = buf1.writeInt32BE(0x12345678, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4700
     * @tc.name       : testFastBufferReadInt32BE003
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32BE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        console.log(buf.readInt32BE(1).toString());
        expect(buf.readInt32BE(1).toString()).assertEqual('16909060');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4800
     * @tc.name       : testFastBufferReadInt32BE004
     * @tc.desc       : Test the function of the interface readInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32BE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_4900
     * @tc.name       : testFastBufferReadInt32LE001
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32LE001';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE().toString());
        expect(buf.readInt32LE().toString()).assertEqual('83886336');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5000
     * @tc.name       : testFastBufferReadInt32LE002
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32LE002';
      try {

        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        console.info(buf.readInt32LE(0).toString());
        expect(buf.readInt32LE(0).toString()).assertEqual('83886336');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5100
     * @tc.name       : testFastBufferReadInt32LE003
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32LE003';
      try {
        let buf = buffer.from([0x00, 0x01, 0x02, 0x03, 0x04]);
        const value = buf.readInt32LE(1);
        console.log(value.toString());
        expect(value.toString()).assertEqual('67305985');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5200
     * @tc.name       : testFastBufferReadInt32LE004
     * @tc.desc       : Test the function of the interface readInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadInt32LE004';
      try {
        let buf = buffer.from([0, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, 0, 5]);
        buf.readInt32LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5300
     * @tc.name       : testFastBufferReadUInt8001
     * @tc.desc       : Test the function of the interface readIntBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt8001';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8().toString());
        expect(buf.readUInt8().toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5400
     * @tc.name       : testFastBufferReadUInt8002
     * @tc.desc       : Test the function of the interface ReadUInt8002.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt8002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt8002';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(0).toString());
        expect(buf.readUInt8(0).toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5500
     * @tc.name       : testFastBufferReadUInt8003
     * @tc.desc       : Test the function of the interface ReadUInt8003.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt8003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt8003';
      try {
        let buf = buffer.from([1, -2]);
        console.info(buf.readUInt8(1).toString());
        expect(buf.readUInt8(1).toString()).assertEqual('254');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5600
     * @tc.name       : testFastBufferReadUInt8004
     * @tc.desc       : Test the function of the interface ReadUInt8004.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt8004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt8004';
      try {
        let buf = buffer.from([1, -2]);
        buf.readUInt8(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5700
     * @tc.name       : testFastBufferReadUInt16BE001
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE().toString(16));
        expect(buf.readUInt16BE().toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5800
     * @tc.name       : testFastBufferReadUInt16BE002
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(0).toString(16));
        expect(buf.readUInt16BE(0).toString(16)).assertEqual('1234');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_5900
     * @tc.name       : testFastBufferReadUInt16BE003
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16BE(1).toString(16));
        expect(buf.readUInt16BE(1).toString(16)).assertEqual('3456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6000
     * @tc.name       : testFastBufferReadUInt16BE004
     * @tc.desc       : Test the function of the interface ReadUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6100
     * @tc.name       : testFastBufferReadUInt16LE0001
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16LE0001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6200
     * @tc.name       : testFastBufferReadUInt16LE0002
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16LE0002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(0).toString(16));
        expect(buf.readUInt16LE(0).toString(16)).assertEqual('3412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6300
     * @tc.name       : testFastBufferReadUInt16LE0003
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16LE0003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        console.info(buf.readUInt16LE(1).toString(16));
        expect(buf.readUInt16LE(1).toString(16)).assertEqual('5634');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6400
     * @tc.name       : testFastBufferReadUInt16LE0004
     * @tc.desc       : Test the function of the interface ReadUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt16LE0004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56]);
        buf.readUInt16LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6500
     * @tc.name       : testFastBufferReadUInt32BE001
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32BE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32BE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE().toString(16));
        expect(buf.readUInt32BE().toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6600
     * @tc.name       : testFastBufferReadUInt32BE002
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32BE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32BE002';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32BE(0).toString(16));
        expect(buf.readUInt32BE(0).toString(16)).assertEqual('12345678');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6700
     * @tc.name       : testFastBufferReadUInt32BE003
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32BE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32BE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32BE(0x12345678, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual(
          'The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1'
        );
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6800
     * @tc.name       : testFastBufferReadUInt32BE004
     * @tc.desc       : Test the function of the interface ReadUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32BE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32BE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32BE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_6900
     * @tc.name       : testFastBufferReadUInt32LE001
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32LE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32LE001';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        console.info(buf.readUInt32LE(0).toString(16));
        expect(buf.readUInt32LE(0).toString(16)).assertEqual('78563412');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_7000
     * @tc.name       : testFastBufferReadUInt32LE002
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32LE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32LE002';
      try {

        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        const result = buf.readUInt32LE(1).toString(16);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_7100
     * @tc.name       : testFastBufferReadUInt32LE003
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32LE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32LE003';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.writeUInt32LE(0x12345678, -1).toString(16);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READ_7200
     * @tc.name       : testFastBufferReadUInt32LE004
     * @tc.desc       : Test the function of the interface ReadUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUInt32LE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUInt32LE004';
      try {
        let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
        buf.readUInt32LE(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0100
     * @tc.name       : testFastBufferSubarray0001
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray();
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0200
     * @tc.name       : testFastBufferSubarray0002
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(0, 3);
        const res = buf2.toString('ascii', 0, buf2.length);
        expect(res).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0300
     * @tc.name       : testFastBufferSubarray0003
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0003';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0400
     * @tc.name       : testFastBufferSubarray0004
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0004';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0500
     * @tc.name       : testFastBufferSubarray0005
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0005';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(-Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0600
     * @tc.name       : testFastBufferSubarray0006
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0006';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0700
     * @tc.name       : testFastBufferSubarray0007
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0007';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 0);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0800
     * @tc.name       : testFastBufferSubarray0008
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0008';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, 1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_0900
     * @tc.name       : testFastBufferSubarray0009
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0009';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -1);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1000
     * @tc.name       : testFastBufferSubarray0010
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0010';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('bcdefghijklmnopqrstuvwxyz');
        expect(buf2.length).assertEqual(25);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1100
     * @tc.name       : testFastBufferSubarray0011
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0011';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        const buf2 = buf1.subarray(1, -Infinity);
        const res = buf2.toString('ascii', 0, buf2.length)
        console.log(`${TAG}res：${res}`);
        expect(res).assertEqual('');
        expect(buf2.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1200
     * @tc.name       : testFastBufferSubarray0012
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0012';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-1, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1300
     * @tc.name       : testFastBufferSubarray0013
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0013';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1400
     * @tc.name       : testFastBufferSubarray0014
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0014';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1500
     * @tc.name       : testFastBufferSubarray0015
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0015';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1600
     * @tc.name       : testFastBufferSubarray0016
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0016';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1700
     * @tc.name       : testFastBufferSubarray0017
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0017';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1800
     * @tc.name       : testFastBufferSubarray0018
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0018';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_1900
     * @tc.name       : testFastBufferSubarray0019
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0019';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2000
     * @tc.name       : testFastBufferSubarray0020
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0020';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, 1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2100
     * @tc.name       : testFastBufferSubarray0021
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0021';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(-Infinity, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2200
     * @tc.name       : testFastBufferSubarray0022
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0022';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, 0);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2300
     * @tc.name       : testFastBufferSubarray0023
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0023';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -1);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2400
     * @tc.name       : testFastBufferSubarray0024
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0024';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, Infinity);
        expect(buf2.length).assertEqual(7);
        expect(buf2.toString()).assertEqual('fghijkl');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_SUBARRAY_2500
     * @tc.name       : testFastBufferSubarray0025
     * @tc.desc       : Test the function of the interface Subarray.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferSubarray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferSubarray0025';
      try {
        const buf1 = buffer.from([101, 102, 103, 104, 105, 106, 107, 108]);
        const buf2 = buf1.subarray(1, -Infinity);
        expect(buf2.length).assertEqual(0);
        expect(buf2.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0100
     * @tc.name       : testFastBufferToString0001
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0001';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0200
     * @tc.name       : testFastBufferToString0002
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0002';
      try {
        let buf1 = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf1.writeInt8(i + 97, i);
        }
        expect(buf1.toString('base64')).assertEqual('YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0300
     * @tc.name       : testFastBufferToString0003
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0003';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 30);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0400
     * @tc.name       : testFastBufferToString0004
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0004';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 5, 3);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0500
     * @tc.name       : testFastBufferToString0005
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0005';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0600
     * @tc.name       : testFastBufferToString0006
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0006';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0700
     * @tc.name       : testFastBufferToString0007
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0007';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0800
     * @tc.name       : testFastBufferToString0008
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0008';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', -Infinity);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_0900
     * @tc.name       : testFastBufferToString0009
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0009';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 1);
        expect(str).assertEqual('bcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1000
     * @tc.name       : testFastBufferToString0010
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0010';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1100
     * @tc.name       : testFastBufferToString0011
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0011';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 3);
        expect(str).assertEqual('abc');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1200
     * @tc.name       : testFastBufferToString0012
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0012';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, 0);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1300
     * @tc.name       : testFastBufferToString0013
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0013';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, 1);
        expect(str).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1400
     * @tc.name       : testFastBufferToString0014
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0014';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, Infinity)
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('abcdefghijklmnopqrstuvwxyz');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1500
     * @tc.name       : testFastBufferToString0015
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0015';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', 0, -Infinity);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1600
     * @tc.name       : testFastBufferToString0016
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0016';
      try {
        let buf = buffer.allocUninitializedFromPool(26);
        for (let i = 0; i < 26; i++) {
          buf.writeInt8(i + 97, i);
        }
        const str = buf.toString('utf8', undefined, -1);
        console.log(`${TAG} str: ${str}`);
        expect(str).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1700
     * @tc.name       : testFastBufferToString0017
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0017';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1800
     * @tc.name       : testFastBufferToString0018
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0018';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_1900
     * @tc.name       : testFastBufferToString0019
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0019';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2000
     * @tc.name       : testFastBufferToString0020
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0020';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2100
     * @tc.name       : testFastBufferToString0021
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0021';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 0, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2200
     * @tc.name       : testFastBufferToString0022
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0022';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2300
     * @tc.name       : testFastBufferToString0023
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0023';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2400
     * @tc.name       : testFastBufferToString0024
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0024';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2500
     * @tc.name       : testFastBufferToString0025
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0025';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2600
     * @tc.name       : testFastBufferToString0026
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0026';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -1, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2700
     * @tc.name       : testFastBufferToString0027
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0027';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2800
     * @tc.name       : testFastBufferToString0028
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0028';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_2900
     * @tc.name       : testFastBufferToString0029
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0029';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3000
     * @tc.name       : testFastBufferToString0030
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0030';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3100
     * @tc.name       : testFastBufferToString0031
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0031';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3200
     * @tc.name       : testFastBufferToString0032
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0032';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3300
     * @tc.name       : testFastBufferToString0033
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0033';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3400
     * @tc.name       : testFastBufferToString0034
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0034';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('aGVsbG8=');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3500
     * @tc.name       : testFastBufferToString0035
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0035';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3600
     * @tc.name       : testFastBufferToString0036
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0036';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', -Infinity, 1);
        expect(res.length).assertEqual(4);
        expect(res).assertEqual('aA==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3700
     * @tc.name       : testFastBufferToString0037
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0037';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3800
     * @tc.name       : testFastBufferToString0038
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0038';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_3900
     * @tc.name       : testFastBufferToString0039
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0039';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, Infinity);
        expect(res.length).assertEqual(8);
        expect(res).assertEqual('ZWxsbw==');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4000
     * @tc.name       : testFastBufferToString0040
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0040';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4100
     * @tc.name       : testFastBufferToString0041
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0041';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('base64', 1, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4200
     * @tc.name       : testFastBufferToString0042
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0042';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4300
     * @tc.name       : testFastBufferToString0043
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0043';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4400
     * @tc.name       : testFastBufferToString0044
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0044';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4500
     * @tc.name       : testFastBufferToString0045
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0045';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4600
     * @tc.name       : testFastBufferToString0046
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0046';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4700
     * @tc.name       : testFastBufferToString0047
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0047';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, 0, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4800
     * @tc.name       : testFastBufferToString0048
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0048';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_4900
     * @tc.name       : testFastBufferToString0049
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0049';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5000
     * @tc.name       : testFastBufferToString0050
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0050';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5100
     * @tc.name       : testFastBufferToString0051
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0051';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5200
     * @tc.name       : testFastBufferToString0052
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0052';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5300
     * @tc.name       : testFastBufferToString0053
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0053';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, -1, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5400
     * @tc.name       : testFastBufferToString0054
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0054';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, undefined);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5500
     * @tc.name       : testFastBufferToString0055
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0055';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5600
     * @tc.name       : testFastBufferToString0056
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0056';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5700
     * @tc.name       : testFastBufferToString0057
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0057';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5800
     * @tc.name       : testFastBufferToString0058
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0058';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_5900
     * @tc.name       : testFastBufferToString0059
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0059';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString(undefined, Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6000
     * @tc.name       : testFastBufferToString0060
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0060';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', undefined, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6100
     * @tc.name       : testFastBufferToString0061
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0061';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6200
     * @tc.name       : testFastBufferToString0062
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0062';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6300
     * @tc.name       : testFastBufferToString0063
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0063';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6400
     * @tc.name       : testFastBufferToString0064
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0064';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6500
     * @tc.name       : testFastBufferToString0065
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0065';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6600
     * @tc.name       : testFastBufferToString0066
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0066';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 0, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6700
     * @tc.name       : testFastBufferToString0067
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0067';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6800
     * @tc.name       : testFastBufferToString0068
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0068';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_6900
     * @tc.name       : testFastBufferToString0069
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0069';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7000
     * @tc.name       : testFastBufferToString0070
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0070';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7100
     * @tc.name       : testFastBufferToString0071
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0071';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7200
     * @tc.name       : testFastBufferToString0072
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0072';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -1, 1);
        expect(res.length).assertEqual(1);
        expect(res).assertEqual('h');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7300
     * @tc.name       : testFastBufferToString0073
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0073';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, undefined);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7400
     * @tc.name       : testFastBufferToString0074
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0074';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, 0);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7500
     * @tc.name       : testFastBufferToString0075
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0075';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, -1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7600
     * @tc.name       : testFastBufferToString0076
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0076';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7700
     * @tc.name       : testFastBufferToString0077
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0077';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', Infinity, 1);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7800
     * @tc.name       : testFastBufferToString0078
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0078';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -Infinity, undefined);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_7900
     * @tc.name       : testFastBufferToString0079
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0079';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', 1, -Infinity);
        expect(res.length).assertEqual(0);
        expect(res).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_TO_STRING_8000
     * @tc.name       : testFastBufferToString0080
     * @tc.desc       : Test the function of the interface toString.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferToString0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferToString0080';
      try {
        const buf = buffer.from('hello');
        const res = buf.toString('utf-8', -Infinity, Infinity);
        expect(res.length).assertEqual(5);
        expect(res).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0100
     * @tc.name       : testFastBufferWrite0001
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0001';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abc");
        expect(len).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0200
     * @tc.name       : testFastBufferWrite0002
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0002';
      try {
        let buf = buffer.alloc(5);
        expect(buf.write("test", 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0300
     * @tc.name       : testFastBufferWrite0003
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0003';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abcd", undefined);
        expect(len).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0400
     * @tc.name       : testFastBufferWrite0004
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0004';
      try {
        let buf = buffer.alloc(5);
        let len = buf.write("abcd", -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0500
     * @tc.name       : testFastBufferWrite0005
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0005';
      try {
        let buf = buffer.alloc(10);
        const result = buf.write("test", Infinity);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0600
     * @tc.name       : testFastBufferWrite0006
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0006';
      try {
        let buf = buffer.alloc(10);
        const result = buf.write("test", -Infinity);
        console.log(`${TAG} result: ${result}`);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0700
     * @tc.name       : testFastBufferWrite0007
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0007';
      try {
        let buf = buffer.alloc(5);
        const result = buf.write("abc", 1)
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0800
     * @tc.name       : testFastBufferWrite0008
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0008';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_0900
     * @tc.name       : testFastBufferWrite0009
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0009';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 0);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1000
     * @tc.name       : testFastBufferWrite0010
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0010';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, -1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 7. Received value is: -1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1100
     * @tc.name       : testFastBufferWrite0011
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0011';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, Infinity);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 7. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1200
     * @tc.name       : testFastBufferWrite0012
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0012';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, -Infinity);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 7. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1300
     * @tc.name       : testFastBufferWrite0013
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0013';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1400
     * @tc.name       : testFastBufferWrite0014
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0014';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1500
     * @tc.name       : testFastBufferWrite0015
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0015';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 3, 1, 'base64');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1600
     * @tc.name       : testFastBufferWrite0016
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0016';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 4, 2, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1700
     * @tc.name       : testFastBufferWrite0017
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0017';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefg", 4, 2, undefined);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1800
     * @tc.name       : testFastBufferWrite0018
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0018';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("", 0, 0, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_1900
     * @tc.name       : testFastBufferWrite0019
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0019';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abcdefghijklmnopqrstuvwxyz", 0, 10, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2000
     * @tc.name       : testFastBufferWrite0020
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0020';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abc", 6, 1, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 4. Received value is: 6');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2100
     * @tc.name       : testFastBufferWrite0021
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0021';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abcdefg", 2, 5, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "length" is out of range. It must be >= 0 and <= 3. Received value is: 5');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2200
     * @tc.name       : testFastBufferWrite0022
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0022';
      try {
        let buf = buffer.alloc(5);
        const res = buf.write("abc", 0, 3, 'invalid_encoding');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(401);
        expect(err.message)
          .assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding code is unknown');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2300
     * @tc.name       : testFastBufferWrite0023
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0023';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", undefined, undefined, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2400
     * @tc.name       : testFastBufferWrite0024
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0024';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", Infinity, Infinity, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2500
     * @tc.name       : testFastBufferWrite0025
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0025';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", 0, 0, 'utf8');
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2600
     * @tc.name       : testFastBufferWrite0026
     * @tc.desc       : Test the function of the interface write.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWrite0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWrite0026';
      try {
        let buf = buffer.alloc(10);
        const res = buf.write("abc", -Infinity, -Infinity, 'utf8');
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 9. Received value is: -inf');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2700
     * @tc.name       : testFastBufferWriteBigInt64BE0001
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0x1234567890abcdef), 0);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2800
     * @tc.name       : testFastBufferWriteBigInt64BE0002
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0002';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x0304), 1);
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_2900
     * @tc.name       : testFastBufferWriteBigInt64BE0003
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0003';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x05060708));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3000
     * @tc.name       : testFastBufferWriteBigInt64BE0004
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0004';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xbeef));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3100
     * @tc.name       : testFastBufferWriteBigInt64BE0005
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0005';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0x4));
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3200
     * @tc.name       : testFastBufferWriteBigInt64BE0006
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0006';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xfeedface));

        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual(8);
        const result = buf.toString('hex')
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('00000000feedface0000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3300
     * @tc.name       : testFastBufferWriteBigInt64BE0007
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0007';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(-2)).toString()
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3400
     * @tc.name       : testFastBufferWriteBigInt64BE0008
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0008';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(2)).toString()
        console.log(`${TAG} res: ${res}`);
        expect(res).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3500
     * @tc.name       : testFastBufferWriteBigInt64BE0009
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0009';
      try {
        let buf = buffer.alloc(10);
        const res = buf.writeBigInt64BE(BigInt(0xcafebabe))
        console.log(`${TAG} res: ${res}`);
        expect(res.toString()).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3600
     * @tc.name       : testFastBufferWriteBigInt64BE0010
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(123.456));
        expect(res).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3700
     * @tc.name       : testFastBufferWriteBigInt64BE0011
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0xdecafafecacefade))
        console.log(`${TAG} res: ${res}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -9223372036854775807 and <= 9223372036854775807. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3800
     * @tc.name       : testFastBufferWriteBigInt64BE0012
     * @tc.desc       : Test the function of the interface writeBigInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const res = buf.writeBigInt64BE(BigInt(0x0102030405060708n))
        console.log(`${TAG} res: ${res}`);
        expect(res.toString()).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_3900
     * @tc.name       : testFastBufferWriteBigInt64LE0001
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4000
     * @tc.name       : testFastBufferWriteBigInt64LE0002
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x03048), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4100
     * @tc.name       : testFastBufferWriteBigInt64LE0003
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4200
     * @tc.name       : testFastBufferWriteBigInt64LE0004
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4300
     * @tc.name       : testFastBufferWriteBigInt64LE0005
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0x4), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4400
     * @tc.name       : testFastBufferWriteBigInt64LE0006
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4500
     * @tc.name       : testFastBufferWriteBigInt64LE0007
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(-2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4600
     * @tc.name       : testFastBufferWriteBigInt64LE0008
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4700
     * @tc.name       : testFastBufferWriteBigInt64LE0009
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigInt64LE(BigInt(0xcafebabe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4800
     * @tc.name       : testFastBufferWriteBigInt64LE0010
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64LE(BigInt(123.456), 0);

        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_4900
     * @tc.name       : testFastBufferWriteBigInt64LE0011
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigInt64LE(BigInt(0xdecafafecacefade), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -9223372036854775807 and <= 9223372036854775807. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5000
     * @tc.name       : testFastBufferWriteBigInt64LE0012
     * @tc.desc       : Test the function of the interface writeBigInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigInt64LE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigInt64LE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const result = buf.writeBigInt64LE(BigInt(0x0102030405060708n), 0);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5100
     * @tc.name       : testFastBufferWriteBigUInt64BE0001
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x0304), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5200
     * @tc.name       : testFastBufferWriteBigUInt64BE0002
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5300
     * @tc.name       : testFastBufferWriteBigUInt64BE0003
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5400
     * @tc.name       : testFastBufferWriteBigUInt64BE0004
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0x4), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5500
     * @tc.name       : testFastBufferWriteBigUInt64BE0005
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5600
     * @tc.name       : testFastBufferWriteBigUInt64BE0006
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(-2), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 18446744073709551615. Received value is: -2');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5700
     * @tc.name       : testFastBufferWriteBigUInt64BE0007
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5800
     * @tc.name       : testFastBufferWriteBigUInt64BE0008
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xcafebabe));
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_5900
     * @tc.name       : testFastBufferWriteBigUInt64BE0009
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(123.456));
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6000
     * @tc.name       : testFastBufferWriteBigUInt64BE0010
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64BE(BigInt(0xdecafafecacefade), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6100
     * @tc.name       : testFastBufferWriteBigUInt64BE0011
     * @tc.desc       : Test the function of the interface writeBigUInt64BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64BE(BigInt(0x0102030405060708n), 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6200
     * @tc.name       : testFastBufferWriteBigUInt64LE0001
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x0304), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6300
     * @tc.name       : testFastBufferWriteBigUInt64LE0002
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x05060708), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6400
     * @tc.name       : testFastBufferWriteBigUInt64LE0003
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xbeef), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6500
     * @tc.name       : testFastBufferWriteBigUInt64LE0004
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x4), 0);
        ;
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6600
     * @tc.name       : testFastBufferWriteBigUInt64L0E005
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64L0E005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xfeedface), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6700
     * @tc.name       : testFastBufferWriteBigUInt64L0006
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64L0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(-2), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 18446744073709551615. Received value is: -2');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6800
     * @tc.name       : testFastBufferWriteBigUInt64LE0007
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(2), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_6900
     * @tc.name       : testFastBufferWriteBigUInt64LE0008
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xcafebabe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7000
     * @tc.name       : testFastBufferWriteBigUInt64LE0009
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(123.456), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('The number cannot be converted to a BigInt because it is not an integer');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7100
     * @tc.name       : testFastBufferWriteBigUInt64LE0010
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0xdecafafe), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7200
     * @tc.name       : testFastBufferWriteBigUInt64LE0011
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeBigUInt64LE(BigInt(0x0102030405060708n), 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7300
     * @tc.name       : testFastBufferWriteBigUInt64LE0012
     * @tc.desc       : Test the function of the interface writeBigUInt64LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteBigUInt64LE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteBigUInt64LE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeBigUInt64LE(BigInt(0x0102030405060708n), 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 10');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7400
     * @tc.name       : testFastBufferWriteDoubleBE0001
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0x0304, 0);
        let result = buf.writeDoubleBE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
        expect(buf.readDoubleBE(0)).assertEqual(0x0304);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7500
     * @tc.name       : testFastBufferWriteDoubleBE0002
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0x05060708, 0);
        let result = buf.writeDoubleBE(0x05060708, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7600
     * @tc.name       : testFastBufferWriteDoubleBE0003
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        const result = buf.writeDoubleBE(0xbeef,);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7700
     * @tc.name       : testFastBufferWriteDoubleBE0004
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        expect(buf.writeDoubleBE(0x4)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7800
     * @tc.name       : testFastBufferWriteDoubleBE0005
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xfeedface);
        expect(buf.writeDoubleBE(0xfeedface)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_7900
     * @tc.name       : testFastBufferWriteDoubleBE0006
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(-2, 10);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 10');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8000
     * @tc.name       : testFastBufferWriteDoubleBE0007
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(2);
        expect(buf.writeDoubleBE(2)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8100
     * @tc.name       : testFastBufferWriteDoubleBE0008
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xcafebabe, 0);
        expect(buf.writeDoubleBE(0xcafebabe, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8200
     * @tc.name       : testFastBufferWriteDoubleBE0009
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(123.456, 0);
        expect(buf.writeDoubleBE(123.456, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8300
     * @tc.name       : testFastBufferWriteDoubleBE0010
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleBE(0xdecafafecacefade, 0);
        expect(buf.writeDoubleBE(0xdecafafecacefade, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8400
     * @tc.name       : testFastBufferWriteDoubleBE0011
     * @tc.desc       : Test the function of the interface writeDoubleBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleBE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleBE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let res = 0x0102030405060708n;
        buf.writeDoubleBE(Number(res), 0);
        expect(buf.writeDoubleBE(Number(res), 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8500
     * @tc.name       : testFastBufferWriteDoubleLE0001
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0x0304);
        const res = buf.writeDoubleLE(0x0304).toString()
        console.log(`${TAG}result:${res}`);
        expect(buf.writeDoubleLE(0x0304).toString()).assertEqual('8');
        expect(buf.writeDoubleLE(0x0304)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8600
     * @tc.name       : testFastBufferWriteDoubleLE0002
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0x05060708, 0);
        expect(buf.writeDoubleLE(0x05060708, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8700
     * @tc.name       : testFastBufferWriteDoubleLE0003
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0xbeef, 0);
        expect(buf.writeDoubleLE(0xbeef, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8800
     * @tc.name       : testFastBufferWriteDoubleLE0004
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0004';
      try {
        let buf = buffer.alloc(19)
        buf.writeDoubleLE(0x4, 0);
        const res = buf.writeDoubleLE(0x4, 0).toString()
        console.log(`${TAG}res:${res}`);
        expect(buf.writeDoubleLE(0x4, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_8900
     * @tc.name       : testFastBufferWriteDoubleLE0005
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0005';
      try {
        let buf = buffer.alloc(8);
        buf.writeDoubleLE(0xfeedface, 0);
        expect(buf.writeDoubleLE(0xfeedface, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9000
     * @tc.name       : testFastBufferWriteDoubleLE0006
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(-2, 0);
        expect(buf.writeDoubleLE(-2, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9100
     * @tc.name       : testFastBufferWriteDoubleLE0007
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(2, 0);
        expect(buf.writeDoubleLE(2, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9200
     * @tc.name       : testFastBufferWriteDoubleLE0008
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        buf.writeDoubleLE(0xcafebabe, 0);
        expect(buf.writeDoubleLE(0xcafebabe, 0)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9300
     * @tc.name       : testFastBufferWriteDoubleLE0009
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(8);
        let result = buf.writeDoubleLE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9400
     * @tc.name       : testFastBufferWriteDoubleLE0010
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(3);
        let result = buf.writeDoubleLE(0xdecafafecacefade, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual("The value of \"offset\" is out of range. It must be >= 0 and <= -5. Received value is: 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9500
     * @tc.name       : testFastBufferWriteDoubleLE0011
     * @tc.desc       : Test the function of the interface writeDoubleLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteDoubleLE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteDoubleLE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(3);
        let result = buf.writeDoubleLE(Number(0x0102030405060708n), 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "offset" is out of range. It must be >= 0 and <= -5. Received value is: 1');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9600
     * @tc.name       : testFastBufferWriteFloatBE0001
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0001';
      try {
        let buf = buffer.alloc(4);
        buf.writeFloatBE(0x0304, 0);
        expect(buf.writeFloatBE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9700
     * @tc.name       : testFastBufferWriteFloatBE0002
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0002';
      try {
        let buf = buffer.alloc(4);
        buf.writeFloatBE(0x05060708, 0);
        expect(buf.writeFloatBE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9800
     * @tc.name       : testFastBufferWriteFloatBE0003
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xbeef, 0);
        expect(buf.writeFloatBE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_9900
     * @tc.name       : testFastBufferWriteFloatBE0004
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0x4, 0);
        expect(buf.writeFloatBE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10000
     * @tc.name       : testFastBufferWriteFloatBE0005
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xfeedface, 0);
        expect(buf.writeFloatBE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10100
     * @tc.name       : testFastBufferWriteFloatBE0006
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(-2, 0);
        expect(buf.writeFloatBE(-2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10200
     * @tc.name       : testFastBufferWriteFloatBE0007
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(2, 0);
        expect(buf.writeFloatBE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10300
     * @tc.name       : testFastBufferWriteFloatBE0008
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(0xcafebabe, 0);
        expect(buf.writeFloatBE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10400
     * @tc.name       : testFastBufferWriteFloatBE0009
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatBE(123.456, 0);
        expect(buf.writeFloatBE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10500
     * @tc.name       : testFastBufferWriteFloatBE0010
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0010';
      try {
        let buf = buffer.alloc(16);
        buf.writeFloatBE(0xdecafafecacefade, 0);
        expect(buf.writeFloatBE(0xdecafafecacefade, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10600
     * @tc.name       : testFastBufferWriteFloatBE0011
     * @tc.desc       : Test the function of the interface WriteFloatBE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatBE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatBE0011';
      try {
        let buf = buffer.alloc(16);
        expect(buf.writeFloatBE(Number(0x0102030405060708n), 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10700
     * @tc.name       : testFastBufferWriteFloatLE0001
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0001';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x0304, 0);
        expect(buf.writeFloatLE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10800
     * @tc.name       : testFastBufferWriteFloatLE0002
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x05060708, 0);
        expect(buf.writeFloatLE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_10900
     * @tc.name       : testFastBufferWriteFloatLE0003
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xbeef, 0);
        expect(buf.writeFloatLE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11000
     * @tc.name       : testFastBufferWriteFloatLE0004
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0x4, 0);
        expect(buf.writeFloatLE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11100
     * @tc.name       : testFastBufferWriteFloatLE0005
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xfeedface, 0);
        expect(buf.writeFloatLE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11200
     * @tc.name       : testFastBufferWriteFloatLE0006
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(-2, 0);
        expect(buf.writeFloatLE(-2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11300
     * @tc.name       : testFastBufferWriteFloatLE0007
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(2, 0);
        expect(buf.writeFloatLE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11400
     * @tc.name       : testFastBufferWriteFloatLE0008
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(Number(0x0102030405060708n), 0);
        expect(buf.writeFloatLE(Number(0x0102030405060708n), 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11500
     * @tc.name       : testFastBufferWriteFloatLE0009
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xcafebabe, 0);
        expect(buf.writeFloatLE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11600
     * @tc.name       : testFastBufferWriteFloatLE0010
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(123.456, 0);
        expect(buf.writeFloatLE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11700
     * @tc.name       : testFastBufferWriteFloatLE0011
     * @tc.desc       : Test the function of the interface WriteFloatLE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteFloatLE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteFloatLE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeFloatLE(0xdecafafecacefade, 0);
        expect(buf.writeFloatLE(0xdecafafecacefade, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11800
     * @tc.name       : testFastBufferWriteInt80001
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x0304, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 772');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_11900
     * @tc.name       : testFastBufferWriteInt80002
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(-2, 0);
        expect(buf.writeInt8(-2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12000
     * @tc.name       : testFastBufferWriteInt80003
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(2, 0);
        expect(buf.writeInt8(2, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12100
     * @tc.name       : testFastBufferWriteInt80004
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80004';
      try {
        let buf = buffer.alloc(5);
        const res = buf.writeInt8(Number(0x0102030405060708n), 0);
        console.log(`${TAG}res:$${res}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12200
     * @tc.name       : testFastBufferWriteInt80005
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12300
     * @tc.name       : testFastBufferWriteInt80006
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80006';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(123.456, 0);
        expect(buf.writeInt8(123.456, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12400
     * @tc.name       : testFastBufferWriteInt80007
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12500
     * @tc.name       : testFastBufferWriteInt80008
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 84281096');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12600
     * @tc.name       : testFastBufferWriteInt80009
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 48879');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12700
     * @tc.name       : testFastBufferWriteInt80010
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0x4, 0);
        expect(buf.writeInt8(0x4, 0)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12800
     * @tc.name       : testFastBufferWriteInt80011
     * @tc.desc       : Test the function of the interface WriteInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt80011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt8(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_12900
     * @tc.name       : testFastBufferWriteInt16BE0001
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x0304, 0);
        expect(buf.writeInt16BE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13000
     * @tc.name       : testFastBufferWriteInt16BE0002
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 84281096');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13100
     * @tc.name       : testFastBufferWriteInt16BE0003
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 48879');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13200
     * @tc.name       : testFastBufferWriteInt16BE0004
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0x4, 0);
        expect(buf.writeInt16BE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13300
     * @tc.name       : testFastBufferWriteInt16BE0005
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13400
     * @tc.name       : testFastBufferWriteInt16BE0006
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0006';
      try {
        let buf = buffer.alloc(5);
        expect(buf.writeInt16BE(-2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13500
     * @tc.name       : testFastBufferWriteInt16BE0007
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(2, 0);
        expect(buf.writeInt16BE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13600
     * @tc.name       : testFastBufferWriteInt16BE0008
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13700
     * @tc.name       : testFastBufferWriteInt16BE0009
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(123.456, 0);
        expect(buf.writeInt16BE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13800
     * @tc.name       : testFastBufferWriteInt16BE0010
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_13900
     * @tc.name       : testFastBufferWriteInt16BE0011
     * @tc.desc       : Test the function of the interface WriteInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16BE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14000
     * @tc.name       : testFastBufferWriteInt16LE0001
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt160001';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x0304, 0);
        expect(buf.writeInt16LE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14100
     * @tc.name       : testFastBufferWriteInt16LE0002
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0002';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 84281096');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14200
     * @tc.name       : testFastBufferWriteInt16LE0003
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0003';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 48879');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14300
     * @tc.name       : testFastBufferWriteInt16LE0004
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0004';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0x4, 0);
        expect(buf.writeInt16LE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14400
     * @tc.name       : testFastBufferWriteInt16LE0005
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0005';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14500
     * @tc.name       : testFastBufferWriteInt16LE0006
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0006';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(-2, 0);
        expect(buf.writeInt16LE(-2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14600
     * @tc.name       : testFastBufferWriteInt16LE0007
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0007';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(2, 0);
        expect(buf.writeInt16LE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14700
     * @tc.name       : testFastBufferWriteInt16LE0008
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0008';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14800
     * @tc.name       : testFastBufferWriteInt16LE0009
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0009';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(123.456, 0);
        expect(buf.writeInt16LE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_14900
     * @tc.name       : testFastBufferWriteInt16LE0010
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0010';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15000
     * @tc.name       : testFastBufferWriteInt16LE0011
     * @tc.desc       : Test the function of the interface WriteInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt16LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt16LE0011';
      try {
        let buf = buffer.alloc(5);
        buf.writeInt16LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15100
     * @tc.name       : testFastBufferWriteInt32BE0001
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x01020304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15200
     * @tc.name       : testFastBufferWriteInt32BE0002
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15300
     * @tc.name       : testFastBufferWriteInt32BE0003
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x05060708, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15400
     * @tc.name       : testFastBufferWriteInt32BE0004
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xbeef, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15500
     * @tc.name       : testFastBufferWriteInt32BE0005
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0x4, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15600
     * @tc.name       : testFastBufferWriteInt32BE0006
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xfeedface, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15700
     * @tc.name       : testFastBufferWriteInt32BE0007
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(-2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15800
     * @tc.name       : testFastBufferWriteInt32BE0008
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_15900
     * @tc.name       : testFastBufferWriteInt32BE0009
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xcafebabe, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16000
     * @tc.name       : testFastBufferWriteInt32BE0010
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16100
     * @tc.name       : testFastBufferWriteInt32BE0011
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(0xdecafafecacefade, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16200
     * @tc.name       : testFastBufferWriteInt32BE0012
     * @tc.desc       : Test the function of the interface writeInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32BE(Number(0x0102030405060708n), 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16300
     * @tc.name       : testFastBufferWriteInt32LE0001
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x0304, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16400
     * @tc.name       : testFastBufferWriteInt32LE0002
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x050607084, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16500
     * @tc.name       : testFastBufferWriteInt32LE0003
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0xbeef, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16600
     * @tc.name       : testFastBufferWriteInt32LE0004
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0x4, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16700
     * @tc.name       : testFastBufferWriteInt32LE0005
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0005';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(0xfeedface, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16800
     * @tc.name       : testFastBufferWriteInt32LE0006
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(-2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_16900
     * @tc.name       : testFastBufferWriteInt32LE0007
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(2, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17000
     * @tc.name       : testFastBufferWriteInt32LE0008
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0008';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17100
     * @tc.name       : testFastBufferWriteInt32LE0009
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeInt32LE(123.456, 0);
        console.info("result = " + result);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17200
     * @tc.name       : testFastBufferWriteInt32LE0010
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 16053919793946753024')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17300
     * @tc.name       : testFastBufferWriteInt32LE0011
     * @tc.desc       : Test the function of the interface writeInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteInt32LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteInt32LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeInt32LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17400
     * @tc.name       : testFastBufferWriteUInt80001
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x3, 0);
        console.info("result = " + result);
        expect(result).assertEqual(1);
        let result1 = buf.writeUInt8(0x4, 1);
        console.info("result1 = " + result1);
        expect(result1).assertEqual(2);
        let result2 = buf.writeUInt8(0x23, 2);
        console.info("result2 = " + result2);
        expect(result2).assertEqual(3);
        let result3 = buf.writeUInt8(0x42, 3);
        console.info("result3 = " + result3);
        expect(result3).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17500
     * @tc.name       : testFastBufferWriteUInt80002
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x0304, 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 772');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17600
     * @tc.name       : testFastBufferWriteUInt80003
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x05060708, 0);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 84281096');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17700
     * @tc.name       : testFastBufferWriteUInt80004
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0xbeef, 1);
        console.info("result = " + result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 48879');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17800
     * @tc.name       : testFastBufferWriteUInt80005
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(0x4f, 2);
        console.info("result = " + result);
        console.log(`${TAG}reslut:${result}`);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_17900
     * @tc.name       : testFastBufferWriteUInt80006
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xfeedface, 3);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18000
     * @tc.name       : testFastBufferWriteUInt80007
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(-2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: -2')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18100
     * @tc.name       : testFastBufferWriteUInt80008
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xcafebabe, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 3405691582')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18200
     * @tc.name       : testFastBufferWriteUInt80009
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(123.456, 0);
        let result1 = buf.writeUInt8(123.456, 1);
        console.log(`${TAG}reslut:${result}`)
        console.log(`${TAG}reslut1:${result1}`);
        expect(result).assertEqual(1);
        expect(result1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18300
     * @tc.name       : testFastBufferWriteUInt80010
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt8(0xdecafafecacefade, 1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18400
     * @tc.name       : testFastBufferWriteUInt80011
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80011';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(Number(0x0102030405060708n), 2);
        expect(result).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18500
     * @tc.name       : testFastBufferWriteUInt80012
     * @tc.desc       : Test the function of the interface writeUInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt80012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt80012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt8(2, 3);
        console.log(`${TAG} reslut:${result}`);
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18600
     * @tc.name       : testFastBufferWriteUInt16BE0001
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        let result = buf.writeUInt16BE(0xdead, 0);
        console.info("result = " + result);
        expect(result).assertEqual(2);
        let result1 = buf.writeUInt16BE(0xbeef, 2);
        console.info("result1 = " + result1);
        expect(result1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18700
     * @tc.name       : testFastBufferWriteUInt16BE0002
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0x0304, 0);
        console.log(`${TAG}+reslut:+${res}`);
        expect(buf.writeUInt16BE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18800
     * @tc.name       : testFastBufferWriteUInt16BE0003
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 84281096');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_18900
     * @tc.name       : testFastBufferWriteUInt16BE0004
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0xbeef, 0);
        console.log(`${TAG} reslut:${res}`);
        expect(buf.writeUInt16BE(0xbeef, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19000
     * @tc.name       : testFastBufferWriteUInt16BE0005
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(0x4, 0);
        console.log(`${TAG} reslut:${res}`);
        expect(buf.writeUInt16BE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19100
     * @tc.name       : testFastBufferWriteUInt16BE0006
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 4277009102');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19200
     * @tc.name       : testFastBufferWriteUInt16BE0007
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: -2');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19300
     * @tc.name       : testFastBufferWriteUInt16BE0008
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const res = buf.writeUInt16BE(2, 0);
        console.log(`${TAG} res = ${res}`);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19400
     * @tc.name       : testFastBufferWriteUInt16BE0009
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3405691582');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19500
     * @tc.name       : testFastBufferWriteUInt16BE0010
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        const result = buf.writeUInt16BE(123.456, 0);
        const result1 = buf.readUInt16BE(0)
        console.log(`${TAG} result: ${result}`)
        console.log(`${TAG} result1: ${result1}`);
        expect(buf.readUInt16BE(0)).assertEqual(123);
        expect(buf.writeUInt16BE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19600
     * @tc.name       : testFastBufferWriteUInt16BE0011
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(0xdeadbeef, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3735928559');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19700
     * @tc.name       : testFastBufferWriteUInt16BE0012
     * @tc.desc       : Test the function of the interface writeUInt16BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16BE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16BE0012';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 72623859790382848')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19800
     * @tc.name       : testFastBufferWriteUInt16LE0001
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0001';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x0304, 0);
        expect(buf.writeUInt16LE(0x0304, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_19900
     * @tc.name       : testFastBufferWriteUInt16LE0002
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x05060708, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 84281096')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20000
     * @tc.name       : testFastBufferWriteUInt16LE0003
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xbeef, 0);
        expect(buf.writeUInt16LE(0xbeef, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20100
     * @tc.name       : testFastBufferWriteUInt16LE0004
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0x4, 0);
        expect(buf.writeUInt16LE(0x4, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20200
     * @tc.name       : testFastBufferWriteUInt16LE0005
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xfeedface, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 4277009102')

      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20300
     * @tc.name       : testFastBufferWriteUInt16LE0006
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: -2');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20400
     * @tc.name       : testFastBufferWriteUInt16LE0007
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(2, 0);
        expect(buf.writeUInt16LE(2, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20500
     * @tc.name       : testFastBufferWriteUInt16LE0008
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xcafebabe, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 3405691582');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20600
     * @tc.name       : testFastBufferWriteUInt16LE0009
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(123.456, 0);
        expect(buf.writeUInt16LE(123.456, 0)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20700
     * @tc.name       : testFastBufferWriteUInt16LE0010
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20800
     * @tc.name       : testFastBufferWriteUInt16LE0011
     * @tc.desc       : Test the function of the interface writeUInt16LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt16LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt16LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt16LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_20900
     * @tc.name       : testFastBufferWriteUInt32BE0001
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x0304, 0);
        expect(buf.writeUInt32BE(0x0304, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21000
     * @tc.name       : testFastBufferWriteUInt32BE0002
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x05060708, 0);
        expect(buf.writeUInt32BE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21100
     * @tc.name       : testFastBufferWriteUInt32BE0003
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xbeef, 0);
        expect(buf.writeUInt32BE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21200
     * @tc.name       : testFastBufferWriteUInt32BE0004
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0x4, 0);
        expect(buf.writeUInt32BE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21300
     * @tc.name       : testFastBufferWriteUInt32BE0005
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xfeedface, 0);
        expect(buf.writeUInt32BE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21400
     * @tc.name       : testFastBufferWriteUInt32BE0006
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0006';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: -2');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21500
     * @tc.name       : testFastBufferWriteUInt32BE0007
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(2, 0);
        expect(buf.writeUInt32BE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21600
     * @tc.name       : testFastBufferWriteUInt32BE0008
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xcafebabe, 0);
        expect(buf.writeUInt32BE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21700
     * @tc.name       : testFastBufferWriteUInt32BE0009
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(123.456, 0);
        expect(buf.writeUInt32BE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21800
     * @tc.name       : testFastBufferWriteUInt32BE0010
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 16053919793946753024');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_21900
     * @tc.name       : testFastBufferWriteUInt32BE0011
     * @tc.desc       : Test the function of the interface writeUInt32BE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32BE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32BE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32BE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 72623859790382848');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22000
     * @tc.name       : testFastBufferWriteUInt32LE0001
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0001';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x0304, 0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22100
     * @tc.name       : testFastBufferWriteUInt32LE0002
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0002';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x05060708, 0);
        expect(buf.writeUInt32LE(0x05060708, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22200
     * @tc.name       : testFastBufferWriteUInt32LE0003
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0003';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xbeef, 0);
        expect(buf.writeUInt32LE(0xbeef, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22300
     * @tc.name       : testFastBufferWriteUInt32LE0004
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0004';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0x4, 0);
        expect(buf.writeUInt32LE(0x4, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22400
     * @tc.name       : testFastBufferWriteUInt32LE0005
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0005';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xfeedface, 0);
        expect(buf.writeUInt32LE(0xfeedface, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22500
     * @tc.name       : testFastBufferWriteUInt32LE0006
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0006';
      try {

        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(-2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: -2')

      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22600
     * @tc.name       : testFastBufferWriteUInt32LE0007
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0007';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(2, 0);
        expect(buf.writeUInt32LE(2, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22700
     * @tc.name       : testFastBufferWriteUInt32LE0008
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0008';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xcafebabe, 0);
        expect(buf.writeUInt32LE(0xcafebabe, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22800
     * @tc.name       : testFastBufferWriteUInt32LE0009
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0009';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(123.456, 0);
        expect(buf.writeUInt32LE(123.456, 0)).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_22900
     * @tc.name       : testFastBufferWriteUInt32LE0010
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0010';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(0xdecafafecacefade, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 16053919793946753024');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_WRITE_23000
     * @tc.name       : testFastBufferWriteUInt32LE0011
     * @tc.desc       : Test the function of the interface writeUInt32LE.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferWriteUInt32LE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferWriteUInt32LE0011';
      try {
        let buf = buffer.allocUninitializedFromPool(4);
        buf.writeUInt32LE(Number(0x0102030405060708n), 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual('The value of "value" is out of range. It must be >= 0 and <= 4294967295. Received value is: 72623859790382848');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_READUINTLE_0500
     * @tc.name       : testFastBufferReadUIntLE0005
     * @tc.desc       : 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFastBufferReadUIntLE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testFastBufferReadUIntLE0005 == ';
      let buf = buffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
      console.info(TAG + buf.readUIntLE(0, 6).toString(16));
      expect(buf.readUIntLE(0, 6).toString(16)).assertEqual('ab9078563412');
      console.info(TAG + buf.readIntLE(0, 6).toString(16));
      expect(buf.readIntLE(0, 6).toString(16)).assertEqual('-546f87a9cbee');
    })
  });
}