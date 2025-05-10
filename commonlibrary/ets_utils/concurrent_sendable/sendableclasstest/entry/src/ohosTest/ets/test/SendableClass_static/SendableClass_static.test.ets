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
  SendableArrowNewStaticClass,
  SendableArrowOutStaticClass,
  SendableArrowStaticClass,
  SendableExpressionArrowOutStaticClass,
  SendableExpressionOutStaticClass,
  SendableFuncInStaticClass,
  SendableFuncStaticClass,
  SendableNonFuncStaticClass,
  SendableNonParameterFuncStaticClass,
  SendableOutArrowStaticClass,
  SendableParameterFuncStaticClass,
  SendableStaticClass,
  SendableFuncType,
  topLevelSendableClass,
} from './SendableClass_static';

new SendableFuncStaticClass(identityFunction);
new SendableArrowStaticClass(arrowFunc);
new SendableArrowOutStaticClass(arrowFunc);
new SendableFuncInStaticClass();
new SendableNonParameterFuncStaticClass();
new SendableOutArrowStaticClass();
new SendableNonFuncStaticClass();
new SendableParameterFuncStaticClass();
new SendableArrowNewStaticClass();
new SendableExpressionOutStaticClass();

@Sendable
export class SendableExpressionOutArrowStaticClass implements ISendable {
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

export default function sendableClassStaticTest() {
  describe('ActsSendableClassStaticTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0100
     * @tc.name       : testSendableStaticClass0001
     * @tc.desc       : Test SendableStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0001';
      try {
        expect(SendableStaticClass.myString).assertEqual('example string');
        SendableStaticClass.myString = 'new string';
        expect(SendableStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0200
     * @tc.name       : testSendableStaticClass0002
     * @tc.desc       : Test SendableStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0002';
      try {
        expect(SendableStaticClass.myNumber).assertEqual(42);
        SendableStaticClass.myNumber = 100;
        expect(SendableStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0300
     * @tc.name       : testSendableStaticClass0003
     * @tc.desc       : Test SendableStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0003';
      try {
        expect(SendableStaticClass.myBoolean).assertEqual(true);
        SendableStaticClass.myBoolean = false;
        expect(SendableStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0400
     * @tc.name       : testSendableStaticClass0004
     * @tc.desc       : Test SendableStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0004';
      try {
        expect(SendableStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0500
     * @tc.name       : testSendableStaticClass0005
     * @tc.desc       : Test SendableStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0005';
      try {
        expect(SendableStaticClass.myUndefined).assertEqual(undefined);
        SendableStaticClass.myUndefined = 123;
        expect(SendableStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0600
     * @tc.name       : testSendableStaticClass0006
     * @tc.desc       : Test SendableStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0006';
      try {
        expect(SendableStaticClass.myNull).assertEqual(null);
        SendableStaticClass.myNull = 'not null anymore';
        expect(SendableStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0700
     * @tc.name       : testSendableStaticClass0007
     * @tc.desc       : Test SendableStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0007';
      try {
        expect(SendableStaticClass.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(SendableStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableStaticClass.topLevelClassInstance.num = 2;
        expect(SendableStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0800
     * @tc.name       : testSendableStaticClass0008
     * @tc.desc       : Test SendableStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0008';
      try {
        expect(typeof SendableStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableStaticClass.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_0900
     * @tc.name       : testSendableStaticClass0009
     * @tc.desc       : Test SendableStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0009';
      try {
        expect(typeof SendableStaticClass.myEnum).assertEqual('number');
        expect(SendableStaticClass.myEnum).assertEqual(0);
        SendableStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1000
     * @tc.name       : testSendableStaticClass0010
     * @tc.desc       : Test SendableStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0010';
      try {
        expect(typeof SendableStaticClass.myArray).assertEqual('object');
        expect(SendableStaticClass.myArray.toString()).assertEqual('');
        SendableStaticClass.myArray.push(4, 5);
        expect(SendableStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1100
     * @tc.name       : testSendableStaticClass0011
     * @tc.desc       : Test SendableStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0011';
      try {
        expect(typeof SendableStaticClass.myMap).assertEqual('object');
        expect(SendableStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableStaticClass.myMap.set(1, 2);
        expect(SendableStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1200
     * @tc.name       : testSendableStaticClass0012
     * @tc.desc       : Test SendableStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0012';
      try {
        expect(typeof SendableStaticClass.mySet).assertEqual('object');
        expect(SendableStaticClass.mySet.has(123)).assertEqual(false);
        SendableStaticClass.mySet.add(123);
        expect(SendableStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1300
     * @tc.name       : testSendableStaticClass0013
     * @tc.desc       : Test SendableStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0013';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1400
     * @tc.name       : testSendableStaticClass0014
     * @tc.desc       : Test SendableStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0014';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1500
     * @tc.name       : testSendableStaticClass0015
     * @tc.desc       : Test SendableStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0015';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1600
     * @tc.name       : testSendableStaticClass0016
     * @tc.desc       : Test SendableStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0016';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1700
     * @tc.name       : testSendableStaticClass0017
     * @tc.desc       : Test SendableStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0017';
      try {
        expect(typeof SendableStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1800
     * @tc.name       : testSendableStaticClass0018
     * @tc.desc       : Test SendableStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0018';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_1900
     * @tc.name       : testSendableStaticClass0019
     * @tc.desc       : Test SendableStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0019';
      try {
        expect(typeof SendableStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2000
     * @tc.name       : testSendableStaticClass0020
     * @tc.desc       : Test SendableStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0020';
      try {
        expect(typeof SendableStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2100
     * @tc.name       : testSendableStaticClass0021
     * @tc.desc       : Test SendableStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0021';
      try {
        expect(typeof SendableStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2200
     * @tc.name       : testSendableStaticClass0022
     * @tc.desc       : Test SendableStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0022';
      try {
        expect(typeof SendableStaticClass.myConcatArray).assertEqual('object');
        expect(SendableStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2300
     * @tc.name       : testSendableStaticClass0023
     * @tc.desc       : Test SendableStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0023';
      try {
        expect(typeof SendableStaticClass.myBitVector).assertEqual('object');
        expect(SendableStaticClass.myBitVector.pop()).assertEqual(0);
        SendableStaticClass.myBitVector.push(1);
        expect(SendableStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2400
     * @tc.name       : testSendableStaticClass0024
     * @tc.desc       : Test SendableStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0024';
      try {
        expect(typeof SendableStaticClass.myASON).assertEqual('object');
        expect((SendableStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2500
     * @tc.name       : testSendableStaticClass0025
     * @tc.desc       : Test SendableStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0025';
      try {
        expect(typeof SendableStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2600
     * @tc.name       : testSendableStaticClass0026
     * @tc.desc       : Test SendableStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticClass0026';
      try {
        expect(typeof SendableStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableStaticClass.mySendableUnionArray).assertEqual(1);
        SendableStaticClass.mySendableUnionArray = 2;
        expect(SendableStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2700
     * @tc.name       : testSendableFuncStaticClass0001
     * @tc.desc       : Test SendableFuncStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0001';
      try {
        expect(SendableFuncStaticClass.myString).assertEqual('example string');
        SendableFuncStaticClass.myString = 'new string';
        expect(SendableFuncStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2800
     * @tc.name       : testSendableFuncStaticClass0002
     * @tc.desc       : Test SendableFuncStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0002';
      try {
        expect(SendableFuncStaticClass.myNumber).assertEqual(42);
        SendableFuncStaticClass.myNumber = 100;
        expect(SendableFuncStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_2900
     * @tc.name       : testSendableFuncStaticClass0003
     * @tc.desc       : Test SendableFuncStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0003';
      try {
        expect(SendableFuncStaticClass.myBoolean).assertEqual(true);
        SendableFuncStaticClass.myBoolean = false;
        expect(SendableFuncStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3000
     * @tc.name       : testSendableFuncStaticClass0004
     * @tc.desc       : Test SendableFuncStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0004';
      try {
        expect(SendableFuncStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableFuncStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableFuncStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3100
     * @tc.name       : testSendableFuncStaticClass0005
     * @tc.desc       : Test SendableFuncStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0005';
      try {
        expect(SendableFuncStaticClass.myUndefined).assertEqual(undefined);
        SendableFuncStaticClass.myUndefined = 123;
        expect(SendableFuncStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3200
     * @tc.name       : testSendableFuncStaticClass0006
     * @tc.desc       : Test SendableFuncStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0006';
      try {
        expect(SendableFuncStaticClass.myNull).assertEqual(null);
        SendableFuncStaticClass.myNull = 'not null anymore';
        expect(SendableFuncStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3300
     * @tc.name       : testSendableFuncStaticClass0007
     * @tc.desc       : Test SendableFuncStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0007';
      try {
        expect(SendableFuncStaticClass.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
        expect(SendableFuncStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableFuncStaticClass.topLevelClassInstance.num = 2;
        expect(SendableFuncStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3400
     * @tc.name       : testSendableFuncStaticClass0008
     * @tc.desc       : Test SendableFuncStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0008';
      try {
        expect(typeof SendableFuncStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableFuncStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableFuncStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableFuncStaticClass.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3500
     * @tc.name       : testSendableFuncStaticClass0009
     * @tc.desc       : Test SendableFuncStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0009';
      try {
        expect(typeof SendableFuncStaticClass.myEnum).assertEqual('number');
        expect(SendableFuncStaticClass.myEnum).assertEqual(0);
        SendableFuncStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableFuncStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3600
     * @tc.name       : testSendableFuncStaticClass0010
     * @tc.desc       : Test SendableFuncStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0010';
      try {
        expect(typeof SendableFuncStaticClass.myArray).assertEqual('object');
        expect(SendableFuncStaticClass.myArray.toString()).assertEqual('');
        SendableFuncStaticClass.myArray.push(4, 5);
        expect(SendableFuncStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3700
     * @tc.name       : testSendableFuncStaticClass0011
     * @tc.desc       : Test SendableFuncStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0011';
      try {
        expect(typeof SendableFuncStaticClass.myMap).assertEqual('object');
        expect(SendableFuncStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableFuncStaticClass.myMap.set(1, 2);
        expect(SendableFuncStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3800
     * @tc.name       : testSendableFuncStaticClass0012
     * @tc.desc       : Test SendableFuncStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0012';
      try {
        expect(typeof SendableFuncStaticClass.mySet).assertEqual('object');
        expect(SendableFuncStaticClass.mySet.has(123)).assertEqual(false);
        SendableFuncStaticClass.mySet.add(123);
        expect(SendableFuncStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_3900
     * @tc.name       : testSendableFuncStaticClass0013
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0013';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4000
     * @tc.name       : testSendableFuncStaticClass0014
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0014';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4100
     * @tc.name       : testSendableFuncStaticClass0015
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0015';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4200
     * @tc.name       : testSendableFuncStaticClass0016
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0016';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4300
     * @tc.name       : testSendableFuncStaticClass0017
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0017';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4400
     * @tc.name       : testSendableFuncStaticClass0018
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0018';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4500
     * @tc.name       : testSendableFuncStaticClass0019
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0019';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4600
     * @tc.name       : testSendableFuncStaticClass0020
     * @tc.desc       : Test SendableFuncStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0020';
      try {
        expect(typeof SendableFuncStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableFuncStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4700
     * @tc.name       : testSendableFuncStaticClass0021
     * @tc.desc       : Test SendableFuncStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0021';
      try {
        expect(typeof SendableFuncStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableFuncStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableFuncStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4800
     * @tc.name       : testSendableFuncStaticClass0022
     * @tc.desc       : Test SendableFuncStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0022';
      try {
        expect(typeof SendableFuncStaticClass.myConcatArray).assertEqual('object');
        expect(SendableFuncStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableFuncStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_4900
     * @tc.name       : testSendableFuncStaticClass0023
     * @tc.desc       : Test SendableFuncStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0023';
      try {
        expect(typeof SendableFuncStaticClass.myBitVector).assertEqual('object');
        expect(SendableFuncStaticClass.myBitVector.pop()).assertEqual(0);
        SendableFuncStaticClass.myBitVector.push(1);
        expect(SendableFuncStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5000
     * @tc.name       : testSendableFuncStaticClass0024
     * @tc.desc       : Test SendableFuncStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0024';
      try {
        expect(typeof SendableFuncStaticClass.myASON).assertEqual('object');
        expect((SendableFuncStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableFuncStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5100
     * @tc.name       : testSendableFuncStaticClass0025
     * @tc.desc       : Test SendableFuncStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0025';
      try {
        expect(typeof SendableFuncStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5200
     * @tc.name       : testSendableFuncStaticClass0026
     * @tc.desc       : Test SendableFuncStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncStaticClass0026';
      try {
        expect(typeof SendableFuncStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableFuncStaticClass.mySendableUnionArray).assertEqual(1);
        SendableFuncStaticClass.mySendableUnionArray = 2;
        expect(SendableFuncStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5300
     * @tc.name       : testSendableArrowStaticClass0001
     * @tc.desc       : Test SendableArrowStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0001';
      try {
        expect(SendableArrowStaticClass.myString).assertEqual('example string');
        SendableArrowStaticClass.myString = 'new string';
        expect(SendableArrowStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5400
     * @tc.name       : testSendableArrowStaticClass0002
     * @tc.desc       : Test SendableArrowStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0002';
      try {
        expect(SendableArrowStaticClass.myNumber).assertEqual(42);
        SendableArrowStaticClass.myNumber = 100;
        expect(SendableArrowStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5500
     * @tc.name       : testSendableArrowStaticClass0003
     * @tc.desc       : Test SendableArrowStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0003';
      try {
        expect(SendableArrowStaticClass.myBoolean).assertEqual(true);
        SendableArrowStaticClass.myBoolean = false;
        expect(SendableArrowStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5600
     * @tc.name       : testSendableArrowStaticClass0004
     * @tc.desc       : Test SendableArrowStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0004';
      try {
        expect(SendableArrowStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableArrowStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableArrowStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5700
     * @tc.name       : testSendableArrowStaticClass0005
     * @tc.desc       : Test SendableArrowStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0005';
      try {
        expect(SendableArrowStaticClass.myUndefined).assertEqual(undefined);
        SendableArrowStaticClass.myUndefined = 123;
        expect(SendableArrowStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5800
     * @tc.name       : testSendableArrowStaticClass0006
     * @tc.desc       : Test SendableArrowStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0006';
      try {
        expect(SendableArrowStaticClass.myNull).assertEqual(null);
        SendableArrowStaticClass.myNull = 'not null anymore';
        expect(SendableArrowStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_5900
     * @tc.name       : testSendableArrowStaticClass0007
     * @tc.desc       : Test SendableArrowStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0007';
      try {
        expect(SendableArrowStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableArrowStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableArrowStaticClass.topLevelClassInstance.num = 2;
        expect(SendableArrowStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6000
     * @tc.name       : testSendableArrowStaticClass0008
     * @tc.desc       : Test SendableArrowStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0008';
      try {
        expect(typeof SendableArrowStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableArrowStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableArrowStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableArrowStaticClass.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6100
     * @tc.name       : testSendableArrowStaticClass0009
     * @tc.desc       : Test SendableArrowStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0009';
      try {
        expect(typeof SendableArrowStaticClass.myEnum).assertEqual('number');
        expect(SendableArrowStaticClass.myEnum).assertEqual(0);
        SendableArrowStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableArrowStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6200
     * @tc.name       : testSendableArrowStaticClass0010
     * @tc.desc       : Test SendableArrowStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0010';
      try {
        expect(typeof SendableArrowStaticClass.myArray).assertEqual('object');
        expect(SendableArrowStaticClass.myArray.toString()).assertEqual('');
        SendableArrowStaticClass.myArray.push(4, 5);
        expect(SendableArrowStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6300
     * @tc.name       : testSendableArrowStaticClass0011
     * @tc.desc       : Test SendableArrowStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0011';
      try {
        expect(typeof SendableArrowStaticClass.myMap).assertEqual('object');
        expect(SendableArrowStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableArrowStaticClass.myMap.set(1, 2);
        expect(SendableArrowStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6400
     * @tc.name       : testSendableArrowStaticClass0012
     * @tc.desc       : Test SendableArrowStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0012';
      try {
        expect(typeof SendableArrowStaticClass.mySet).assertEqual('object');
        expect(SendableArrowStaticClass.mySet.has(123)).assertEqual(false);
        SendableArrowStaticClass.mySet.add(123);
        expect(SendableArrowStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6500
     * @tc.name       : testSendableArrowStaticClass0013
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0013';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6600
     * @tc.name       : testSendableArrowStaticClass0014
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0014';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6700
     * @tc.name       : testSendableArrowStaticClass0015
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0015';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6800
     * @tc.name       : testSendableArrowStaticClass0016
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0016';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_6900
     * @tc.name       : testSendableArrowStaticClass0017
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0017';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7000
     * @tc.name       : testSendableArrowStaticClass0018
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0018';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7100
     * @tc.name       : testSendableArrowStaticClass0019
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0019';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7200
     * @tc.name       : testSendableArrowStaticClass0020
     * @tc.desc       : Test SendableArrowStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0020';
      try {
        expect(typeof SendableArrowStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableArrowStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7300
     * @tc.name       : testSendableArrowStaticClass0021
     * @tc.desc       : Test SendableArrowStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0021';
      try {
        expect(typeof SendableArrowStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableArrowStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableArrowStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7400
     * @tc.name       : testSendableArrowStaticClass0022
     * @tc.desc       : Test SendableArrowStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0022';
      try {
        expect(typeof SendableArrowStaticClass.myConcatArray).assertEqual('object');
        expect(SendableArrowStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableArrowStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7500
     * @tc.name       : testSendableArrowStaticClass0023
     * @tc.desc       : Test SendableArrowStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0023';
      try {
        expect(typeof SendableArrowStaticClass.myBitVector).assertEqual('object');
        expect(SendableArrowStaticClass.myBitVector.pop()).assertEqual(0);
        SendableArrowStaticClass.myBitVector.push(1);
        expect(SendableArrowStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7600
     * @tc.name       : testSendableArrowStaticClass0024
     * @tc.desc       : Test SendableArrowStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0024';
      try {
        expect(typeof SendableArrowStaticClass.myASON).assertEqual('object');
        expect((SendableArrowStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableArrowStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7700
     * @tc.name       : testSendableArrowStaticClass0025
     * @tc.desc       : Test SendableArrowStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0025';
      try {
        expect(typeof SendableArrowStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7800
     * @tc.name       : testSendableArrowStaticClass0026
     * @tc.desc       : Test SendableArrowStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowStaticClass0026';
      try {
        expect(typeof SendableArrowStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableArrowStaticClass.mySendableUnionArray).assertEqual(1);
        SendableArrowStaticClass.mySendableUnionArray = 2;
        expect(SendableArrowStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_7900
     * @tc.name       : testSendableArrowOutStaticClass0001
     * @tc.desc       : Test SendableArrowOutStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0001';
      try {
        expect(SendableArrowOutStaticClass.myString).assertEqual('example string');
        SendableArrowOutStaticClass.myString = 'new string';
        expect(SendableArrowOutStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8000
     * @tc.name       : testSendableArrowOutStaticClass0002
     * @tc.desc       : Test SendableArrowOutStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0002';
      try {
        expect(SendableArrowOutStaticClass.myNumber).assertEqual(42);
        SendableArrowOutStaticClass.myNumber = 100;
        expect(SendableArrowOutStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8100
     * @tc.name       : testSendableArrowOutStaticClass0003
     * @tc.desc       : Test SendableArrowOutStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0003';
      try {
        expect(SendableArrowOutStaticClass.myBoolean).assertEqual(true);
        SendableArrowOutStaticClass.myBoolean = false;
        expect(SendableArrowOutStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8200
     * @tc.name       : testSendableArrowOutStaticClass0004
     * @tc.desc       : Test SendableArrowOutStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0004';
      try {
        expect(SendableArrowOutStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableArrowOutStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableArrowOutStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8300
     * @tc.name       : testSendableArrowOutStaticClass0005
     * @tc.desc       : Test SendableArrowOutStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0005';
      try {
        expect(SendableArrowOutStaticClass.myUndefined).assertEqual(undefined);
        SendableArrowOutStaticClass.myUndefined = 123;
        expect(SendableArrowOutStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8400
     * @tc.name       : testSendableArrowOutStaticClass0006
     * @tc.desc       : Test SendableArrowOutStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0006';
      try {
        expect(SendableArrowOutStaticClass.myNull).assertEqual(null);
        SendableArrowOutStaticClass.myNull = 'not null anymore';
        expect(SendableArrowOutStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8500
     * @tc.name       : testSendableArrowOutStaticClass0007
     * @tc.desc       : Test SendableArrowOutStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0007';
      try {
        expect(SendableArrowOutStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableArrowOutStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableArrowOutStaticClass.topLevelClassInstance.num = 2;
        expect(SendableArrowOutStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8600
     * @tc.name       : testSendableArrowOutStaticClass0008
     * @tc.desc       : Test SendableArrowOutStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0008';
      try {
        expect(typeof SendableArrowOutStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableArrowOutStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableArrowOutStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableArrowOutStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8700
     * @tc.name       : testSendableArrowOutStaticClass0009
     * @tc.desc       : Test SendableArrowOutStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0009';
      try {
        expect(typeof SendableArrowOutStaticClass.myEnum).assertEqual('number');
        expect(SendableArrowOutStaticClass.myEnum).assertEqual(0);
        SendableArrowOutStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableArrowOutStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8800
     * @tc.name       : testSendableArrowOutStaticClass0010
     * @tc.desc       : Test SendableArrowOutStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0010';
      try {
        expect(typeof SendableArrowOutStaticClass.myArray).assertEqual('object');
        expect(SendableArrowOutStaticClass.myArray.toString()).assertEqual('');
        SendableArrowOutStaticClass.myArray.push(4, 5);
        expect(SendableArrowOutStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_8900
     * @tc.name       : testSendableArrowOutStaticClass0011
     * @tc.desc       : Test SendableArrowOutStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0011';
      try {
        expect(typeof SendableArrowOutStaticClass.myMap).assertEqual('object');
        expect(SendableArrowOutStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableArrowOutStaticClass.myMap.set(1, 2);
        expect(SendableArrowOutStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9000
     * @tc.name       : testSendableArrowOutStaticClass0012
     * @tc.desc       : Test SendableArrowOutStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0012';
      try {
        expect(typeof SendableArrowOutStaticClass.mySet).assertEqual('object');
        expect(SendableArrowOutStaticClass.mySet.has(123)).assertEqual(false);
        SendableArrowOutStaticClass.mySet.add(123);
        expect(SendableArrowOutStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9100
     * @tc.name       : testSendableArrowOutStaticClass0013
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0013';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9200
     * @tc.name       : testSendableArrowOutStaticClass0014
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0014';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9300
     * @tc.name       : testSendableArrowOutStaticClass0015
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0015';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9400
     * @tc.name       : testSendableArrowOutStaticClass0016
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0016';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9500
     * @tc.name       : testSendableArrowOutStaticClass0017
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0017';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9600
     * @tc.name       : testSendableArrowOutStaticClass0018
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0018';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9700
     * @tc.name       : testSendableArrowOutStaticClass0019
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0019';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9800
     * @tc.name       : testSendableArrowOutStaticClass0020
     * @tc.desc       : Test SendableArrowOutStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0020';
      try {
        expect(typeof SendableArrowOutStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableArrowOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableArrowOutStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableArrowOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_9900
     * @tc.name       : testSendableArrowOutStaticClass0021
     * @tc.desc       : Test SendableArrowOutStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0021';
      try {
        expect(typeof SendableArrowOutStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableArrowOutStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableArrowOutStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10000
     * @tc.name       : testSendableArrowOutStaticClass0022
     * @tc.desc       : Test SendableArrowOutStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0022';
      try {
        expect(typeof SendableArrowOutStaticClass.myConcatArray).assertEqual('object');
        expect(SendableArrowOutStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableArrowOutStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10100
     * @tc.name       : testSendableArrowOutStaticClass0023
     * @tc.desc       : Test SendableArrowOutStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0023';
      try {
        expect(typeof SendableArrowOutStaticClass.myBitVector).assertEqual('object');
        expect(SendableArrowOutStaticClass.myBitVector.pop()).assertEqual(0);
        SendableArrowOutStaticClass.myBitVector.push(1);
        expect(SendableArrowOutStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10200
     * @tc.name       : testSendableArrowOutStaticClass0024
     * @tc.desc       : Test SendableArrowOutStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0024';
      try {
        expect(typeof SendableArrowOutStaticClass.myASON).assertEqual('object');
        expect((SendableArrowOutStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableArrowOutStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10300
     * @tc.name       : testSendableArrowOutStaticClass0025
     * @tc.desc       : Test SendableArrowOutStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0025';
      try {
        expect(typeof SendableArrowOutStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10400
     * @tc.name       : testSendableArrowOutStaticClass0026
     * @tc.desc       : Test SendableArrowOutStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowOutStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowOutStaticClass0026';
      try {
        expect(typeof SendableArrowOutStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableArrowOutStaticClass.mySendableUnionArray).assertEqual(1);
        SendableArrowOutStaticClass.mySendableUnionArray = 2;
        expect(SendableArrowOutStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10500
     * @tc.name       : testSendableFuncInStaticClass0001
     * @tc.desc       : Test SendableFuncInStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0001';
      try {
        expect(SendableFuncInStaticClass.myString).assertEqual('example string');
        SendableFuncInStaticClass.myString = 'new string';
        expect(SendableFuncInStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10600
     * @tc.name       : testSendableFuncInStaticClass0002
     * @tc.desc       : Test SendableFuncInStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0002';
      try {
        expect(SendableFuncInStaticClass.myNumber).assertEqual(42);
        SendableFuncInStaticClass.myNumber = 100;
        expect(SendableFuncInStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10700
     * @tc.name       : testSendableFuncInStaticClass0003
     * @tc.desc       : Test SendableFuncInStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0003';
      try {
        expect(SendableFuncInStaticClass.myBoolean).assertEqual(true);
        SendableFuncInStaticClass.myBoolean = false;
        expect(SendableFuncInStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10800
     * @tc.name       : testSendableFuncInStaticClass0004
     * @tc.desc       : Test SendableFuncInStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0004';
      try {
        expect(SendableFuncInStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableFuncInStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableFuncInStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_10900
     * @tc.name       : testSendableFuncInStaticClass0005
     * @tc.desc       : Test SendableFuncInStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0005';
      try {
        expect(SendableFuncInStaticClass.myUndefined).assertEqual(undefined);
        SendableFuncInStaticClass.myUndefined = 123;
        expect(SendableFuncInStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11000
     * @tc.name       : testSendableFuncInStaticClass0006
     * @tc.desc       : Test SendableFuncInStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0006';
      try {
        expect(SendableFuncInStaticClass.myNull).assertEqual(null);
        SendableFuncInStaticClass.myNull = 'not null anymore';
        expect(SendableFuncInStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11100
     * @tc.name       : testSendableFuncInStaticClass0007
     * @tc.desc       : Test SendableFuncInStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0007';
      try {
        expect(SendableFuncInStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableFuncInStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableFuncInStaticClass.topLevelClassInstance.num = 2;
        expect(SendableFuncInStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11200
     * @tc.name       : testSendableFuncInStaticClass0008
     * @tc.desc       : Test SendableFuncInStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0008';
      try {
        expect(typeof SendableFuncInStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableFuncInStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableFuncInStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableFuncInStaticClass.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11300
     * @tc.name       : testSendableFuncInStaticClass0009
     * @tc.desc       : Test SendableFuncInStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0009';
      try {
        expect(typeof SendableFuncInStaticClass.myEnum).assertEqual('number');
        expect(SendableFuncInStaticClass.myEnum).assertEqual(0);
        SendableFuncInStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableFuncInStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11400
     * @tc.name       : testSendableFuncInStaticClass0010
     * @tc.desc       : Test SendableFuncInStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0010';
      try {
        expect(typeof SendableFuncInStaticClass.myArray).assertEqual('object');
        expect(SendableFuncInStaticClass.myArray.toString()).assertEqual('');
        SendableFuncInStaticClass.myArray.push(4, 5);
        expect(SendableFuncInStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11500
     * @tc.name       : testSendableFuncInStaticClass0011
     * @tc.desc       : Test SendableFuncInStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0011';
      try {
        expect(typeof SendableFuncInStaticClass.myMap).assertEqual('object');
        expect(SendableFuncInStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableFuncInStaticClass.myMap.set(1, 2);
        expect(SendableFuncInStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11600
     * @tc.name       : testSendableFuncInStaticClass0012
     * @tc.desc       : Test SendableFuncInStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0012';
      try {
        expect(typeof SendableFuncInStaticClass.mySet).assertEqual('object');
        expect(SendableFuncInStaticClass.mySet.has(123)).assertEqual(false);
        SendableFuncInStaticClass.mySet.add(123);
        expect(SendableFuncInStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11700
     * @tc.name       : testSendableFuncInStaticClass0013
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0013';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11800
     * @tc.name       : testSendableFuncInStaticClass0014
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0014';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_11900
     * @tc.name       : testSendableFuncInStaticClass0015
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0015';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12000
     * @tc.name       : testSendableFuncInStaticClass0016
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0016';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12100
     * @tc.name       : testSendableFuncInStaticClass0017
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0017';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12200
     * @tc.name       : testSendableFuncInStaticClass0018
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0018';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12300
     * @tc.name       : testSendableFuncInStaticClass0019
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0019';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12400
     * @tc.name       : testSendableFuncInStaticClass0020
     * @tc.desc       : Test SendableFuncInStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0020';
      try {
        expect(typeof SendableFuncInStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableFuncInStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableFuncInStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableFuncInStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12500
     * @tc.name       : testSendableFuncInStaticClass0021
     * @tc.desc       : Test SendableFuncInStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0021';
      try {
        expect(typeof SendableFuncInStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableFuncInStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableFuncInStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12600
     * @tc.name       : testSendableFuncInStaticClass0022
     * @tc.desc       : Test SendableFuncInStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0022';
      try {
        expect(typeof SendableFuncInStaticClass.myConcatArray).assertEqual('object');
        expect(SendableFuncInStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableFuncInStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12700
     * @tc.name       : testSendableFuncInStaticClass0023
     * @tc.desc       : Test SendableFuncInStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0023';
      try {
        expect(typeof SendableFuncInStaticClass.myBitVector).assertEqual('object');
        expect(SendableFuncInStaticClass.myBitVector.pop()).assertEqual(0);
        SendableFuncInStaticClass.myBitVector.push(1);
        expect(SendableFuncInStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12800
     * @tc.name       : testSendableFuncInStaticClass0024
     * @tc.desc       : Test SendableFuncInStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0024';
      try {
        expect(typeof SendableFuncInStaticClass.myASON).assertEqual('object');
        expect((SendableFuncInStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableFuncInStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_12900
     * @tc.name       : testSendableFuncInStaticClass0025
     * @tc.desc       : Test SendableFuncInStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0025';
      try {
        expect(typeof SendableFuncInStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13000
     * @tc.name       : testSendableFuncInStaticClass0026
     * @tc.desc       : Test SendableFuncInStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncInStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncInStaticClass0026';
      try {
        expect(typeof SendableFuncInStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableFuncInStaticClass.mySendableUnionArray).assertEqual(1);
        SendableFuncInStaticClass.mySendableUnionArray = 2;
        expect(SendableFuncInStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13100
     * @tc.name       : testSendableNonParameterFuncStaticClass0001
     * @tc.desc       : Test SendableNonParameterFuncStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0001';
      try {
        expect(SendableNonParameterFuncStaticClass.myString).assertEqual('example string');
        SendableNonParameterFuncStaticClass.myString = 'new string';
        expect(SendableNonParameterFuncStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13200
     * @tc.name       : testSendableNonParameterFuncStaticClass0002
     * @tc.desc       : Test SendableNonParameterFuncStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0002';
      try {
        expect(SendableNonParameterFuncStaticClass.myNumber).assertEqual(42);
        SendableNonParameterFuncStaticClass.myNumber = 100;
        expect(SendableNonParameterFuncStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13300
     * @tc.name       : testSendableNonParameterFuncStaticClass0003
     * @tc.desc       : Test SendableNonParameterFuncStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0003';
      try {
        expect(SendableNonParameterFuncStaticClass.myBoolean).assertEqual(true);
        SendableNonParameterFuncStaticClass.myBoolean = false;
        expect(SendableNonParameterFuncStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13400
     * @tc.name       : testSendableNonParameterFuncStaticClass0004
     * @tc.desc       : Test SendableNonParameterFuncStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0004';
      try {
        expect(SendableNonParameterFuncStaticClass.myBigInt)
          .assertEqual(1234567890123456789012345678901234567890n);
        SendableNonParameterFuncStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableNonParameterFuncStaticClass.myBigInt)
          .assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13500
     * @tc.name       : testSendableNonParameterFuncStaticClass0005
     * @tc.desc       : Test SendableNonParameterFuncStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0005';
      try {
        expect(SendableNonParameterFuncStaticClass.myUndefined).assertEqual(undefined);
        SendableNonParameterFuncStaticClass.myUndefined = 123;
        expect(SendableNonParameterFuncStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13600
     * @tc.name       : testSendableNonParameterFuncStaticClass0006
     * @tc.desc       : Test SendableNonParameterFuncStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0006';
      try {
        expect(SendableNonParameterFuncStaticClass.myNull).assertEqual(null);
        SendableNonParameterFuncStaticClass.myNull = 'not null anymore';
        expect(SendableNonParameterFuncStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13700
     * @tc.name       : testSendableNonParameterFuncStaticClass0007
     * @tc.desc       : Test SendableNonParameterFuncStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0007';
      try {
        expect(SendableNonParameterFuncStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableNonParameterFuncStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableNonParameterFuncStaticClass.topLevelClassInstance.num = 2;
        expect(SendableNonParameterFuncStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13800
     * @tc.name       : testSendableNonParameterFuncStaticClass0008
     * @tc.desc       : Test SendableNonParameterFuncStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0008';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableNonParameterFuncStaticClass.topLevelFunction())
          .assertEqual('Top level sendable function');
        SendableNonParameterFuncStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableNonParameterFuncStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_13900
     * @tc.name       : testSendableNonParameterFuncStaticClass0009
     * @tc.desc       : Test SendableNonParameterFuncStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0009';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myEnum).assertEqual('number');
        expect(SendableNonParameterFuncStaticClass.myEnum).assertEqual(0);
        SendableNonParameterFuncStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableNonParameterFuncStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14000
     * @tc.name       : testSendableNonParameterFuncStaticClass0010
     * @tc.desc       : Test SendableNonParameterFuncStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0010';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myArray).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myArray.toString()).assertEqual('');
        SendableNonParameterFuncStaticClass.myArray.push(4, 5);
        expect(SendableNonParameterFuncStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14100
     * @tc.name       : testSendableNonParameterFuncStaticClass0011
     * @tc.desc       : Test SendableNonParameterFuncStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0011';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myMap).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableNonParameterFuncStaticClass.myMap.set(1, 2);
        expect(SendableNonParameterFuncStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14200
     * @tc.name       : testSendableNonParameterFuncStaticClass0012
     * @tc.desc       : Test SendableNonParameterFuncStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0012';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.mySet).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.mySet.has(123)).assertEqual(false);
        SendableNonParameterFuncStaticClass.mySet.add(123);
        expect(SendableNonParameterFuncStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14300
     * @tc.name       : testSendableNonParameterFuncStaticClass0013
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0013';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14400
     * @tc.name       : testSendableNonParameterFuncStaticClass0014
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0014';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14500
     * @tc.name       : testSendableNonParameterFuncStaticClass0015
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0015';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14600
     * @tc.name       : testSendableNonParameterFuncStaticClass0016
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0016';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14700
     * @tc.name       : testSendableNonParameterFuncStaticClass0017
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0017';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14800
     * @tc.name       : testSendableNonParameterFuncStaticClass0018
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0018';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_14900
     * @tc.name       : testSendableNonParameterFuncStaticClass0019
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0019';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15000
     * @tc.name       : testSendableNonParameterFuncStaticClass0020
     * @tc.desc       : Test SendableNonParameterFuncStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0020';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableNonParameterFuncStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableNonParameterFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15100
     * @tc.name       : testSendableNonParameterFuncStaticClass0021
     * @tc.desc       : Test SendableNonParameterFuncStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0021';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableNonParameterFuncStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15200
     * @tc.name       : testSendableNonParameterFuncStaticClass0022
     * @tc.desc       : Test SendableNonParameterFuncStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0022';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myConcatArray).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableNonParameterFuncStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15300
     * @tc.name       : testSendableNonParameterFuncStaticClass0023
     * @tc.desc       : Test SendableNonParameterFuncStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0023';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myBitVector).assertEqual('object');
        expect(SendableNonParameterFuncStaticClass.myBitVector.pop()).assertEqual(0);
        SendableNonParameterFuncStaticClass.myBitVector.push(1);
        expect(SendableNonParameterFuncStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15400
     * @tc.name       : testSendableNonParameterFuncStaticClass0024
     * @tc.desc       : Test SendableNonParameterFuncStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0024';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myASON).assertEqual('object');
        expect((SendableNonParameterFuncStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableNonParameterFuncStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15500
     * @tc.name       : testSendableNonParameterFuncStaticClass0025
     * @tc.desc       : Test SendableNonParameterFuncStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0025';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15600
     * @tc.name       : testSendableNonParameterFuncStaticClass0026
     * @tc.desc       : Test SendableNonParameterFuncStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonParameterFuncStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonParameterFuncStaticClass0026';
      try {
        expect(typeof SendableNonParameterFuncStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableNonParameterFuncStaticClass.mySendableUnionArray).assertEqual(1);
        SendableNonParameterFuncStaticClass.mySendableUnionArray = 2;
        expect(SendableNonParameterFuncStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15700
     * @tc.name       : testSendableOutArrowStaticClass0001
     * @tc.desc       : Test SendableOutArrowStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0001';
      try {
        expect(SendableOutArrowStaticClass.myString).assertEqual('example string');
        SendableOutArrowStaticClass.myString = 'new string';
        expect(SendableOutArrowStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15800
     * @tc.name       : testSendableOutArrowStaticClass0002
     * @tc.desc       : Test SendableOutArrowStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0002';
      try {
        expect(SendableOutArrowStaticClass.myNumber).assertEqual(42);
        SendableOutArrowStaticClass.myNumber = 100;
        expect(SendableOutArrowStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_15900
     * @tc.name       : testSendableOutArrowStaticClass0003
     * @tc.desc       : Test SendableOutArrowStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0003';
      try {
        expect(SendableOutArrowStaticClass.myBoolean).assertEqual(true);
        SendableOutArrowStaticClass.myBoolean = false;
        expect(SendableOutArrowStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16000
     * @tc.name       : testSendableOutArrowStaticClass0004
     * @tc.desc       : Test SendableOutArrowStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0004';
      try {
        expect(SendableOutArrowStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableOutArrowStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableOutArrowStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16100
     * @tc.name       : testSendableOutArrowStaticClass0005
     * @tc.desc       : Test SendableOutArrowStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0005';
      try {
        expect(SendableOutArrowStaticClass.myUndefined).assertEqual(undefined);
        SendableOutArrowStaticClass.myUndefined = 123;
        expect(SendableOutArrowStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16200
     * @tc.name       : testSendableOutArrowStaticClass0006
     * @tc.desc       : Test SendableOutArrowStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0006';
      try {
        expect(SendableOutArrowStaticClass.myNull).assertEqual(null);
        SendableOutArrowStaticClass.myNull = 'not null anymore';
        expect(SendableOutArrowStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16300
     * @tc.name       : testSendableOutArrowStaticClass0007
     * @tc.desc       : Test SendableOutArrowStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0007';
      try {
        expect(SendableOutArrowStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableOutArrowStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableOutArrowStaticClass.topLevelClassInstance.num = 2;
        expect(SendableOutArrowStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16400
     * @tc.name       : testSendableOutArrowStaticClass0008
     * @tc.desc       : Test SendableOutArrowStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0008';
      try {
        expect(typeof SendableOutArrowStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableOutArrowStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableOutArrowStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableOutArrowStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16500
     * @tc.name       : testSendableOutArrowStaticClass0009
     * @tc.desc       : Test SendableOutArrowStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0009';
      try {
        expect(typeof SendableOutArrowStaticClass.myEnum).assertEqual('number');
        expect(SendableOutArrowStaticClass.myEnum).assertEqual(0);
        SendableOutArrowStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableOutArrowStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16600
     * @tc.name       : testSendableOutArrowStaticClass0010
     * @tc.desc       : Test SendableOutArrowStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0010';
      try {
        expect(typeof SendableOutArrowStaticClass.myArray).assertEqual('object');
        expect(SendableOutArrowStaticClass.myArray.toString()).assertEqual('');
        SendableOutArrowStaticClass.myArray.push(4, 5);
        expect(SendableOutArrowStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16700
     * @tc.name       : testSendableOutArrowStaticClass0011
     * @tc.desc       : Test SendableOutArrowStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0011';
      try {
        expect(typeof SendableOutArrowStaticClass.myMap).assertEqual('object');
        expect(SendableOutArrowStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableOutArrowStaticClass.myMap.set(1, 2);
        expect(SendableOutArrowStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16800
     * @tc.name       : testSendableOutArrowStaticClass0012
     * @tc.desc       : Test SendableOutArrowStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0012';
      try {
        expect(typeof SendableOutArrowStaticClass.mySet).assertEqual('object');
        expect(SendableOutArrowStaticClass.mySet.has(123)).assertEqual(false);
        SendableOutArrowStaticClass.mySet.add(123);
        expect(SendableOutArrowStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_16900
     * @tc.name       : testSendableOutArrowStaticClass0013
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0013';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17000
     * @tc.name       : testSendableOutArrowStaticClass0014
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0014';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17100
     * @tc.name       : testSendableOutArrowStaticClass0015
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0015';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17200
     * @tc.name       : testSendableOutArrowStaticClass0016
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0016';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17300
     * @tc.name       : testSendableOutArrowStaticClass0017
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0017';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17400
     * @tc.name       : testSendableOutArrowStaticClass0018
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0018';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17500
     * @tc.name       : testSendableOutArrowStaticClass0019
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0019';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17600
     * @tc.name       : testSendableOutArrowStaticClass0020
     * @tc.desc       : Test SendableOutArrowStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0020';
      try {
        expect(typeof SendableOutArrowStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableOutArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableOutArrowStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableOutArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17700
     * @tc.name       : testSendableOutArrowStaticClass0021
     * @tc.desc       : Test SendableOutArrowStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0021';
      try {
        expect(typeof SendableOutArrowStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableOutArrowStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableOutArrowStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17800
     * @tc.name       : testSendableOutArrowStaticClass0022
     * @tc.desc       : Test SendableOutArrowStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0022';
      try {
        expect(typeof SendableOutArrowStaticClass.myConcatArray).assertEqual('object');
        expect(SendableOutArrowStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableOutArrowStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_17900
     * @tc.name       : testSendableOutArrowStaticClass0023
     * @tc.desc       : Test SendableOutArrowStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0023';
      try {
        expect(typeof SendableOutArrowStaticClass.myBitVector).assertEqual('object');
        expect(SendableOutArrowStaticClass.myBitVector.pop()).assertEqual(0);
        SendableOutArrowStaticClass.myBitVector.push(1);
        expect(SendableOutArrowStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18000
     * @tc.name       : testSendableOutArrowStaticClass0024
     * @tc.desc       : Test SendableOutArrowStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0024';
      try {
        expect(typeof SendableOutArrowStaticClass.myASON).assertEqual('object');
        expect((SendableOutArrowStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableOutArrowStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18100
     * @tc.name       : testSendableOutArrowStaticClass0025
     * @tc.desc       : Test SendableOutArrowStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0025';
      try {
        expect(typeof SendableOutArrowStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18200
     * @tc.name       : testSendableOutArrowStaticClass0026
     * @tc.desc       : Test SendableOutArrowStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableOutArrowStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableOutArrowStaticClass0026';
      try {
        expect(typeof SendableOutArrowStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableOutArrowStaticClass.mySendableUnionArray).assertEqual(1);
        SendableOutArrowStaticClass.mySendableUnionArray = 2;
        expect(SendableOutArrowStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18300
     * @tc.name       : testSendableNonFuncStaticClass0001
     * @tc.desc       : Test SendableNonFuncStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0001';
      try {
        expect(SendableNonFuncStaticClass.myString).assertEqual('example string');
        SendableNonFuncStaticClass.myString = 'new string';
        expect(SendableNonFuncStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18400
     * @tc.name       : testSendableNonFuncStaticClass0002
     * @tc.desc       : Test SendableNonFuncStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0002';
      try {
        expect(SendableNonFuncStaticClass.myNumber).assertEqual(42);
        SendableNonFuncStaticClass.myNumber = 100;
        expect(SendableNonFuncStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18500
     * @tc.name       : testSendableNonFuncStaticClass0003
     * @tc.desc       : Test SendableNonFuncStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0003';
      try {
        expect(SendableNonFuncStaticClass.myBoolean).assertEqual(true);
        SendableNonFuncStaticClass.myBoolean = false;
        expect(SendableNonFuncStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18600
     * @tc.name       : testSendableNonFuncStaticClass0004
     * @tc.desc       : Test SendableNonFuncStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0004';
      try {
        expect(SendableNonFuncStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableNonFuncStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableNonFuncStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18700
     * @tc.name       : testSendableNonFuncStaticClass0005
     * @tc.desc       : Test SendableNonFuncStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0005';
      try {
        expect(SendableNonFuncStaticClass.myUndefined).assertEqual(undefined);
        SendableNonFuncStaticClass.myUndefined = 123;
        expect(SendableNonFuncStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18800
     * @tc.name       : testSendableNonFuncStaticClass0006
     * @tc.desc       : Test SendableNonFuncStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0006';
      try {
        expect(SendableNonFuncStaticClass.myNull).assertEqual(null);
        SendableNonFuncStaticClass.myNull = 'not null anymore';
        expect(SendableNonFuncStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_18900
     * @tc.name       : testSendableNonFuncStaticClass0007
     * @tc.desc       : Test SendableNonFuncStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0007';
      try {
        expect(SendableNonFuncStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableNonFuncStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableNonFuncStaticClass.topLevelClassInstance.num = 2;
        expect(SendableNonFuncStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19000
     * @tc.name       : testSendableNonFuncStaticClass0008
     * @tc.desc       : Test SendableNonFuncStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0008';
      try {
        expect(typeof SendableNonFuncStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableNonFuncStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableNonFuncStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableNonFuncStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19100
     * @tc.name       : testSendableNonFuncStaticClass0009
     * @tc.desc       : Test SendableNonFuncStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0009';
      try {
        expect(typeof SendableNonFuncStaticClass.myEnum).assertEqual('number');
        expect(SendableNonFuncStaticClass.myEnum).assertEqual(0);
        SendableNonFuncStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableNonFuncStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19200
     * @tc.name       : testSendableNonFuncStaticClass0010
     * @tc.desc       : Test SendableNonFuncStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0010';
      try {
        expect(typeof SendableNonFuncStaticClass.myArray).assertEqual('object');
        expect(SendableNonFuncStaticClass.myArray.toString()).assertEqual('');
        SendableNonFuncStaticClass.myArray.push(4, 5);
        expect(SendableNonFuncStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19300
     * @tc.name       : testSendableNonFuncStaticClass0011
     * @tc.desc       : Test SendableNonFuncStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0011';
      try {
        expect(typeof SendableNonFuncStaticClass.myMap).assertEqual('object');
        expect(SendableNonFuncStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableNonFuncStaticClass.myMap.set(1, 2);
        expect(SendableNonFuncStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19400
     * @tc.name       : testSendableNonFuncStaticClass0012
     * @tc.desc       : Test SendableNonFuncStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0012';
      try {
        expect(typeof SendableNonFuncStaticClass.mySet).assertEqual('object');
        expect(SendableNonFuncStaticClass.mySet.has(123)).assertEqual(false);
        SendableNonFuncStaticClass.mySet.add(123);
        expect(SendableNonFuncStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19500
     * @tc.name       : testSendableNonFuncStaticClass0013
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0013';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19600
     * @tc.name       : testSendableNonFuncStaticClass0014
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0014';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19700
     * @tc.name       : testSendableNonFuncStaticClass0015
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0015';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19800
     * @tc.name       : testSendableNonFuncStaticClass0016
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0016';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_19900
     * @tc.name       : testSendableNonFuncStaticClass0017
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0017';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20000
     * @tc.name       : testSendableNonFuncStaticClass0018
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0018';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20100
     * @tc.name       : testSendableNonFuncStaticClass0019
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0019';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20200
     * @tc.name       : testSendableNonFuncStaticClass0020
     * @tc.desc       : Test SendableNonFuncStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0020';
      try {
        expect(typeof SendableNonFuncStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableNonFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableNonFuncStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableNonFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20300
     * @tc.name       : testSendableNonFuncStaticClass0021
     * @tc.desc       : Test SendableNonFuncStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0021';
      try {
        expect(typeof SendableNonFuncStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableNonFuncStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableNonFuncStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20400
     * @tc.name       : testSendableNonFuncStaticClass0022
     * @tc.desc       : Test SendableNonFuncStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0022';
      try {
        expect(typeof SendableNonFuncStaticClass.myConcatArray).assertEqual('object');
        expect(SendableNonFuncStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableNonFuncStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20500
     * @tc.name       : testSendableNonFuncStaticClass0023
     * @tc.desc       : Test SendableNonFuncStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0023';
      try {
        expect(typeof SendableNonFuncStaticClass.myBitVector).assertEqual('object');
        expect(SendableNonFuncStaticClass.myBitVector.pop()).assertEqual(0);
        SendableNonFuncStaticClass.myBitVector.push(1);
        expect(SendableNonFuncStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20600
     * @tc.name       : testSendableNonFuncStaticClass0024
     * @tc.desc       : Test SendableNonFuncStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0024';
      try {
        expect(typeof SendableNonFuncStaticClass.myASON).assertEqual('object');
        expect((SendableNonFuncStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableNonFuncStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20700
     * @tc.name       : testSendableNonFuncStaticClass0025
     * @tc.desc       : Test SendableNonFuncStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0025';
      try {
        expect(typeof SendableNonFuncStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20800
     * @tc.name       : testSendableNonFuncStaticClass0026
     * @tc.desc       : Test SendableNonFuncStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableNonFuncStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableNonFuncStaticClass0026';
      try {
        expect(typeof SendableNonFuncStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableNonFuncStaticClass.mySendableUnionArray).assertEqual(1);
        SendableNonFuncStaticClass.mySendableUnionArray = 2;
        expect(SendableNonFuncStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_20900
     * @tc.name       : testSendableParameterFuncStaticClass0001
     * @tc.desc       : Test SendableParameterFuncStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0001';
      try {
        expect(SendableParameterFuncStaticClass.myString).assertEqual('example string');
        SendableParameterFuncStaticClass.myString = 'new string';
        expect(SendableParameterFuncStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21000
     * @tc.name       : testSendableParameterFuncStaticClass0002
     * @tc.desc       : Test SendableParameterFuncStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0002';
      try {
        expect(SendableParameterFuncStaticClass.myNumber).assertEqual(42);
        SendableParameterFuncStaticClass.myNumber = 100;
        expect(SendableParameterFuncStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21100
     * @tc.name       : testSendableParameterFuncStaticClass0003
     * @tc.desc       : Test SendableParameterFuncStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0003';
      try {
        expect(SendableParameterFuncStaticClass.myBoolean).assertEqual(true);
        SendableParameterFuncStaticClass.myBoolean = false;
        expect(SendableParameterFuncStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21200
     * @tc.name       : testSendableParameterFuncStaticClass0004
     * @tc.desc       : Test SendableParameterFuncStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0004';
      try {
        expect(SendableParameterFuncStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableParameterFuncStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableParameterFuncStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21300
     * @tc.name       : testSendableParameterFuncStaticClass0005
     * @tc.desc       : Test SendableParameterFuncStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0005';
      try {
        expect(SendableParameterFuncStaticClass.myUndefined).assertEqual(undefined);
        SendableParameterFuncStaticClass.myUndefined = 123;
        expect(SendableParameterFuncStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21400
     * @tc.name       : testSendableParameterFuncStaticClass0006
     * @tc.desc       : Test SendableParameterFuncStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0006';
      try {
        expect(SendableParameterFuncStaticClass.myNull).assertEqual(null);
        SendableParameterFuncStaticClass.myNull = 'not null anymore';
        expect(SendableParameterFuncStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21500
     * @tc.name       : testSendableParameterFuncStaticClass0007
     * @tc.desc       : Test SendableParameterFuncStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0007';
      try {
        expect(SendableParameterFuncStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableParameterFuncStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableParameterFuncStaticClass.topLevelClassInstance.num = 2;
        expect(SendableParameterFuncStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21600
     * @tc.name       : testSendableParameterFuncStaticClass0008
     * @tc.desc       : Test SendableParameterFuncStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0008';
      try {
        expect(typeof SendableParameterFuncStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableParameterFuncStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableParameterFuncStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableParameterFuncStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21700
     * @tc.name       : testSendableParameterFuncStaticClass0009
     * @tc.desc       : Test SendableParameterFuncStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0009';
      try {
        expect(typeof SendableParameterFuncStaticClass.myEnum).assertEqual('number');
        expect(SendableParameterFuncStaticClass.myEnum).assertEqual(0);
        SendableParameterFuncStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableParameterFuncStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21800
     * @tc.name       : testSendableParameterFuncStaticClass0010
     * @tc.desc       : Test SendableParameterFuncStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0010';
      try {
        expect(typeof SendableParameterFuncStaticClass.myArray).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myArray.toString()).assertEqual('');
        SendableParameterFuncStaticClass.myArray.push(4, 5);
        expect(SendableParameterFuncStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_21900
     * @tc.name       : testSendableParameterFuncStaticClass0011
     * @tc.desc       : Test SendableParameterFuncStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0011';
      try {
        expect(typeof SendableParameterFuncStaticClass.myMap).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableParameterFuncStaticClass.myMap.set(1, 2);
        expect(SendableParameterFuncStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22000
     * @tc.name       : testSendableParameterFuncStaticClass0012
     * @tc.desc       : Test SendableParameterFuncStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0012';
      try {
        expect(typeof SendableParameterFuncStaticClass.mySet).assertEqual('object');
        expect(SendableParameterFuncStaticClass.mySet.has(123)).assertEqual(false);
        SendableParameterFuncStaticClass.mySet.add(123);
        expect(SendableParameterFuncStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22100
     * @tc.name       : testSendableParameterFuncStaticClass0013
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0013';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22200
     * @tc.name       : testSendableParameterFuncStaticClass0014
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0014';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22300
     * @tc.name       : testSendableParameterFuncStaticClass0015
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0015';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22400
     * @tc.name       : testSendableParameterFuncStaticClass0016
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0016';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22500
     * @tc.name       : testSendableParameterFuncStaticClass0017
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0017';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22600
     * @tc.name       : testSendableParameterFuncStaticClass0018
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0018';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22700
     * @tc.name       : testSendableParameterFuncStaticClass0019
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0019';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22800
     * @tc.name       : testSendableParameterFuncStaticClass0020
     * @tc.desc       : Test SendableParameterFuncStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0020';
      try {
        expect(typeof SendableParameterFuncStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableParameterFuncStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableParameterFuncStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_22900
     * @tc.name       : testSendableParameterFuncStaticClass0021
     * @tc.desc       : Test SendableParameterFuncStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0021';
      try {
        expect(typeof SendableParameterFuncStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableParameterFuncStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23000
     * @tc.name       : testSendableParameterFuncStaticClass0022
     * @tc.desc       : Test SendableParameterFuncStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0022';
      try {
        expect(typeof SendableParameterFuncStaticClass.myConcatArray).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableParameterFuncStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23100
     * @tc.name       : testSendableParameterFuncStaticClass0023
     * @tc.desc       : Test SendableParameterFuncStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0023';
      try {
        expect(typeof SendableParameterFuncStaticClass.myBitVector).assertEqual('object');
        expect(SendableParameterFuncStaticClass.myBitVector.pop()).assertEqual(0);
        SendableParameterFuncStaticClass.myBitVector.push(1);
        expect(SendableParameterFuncStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23200
     * @tc.name       : testSendableParameterFuncStaticClass0024
     * @tc.desc       : Test SendableParameterFuncStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0024';
      try {
        expect(typeof SendableParameterFuncStaticClass.myASON).assertEqual('object');
        expect((SendableParameterFuncStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableParameterFuncStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23300
     * @tc.name       : testSendableParameterFuncStaticClass0025
     * @tc.desc       : Test SendableParameterFuncStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0025';
      try {
        expect(typeof SendableParameterFuncStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23400
     * @tc.name       : testSendableParameterFuncStaticClass0026
     * @tc.desc       : Test SendableParameterFuncStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableParameterFuncStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableParameterFuncStaticClass0026';
      try {
        expect(typeof SendableParameterFuncStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableParameterFuncStaticClass.mySendableUnionArray).assertEqual(1);
        SendableParameterFuncStaticClass.mySendableUnionArray = 2;
        expect(SendableParameterFuncStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23500
     * @tc.name       : testSendableArrowNewStaticClass0001
     * @tc.desc       : Test SendableArrowNewStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0001';
      try {
        expect(SendableArrowNewStaticClass.myString).assertEqual('example string');
        SendableArrowNewStaticClass.myString = 'new string';
        expect(SendableArrowNewStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23600
     * @tc.name       : testSendableArrowNewStaticClass0002
     * @tc.desc       : Test SendableArrowNewStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0002';
      try {
        expect(SendableArrowNewStaticClass.myNumber).assertEqual(42);
        SendableArrowNewStaticClass.myNumber = 100;
        expect(SendableArrowNewStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23700
     * @tc.name       : testSendableArrowNewStaticClass0003
     * @tc.desc       : Test SendableArrowNewStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0003';
      try {
        expect(SendableArrowNewStaticClass.myBoolean).assertEqual(true);
        SendableArrowNewStaticClass.myBoolean = false;
        expect(SendableArrowNewStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23800
     * @tc.name       : testSendableArrowNewStaticClass0004
     * @tc.desc       : Test SendableArrowNewStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0004';
      try {
        expect(SendableArrowNewStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableArrowNewStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableArrowNewStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_23900
     * @tc.name       : testSendableArrowNewStaticClass0005
     * @tc.desc       : Test SendableArrowNewStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0005';
      try {
        expect(SendableArrowNewStaticClass.myUndefined).assertEqual(undefined);
        SendableArrowNewStaticClass.myUndefined = 123;
        expect(SendableArrowNewStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24000
     * @tc.name       : testSendableArrowNewStaticClass0006
     * @tc.desc       : Test SendableArrowNewStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0006';
      try {
        expect(SendableArrowNewStaticClass.myNull).assertEqual(null);
        SendableArrowNewStaticClass.myNull = 'not null anymore';
        expect(SendableArrowNewStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24100
     * @tc.name       : testSendableArrowNewStaticClass0007
     * @tc.desc       : Test SendableArrowNewStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0007';
      try {
        expect(SendableArrowNewStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableArrowNewStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableArrowNewStaticClass.topLevelClassInstance.num = 2;
        expect(SendableArrowNewStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24200
     * @tc.name       : testSendableArrowNewStaticClass0008
     * @tc.desc       : Test SendableArrowNewStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0008';
      try {
        expect(typeof SendableArrowNewStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableArrowNewStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableArrowNewStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableArrowNewStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24300
     * @tc.name       : testSendableArrowNewStaticClass0009
     * @tc.desc       : Test SendableArrowNewStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0009';
      try {
        expect(typeof SendableArrowNewStaticClass.myEnum).assertEqual('number');
        expect(SendableArrowNewStaticClass.myEnum).assertEqual(0);
        SendableArrowNewStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableArrowNewStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24400
     * @tc.name       : testSendableArrowNewStaticClass0010
     * @tc.desc       : Test SendableArrowNewStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0010';
      try {
        expect(typeof SendableArrowNewStaticClass.myArray).assertEqual('object');
        expect(SendableArrowNewStaticClass.myArray.toString()).assertEqual('');
        SendableArrowNewStaticClass.myArray.push(4, 5);
        expect(SendableArrowNewStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24500
     * @tc.name       : testSendableArrowNewStaticClass0011
     * @tc.desc       : Test SendableArrowNewStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0011';
      try {
        expect(typeof SendableArrowNewStaticClass.myMap).assertEqual('object');
        expect(SendableArrowNewStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableArrowNewStaticClass.myMap.set(1, 2);
        expect(SendableArrowNewStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24600
     * @tc.name       : testSendableArrowNewStaticClass0012
     * @tc.desc       : Test SendableArrowNewStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0012';
      try {
        expect(typeof SendableArrowNewStaticClass.mySet).assertEqual('object');
        expect(SendableArrowNewStaticClass.mySet.has(123)).assertEqual(false);
        SendableArrowNewStaticClass.mySet.add(123);
        expect(SendableArrowNewStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24700
     * @tc.name       : testSendableArrowNewStaticClass0013
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0013';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24800
     * @tc.name       : testSendableArrowNewStaticClass0014
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0014';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_24900
     * @tc.name       : testSendableArrowNewStaticClass0015
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0015';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25000
     * @tc.name       : testSendableArrowNewStaticClass0016
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0016';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25100
     * @tc.name       : testSendableArrowNewStaticClass0017
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0017';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25200
     * @tc.name       : testSendableArrowNewStaticClass0018
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0018';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25300
     * @tc.name       : testSendableArrowNewStaticClass0019
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0019';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25400
     * @tc.name       : testSendableArrowNewStaticClass0020
     * @tc.desc       : Test SendableArrowNewStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0020';
      try {
        expect(typeof SendableArrowNewStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableArrowNewStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableArrowNewStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableArrowNewStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25500
     * @tc.name       : testSendableArrowNewStaticClass0021
     * @tc.desc       : Test SendableArrowNewStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0021';
      try {
        expect(typeof SendableArrowNewStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableArrowNewStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableArrowNewStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25600
     * @tc.name       : testSendableArrowNewStaticClass0022
     * @tc.desc       : Test SendableArrowNewStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0022';
      try {
        expect(typeof SendableArrowNewStaticClass.myConcatArray).assertEqual('object');
        expect(SendableArrowNewStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableArrowNewStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25700
     * @tc.name       : testSendableArrowNewStaticClass0023
     * @tc.desc       : Test SendableArrowNewStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0023';
      try {
        expect(typeof SendableArrowNewStaticClass.myBitVector).assertEqual('object');
        expect(SendableArrowNewStaticClass.myBitVector.pop()).assertEqual(0);
        SendableArrowNewStaticClass.myBitVector.push(1);
        expect(SendableArrowNewStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25800
     * @tc.name       : testSendableArrowNewStaticClass0024
     * @tc.desc       : Test SendableArrowNewStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0024';
      try {
        expect(typeof SendableArrowNewStaticClass.myASON).assertEqual('object');
        expect((SendableArrowNewStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableArrowNewStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_25900
     * @tc.name       : testSendableArrowNewStaticClass0025
     * @tc.desc       : Test SendableArrowNewStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0025';
      try {
        expect(typeof SendableArrowNewStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26000
     * @tc.name       : testSendableArrowNewStaticClass0026
     * @tc.desc       : Test SendableArrowNewStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableArrowNewStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableArrowNewStaticClass0026';
      try {
        expect(typeof SendableArrowNewStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableArrowNewStaticClass.mySendableUnionArray).assertEqual(1);
        SendableArrowNewStaticClass.mySendableUnionArray = 2;
        expect(SendableArrowNewStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26100
     * @tc.name       : testSendableExpressionArrowOutStaticClass0001
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0001';
        try {
          expect(SendableExpressionArrowOutStaticClass.myString).assertEqual('example string');
          SendableExpressionArrowOutStaticClass.myString = 'new string';
          expect(SendableExpressionArrowOutStaticClass.myString).assertEqual('new string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26200
     * @tc.name       : testSendableExpressionArrowOutStaticClass0002
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0002';
        try {
          expect(SendableExpressionArrowOutStaticClass.myNumber).assertEqual(42);
          SendableExpressionArrowOutStaticClass.myNumber = 100;
          expect(SendableExpressionArrowOutStaticClass.myNumber).assertEqual(100);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26300
     * @tc.name       : testSendableExpressionArrowOutStaticClass0003
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0003';
        try {
          expect(SendableExpressionArrowOutStaticClass.myBoolean).assertEqual(true);
          SendableExpressionArrowOutStaticClass.myBoolean = false;
          expect(SendableExpressionArrowOutStaticClass.myBoolean).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26400
     * @tc.name       : testSendableExpressionArrowOutStaticClass0004
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0004';
        try {
          expect(SendableExpressionArrowOutStaticClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
          SendableExpressionArrowOutStaticClass.myBigInt = 987654321098765432109876543210987654321n;
          expect(SendableExpressionArrowOutStaticClass.myBigInt)
            .assertEqual(987654321098765432109876543210987654321n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26500
     * @tc.name       : testSendableExpressionArrowOutStaticClass0005
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0005';
        try {
          expect(SendableExpressionArrowOutStaticClass.myUndefined).assertEqual(undefined);
          SendableExpressionArrowOutStaticClass.myUndefined = 123;
          expect(SendableExpressionArrowOutStaticClass.myUndefined).assertEqual(123);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26600
     * @tc.name       : testSendableExpressionArrowOutStaticClass0006
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0006';
        try {
          expect(SendableExpressionArrowOutStaticClass.myNull).assertEqual(null);
          SendableExpressionArrowOutStaticClass.myNull = 'not null anymore';
          expect(SendableExpressionArrowOutStaticClass.myNull).assertEqual('not null anymore');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26700
     * @tc.name       : testSendableExpressionArrowOutStaticClass0007
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0007';
        try {
          expect(SendableExpressionArrowOutStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
            .assertEqual(true);
          expect(SendableExpressionArrowOutStaticClass.topLevelClassInstance.num).assertEqual(1);
          SendableExpressionArrowOutStaticClass.topLevelClassInstance.num = 2;
          expect(SendableExpressionArrowOutStaticClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26800
     * @tc.name       : testSendableExpressionArrowOutStaticClass0008
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0008';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.topLevelFunction === 'function').assertEqual(true);
          expect(SendableExpressionArrowOutStaticClass.topLevelFunction())
            .assertEqual('Top level sendable function');
          SendableExpressionArrowOutStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
          expect(SendableExpressionArrowOutStaticClass.topLevelFunction())
            .assertEqual('Modified top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_26900
     * @tc.name       : testSendableExpressionArrowOutStaticClass0009
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0009';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myEnum).assertEqual('number');
          expect(SendableExpressionArrowOutStaticClass.myEnum).assertEqual(0);
          SendableExpressionArrowOutStaticClass.myEnum = SendableConstEnum.OPTION_2;
          expect(SendableExpressionArrowOutStaticClass.myEnum).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27000
     * @tc.name       : testSendableExpressionArrowOutStaticClass0010
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0010';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myArray).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myArray.toString()).assertEqual('');
          SendableExpressionArrowOutStaticClass.myArray.push(4, 5);
          expect(SendableExpressionArrowOutStaticClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27100
     * @tc.name       : testSendableExpressionArrowOutStaticClass0011
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0011';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myMap).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myMap.get(1)).assertEqual(undefined);
          SendableExpressionArrowOutStaticClass.myMap.set(1, 2);
          expect(SendableExpressionArrowOutStaticClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27200
     * @tc.name       : testSendableExpressionArrowOutStaticClass0012
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0012';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.mySet).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.mySet.has(123)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.mySet.add(123);
          expect(SendableExpressionArrowOutStaticClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27300
     * @tc.name       : testSendableExpressionArrowOutStaticClass0013
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0013';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayInt8Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayInt8Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27400
     * @tc.name       : testSendableExpressionArrowOutStaticClass0014
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0014';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayUint8Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayUint8Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27500
     * @tc.name       : testSendableExpressionArrowOutStaticClass0015
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0015';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayInt16Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayInt16Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27600
     * @tc.name       : testSendableExpressionArrowOutStaticClass0016
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0016';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayUint16Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayUint16Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27700
     * @tc.name       : testSendableExpressionArrowOutStaticClass0017
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0017';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayInt32Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayInt32Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27800
     * @tc.name       : testSendableExpressionArrowOutStaticClass0018
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0018';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayUint32Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayUint32Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_27900
     * @tc.name       : testSendableExpressionArrowOutStaticClass0019
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0019';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28000
     * @tc.name       : testSendableExpressionArrowOutStaticClass0020
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0020';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myTypedArrayFloat32Array).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
          SendableExpressionArrowOutStaticClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableExpressionArrowOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28100
     * @tc.name       : testSendableExpressionArrowOutStaticClass0021
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0021';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myArrayBuffer).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableExpressionArrowOutStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28200
     * @tc.name       : testSendableExpressionArrowOutStaticClass0022
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0022';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myConcatArray).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myConcatArray[1]).assertEqual(2);
          expect(SendableExpressionArrowOutStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28300
     * @tc.name       : testSendableExpressionArrowOutStaticClass0023
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0023';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myBitVector).assertEqual('object');
          expect(SendableExpressionArrowOutStaticClass.myBitVector.pop()).assertEqual(0);
          SendableExpressionArrowOutStaticClass.myBitVector.push(1);
          expect(SendableExpressionArrowOutStaticClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28400
     * @tc.name       : testSendableExpressionArrowOutStaticClass0024
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0024';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myASON).assertEqual('object');
          expect((SendableExpressionArrowOutStaticClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableExpressionArrowOutStaticClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28500
     * @tc.name       : testSendableExpressionArrowOutStaticClass0025
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0025';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28600
     * @tc.name       : testSendableExpressionArrowOutStaticClass0026
     * @tc.desc       : Test SendableExpressionArrowOutStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionArrowOutStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionArrowOutStaticClass0026';
        try {
          expect(typeof SendableExpressionArrowOutStaticClass.mySendableUnionArray).assertEqual('number');
          expect(SendableExpressionArrowOutStaticClass.mySendableUnionArray).assertEqual(1);
          SendableExpressionArrowOutStaticClass.mySendableUnionArray = 2;
          expect(SendableExpressionArrowOutStaticClass.mySendableUnionArray).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28700
     * @tc.name       : testSendableExpressionOutStaticClass0001
     * @tc.desc       : Test SendableExpressionOutStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0001';
      try {
        expect(SendableExpressionOutStaticClass.myString).assertEqual('example string');
        SendableExpressionOutStaticClass.myString = 'new string';
        expect(SendableExpressionOutStaticClass.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28800
     * @tc.name       : testSendableExpressionOutStaticClass0002
     * @tc.desc       : Test SendableExpressionOutStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0002';
      try {
        expect(SendableExpressionOutStaticClass.myNumber).assertEqual(42);
        SendableExpressionOutStaticClass.myNumber = 100;
        expect(SendableExpressionOutStaticClass.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_28900
     * @tc.name       : testSendableExpressionOutStaticClass0003
     * @tc.desc       : Test SendableExpressionOutStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0003';
      try {
        expect(SendableExpressionOutStaticClass.myBoolean).assertEqual(true);
        SendableExpressionOutStaticClass.myBoolean = false;
        expect(SendableExpressionOutStaticClass.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29000
     * @tc.name       : testSendableExpressionOutStaticClass0004
     * @tc.desc       : Test SendableExpressionOutStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0004';
      try {
        expect(SendableExpressionOutStaticClass.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableExpressionOutStaticClass.myBigInt = 987654321098765432109876543210987654321n;
        expect(SendableExpressionOutStaticClass.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29100
     * @tc.name       : testSendableExpressionOutStaticClass0005
     * @tc.desc       : Test SendableExpressionOutStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0005';
      try {
        expect(SendableExpressionOutStaticClass.myUndefined).assertEqual(undefined);
        SendableExpressionOutStaticClass.myUndefined = 123;
        expect(SendableExpressionOutStaticClass.myUndefined).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29200
     * @tc.name       : testSendableExpressionOutStaticClass0006
     * @tc.desc       : Test SendableExpressionOutStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0006';
      try {
        expect(SendableExpressionOutStaticClass.myNull).assertEqual(null);
        SendableExpressionOutStaticClass.myNull = 'not null anymore';
        expect(SendableExpressionOutStaticClass.myNull).assertEqual('not null anymore');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29300
     * @tc.name       : testSendableExpressionOutStaticClass0007
     * @tc.desc       : Test SendableExpressionOutStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0007';
      try {
        expect(SendableExpressionOutStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
          .assertEqual(true);
        expect(SendableExpressionOutStaticClass.topLevelClassInstance.num).assertEqual(1);
        SendableExpressionOutStaticClass.topLevelClassInstance.num = 2;
        expect(SendableExpressionOutStaticClass.topLevelClassInstance.num).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29400
     * @tc.name       : testSendableExpressionOutStaticClass0008
     * @tc.desc       : Test SendableExpressionOutStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0008';
      try {
        expect(typeof SendableExpressionOutStaticClass.topLevelFunction === 'function').assertEqual(true);
        expect(SendableExpressionOutStaticClass.topLevelFunction()).assertEqual('Top level sendable function');
        SendableExpressionOutStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
        expect(SendableExpressionOutStaticClass.topLevelFunction())
          .assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29500
     * @tc.name       : testSendableExpressionOutStaticClass0009
     * @tc.desc       : Test SendableExpressionOutStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0009';
      try {
        expect(typeof SendableExpressionOutStaticClass.myEnum).assertEqual('number');
        expect(SendableExpressionOutStaticClass.myEnum).assertEqual(0);
        SendableExpressionOutStaticClass.myEnum = SendableConstEnum.OPTION_2;
        expect(SendableExpressionOutStaticClass.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29600
     * @tc.name       : testSendableExpressionOutStaticClass0010
     * @tc.desc       : Test SendableExpressionOutStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0010';
      try {
        expect(typeof SendableExpressionOutStaticClass.myArray).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myArray.toString()).assertEqual('');
        SendableExpressionOutStaticClass.myArray.push(4, 5);
        expect(SendableExpressionOutStaticClass.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29700
     * @tc.name       : testSendableExpressionOutStaticClass0011
     * @tc.desc       : Test SendableExpressionOutStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0011';
      try {
        expect(typeof SendableExpressionOutStaticClass.myMap).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myMap.get(1)).assertEqual(undefined);
        SendableExpressionOutStaticClass.myMap.set(1, 2);
        expect(SendableExpressionOutStaticClass.myMap.get(1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29800
     * @tc.name       : testSendableExpressionOutStaticClass0012
     * @tc.desc       : Test SendableExpressionOutStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0012';
      try {
        expect(typeof SendableExpressionOutStaticClass.mySet).assertEqual('object');
        expect(SendableExpressionOutStaticClass.mySet.has(123)).assertEqual(false);
        SendableExpressionOutStaticClass.mySet.add(123);
        expect(SendableExpressionOutStaticClass.mySet.has(123)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_29900
     * @tc.name       : testSendableExpressionOutStaticClass0013
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0013';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayInt8Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayInt8Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30000
     * @tc.name       : testSendableExpressionOutStaticClass0014
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0014';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayUint8Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayUint8Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30100
     * @tc.name       : testSendableExpressionOutStaticClass0015
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0015';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayInt16Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayInt16Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30200
     * @tc.name       : testSendableExpressionOutStaticClass0016
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0016';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayUint16Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayUint16Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30300
     * @tc.name       : testSendableExpressionOutStaticClass0017
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0017';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayInt32Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayInt32Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30400
     * @tc.name       : testSendableExpressionOutStaticClass0018
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0018';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayUint32Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayUint32Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30500
     * @tc.name       : testSendableExpressionOutStaticClass0019
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0019';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayUint8ClampedArray.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30600
     * @tc.name       : testSendableExpressionOutStaticClass0020
     * @tc.desc       : Test SendableExpressionOutStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0020';
      try {
        expect(typeof SendableExpressionOutStaticClass.myTypedArrayFloat32Array).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        SendableExpressionOutStaticClass.myTypedArrayFloat32Array.fill(2);
        expect(SendableExpressionOutStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30700
     * @tc.name       : testSendableExpressionOutStaticClass0021
     * @tc.desc       : Test SendableExpressionOutStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0021';
      try {
        expect(typeof SendableExpressionOutStaticClass.myArrayBuffer).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myArrayBuffer.byteLength).assertEqual(10);
        expect(SendableExpressionOutStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30800
     * @tc.name       : testSendableExpressionOutStaticClass0022
     * @tc.desc       : Test SendableExpressionOutStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0022';
      try {
        expect(typeof SendableExpressionOutStaticClass.myConcatArray).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myConcatArray[1]).assertEqual(2);
        expect(SendableExpressionOutStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_30900
     * @tc.name       : testSendableExpressionOutStaticClass0023
     * @tc.desc       : Test SendableExpressionOutStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0023';
      try {
        expect(typeof SendableExpressionOutStaticClass.myBitVector).assertEqual('object');
        expect(SendableExpressionOutStaticClass.myBitVector.pop()).assertEqual(0);
        SendableExpressionOutStaticClass.myBitVector.push(1);
        expect(SendableExpressionOutStaticClass.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31000
     * @tc.name       : testSendableExpressionOutStaticClass0024
     * @tc.desc       : Test SendableExpressionOutStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0024';
      try {
        expect(typeof SendableExpressionOutStaticClass.myASON).assertEqual('object');
        expect((SendableExpressionOutStaticClass.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(SendableExpressionOutStaticClass.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31100
     * @tc.name       : testSendableExpressionOutStaticClass0025
     * @tc.desc       : Test SendableExpressionOutStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0025';
      try {
        expect(typeof SendableExpressionOutStaticClass.myAsyncLock).assertEqual('object');
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31200
     * @tc.name       : testSendableExpressionOutStaticClass0026
     * @tc.desc       : Test SendableExpressionOutStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableExpressionOutStaticClass0026';
      try {
        expect(typeof SendableExpressionOutStaticClass.mySendableUnionArray).assertEqual('number');
        expect(SendableExpressionOutStaticClass.mySendableUnionArray).assertEqual(1);
        SendableExpressionOutStaticClass.mySendableUnionArray = 2;
        expect(SendableExpressionOutStaticClass.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31300
     * @tc.name       : testSendableExpressionOutArrowStaticClass0001
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0001';
        try {
          expect(SendableExpressionOutArrowStaticClass.myString).assertEqual('example string');
          SendableExpressionOutArrowStaticClass.myString = 'new string';
          expect(SendableExpressionOutArrowStaticClass.myString).assertEqual('new string');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31400
     * @tc.name       : testSendableExpressionOutArrowStaticClass0002
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0002';
        try {
          expect(SendableExpressionOutArrowStaticClass.myNumber).assertEqual(42);
          SendableExpressionOutArrowStaticClass.myNumber = 100;
          expect(SendableExpressionOutArrowStaticClass.myNumber).assertEqual(100);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31500
     * @tc.name       : testSendableExpressionOutArrowStaticClass0003
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0003';
        try {
          expect(SendableExpressionOutArrowStaticClass.myBoolean).assertEqual(true);
          SendableExpressionOutArrowStaticClass.myBoolean = false;
          expect(SendableExpressionOutArrowStaticClass.myBoolean).assertEqual(false);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31600
     * @tc.name       : testSendableExpressionOutArrowStaticClass0004
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0004';
        try {
          expect(SendableExpressionOutArrowStaticClass.myBigInt)
            .assertEqual(1234567890123456789012345678901234567890n);
          SendableExpressionOutArrowStaticClass.myBigInt = 987654321098765432109876543210987654321n;
          expect(SendableExpressionOutArrowStaticClass.myBigInt)
            .assertEqual(987654321098765432109876543210987654321n);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31700
     * @tc.name       : testSendableExpressionOutArrowStaticClass0005
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0005';
        try {
          expect(SendableExpressionOutArrowStaticClass.myUndefined).assertEqual(undefined);
          SendableExpressionOutArrowStaticClass.myUndefined = 123;
          expect(SendableExpressionOutArrowStaticClass.myUndefined).assertEqual(123);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31800
     * @tc.name       : testSendableExpressionOutArrowStaticClass0006
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0006';
        try {
          expect(SendableExpressionOutArrowStaticClass.myNull).assertEqual(null);
          SendableExpressionOutArrowStaticClass.myNull = 'not null anymore';
          expect(SendableExpressionOutArrowStaticClass.myNull).assertEqual('not null anymore');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_31900
     * @tc.name       : testSendableExpressionOutArrowStaticClass0007
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0007';
        try {
          expect(SendableExpressionOutArrowStaticClass.topLevelClassInstance instanceof topLevelSendableClass)
            .assertEqual(true);
          expect(SendableExpressionOutArrowStaticClass.topLevelClassInstance.num).assertEqual(1);
          SendableExpressionOutArrowStaticClass.topLevelClassInstance.num = 2;
          expect(SendableExpressionOutArrowStaticClass.topLevelClassInstance.num).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32000
     * @tc.name       : testSendableExpressionOutArrowStaticClass0008
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0008';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.topLevelFunction === 'function').assertEqual(true);
          expect(SendableExpressionOutArrowStaticClass.topLevelFunction())
            .assertEqual('Top level sendable function');
          SendableExpressionOutArrowStaticClass.topLevelFunction = ModifiedTopLevelSendableFunction;
          expect(SendableExpressionOutArrowStaticClass.topLevelFunction())
            .assertEqual('Modified top level sendable function');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32100
     * @tc.name       : testSendableExpressionOutArrowStaticClass0009
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0009';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myEnum).assertEqual('number');
          expect(SendableExpressionOutArrowStaticClass.myEnum).assertEqual(0);
          SendableExpressionOutArrowStaticClass.myEnum = SendableConstEnum.OPTION_2;
          expect(SendableExpressionOutArrowStaticClass.myEnum).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32200
     * @tc.name       : testSendableExpressionOutArrowStaticClass0010
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0010';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myArray).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myArray.toString()).assertEqual('');
          SendableExpressionOutArrowStaticClass.myArray.push(4, 5);
          expect(SendableExpressionOutArrowStaticClass.myArray.toString()).assertEqual('4,5');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32300
     * @tc.name       : testSendableExpressionOutArrowStaticClass0011
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0011';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myMap).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myMap.get(1)).assertEqual(undefined);
          SendableExpressionOutArrowStaticClass.myMap.set(1, 2);
          expect(SendableExpressionOutArrowStaticClass.myMap.get(1)).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32400
     * @tc.name       : testSendableExpressionOutArrowStaticClass0012
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0012';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.mySet).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.mySet.has(123)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.mySet.add(123);
          expect(SendableExpressionOutArrowStaticClass.mySet.has(123)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32500
     * @tc.name       : testSendableExpressionOutArrowStaticClass0013
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0013';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayInt8Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayInt8Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt8Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32600
     * @tc.name       : testSendableExpressionOutArrowStaticClass0014
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayUint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0014';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayUint8Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayUint8Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint8Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32700
     * @tc.name       : testSendableExpressionOutArrowStaticClass0015
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayInt16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0015';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayInt16Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayInt16Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt16Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32800
     * @tc.name       : testSendableExpressionOutArrowStaticClass0016
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayUint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0016';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayUint16Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayUint16Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint16Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_32900
     * @tc.name       : testSendableExpressionOutArrowStaticClass0017
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayInt32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0017';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayInt32Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayInt32Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayInt32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33000
     * @tc.name       : testSendableExpressionOutArrowStaticClass0018
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayUint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0018';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayUint32Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayUint32Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33100
     * @tc.name       : testSendableExpressionOutArrowStaticClass0019
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayUint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0019';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayUint8ClampedArray)
            .assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayUint8ClampedArray.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayUint8ClampedArray.includes(2))
            .assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33200
     * @tc.name       : testSendableExpressionOutArrowStaticClass0020
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass TypedArrayFloat32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0020';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myTypedArrayFloat32Array).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
          SendableExpressionOutArrowStaticClass.myTypedArrayFloat32Array.fill(2);
          expect(SendableExpressionOutArrowStaticClass.myTypedArrayFloat32Array.includes(2)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33300
     * @tc.name       : testSendableExpressionOutArrowStaticClass0021
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0021';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myArrayBuffer).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myArrayBuffer.byteLength).assertEqual(10);
          expect(SendableExpressionOutArrowStaticClass.myArrayBuffer.slice(0, 4).byteLength).assertEqual(4);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33400
     * @tc.name       : testSendableExpressionOutArrowStaticClass0022
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0022';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myConcatArray).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myConcatArray[1]).assertEqual(2);
          expect(SendableExpressionOutArrowStaticClass.myConcatArray.join('-')).assertEqual("1-2-4");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33500
     * @tc.name       : testSendableExpressionOutArrowStaticClass0023
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0023';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myBitVector).assertEqual('object');
          expect(SendableExpressionOutArrowStaticClass.myBitVector.pop()).assertEqual(0);
          SendableExpressionOutArrowStaticClass.myBitVector.push(1);
          expect(SendableExpressionOutArrowStaticClass.myBitVector.pop()).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33600
     * @tc.name       : testSendableExpressionOutArrowStaticClass0024
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0024';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myASON).assertEqual('object');
          expect((SendableExpressionOutArrowStaticClass.myASON as object)?.["name"]).assertEqual('John');
          expect(ArkTSUtils.isSendable(SendableExpressionOutArrowStaticClass.myASON)).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33700
     * @tc.name       : testSendableExpressionOutArrowStaticClass0025
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0025';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.myAsyncLock).assertEqual('object');
          expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CLASS_STATIC_33800
     * @tc.name       : testSendableExpressionOutArrowStaticClass0026
     * @tc.desc       : Test SendableExpressionOutArrowStaticClass SendableUnionType is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableExpressionOutArrowStaticClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = 'testSendableExpressionOutArrowStaticClass0026';
        try {
          expect(typeof SendableExpressionOutArrowStaticClass.mySendableUnionArray).assertEqual('number');
          expect(SendableExpressionOutArrowStaticClass.mySendableUnionArray).assertEqual(1);
          SendableExpressionOutArrowStaticClass.mySendableUnionArray = 2;
          expect(SendableExpressionOutArrowStaticClass.mySendableUnionArray).assertEqual(2);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })
  })
}