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
import { ArkTSUtils, collections } from '@kit.ArkTS';
import {
  getArray,
  getArrayBuffer,
  getASON,
  getAsyncLock,
  getBigInt,
  getBitVector,
  getBoolean,
  getConcatArray,
  getEnum,
  getMap,
  getNull,
  getNumber,
  getSendableUnionArray,
  getSet,
  getString,
  getTopLevelClassInstance,
  getTopLevelFunction,
  getTypedArrayFloat32Array,
  getTypedArrayInt16Array,
  getTypedArrayInt32Array,
  getTypedArrayInt8Array,
  getTypedArrayUint16Array,
  getTypedArrayUint32Array,
  getTypedArrayUint8Array,
  getTypedArrayUint8ClampedArray,
  getUndefined,
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableArrowNewStaticReadonlyClass,
  SendableExpressionArrowOutStaticReadonlyClass,
  SendableNonFuncStaticReadonlyClass,
  SendableNonParameterFuncStaticReadonlyClass,
  SendableStaticReadonlyClass,
  SendableFuncType,
  topLevelSendableClass
} from './SendableClass_static_readonly';

new SendableNonParameterFuncStaticReadonlyClass();
new SendableNonFuncStaticReadonlyClass();
new SendableArrowNewStaticReadonlyClass();

@Sendable
export class SendableExpressionOutArrowStaticReadonlyClass implements ISendable {
  static myString: string = getString();
  static myNumber: number = getNumber();
  static myBoolean: boolean = getBoolean();
  static myBigInt: bigint = getBigInt();
  static myUndefined: undefined | string | number | null = getUndefined();
  static myNull: undefined | string | number | null = getNull();
  static topLevelClassInstance: topLevelSendableClass = getTopLevelClassInstance();
  static topLevelFunction: SendableFuncType = getTopLevelFunction();
  static myEnum: SendableConstEnum = getEnum();
  static myArray: collections.Array<number> = getArray();
  static myMap: collections.Map<number, number> = getMap();
  static mySet: collections.Set<number> = getSet();
  static myTypedArrayInt8Array: collections.Int8Array = getTypedArrayInt8Array();
  static myTypedArrayUint8Array: collections.Uint8Array = getTypedArrayUint8Array();
  static myTypedArrayInt16Array: collections.Int16Array = getTypedArrayInt16Array();
  static myTypedArrayUint16Array: collections.Uint16Array = getTypedArrayUint16Array();
  static myTypedArrayInt32Array: collections.Int32Array = getTypedArrayInt32Array();
  static myTypedArrayUint32Array: collections.Uint32Array = getTypedArrayUint32Array();
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = getTypedArrayUint8ClampedArray();
  static myTypedArrayFloat32Array: collections.Float32Array = getTypedArrayFloat32Array();
  static myArrayBuffer: collections.ArrayBuffer = getArrayBuffer();
  static myConcatArray: collections.ConcatArray<number> = getConcatArray();
  static myBitVector: collections.BitVector = getBitVector();
  static myASON: ISendable = getASON();
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = getAsyncLock();
  static mySendableUnionArray: string | number | boolean | bigint = getSendableUnionArray();

  constructor() {
  }
}

