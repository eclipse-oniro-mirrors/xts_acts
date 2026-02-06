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
  arrowFunc,
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
  identityFunction,
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableDefaultArrowClass,
  SendableDefaultArrowNewClass,
  SendableDefaultArrowOutClass,
  SendableDefaultClass,
  SendableDefaultExpressionArrowOutClass,
  SendableDefaultExpressionOutClass,
  SendableDefaultFuncClass,
  SendableDefaultFuncInClass,
  SendableDefaultNonFuncClass,
  SendableDefaultNonParameterFuncClass,
  SendableDefaultOutArrowClass,
  SendableDefaultParameterFuncClass,
  SendableFuncType,
  topLevelSendableClass
} from './SendableClass';

@Sendable
export class SendableDefaultExpressionOutArrowClass implements ISendable {
  myString: string = getString();
  myNumber: number = getNumber();
  myBoolean: boolean = getBoolean();
  myBigInt: bigint = getBigInt();
  myUndefined: undefined | string | number | null = getUndefined();
  myNull: undefined | string | number | null = getNull();
  topLevelClassInstance: topLevelSendableClass = getTopLevelClassInstance();
  topLevelFunction: SendableFuncType = getTopLevelFunction();
  myEnum: SendableConstEnum = getEnum();
  myArray: collections.Array<number> = getArray();
  myMap: collections.Map<number, number> = getMap();
  mySet: collections.Set<number> = getSet();
  myTypedArrayInt8Array: collections.Int8Array = getTypedArrayInt8Array();
  myTypedArrayUint8Array: collections.Uint8Array = getTypedArrayUint8Array();
  myTypedArrayInt16Array: collections.Int16Array = getTypedArrayInt16Array();
  myTypedArrayUint16Array: collections.Uint16Array = getTypedArrayUint16Array();
  myTypedArrayInt32Array: collections.Int32Array = getTypedArrayInt32Array();
  myTypedArrayUint32Array: collections.Uint32Array = getTypedArrayUint32Array();
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = getTypedArrayUint8ClampedArray();
  myTypedArrayFloat32Array: collections.Float32Array = getTypedArrayFloat32Array();
  myArrayBuffer: collections.ArrayBuffer = getArrayBuffer();
  myConcatArray: collections.ConcatArray<number> = getConcatArray();
  myBitVector: collections.BitVector = getBitVector();
  myASON: ISendable = getASON();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = getAsyncLock();
  mySendableUnionArray: string | number | boolean | bigint = getSendableUnionArray();

  constructor() {
  }
}


