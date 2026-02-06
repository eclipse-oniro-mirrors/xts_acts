/*
* Copyright (c) 2024 huawei Technology Development Co., LTD.
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

import buffer from '@ohos.buffer';
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let TAG = "BufferSupplementTest";

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface GeneratedObjectLiteralInterface_1 {
  type: string;
  endings: string;
}

export default function ActsBuffer3Test() {
  describe('ActsBuffer3Test', () => {
    afterEach(async (done: Function) => {
      await sleep(20);
      done();
    })

    /**
     * @tc.name   testWriteBigInt64LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGINT64LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64LEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigInt64LE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGINT64LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64LEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigInt64LE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGUINT64BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64BEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigUInt64BE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGUINT64BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64BEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigUInt64BE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGUINT64LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64LEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigUInt64LE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGUINT64LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64LEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigUInt64LE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEDOUBLEBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleBEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeDoubleBE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEDOUBLEBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleBEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeDoubleBE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEDOUBLELE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleLEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeDoubleLE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEDOUBLELE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleLEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeDoubleLE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEFLOATBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatBEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeFloatBE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEFLOATBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatBEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeFloatBE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEFLOATLE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatLEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeFloatLE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEFLOATLE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatLEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeFloatLE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt8OffsetNull
     * @tc.number SUB_BUFFER_WRITEINT8_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt8 with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt8OffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt8OffsetNull";
      try {

        let buf = buffer.alloc(2);
        let result = buf.writeInt8(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt8OffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT8_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt8 with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt8OffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt8OffsetUndefined";
      try {

        let buf = buffer.alloc(2);
        let result = buf.writeInt8(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT16BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16BEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeInt16BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT16BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16BEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeInt16BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT16LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16LEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeInt16LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT16LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16LEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeInt16LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT32BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32BEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeInt32BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT32BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32BEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeInt32BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT32LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32LEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeInt32LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT32LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32LEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeInt32LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteIntBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINTBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntBE(42, null, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINTBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntBE(42, undefined, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntBEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEByteLengthNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntBE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEByteLengthUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntBE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINTLE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntLE(42, null, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINTLE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntLE(42, undefined, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEByteLengthNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntLE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEByteLengthUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeIntLE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUInt8OffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT8_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt8 with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt8OffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt8OffsetNull";
      try {

        let buf = buffer.alloc(2);
        let result = buf.writeUInt8(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt8OffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT8_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt8 with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt8OffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt8OffsetUndefined";
      try {

        let buf = buffer.alloc(2);
        let result = buf.writeUInt8(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT16BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16BEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeUInt16BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT16BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16BEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeUInt16BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT16LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16LEOffsetNull";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeUInt16LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT16LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16LEOffsetUndefined";
      try {

        let buf = buffer.alloc(4);
        let result = buf.writeUInt16LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT32BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32BEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUInt32BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT32BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32BEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUInt32BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT32LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32LEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUInt32LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT32LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32LEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUInt32LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUIntBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINTBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntBE(42, null, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINTBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntBE(42, undefined, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntBEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEUINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEByteLengthNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntBE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEUINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEByteLengthUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntBE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINTLE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntLE(42, null, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINTLE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntLE(42, undefined, 4);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEUINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEByteLengthNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntLE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEUINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEByteLengthUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeUIntLE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetNull
     * @tc.number SUB_BUFFER_LASTINDEXOF_BYTEOFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetNull";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetUndefined
     * @tc.number SUB_BUFFER_LASTINDEXOF_BYTEOFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetUndefined";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap16ReturnLength
     * @tc.number SUB_BUFFER_SWAP16_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap16 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap16ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap16ReturnLength";
      try {
        let buf = buffer.from('1234');
        let result = buf.swap16();
        expect(result.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap16ReturnBuffer
     * @tc.number SUB_BUFFER_SWAP16_RETURN_BUFFER_0100
     * @tc.desc   Testing Buffer.prototype.swap16 return value buffer property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap16ReturnBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap16ReturnBuffer";
      try {
        let buf = buffer.from('1234');
        let result = buf.swap16();
        expect(result.buffer instanceof ArrayBuffer).assertTrue();
        expect(result.buffer.byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap32ReturnLength
     * @tc.number SUB_BUFFER_SWAP32_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap32 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap32ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap32ReturnLength";
      try {
        let buf = buffer.from('12345678');
        let result = buf.swap32();
        expect(result.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap32ReturnBuffer
     * @tc.number SUB_BUFFER_SWAP32_RETURN_BUFFER_0100
     * @tc.desc   Testing Buffer.prototype.swap32 return value buffer property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap32ReturnBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap32ReturnBuffer";
      let buf = buffer.from('12345678');
      let result = buf.swap32();
      expect(result.buffer instanceof ArrayBuffer).assertTrue();
      expect(result.buffer.byteLength).assertEqual(8);
    })

    /**
     * @tc.name   testSwap64ReturnLength
     * @tc.number SUB_BUFFER_SWAP64_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap64 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap64ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap64ReturnLength";
      try {
        let buf = buffer.from('1234567812345678');
        let result = buf.swap64();
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobSizeFromBuffer
     * @tc.number SUB_BUFFER_BLOB_SIZE_FROM_BUFFER_0100
     * @tc.desc   Testing Blob.size property created from buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobSizeFromBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobSizeFromBuffer";
      try {
        let buf = buffer.from('Hello World');
        let sources = [buf.buffer];
        let blob = new buffer.Blob(sources);
        expect(blob.size).assertEqual(11);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobSizeWithSpecialChars
     * @tc.number SUB_BUFFER_BLOB_SIZE_SPECIAL_CHARS_0100
     * @tc.desc   Testing Blob.size property with special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobSizeWithSpecialChars', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobSizeWithSpecialChars";
      try {
        let sources = ['!@#$%^&*()'];
        let blob = new buffer.Blob(sources);
        expect(blob.size).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobSizeLargeData
     * @tc.number SUB_BUFFER_BLOB_SIZE_LARGE_DATA_0100
     * @tc.desc   Testing Blob.size property with large data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobSizeLargeData', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobSizeLargeData";
      try {
        let largeStr = 'a'.repeat(1000);
        let sources = [largeStr];
        let blob = new buffer.Blob(sources);
        expect(blob.size).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobSizeMultipleSources
     * @tc.number SUB_BUFFER_BLOB_SIZE_MULTIPLE_SOURCES_0100
     * @tc.desc   Testing Blob.size property with multiple sources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobSizeMultipleSources', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobSizeMultipleSources";
      try {
        let sources = ['Hello', ' ', 'World', '!'];
        let blob = new buffer.Blob(sources);
        expect(blob.size).assertEqual(12);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobTypeTextPlain
     * @tc.number SUB_BUFFER_BLOB_TYPE_TEXT_PLAIN_0100
     * @tc.desc   Testing Blob.type property with text/plain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobTypeTextPlain', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobTypeTextPlain";
      try {
        let option: GeneratedObjectLiteralInterface_1 = {
          type: "text/plain",
          endings: "transparent"
        };
        let sources = ["Hello World"];
        let blob = new buffer.Blob(sources, option);
        expect(blob.type).assertEqual("text/plain");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobTypeApplicationJson
     * @tc.number SUB_BUFFER_BLOB_TYPE_APP_JSON_0100
     * @tc.desc   Testing Blob.type property with application/json
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobTypeApplicationJson', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobTypeApplicationJson";
      try {
        let option: GeneratedObjectLiteralInterface_1 = {
          type: "application/json",
          endings: "transparent"
        };
        let sources = ['{"key": "value"}'];
        let blob = new buffer.Blob(sources, option);
        expect(blob.type).assertEqual("application/json");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobTypeImagePng
     * @tc.number SUB_BUFFER_BLOB_TYPE_IMAGE_PNG_0100
     * @tc.desc   Testing Blob.type property with image/png
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobTypeImagePng', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobTypeImagePng";
      try {
        let option: GeneratedObjectLiteralInterface_1 = {
          type: "image/png",
          endings: "transparent"
        };
        let sources = ["binary data"];
        let blob = new buffer.Blob(sources, option);
        expect(blob.type).assertEqual("image/png");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobTypeCustomMime
     * @tc.number SUB_BUFFER_BLOB_TYPE_CUSTOM_MIME_0100
     * @tc.desc   Testing Blob.type property with custom MIME type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobTypeCustomMime', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobTypeCustomMime";
      try {
        let option: GeneratedObjectLiteralInterface_1 = {
          type: "application/custom-type",
          endings: "transparent"
        };
        let sources = ["custom data"];
        let blob = new buffer.Blob(sources, option);
        expect(blob.type).assertEqual("application/custom-type");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBlobTypeWithNative
     * @tc.number SUB_BUFFER_BLOB_TYPE_WITH_NATIVE_0100
     * @tc.desc   Testing Blob.type property with native endings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBlobTypeWithNative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testBlobTypeWithNative";
      try {
        let option: GeneratedObjectLiteralInterface_1 = {
          type: "text/html",
          endings: "native"
        };
        let sources = ["<html></html>"];
        let blob = new buffer.Blob(sources, option);
        expect(blob.type).assertEqual("text/html");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocEncodingNull
     * @tc.number SUB_BUFFER_ALLOC_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.alloc with encoding parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocEncodingNull";
      try {

        let buf = buffer.alloc(10, 'a', null);
        expect(buf.length).assertEqual(10);
        expect(buf.toString()).assertEqual('aaaaaaaaaa');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocEncodingUndefined
     * @tc.number SUB_BUFFER_ALLOC_ENCODING_UNDEFINED_0100
     * @tc.desc   Testing Buffer.alloc with encoding parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocEncodingUndefined";
      try {

        let buf = buffer.alloc(10, 'a', undefined);
        expect(buf.length).assertEqual(10);
        expect(buf.toString()).assertEqual('aaaaaaaaaa');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillNullEncodingNull
     * @tc.number SUB_BUFFER_ALLOC_FILL_NULL_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.alloc with fill as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillNullEncodingNull";
      try {

        let buf = buffer.alloc(10, null, null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillUndefinedEncodingUndefined
     * @tc.number SUB_BUFFER_ALLOC_FILL_UNDEF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.alloc with fill as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillUndefinedEncodingUndefined";
      try {

        let buf = buffer.alloc(10, undefined, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillNullWithEncoding
     * @tc.number SUB_BUFFER_ALLOC_FILL_NULL_WITH_ENCODING_0100
     * @tc.desc   Testing Buffer.alloc with fill as null and encoding as utf8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillNullWithEncoding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillNullWithEncoding";
      try {

        let buf = buffer.alloc(10, null, 'utf8');
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthEncodingNull
     * @tc.number SUB_BUFFER_BYTELENGTH_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with encoding parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthEncodingNull";
      try {

        let len = buffer.byteLength('hello world', null);
        expect(len).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthEncodingUndefined
     * @tc.number SUB_BUFFER_BYTELENGTH_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with encoding parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthEncodingUndefined";
      try {

        let len = buffer.byteLength('hello world', undefined);
        expect(len).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthStringNullEncodingNull
     * @tc.number SUB_BUFFER_BYTELENGTH_STR_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with string as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthStringNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthStringNullEncodingNull";
      try {

        let len = buffer.byteLength(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testByteLengthStringUndefinedEncodingUndefined
     * @tc.number SUB_BUFFER_BYTELENGTH_STR_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with string as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthStringUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthStringUndefinedEncodingUndefined";
      try {

        let len = buffer.byteLength(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testByteLengthBufferEncodingNull
     * @tc.number SUB_BUFFER_BYTELENGTH_BUFFER_ENC_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with Buffer and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthBufferEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthBufferEncodingNull";
      try {

        let buf = buffer.from('hello');
        let len = buffer.byteLength(buf, null);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthBufferEncodingUndefined
     * @tc.number SUB_BUFFER_BYTELENGTH_BUFFER_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with Buffer and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthBufferEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthBufferEncodingUndefined";
      try {

        let buf = buffer.from('hello');
        let len = buffer.byteLength(buf, undefined);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListNull
     * @tc.number SUB_BUFFER_CONCAT_LIST_NULL_0100
     * @tc.desc   Testing Buffer.concat with list parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListNull";
      try {

        let result = buffer.concat(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListUndefined
     * @tc.number SUB_BUFFER_CONCAT_LIST_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with list parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListUndefined";
      try {

        let result = buffer.concat(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatTotalLengthNull
     * @tc.number SUB_BUFFER_CONCAT_TOTALLEN_NULL_0100
     * @tc.desc   Testing Buffer.concat with totalLength parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatTotalLengthNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('world');
        let result = buffer.concat([buf1, buf2], null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatTotalLengthUndefined
     * @tc.number SUB_BUFFER_CONCAT_TOTALLEN_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with totalLength parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatTotalLengthUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('world');
        let result = buffer.concat([buf1, buf2], undefined);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListNullTotalLengthNull
     * @tc.number SUB_BUFFER_CONCAT_LIST_NULL_TL_NULL_0100
     * @tc.desc   Testing Buffer.concat with list as null and totalLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListNullTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListNullTotalLengthNull";
      try {

        let result = buffer.concat(null, null);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListUndefinedTotalLengthUndefined
     * @tc.number SUB_BUFFER_CONCAT_LIST_UNDEF_TL_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with list as undefined and totalLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListUndefinedTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListUndefinedTotalLengthUndefined";
      try {

        let result = buffer.concat(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListEmptyTotalLengthNull
     * @tc.number SUB_BUFFER_CONCAT_LIST_EMPTY_TL_NULL_0100
     * @tc.desc   Testing Buffer.concat with empty list and totalLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListEmptyTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListEmptyTotalLengthNull";
      try {

        let result = buffer.concat([], null);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListEmptyTotalLengthUndefined
     * @tc.number SUB_BUFFER_CONCAT_LIST_EMPTY_TL_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with empty list and totalLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListEmptyTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListEmptyTotalLengthUndefined";
      try {

        let result = buffer.concat([], undefined);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayEmpty
     * @tc.number SUB_BUFFER_FROM_ARRAY_EMPTY_0100
     * @tc.desc   Testing Buffer.from with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayEmpty";
      try {

        let result = buffer.from([]);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferByteOffsetNull
     * @tc.number SUB_BUFFER_FROM_ARRAYBUF_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferByteOffsetNull";
      try {

        let ab = new ArrayBuffer(10);
        let result = buffer.from(ab, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferByteOffsetUndefined
     * @tc.number SUB_BUFFER_FROM_ARRAYBUF_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferByteOffsetUndefined";
      try {

        let ab = new ArrayBuffer(10);
        let result = buffer.from(ab, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferLengthUndefined
     * @tc.number SUB_BUFFER_FROM_ARRAYBUF_LENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and length as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferLengthUndefined";
      try {

        let ab = new ArrayBuffer(10);
        let result = buffer.from(ab, 0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectNull
     * @tc.number SUB_BUFFER_FROM_OBJECT_NULL_0100
     * @tc.desc   Testing Buffer.from with object as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectNull";
      try {

        let result = buffer.from(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFromObjectUndefined
     * @tc.number SUB_BUFFER_FROM_OBJECT_UNDEF_0100
     * @tc.desc   Testing Buffer.from with object as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectUndefined";
      try {

        let result = buffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFromObjectOffsetNull
     * @tc.number SUB_BUFFER_FROM_OBJECT_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.from with object and offsetOrEncoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectOffsetNull";
      try {
        let result = buffer.from(new String('this is a test'), null);
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectOffsetUndefined
     * @tc.number SUB_BUFFER_FROM_OBJECT_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.from with object and offsetOrEncoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectOffsetUndefined";
      try {

        let result = buffer.from(new String('this is a test'), undefined);
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectLengthNull
     * @tc.number SUB_BUFFER_FROM_OBJECT_LENGTH_NULL_0100
     * @tc.desc   Testing Buffer.from with object and length as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectLengthNull";
      try {

        let result = buffer.from(new String('this is a test'), 0, null);
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectLengthUndefined
     * @tc.number SUB_BUFFER_FROM_OBJECT_LENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.from with object and length as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectLengthUndefined";
      try {

        let result = buffer.from(new String('this is a test'), 0, undefined);
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectOffsetEmptyString
     * @tc.number SUB_BUFFER_FROM_OBJECT_OFFSET_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.from with object and offsetOrEncoding as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */












    /**
     * @tc.name   testFromStringEncodingNull
     * @tc.number SUB_BUFFER_FROM_STRING_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.from with string and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromStringEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromStringEncodingNull";
      try {

        let result = buffer.from('hello', null);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromStringEncodingUndefined
     * @tc.number SUB_BUFFER_FROM_STRING_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.from with string and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromStringEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromStringEncodingUndefined";
      try {

        let result = buffer.from('hello', undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTranscodeFromEncEmptyString
     * @tc.number SUB_BUFFER_TRANSCODE_FROMENC_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.transcode with fromEnc as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeFromEncEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeFromEncEmptyString";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, '', 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeFromEncNull
     * @tc.number SUB_BUFFER_TRANSCODE_FROMENC_NULL_0100
     * @tc.desc   Testing Buffer.transcode with fromEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeFromEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeFromEncNull";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, null, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeFromEncUndefined
     * @tc.number SUB_BUFFER_TRANSCODE_FROMENC_UNDEF_0100
     * @tc.desc   Testing Buffer.transcode with fromEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeFromEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeFromEncUndefined";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, undefined, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncEmptyString
     * @tc.number SUB_BUFFER_TRANSCODE_TOENC_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncEmptyString";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, 'utf8', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncNull
     * @tc.number SUB_BUFFER_TRANSCODE_TOENC_NULL_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncNull";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, 'utf8', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncUndefined
     * @tc.number SUB_BUFFER_TRANSCODE_TOENC_UNDEF_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncUndefined";
      try {

        let buf = buffer.from('hello', 'utf8');
        let result = buffer.transcode(buf, 'utf8', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFillValueNull
     * @tc.number SUB_BUFFER_FILL_VALUE_NULL_0100
     * @tc.desc   Testing Buffer.prototype.fill with value as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillValueNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillValueNull";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill(null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillValueUndefined
     * @tc.number SUB_BUFFER_FILL_VALUE_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with value as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillValueUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillValueUndefined";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill(undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillOffsetNull
     * @tc.number SUB_BUFFER_FILL_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.fill with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillOffsetNull";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillOffsetUndefined
     * @tc.number SUB_BUFFER_FILL_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillOffsetUndefined";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEndNull
     * @tc.number SUB_BUFFER_FILL_END_NULL_0100
     * @tc.desc   Testing Buffer.prototype.fill with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEndNull";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', 0, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEndUndefined
     * @tc.number SUB_BUFFER_FILL_END_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEndUndefined";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', 0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEncodingNull
     * @tc.number SUB_BUFFER_FILL_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.fill with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEncodingNull";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', 0, 10, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEncodingUndefined
     * @tc.number SUB_BUFFER_FILL_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEncodingUndefined";
      try {

        let buf = buffer.alloc(10);
        let result = buf.fill('a', 0, 10, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareTargetEndNull
     * @tc.number SUB_BUFFER_COMPARE_TARGETEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with targetEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareTargetEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareTargetEndNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, null);
        expect(result === 0 || result === -1 || result === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareTargetEndUndefined
     * @tc.number SUB_BUFFER_COMPARE_TARGETEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with targetEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareTargetEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareTargetEndUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, undefined);
        expect(result === 0 || result === -1 || result === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareSourceStartNull
     * @tc.number SUB_BUFFER_COMPARE_SOURCESTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceStartNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceStartUndefined
     * @tc.number SUB_BUFFER_COMPARE_SOURCESTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceStartUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceEndNull
     * @tc.number SUB_BUFFER_COMPARE_SOURCEEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceEndNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceEndUndefined
     * @tc.number SUB_BUFFER_COMPARE_SOURCEEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceEndUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCopyTargetStartNull
     * @tc.number SUB_BUFFER_COPY_TARGETSTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with targetStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopyTargetStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopyTargetStartNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopyTargetStartUndefined
     * @tc.number SUB_BUFFER_COPY_TARGETSTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with targetStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopyTargetStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopyTargetStartUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceStartNull
     * @tc.number SUB_BUFFER_COPY_SOURCESTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceStartNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceStartUndefined
     * @tc.number SUB_BUFFER_COPY_SOURCESTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceStartUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceEndNull
     * @tc.number SUB_BUFFER_COPY_SOURCEEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceEndNull";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, 0, 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceEndUndefined
     * @tc.number SUB_BUFFER_COPY_SOURCEEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceEndUndefined";
      try {

        let buf1 = buffer.from('hello');
        let buf2 = buffer.alloc(10);
        let result = buf1.copy(buf2, 0, 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetNull
     * @tc.number SUB_BUFFER_INDEXOF_BYTEOFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetNull";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetUndefined
     * @tc.number SUB_BUFFER_INDEXOF_BYTEOFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfEncodingNull
     * @tc.number SUB_BUFFER_INDEXOF_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfEncodingNull";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfEncodingUndefined
     * @tc.number SUB_BUFFER_INDEXOF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfEncodingUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetNullEncodingNull
     * @tc.number SUB_BUFFER_INDEXOF_OFFSET_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetNullEncodingNull";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', null, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetUndefinedEncodingUndefined
     * @tc.number SUB_BUFFER_INDEXOF_OFFSET_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetUndefinedEncodingUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.indexOf('hello', undefined, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfEncodingNull
     * @tc.number SUB_BUFFER_LASTINDEXOF_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfEncodingNull";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfEncodingUndefined
     * @tc.number SUB_BUFFER_LASTINDEXOF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfEncodingUndefined";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetNullEncodingNull
     * @tc.number SUB_BUFFER_LASTINDEXOF_OFFSET_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetNullEncodingNull";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', null, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetUndefinedEncodingUndefined
     * @tc.number SUB_BUFFER_LASTINDEXOF_OFFSET_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetUndefinedEncodingUndefined";
      try {

        let buf = buffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', undefined, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testReadIntBEByteLengthNull
     * @tc.number SUB_BUFFER_READINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_READINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEOffsetNullByteLengthNull
     * @tc.number SUB_BUFFER_READINTBE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEOffsetNullByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_BUFFER_READINTBE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEByteLengthNull
     * @tc.number SUB_BUFFER_READINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_READINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEOffsetNullByteLengthNull
     * @tc.number SUB_BUFFER_READINTLE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEOffsetNullByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_BUFFER_READINTLE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEByteLengthNull
     * @tc.number SUB_BUFFER_READUINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_READUINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEOffsetNullByteLengthNull
     * @tc.number SUB_BUFFER_READUINTBE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEOffsetNullByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_BUFFER_READUINTBE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEByteLengthNull
     * @tc.number SUB_BUFFER_READUINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_READUINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEOffsetNullByteLengthNull
     * @tc.number SUB_BUFFER_READUINTLE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEOffsetNullByteLengthNull";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_BUFFER_READUINTLE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = buffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testSubarrayEndUndefined
     * @tc.number SUB_BUFFER_SUBARRAY_END_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.subarray with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSubarrayEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSubarrayEndUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.subarray(0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringStartNull
     * @tc.number SUB_BUFFER_TOSTRING_START_NULL_0100
     * @tc.desc   Testing Buffer.prototype.toString with start as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringStartNull";
      try {

        let buf = buffer.from('hello world');
        let result = buf.toString('utf8', null);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringStartUndefined
     * @tc.number SUB_BUFFER_TOSTRING_START_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.toString with start as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringStartUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.toString('utf8', undefined);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringEndNull
     * @tc.number SUB_BUFFER_TOSTRING_END_NULL_0100
     * @tc.desc   Testing Buffer.prototype.toString with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringEndNull";
      try {

        let buf = buffer.from('hello world');
        let result = buf.toString('utf8', 0, null);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringEndUndefined
     * @tc.number SUB_BUFFER_TOSTRING_END_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.toString with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringEndUndefined";
      try {

        let buf = buffer.from('hello world');
        let result = buf.toString('utf8', 0, undefined);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteEncodingEmptyString
     * @tc.number SUB_BUFFER_WRITE_ENCODING_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingEmptyString";
      try {

        let buf = buffer.alloc(10);
        let result = buf.write('hello', 0, 5, '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteEncodingNull
     * @tc.number SUB_BUFFER_WRITE_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingNull";
      try {

        let buf = buffer.alloc(10);
        let result = buf.write('hello', 0, 5, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteEncodingUndefined
     * @tc.number SUB_BUFFER_WRITE_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingUndefined";
      try {

        let buf = buffer.alloc(10);
        let result = buf.write('hello', 0, 5, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGINT64BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64BEOffsetNull";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigInt64BE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGINT64BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64BEOffsetUndefined";
      try {

        let buf = buffer.alloc(8);
        let result = buf.writeBigInt64BE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

  })
}