export default function sendableClassStaticReadonlyTest() {
  describe('ActsSendableClassStaticReadonlyTest', () => {
    /**
     * @tc.name   testSendableStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0100
     * @tc.desc   Test SendableStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0001';
      try {
        expect(SendableStaticReadonlyClass.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0200
     * @tc.desc   Test SendableStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0002';
      try {
        expect(SendableStaticReadonlyClass.myNumber).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0300
     * @tc.desc   Test SendableStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0003';
      try {
        expect(SendableStaticReadonlyClass.myBoolean).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0400
     * @tc.desc   Test SendableStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0004';
      try {
        expect(SendableStaticReadonlyClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0500
     * @tc.desc   Test SendableStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0005';
      try {
        expect(SendableStaticReadonlyClass.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0600
     * @tc.desc   Test SendableStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0006';
      try {
        expect(SendableStaticReadonlyClass.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0700
     * @tc.desc   Test SendableStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0007';
      try {
        expect(SendableStaticReadonlyClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
        SendableStaticReadonlyClass.topLevelClassInstance.num = 2;
        expect(SendableStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0800
     * @tc.desc   Test SendableStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0008';
      try {
        expect(typeof SendableStaticReadonlyClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableStaticReadonlyClass.topLevelFunction()).assertEqual('Top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_0900
     * @tc.desc   Test SendableStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0009';
      try {
        expect(typeof SendableStaticReadonlyClass.myEnum).assertEqual('number');
        expect(SendableStaticReadonlyClass.myEnum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1000
     * @tc.desc   Test SendableStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0010';
      try {
        expect(typeof SendableStaticReadonlyClass.myArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myArray.toString()).assertEqual('');
        SendableStaticReadonlyClass.myArray.push(4, 5);
        expect(SendableStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1100
     * @tc.desc   Test SendableStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0011';
      try {
        expect(typeof SendableStaticReadonlyClass.myMap).assertEqual('object');
        expect(SendableStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
        SendableStaticReadonlyClass.myMap.set(1, 2);
        expect(SendableStaticReadonlyClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1200
     * @tc.desc   Test SendableStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0012';
      try {
        expect(typeof SendableStaticReadonlyClass.mySet).assertEqual('object');
        expect(SendableStaticReadonlyClass.mySet.has(123)).assertEqual(false);
        SendableStaticReadonlyClass.mySet.add(123);
        expect(SendableStaticReadonlyClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1300
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0013';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1400
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0014';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1500
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0015';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1600
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0016';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1700
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0017';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1800
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0018';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_1900
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0019';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2000
     * @tc.desc   Test SendableStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0020';
      try {
        expect(typeof SendableStaticReadonlyClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2100
     * @tc.desc   Test SendableStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0021';
      try {
        expect(typeof SendableStaticReadonlyClass.myArrayBuffer).assertEqual('object');
        expect(SendableStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2200
     * @tc.desc   Test SendableStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0022';
      try {
        expect(typeof SendableStaticReadonlyClass.myConcatArray).assertEqual('object');
        expect(SendableStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
        expect(SendableStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2300
     * @tc.desc   Test SendableStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0023';
      try {
        expect(typeof SendableStaticReadonlyClass.myBitVector).assertEqual('object');
        expect(SendableStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
        SendableStaticReadonlyClass.myBitVector.push(1);
        expect(SendableStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2400
     * @tc.desc   Test SendableStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0024';
      try {
        expect(typeof SendableStaticReadonlyClass.myASON).assertEqual('object');
        expect((SendableStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableStaticReadonlyClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2500
     * @tc.desc   Test SendableStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0025';
      try {
        expect(typeof SendableStaticReadonlyClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2600
     * @tc.desc   Test SendableStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticReadonlyClass0026';
      try {
        expect(typeof SendableStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
        expect(SendableStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2700
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0001';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myString).assertEqual('example string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2800
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0002';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myNumber).assertEqual(42);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_2900
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0003';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myBoolean).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3000
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0004';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3100
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0005';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myUndefined).assertEqual(undefined);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3200
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0006';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.myNull).assertEqual(null);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3300
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0007';
        try {
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance instanceof
            topLevelSendableClass).assertEqual(true);
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
          SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num = 2;
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3400
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0008';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.topLevelFunction === 'function')
            .assertEqual(true);
          expect(SendableNonParameterFuncStaticReadonlyClass.topLevelFunction())
            .assertEqual('Top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3500
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0009';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myEnum).assertEqual('number');
          expect(SendableNonParameterFuncStaticReadonlyClass.myEnum).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3600
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0010';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myArray).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myArray.toString()).assertEqual('');
          SendableNonParameterFuncStaticReadonlyClass.myArray.push(4, 5);
          expect(SendableNonParameterFuncStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3700
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0011';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myMap).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
          SendableNonParameterFuncStaticReadonlyClass.myMap.set(1, 2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3800
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0012';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.mySet).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.mySet.has(123)).assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.mySet.add(123);
          expect(SendableNonParameterFuncStaticReadonlyClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_3900
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0013';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4000
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0014';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4100
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0015';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4200
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0016';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4300
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0017';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4400
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0018';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4500
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0019';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4600
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0020';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array)
            .assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(false);
          SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4700
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0021';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableNonParameterFuncStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength)
            .assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4800
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0022';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myConcatArray).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
          expect(SendableNonParameterFuncStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_4900
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0023';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myBitVector).assertEqual('object');
          expect(SendableNonParameterFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
          SendableNonParameterFuncStaticReadonlyClass.myBitVector.push(1);
          expect(SendableNonParameterFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5000
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0024';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myASON).assertEqual('object');
          expect((SendableNonParameterFuncStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableNonParameterFuncStaticReadonlyClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5100
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0025';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonParameterFuncStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5200
     * @tc.desc   Test SendableNonParameterFuncStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonParameterFuncStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableNonParameterFuncStaticReadonlyClass0026';
        try {
          expect(typeof SendableNonParameterFuncStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
          expect(SendableNonParameterFuncStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5300
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0001';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5400
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0002';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myNumber).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5500
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0003';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myBoolean).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5600
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0004';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myBigInt)
          .assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5700
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0005';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5800
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0006';
      try {
        expect(SendableNonFuncStaticReadonlyClass.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_5900
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0007';
      try {
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
        SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num = 2;
        expect(SendableNonFuncStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6000
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0008';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableNonFuncStaticReadonlyClass.topLevelFunction()).assertEqual('Top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6100
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0009';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myEnum).assertEqual('number');
        expect(SendableNonFuncStaticReadonlyClass.myEnum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6200
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0010';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myArray).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myArray.toString()).assertEqual('');
        SendableNonFuncStaticReadonlyClass.myArray.push(4, 5);
        expect(SendableNonFuncStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6300
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0011';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myMap).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
        SendableNonFuncStaticReadonlyClass.myMap.set(1, 2);
        expect(SendableNonFuncStaticReadonlyClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6400
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0012';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.mySet).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.mySet.has(123)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.mySet.add(123);
        expect(SendableNonFuncStaticReadonlyClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6500
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0013';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6600
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0014';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6700
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0015';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6800
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0016';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_6900
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0017';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7000
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0018';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7100
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0019';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7200
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0020';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableNonFuncStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7300
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0021';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myArrayBuffer).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableNonFuncStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7400
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0022';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myConcatArray).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
        expect(SendableNonFuncStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7500
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0023';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myBitVector).assertEqual('object');
        expect(SendableNonFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
        SendableNonFuncStaticReadonlyClass.myBitVector.push(1);
        expect(SendableNonFuncStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7600
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0024';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myASON).assertEqual('object');
        expect((SendableNonFuncStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableNonFuncStaticReadonlyClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7700
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0025';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableNonFuncStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7800
     * @tc.desc   Test SendableNonFuncStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableNonFuncStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticReadonlyClass0026';
      try {
        expect(typeof SendableNonFuncStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
        expect(SendableNonFuncStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_7900
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0001';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8000
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0002';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myNumber).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8100
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0003';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myBoolean).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8200
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0004';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myBigInt)
          .assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8300
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0005';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8400
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0006';
      try {
        expect(SendableArrowNewStaticReadonlyClass.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8500
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0007';
      try {
        expect(SendableArrowNewStaticReadonlyClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableArrowNewStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
        SendableArrowNewStaticReadonlyClass.topLevelClassInstance.num = 2;
        expect(SendableArrowNewStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8600
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0008';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableArrowNewStaticReadonlyClass.topLevelFunction())
          .assertEqual('Top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8700
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0009';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myEnum).assertEqual('number');
        expect(SendableArrowNewStaticReadonlyClass.myEnum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8800
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0010';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myArray).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myArray.toString()).assertEqual('');
        SendableArrowNewStaticReadonlyClass.myArray.push(4, 5);
        expect(SendableArrowNewStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_8900
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0011';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myMap).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
        SendableArrowNewStaticReadonlyClass.myMap.set(1, 2);
        expect(SendableArrowNewStaticReadonlyClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9000
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0012';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.mySet).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.mySet.has(123)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.mySet.add(123);
        expect(SendableArrowNewStaticReadonlyClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9100
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0013';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9200
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0014';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9300
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0015';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9400
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0016';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9500
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0017';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9600
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0018';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9700
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0019';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9800
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0020';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableArrowNewStaticReadonlyClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_9900
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0021';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myArrayBuffer).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableArrowNewStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10000
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0022';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myConcatArray).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
        expect(SendableArrowNewStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10100
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0023';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myBitVector).assertEqual('object');
        expect(SendableArrowNewStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
        SendableArrowNewStaticReadonlyClass.myBitVector.push(1);
        expect(SendableArrowNewStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10200
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0024';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myASON).assertEqual('object');
        expect((SendableArrowNewStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableArrowNewStaticReadonlyClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10300
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0025';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableArrowNewStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10400
     * @tc.desc   Test SendableArrowNewStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrowNewStaticReadonlyClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticReadonlyClass0026';
      try {
        expect(typeof SendableArrowNewStaticReadonlyClass.mySendableUnionArray).assertEqual('number');
        expect(SendableArrowNewStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10500
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0001';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myString).assertEqual('example string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10600
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0002';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myNumber).assertEqual(42);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10700
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0003';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myBoolean).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10800
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0004';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_10900
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0005';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myUndefined).assertEqual(undefined);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11000
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0006';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.myNull).assertEqual(null);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11100
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0007';
        try {
          expect(SendableExpressionArrowOutStaticReadonlyClass.topLevelClassInstance instanceof
            topLevelSendableClass).assertEqual(true);
          expect(SendableExpressionArrowOutStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
          SendableExpressionArrowOutStaticReadonlyClass.topLevelClassInstance.num = 2;
          expect(SendableExpressionArrowOutStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11200
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0008';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.topLevelFunction === 'function')
            .assertEqual(true);
          expect(SendableExpressionArrowOutStaticReadonlyClass.topLevelFunction())
            .assertEqual('Top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11300
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0009';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myEnum).assertEqual('number');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myEnum).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11400
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0010';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myArray).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myArray.toString()).assertEqual('');
          SendableExpressionArrowOutStaticReadonlyClass.myArray.push(4, 5);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11500
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0011';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myMap).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
          SendableExpressionArrowOutStaticReadonlyClass.myMap.set(1, 2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11600
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0012';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.mySet).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.mySet.has(123)).assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.mySet.add(123);
          expect(SendableExpressionArrowOutStaticReadonlyClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11700
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0013';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt8Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11800
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0014';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_11900
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0015';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt16Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12000
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0016';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint16Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12100
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0017';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt32Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12200
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0018';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint32Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12300
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0019';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12400
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0020';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayFloat32Array)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12500
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0021';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myArrayBuffer).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength)
            .assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12600
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0022';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myConcatArray).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12700
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0023';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myBitVector).assertEqual('object');
          expect(SendableExpressionArrowOutStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
          SendableExpressionArrowOutStaticReadonlyClass.myBitVector.push(1);
          expect(SendableExpressionArrowOutStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12800
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0024';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myASON).assertEqual('object');
          expect((SendableExpressionArrowOutStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableExpressionArrowOutStaticReadonlyClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_12900
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0025';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionArrowOutStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13000
     * @tc.desc   Test SendableExpressionArrowOutStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionArrowOutStaticReadonlyClass0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionArrowOutStaticReadonlyClass0026';
        try {
          expect(typeof SendableExpressionArrowOutStaticReadonlyClass.mySendableUnionArray)
            .assertEqual('number');
          expect(SendableExpressionArrowOutStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13100
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0001';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myString).assertEqual('example string');
          SendableExpressionOutArrowStaticReadonlyClass.myString = 'new string';
          expect(SendableExpressionOutArrowStaticReadonlyClass.myString).assertEqual('new string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13200
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0002';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myNumber).assertEqual(42);
          SendableExpressionOutArrowStaticReadonlyClass.myNumber = 100;
          expect(SendableExpressionOutArrowStaticReadonlyClass.myNumber).assertEqual(100);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13300
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0003';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBoolean).assertEqual(true);
          SendableExpressionOutArrowStaticReadonlyClass.myBoolean = false;
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBoolean).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13400
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0004';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
          SendableExpressionOutArrowStaticReadonlyClass.myBigInt = 987654321098765432109876543210987654321n;
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBigInt)
            .assertEqual(987654321098765432109876543210987654321n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13500
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0005';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myUndefined).assertEqual(undefined);
          SendableExpressionOutArrowStaticReadonlyClass.myUndefined = 123;
          expect(SendableExpressionOutArrowStaticReadonlyClass.myUndefined).assertEqual(123);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13600
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0006';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.myNull).assertEqual(null);
          SendableExpressionOutArrowStaticReadonlyClass.myNull = 'not null anymore';
          expect(SendableExpressionOutArrowStaticReadonlyClass.myNull).assertEqual('not null anymore');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13700
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0007';
        try {
          expect(SendableExpressionOutArrowStaticReadonlyClass.topLevelClassInstance instanceof
            topLevelSendableClass).assertEqual(true);
          expect(SendableExpressionOutArrowStaticReadonlyClass.topLevelClassInstance.num).assertEqual(1);
          SendableExpressionOutArrowStaticReadonlyClass.topLevelClassInstance.num = 2;
          expect(SendableExpressionOutArrowStaticReadonlyClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13800
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0008';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.topLevelFunction === 'function')
            .assertEqual(true);
          expect(SendableExpressionOutArrowStaticReadonlyClass.topLevelFunction())
            .assertEqual('Top level sendable function');
          SendableExpressionOutArrowStaticReadonlyClass.topLevelFunction = ModifiedTopLevelSendableFunction;
          expect(SendableExpressionOutArrowStaticReadonlyClass.topLevelFunction())
            .assertEqual('Modified top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_13900
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0009';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myEnum).assertEqual('number');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myEnum).assertEqual(0);
          SendableExpressionOutArrowStaticReadonlyClass.myEnum = SendableConstEnum.OPTION_2;
          expect(SendableExpressionOutArrowStaticReadonlyClass.myEnum).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14000
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0010';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myArray).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myArray.toString()).assertEqual('');
          SendableExpressionOutArrowStaticReadonlyClass.myArray.push(4, 5);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14100
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0011';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myMap).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myMap.get(1)).assertEqual(undefined);
          SendableExpressionOutArrowStaticReadonlyClass.myMap.set(1, 2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14200
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0012';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.mySet).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.mySet.has(123)).assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.mySet.add(123);
          expect(SendableExpressionOutArrowStaticReadonlyClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14300
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0013';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt8Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt8Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14400
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0014';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14500
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0015';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt16Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt16Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14600
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0016';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint16Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint16Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint16Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14700
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0017';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt32Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt32Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayInt32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14800
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0018';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint32Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint32Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_14900
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0019';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15000
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0020';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayFloat32Array)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myTypedArrayFloat32Array.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15100
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0021';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myArrayBuffer).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myArrayBuffer.slice(0, 4).byteLength)
            .assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15200
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0022';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myConcatArray).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myConcatArray[1]).assertEqual(2);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15300
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0023';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myBitVector).assertEqual('object');
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBitVector.pop()).assertEqual(0);
          SendableExpressionOutArrowStaticReadonlyClass.myBitVector.push(1);
          expect(SendableExpressionOutArrowStaticReadonlyClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15400
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0024';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myASON).assertEqual('object');
          expect((SendableExpressionOutArrowStaticReadonlyClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableExpressionOutArrowStaticReadonlyClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15500
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0025';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.name   testSendableExpressionOutArrowStaticReadonlyClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_READONLY_15600
     * @tc.desc   Test SendableExpressionOutArrowStaticReadonlyClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExpressionOutArrowStaticReadonlyClass0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const TAG = 'testSendableExpressionOutArrowStaticReadonlyClass0026';
        try {
          expect(typeof SendableExpressionOutArrowStaticReadonlyClass.mySendableUnionArray)
            .assertEqual('number');
          expect(SendableExpressionOutArrowStaticReadonlyClass.mySendableUnionArray).assertEqual(1);
          SendableExpressionOutArrowStaticReadonlyClass.mySendableUnionArray = 2;
          expect(SendableExpressionOutArrowStaticReadonlyClass.mySendableUnionArray).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
  })
}