export default function sendableClassTest() {
  describe('ActsSendableClassTest', () => {
    /**
     * @tc.name   testSendableDefaultClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0100
     * @tc.desc   Test SendableDefaultClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0001';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0200
     * @tc.desc   Test SendableDefaultClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0002';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0300
     * @tc.desc   Test SendableDefaultClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0003';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0400
     * @tc.desc   Test SendableDefaultClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0004';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0500
     * @tc.desc   Test SendableDefaultClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0005';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0600
     * @tc.desc   Test SendableDefaultClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0006';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0700
     * @tc.desc   Test SendableDefaultClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0007';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0800
     * @tc.desc   Test SendableDefaultClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0008';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_0900
     * @tc.desc   Test SendableDefaultClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0009';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1000
     * @tc.desc   Test SendableDefaultClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0010';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1100
     * @tc.desc   Test SendableDefaultClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0011';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1200
     * @tc.desc   Test SendableDefaultClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0012';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1300
     * @tc.desc   Test SendableDefaultClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0013';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1400
     * @tc.desc   Test SendableDefaultClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0014';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1500
     * @tc.desc   Test SendableDefaultClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0015';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1600
     * @tc.desc   Test SendableDefaultClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0016';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1700
     * @tc.desc   Test SendableDefaultClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0017';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1800
     * @tc.desc   Test SendableDefaultClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0018';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_1900
     * @tc.desc   Test SendableDefaultClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0019';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2000
     * @tc.desc   Test SendableDefaultClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0020';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2100
     * @tc.desc   Test SendableDefaultClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0021';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2200
     * @tc.desc   Test SendableDefaultClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0022';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2300
     * @tc.desc   Test SendableDefaultClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0023';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2400
     * @tc.desc   Test SendableDefaultClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0024';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2500
     * @tc.desc   Test SendableDefaultClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0025';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2600
     * @tc.desc   Test SendableDefaultClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultClass0026';
      try {
        const instance = new SendableDefaultClass();
        expect(instance instanceof SendableDefaultClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2700
     * @tc.desc   Test SendableDefaultFuncClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0001';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2800
     * @tc.desc   Test SendableDefaultFuncClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0002';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_2900
     * @tc.desc   Test SendableDefaultFuncClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0003';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3000
     * @tc.desc   Test SendableDefaultFuncClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0004';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3100
     * @tc.desc   Test SendableDefaultFuncClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0005';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3200
     * @tc.desc   Test SendableDefaultFuncClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0006';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3300
     * @tc.desc   Test SendableDefaultFuncClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0007';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3400
     * @tc.desc   Test SendableDefaultFuncClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0008';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3500
     * @tc.desc   Test SendableDefaultFuncClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0009';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3600
     * @tc.desc   Test SendableDefaultFuncClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0010';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3700
     * @tc.desc   Test SendableDefaultFuncClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0011';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3800
     * @tc.desc   Test SendableDefaultFuncClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0012';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_3900
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0013';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4000
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0014';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4100
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0015';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4200
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0016';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4300
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0017';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4400
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0018';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4500
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0019';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4600
     * @tc.desc   Test SendableDefaultFuncClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0020';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4700
     * @tc.desc   Test SendableDefaultFuncClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0021';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4800
     * @tc.desc   Test SendableDefaultFuncClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0022';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_4900
     * @tc.desc   Test SendableDefaultFuncClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0023';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5000
     * @tc.desc   Test SendableDefaultFuncClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0024';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5100
     * @tc.desc   Test SendableDefaultFuncClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0025';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5200
     * @tc.desc   Test SendableDefaultFuncClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncClass0026';
      try {
        const instance = new SendableDefaultFuncClass(identityFunction);
        expect(instance instanceof SendableDefaultFuncClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5300
     * @tc.desc   Test SendableDefaultArrowClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0001';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5400
     * @tc.desc   Test SendableDefaultArrowClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0002';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5500
     * @tc.desc   Test SendableDefaultArrowClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0003';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5600
     * @tc.desc   Test SendableDefaultArrowClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0004';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5700
     * @tc.desc   Test SendableDefaultArrowClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0005';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5800
     * @tc.desc   Test SendableDefaultArrowClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0006';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_5900
     * @tc.desc   Test SendableDefaultArrowClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0007';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6000
     * @tc.desc   Test SendableDefaultArrowClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0008';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6100
     * @tc.desc   Test SendableDefaultArrowClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0009';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6200
     * @tc.desc   Test SendableDefaultArrowClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0010';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6300
     * @tc.desc   Test SendableDefaultArrowClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0011';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6400
     * @tc.desc   Test SendableDefaultArrowClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0012';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6500
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0013';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6600
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0014';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6700
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0015';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6800
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0016';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_6900
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0017';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7000
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0018';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7100
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0019';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7200
     * @tc.desc   Test SendableDefaultArrowClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0020';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7300
     * @tc.desc   Test SendableDefaultArrowClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0021';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7400
     * @tc.desc   Test SendableDefaultArrowClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0022';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7500
     * @tc.desc   Test SendableDefaultArrowClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0023';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7600
     * @tc.desc   Test SendableDefaultArrowClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0024';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7700
     * @tc.desc   Test SendableDefaultArrowClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0025';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7800
     * @tc.desc   Test SendableDefaultArrowClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowClass0026';
      try {
        const instance = new SendableDefaultArrowClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_7900
     * @tc.desc   Test SendableDefaultArrowOutClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0001';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8000
     * @tc.desc   Test SendableDefaultArrowOutClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0002';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8100
     * @tc.desc   Test SendableDefaultArrowOutClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0003';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowOutClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8200
     * @tc.desc   Test SendableDefaultArrowOutClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0004';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowOutClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8300
     * @tc.desc   Test SendableDefaultArrowOutClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0005';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowOutClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8400
     * @tc.desc   Test SendableDefaultArrowOutClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0006';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowOutClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8500
     * @tc.desc   Test SendableDefaultArrowOutClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0007';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8600
     * @tc.desc   Test SendableDefaultArrowOutClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0008';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8700
     * @tc.desc   Test SendableDefaultArrowOutClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0009';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8800
     * @tc.desc   Test SendableDefaultArrowOutClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0010';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_8900
     * @tc.desc   Test SendableDefaultArrowOutClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0011';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9000
     * @tc.desc   Test SendableDefaultArrowOutClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0012';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9100
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0013';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9200
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0014';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9300
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0015';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9400
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0016';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9500
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0017';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9600
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0018';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9700
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0019';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9800
     * @tc.desc   Test SendableDefaultArrowOutClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0020';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_9900
     * @tc.desc   Test SendableDefaultArrowOutClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0021';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10000
     * @tc.desc   Test SendableDefaultArrowOutClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0022';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10100
     * @tc.desc   Test SendableDefaultArrowOutClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0023';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10200
     * @tc.desc   Test SendableDefaultArrowOutClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0024';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10300
     * @tc.desc   Test SendableDefaultArrowOutClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0025';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowOutClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10400
     * @tc.desc   Test SendableDefaultArrowOutClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowOutClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowOutClass0026';
      try {
        const instance = new SendableDefaultArrowOutClass(arrowFunc);
        expect(instance instanceof SendableDefaultArrowOutClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10500
     * @tc.desc   Test SendableDefaultFuncInClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0001';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10600
     * @tc.desc   Test SendableDefaultFuncInClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0002';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10700
     * @tc.desc   Test SendableDefaultFuncInClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0003';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10800
     * @tc.desc   Test SendableDefaultFuncInClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0004';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_10900
     * @tc.desc   Test SendableDefaultFuncInClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0005';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11000
     * @tc.desc   Test SendableDefaultFuncInClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0006';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11100
     * @tc.desc   Test SendableDefaultFuncInClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0007';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11200
     * @tc.desc   Test SendableDefaultFuncInClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0008';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11300
     * @tc.desc   Test SendableDefaultFuncInClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0009';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11400
     * @tc.desc   Test SendableDefaultFuncInClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0010';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11500
     * @tc.desc   Test SendableDefaultFuncInClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0011';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11600
     * @tc.desc   Test SendableDefaultFuncInClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0012';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11700
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0013';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11800
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0014';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_11900
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0015';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12000
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0016';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12100
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0017';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12200
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0018';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12300
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0019';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12400
     * @tc.desc   Test SendableDefaultFuncInClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0020';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12500
     * @tc.desc   Test SendableDefaultFuncInClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0021';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12600
     * @tc.desc   Test SendableDefaultFuncInClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0022';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12700
     * @tc.desc   Test SendableDefaultFuncInClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0023';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12800
     * @tc.desc   Test SendableDefaultFuncInClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0024';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_12900
     * @tc.desc   Test SendableDefaultFuncInClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0025';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13000
     * @tc.desc   Test SendableDefaultFuncInClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInClass0026';
      try {
        const instance = new SendableDefaultFuncInClass();
        expect(instance instanceof SendableDefaultFuncInClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13100
     * @tc.desc   Test SendableDefaultNonParameterFuncClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0001';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13200
     * @tc.desc   Test SendableDefaultNonParameterFuncClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0002';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13300
     * @tc.desc   Test SendableDefaultNonParameterFuncClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0003';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13400
     * @tc.desc   Test SendableDefaultNonParameterFuncClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0004';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13500
     * @tc.desc   Test SendableDefaultNonParameterFuncClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0005';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13600
     * @tc.desc   Test SendableDefaultNonParameterFuncClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0006';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13700
     * @tc.desc   Test SendableDefaultNonParameterFuncClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0007';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13800
     * @tc.desc   Test SendableDefaultNonParameterFuncClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0008';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_13900
     * @tc.desc   Test SendableDefaultNonParameterFuncClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0009';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14000
     * @tc.desc   Test SendableDefaultNonParameterFuncClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0010';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14100
     * @tc.desc   Test SendableDefaultNonParameterFuncClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0011';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14200
     * @tc.desc   Test SendableDefaultNonParameterFuncClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0012';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14300
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0013';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14400
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0014';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14500
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0015';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14600
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0016';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14700
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0017';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14800
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0018';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_14900
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0019';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15000
     * @tc.desc   Test SendableDefaultNonParameterFuncClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0020';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15100
     * @tc.desc   Test SendableDefaultNonParameterFuncClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0021';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15200
     * @tc.desc   Test SendableDefaultNonParameterFuncClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0022';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15300
     * @tc.desc   Test SendableDefaultNonParameterFuncClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0023';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15400
     * @tc.desc   Test SendableDefaultNonParameterFuncClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0024';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15500
     * @tc.desc   Test SendableDefaultNonParameterFuncClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0025';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonParameterFuncClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15600
     * @tc.desc   Test SendableDefaultNonParameterFuncClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonParameterFuncClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonParameterFuncClass0026';
      try {
        const instance = new SendableDefaultNonParameterFuncClass();
        expect(instance instanceof SendableDefaultNonParameterFuncClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15700
     * @tc.desc   Test SendableDefaultOutArrowClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0001';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15800
     * @tc.desc   Test SendableDefaultOutArrowClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0002';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_15900
     * @tc.desc   Test SendableDefaultOutArrowClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0003';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultOutArrowClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16000
     * @tc.desc   Test SendableDefaultOutArrowClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0004';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultOutArrowClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16100
     * @tc.desc   Test SendableDefaultOutArrowClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0005';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultOutArrowClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16200
     * @tc.desc   Test SendableDefaultOutArrowClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0006';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultOutArrowClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16300
     * @tc.desc   Test SendableDefaultOutArrowClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0007';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16400
     * @tc.desc   Test SendableDefaultOutArrowClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0008';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16500
     * @tc.desc   Test SendableDefaultOutArrowClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0009';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16600
     * @tc.desc   Test SendableDefaultOutArrowClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0010';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16700
     * @tc.desc   Test SendableDefaultOutArrowClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0011';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16800
     * @tc.desc   Test SendableDefaultOutArrowClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0012';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_16900
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0013';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17000
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0014';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17100
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0015';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17200
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0016';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17300
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0017';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17400
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0018';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17500
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0019';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17600
     * @tc.desc   Test SendableDefaultOutArrowClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0020';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17700
     * @tc.desc   Test SendableDefaultOutArrowClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0021';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17800
     * @tc.desc   Test SendableDefaultOutArrowClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0022';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_17900
     * @tc.desc   Test SendableDefaultOutArrowClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0023';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18000
     * @tc.desc   Test SendableDefaultOutArrowClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0024';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18100
     * @tc.desc   Test SendableDefaultOutArrowClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0025';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultOutArrowClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18200
     * @tc.desc   Test SendableDefaultOutArrowClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultOutArrowClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultOutArrowClass0026';
      try {
        const instance = new SendableDefaultOutArrowClass();
        expect(instance instanceof SendableDefaultOutArrowClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18300
     * @tc.desc   Test SendableDefaultNonFuncClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0001';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18400
     * @tc.desc   Test SendableDefaultNonFuncClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0002';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18500
     * @tc.desc   Test SendableDefaultNonFuncClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0003';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonFuncClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18600
     * @tc.desc   Test SendableDefaultNonFuncClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0004';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonFuncClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18700
     * @tc.desc   Test SendableDefaultNonFuncClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0005';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonFuncClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18800
     * @tc.desc   Test SendableDefaultNonFuncClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0006';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultNonFuncClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_18900
     * @tc.desc   Test SendableDefaultNonFuncClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0007';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19000
     * @tc.desc   Test SendableDefaultNonFuncClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0008';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19100
     * @tc.desc   Test SendableDefaultNonFuncClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0009';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19200
     * @tc.desc   Test SendableDefaultNonFuncClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0010';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19300
     * @tc.desc   Test SendableDefaultNonFuncClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0011';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19400
     * @tc.desc   Test SendableDefaultNonFuncClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0012';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19500
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0013';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19600
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0014';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19700
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0015';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19800
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0016';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_19900
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0017';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20000
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0018';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20100
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0019';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20200
     * @tc.desc   Test SendableDefaultNonFuncClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0020';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20300
     * @tc.desc   Test SendableDefaultNonFuncClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0021';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20400
     * @tc.desc   Test SendableDefaultNonFuncClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0022';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20500
     * @tc.desc   Test SendableDefaultNonFuncClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0023';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20600
     * @tc.desc   Test SendableDefaultNonFuncClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0024';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20700
     * @tc.desc   Test SendableDefaultNonFuncClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0025';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultNonFuncClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20800
     * @tc.desc   Test SendableDefaultNonFuncClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultNonFuncClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultNonFuncClass0026';
      try {
        const instance = new SendableDefaultNonFuncClass();
        expect(instance instanceof SendableDefaultNonFuncClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_20900
     * @tc.desc   Test SendableDefaultParameterFuncClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0001';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21000
     * @tc.desc   Test SendableDefaultParameterFuncClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0002';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21100
     * @tc.desc   Test SendableDefaultParameterFuncClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0003';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultParameterFuncClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21200
     * @tc.desc   Test SendableDefaultParameterFuncClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0004';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultParameterFuncClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21300
     * @tc.desc   Test SendableDefaultParameterFuncClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0005';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultParameterFuncClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21400
     * @tc.desc   Test SendableDefaultParameterFuncClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0006';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultParameterFuncClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21500
     * @tc.desc   Test SendableDefaultParameterFuncClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0007';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21600
     * @tc.desc   Test SendableDefaultParameterFuncClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0008';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21700
     * @tc.desc   Test SendableDefaultParameterFuncClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0009';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21800
     * @tc.desc   Test SendableDefaultParameterFuncClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0010';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_21900
     * @tc.desc   Test SendableDefaultParameterFuncClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0011';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22000
     * @tc.desc   Test SendableDefaultParameterFuncClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0012';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22100
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0013';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22200
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0014';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22300
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0015';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22400
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0016';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22500
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0017';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22600
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0018';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22700
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0019';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22800
     * @tc.desc   Test SendableDefaultParameterFuncClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0020';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_22900
     * @tc.desc   Test SendableDefaultParameterFuncClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0021';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23000
     * @tc.desc   Test SendableDefaultParameterFuncClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0022';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23100
     * @tc.desc   Test SendableDefaultParameterFuncClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0023';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23200
     * @tc.desc   Test SendableDefaultParameterFuncClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0024';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23300
     * @tc.desc   Test SendableDefaultParameterFuncClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0025';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultParameterFuncClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23400
     * @tc.desc   Test SendableDefaultParameterFuncClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultParameterFuncClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultParameterFuncClass0026';
      try {
        const instance = new SendableDefaultParameterFuncClass();
        expect(instance instanceof SendableDefaultParameterFuncClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23500
     * @tc.desc   Test SendableDefaultArrowNewClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0001';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23600
     * @tc.desc   Test SendableDefaultArrowNewClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0002';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23700
     * @tc.desc   Test SendableDefaultArrowNewClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0003';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowNewClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23800
     * @tc.desc   Test SendableDefaultArrowNewClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0004';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowNewClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_23900
     * @tc.desc   Test SendableDefaultArrowNewClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0005';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowNewClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24000
     * @tc.desc   Test SendableDefaultArrowNewClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0006';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultArrowNewClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24100
     * @tc.desc   Test SendableDefaultArrowNewClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0007';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24200
     * @tc.desc   Test SendableDefaultArrowNewClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0008';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24300
     * @tc.desc   Test SendableDefaultArrowNewClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0009';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24400
     * @tc.desc   Test SendableDefaultArrowNewClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0010';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24500
     * @tc.desc   Test SendableDefaultArrowNewClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0011';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24600
     * @tc.desc   Test SendableDefaultArrowNewClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0012';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24700
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0013';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24800
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0014';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_24900
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0015';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25000
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0016';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25100
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0017';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25200
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0018';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25300
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0019';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25400
     * @tc.desc   Test SendableDefaultArrowNewClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0020';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25500
     * @tc.desc   Test SendableDefaultArrowNewClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0021';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25600
     * @tc.desc   Test SendableDefaultArrowNewClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0022';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25700
     * @tc.desc   Test SendableDefaultArrowNewClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0023';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25800
     * @tc.desc   Test SendableDefaultArrowNewClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0024';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_25900
     * @tc.desc   Test SendableDefaultArrowNewClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0025';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultArrowNewClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26000
     * @tc.desc   Test SendableDefaultArrowNewClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultArrowNewClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultArrowNewClass0026';
      try {
        const instance = new SendableDefaultArrowNewClass();
        expect(instance instanceof SendableDefaultArrowNewClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26100
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0001';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26200
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0002';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26300
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0003';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26400
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0004';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26500
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0005';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26600
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0006';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26700
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0007';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26800
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0008';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_26900
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0009';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27000
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0010';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27100
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0011';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27200
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0012';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27300
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0013';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27400
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0014';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27500
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0015';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27600
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0016';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27700
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0017';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27800
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0018';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_27900
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0019';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28000
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0020';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28100
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0021';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28200
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0022';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28300
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0023';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28400
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0024';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28500
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0025';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionArrowOutClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28600
     * @tc.desc   Test SendableDefaultExpressionArrowOutClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionArrowOutClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionArrowOutClass0026';
      try {
        const instance = new SendableDefaultExpressionArrowOutClass();
        expect(instance instanceof SendableDefaultExpressionArrowOutClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28700
     * @tc.desc   Test SendableDefaultExpressionOutClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0001';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28800
     * @tc.desc   Test SendableDefaultExpressionOutClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0002';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_28900
     * @tc.desc   Test SendableDefaultExpressionOutClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0003';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29000
     * @tc.desc   Test SendableDefaultExpressionOutClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0004';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29100
     * @tc.desc   Test SendableDefaultExpressionOutClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0005';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29200
     * @tc.desc   Test SendableDefaultExpressionOutClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0006';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29300
     * @tc.desc   Test SendableDefaultExpressionOutClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0007';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29400
     * @tc.desc   Test SendableDefaultExpressionOutClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0008';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29500
     * @tc.desc   Test SendableDefaultExpressionOutClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0009';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29600
     * @tc.desc   Test SendableDefaultExpressionOutClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0010';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29700
     * @tc.desc   Test SendableDefaultExpressionOutClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0011';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29800
     * @tc.desc   Test SendableDefaultExpressionOutClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0012';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_29900
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0013';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30000
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0014';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30100
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0015';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30200
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0016';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30300
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0017';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30400
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0018';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30500
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0019';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30600
     * @tc.desc   Test SendableDefaultExpressionOutClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0020';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30700
     * @tc.desc   Test SendableDefaultExpressionOutClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0021';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30800
     * @tc.desc   Test SendableDefaultExpressionOutClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0022';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_30900
     * @tc.desc   Test SendableDefaultExpressionOutClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0023';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31000
     * @tc.desc   Test SendableDefaultExpressionOutClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0024';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31100
     * @tc.desc   Test SendableDefaultExpressionOutClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0025';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31200
     * @tc.desc   Test SendableDefaultExpressionOutClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutClass0026';
      try {
        const instance = new SendableDefaultExpressionOutClass();
        expect(instance instanceof SendableDefaultExpressionOutClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31300
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0001';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.myString = 'new string';
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31400
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0002';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.myNumber = 100;
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31500
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0003';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.myBoolean = false;
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31600
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0004';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.myBigInt = 987654321098765432109876543210987654321n;
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31700
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0005';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.myUndefined = 123;
        expect(instance.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31800
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0006';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.myNull = 'not null anymore';
        expect(instance.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_31900
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass class is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0007';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.topLevelClassInstance.num = 2;
        expect(instance.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32000
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass function is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0008';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.topLevelFunction === 'function').assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32100
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0009';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.myEnum = SendableConstEnum.OPTION_2;
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32200
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0010';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        expect(instance.myArray.toString()).assertEqual('');
        instance.myArray.push(4, 5);
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32300
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass Map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0011';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        instance.myMap.set(1, 2);
        expect(instance.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32400
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass Set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0012';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        instance.mySet.add(123);
        expect(instance.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32500
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayInt8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0013';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt8Array.fill(2);
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32600
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayUint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0014';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8Array.fill(2);
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32700
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayInt16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0015';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt16Array.fill(2);
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32800
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayUint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0016';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint16Array.fill(2);
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_32900
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayInt32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0017';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayInt32Array.fill(2);
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33000
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayUint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0018';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayUint32Array.fill(2);
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33100
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0019';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        instance.myTypedArrayUint8ClampedArray.fill(2);
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33200
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass TypedArrayFloat32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0020';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        instance.myTypedArrayFloat32Array.fill(2);
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33300
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0021';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        expect(instance.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33400
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0022';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        expect(instance.myConcatArray[1]).assertEqual(2);
        expect(instance.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33500
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0023';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33600
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass ASON is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0024';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myASON).assertEqual('object');
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33700
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass AsyncLock is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0025';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultExpressionOutArrowClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_CLASS_33800
     * @tc.desc   Test SendableDefaultExpressionOutArrowClass SendableUnionType is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultExpressionOutArrowClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultExpressionOutArrowClass0026';
      try {
        const instance = new SendableDefaultExpressionOutArrowClass();
        expect(instance instanceof SendableDefaultExpressionOutArrowClass).assertEqual(true);
        expect(typeof instance.mySendableUnionArray).assertEqual('number');
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.mySendableUnionArray = 2;
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}