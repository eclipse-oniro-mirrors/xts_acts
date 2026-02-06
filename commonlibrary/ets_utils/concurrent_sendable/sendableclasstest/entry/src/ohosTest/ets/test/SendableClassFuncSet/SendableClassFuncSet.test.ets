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
import {
  ISendable,
  ModifiedTopLevelSendableFunction,
  SendableAsyncFuncSetClass,
  SendableConstEnum,
  SendableConstructorClass,
  SendableFuncSetClass,
  SendableGetFuncSetClass,
  SendableSetFuncSetClass,
  SendableStaticFuncSetClass,
  SendableStaticGetFuncSetClass,
  SendableStaticSetFuncSetClass,
  topLevelSendableClass,
  TopLevelSendableFunction
} from './SendableClassFuncSet';
import { ArkTSUtils, collections } from '@kit.ArkTS';

new SendableStaticFuncSetClass();

export default function sendableDefaultFuncSetClassTest() {
  describe('ActsSendableFuncSetClassTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableFuncSetClass0001
     * @tc.desc       : Test SendableFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0001';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnString('test string');
        expect(returnValue).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableFuncSetClass0002
     * @tc.desc       : Test SendableFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0002';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnNumber(42);
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableFuncSetClass0003
     * @tc.desc       : Test SendableFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0003';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnBoolean(true);
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableFuncSetClass0004
     * @tc.desc       : Test SendableFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0004';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnBigInt(987654321098765432109876543210987654321n);
        expect(returnValue).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableFuncSetClass0005
     * @tc.desc       : Test SendableFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0005';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnUndefined(undefined);
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableFuncSetClass0006
     * @tc.desc       : Test SendableFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0006';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnNull(null);
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableFuncSetClass0007
     * @tc.desc       : Test SendableFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0007';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnTopLevelClassInstance(new topLevelSendableClass());
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableFuncSetClass0008
     * @tc.desc       : Test SendableFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0008';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnTopLevelFunction(TopLevelSendableFunction);
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableFuncSetClass0009
     * @tc.desc       : Test SendableFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0009';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        const returnValue = instance.returnEnum(SendableConstEnum.OPTION_1);
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableFuncSetClass0010
     * @tc.desc       : Test SendableFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0010';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        const returnValue = instance.returnArray(new collections.Array<number>());
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableFuncSetClass0011
     * @tc.desc       : Test SendableFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0011';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        const returnValue = instance.returnMap(new collections.Map<number, number>());
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableFuncSetClass0012
     * @tc.desc       : Test SendableFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0012';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        const returnValue = instance.returnSet(new collections.Set<number>());
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableFuncSetClass0013
     * @tc.desc       : Test SendableFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0013';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt8Array(new collections.Int8Array(6));
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableFuncSetClass0014
     * @tc.desc       : Test SendableFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0014';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint8Array(new collections.Uint8Array(6));
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableFuncSetClass0015
     * @tc.desc       : Test SendableFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0015';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt16Array(new collections.Int16Array(6));
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableFuncSetClass0016
     * @tc.desc       : Test SendableFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0016';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint16Array(new collections.Uint16Array(6));
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableFuncSetClass0017
     * @tc.desc       : Test SendableFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0017';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayInt32Array(new collections.Int32Array(6));
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableFuncSetClass0018
     * @tc.desc       : Test SendableFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0018';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint32Array(new collections.Uint32Array(6));
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableFuncSetClass0019
     * @tc.desc       : Test SendableFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0019';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(6));
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableFuncSetClass0020
     * @tc.desc       : Test SendableFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0020';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        const returnValue = instance.returnTypedArrayFloat32Array(new collections.Float32Array(6));
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableFuncSetClass0021
     * @tc.desc       : Test SendableFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0021';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        const returnValue = instance.returnArrayBuffer(new collections.ArrayBuffer(10));
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableFuncSetClass0022
     * @tc.desc       : Test SendableFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0022';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        const returnValue = instance.returnConcatArray(new collections.Array<number>(1, 2, 4));
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableFuncSetClass0023
     * @tc.desc       : Test SendableFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0023';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        const returnValue = instance.returnBitVector(new collections.BitVector(2));
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableFuncSetClass0024
     * @tc.desc       : Test SendableFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0024';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue =
          instance.returnASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableFuncSetClass0025
     * @tc.desc       : Test SendableFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0025';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        const returnValue = instance.returnAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableFuncSetClass0026
     * @tc.desc       : Test SendableFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableFuncSetClass0026';
      try {
        const instance = new SendableFuncSetClass();
        expect(instance instanceof SendableFuncSetClass).assertEqual(true);
        const returnValue = instance.returnSendableUnionArray(1);
        expect(returnValue).assertEqual(instance.mySendableUnionArray);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableStaticFuncSetClass0001
     * @tc.desc       : Test SendableStaticFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0001';
      try {
        const returnValue = SendableStaticFuncSetClass.returnString('test string');
        expect(returnValue).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableStaticFuncSetClass0002
     * @tc.desc       : Test SendableStaticFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0002';
      try {
        const returnValue = SendableStaticFuncSetClass.returnNumber(42);
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableStaticFuncSetClass0003
     * @tc.desc       : Test SendableStaticFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0003';
      try {
        const returnValue = SendableStaticFuncSetClass.returnBoolean(true);
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableStaticFuncSetClass0004
     * @tc.desc       : Test SendableStaticFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0004';
      try {
        const returnValue = SendableStaticFuncSetClass.returnBigInt(987654321098765432109876543210987654321n);
        expect(returnValue).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableStaticFuncSetClass0005
     * @tc.desc       : Test SendableStaticFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0005';
      try {
        const returnValue = SendableStaticFuncSetClass.returnUndefined(undefined);
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableStaticFuncSetClass0006
     * @tc.desc       : Test SendableStaticFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0006';
      try {
        const returnValue = SendableStaticFuncSetClass.returnNull(null);
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableStaticFuncSetClass0007
     * @tc.desc       : Test SendableStaticFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0007';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTopLevelClassInstance(new topLevelSendableClass());
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableStaticFuncSetClass0008
     * @tc.desc       : Test SendableStaticFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0008';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTopLevelFunction(TopLevelSendableFunction);
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableStaticFuncSetClass0009
     * @tc.desc       : Test SendableStaticFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0009';
      try {
        const returnValue = SendableStaticFuncSetClass.returnEnum(SendableConstEnum.OPTION_1);
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableStaticFuncSetClass0010
     * @tc.desc       : Test SendableStaticFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0010';
      try {
        const returnValue = SendableStaticFuncSetClass.returnArray(new collections.Array<number>());
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableStaticFuncSetClass0011
     * @tc.desc       : Test SendableStaticFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0011';
      try {
        const returnValue = SendableStaticFuncSetClass.returnMap(new collections.Map<number, number>());
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableStaticFuncSetClass0012
     * @tc.desc       : Test SendableStaticFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0012';
      try {
        const returnValue = SendableStaticFuncSetClass.returnSet(new collections.Set<number>());
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableStaticFuncSetClass0013
     * @tc.desc       : Test SendableStaticFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0013';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayInt8Array(new collections.Int8Array(6));
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableStaticFuncSetClass0014
     * @tc.desc       : Test SendableStaticFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0014';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayUint8Array(new collections.Uint8Array(6));
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableStaticFuncSetClass0015
     * @tc.desc       : Test SendableStaticFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0015';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayInt16Array(new collections.Int16Array(6));
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableStaticFuncSetClass0016
     * @tc.desc       : Test SendableStaticFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0016';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayUint16Array(new collections.Uint16Array(6));
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableStaticFuncSetClass0017
     * @tc.desc       : Test SendableStaticFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0017';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayInt32Array(new collections.Int32Array(6));
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableStaticFuncSetClass0018
     * @tc.desc       : Test SendableStaticFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0018';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayUint32Array(new collections.Uint32Array(6));
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableStaticFuncSetClass0019
     * @tc.desc       : Test SendableStaticFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0019';
      try {
        const returnValue =
          SendableStaticFuncSetClass.returnTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(6));
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableStaticFuncSetClass0020
     * @tc.desc       : Test SendableStaticFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0020';
      try {
        const returnValue = SendableStaticFuncSetClass.returnTypedArrayFloat32Array(new collections.Float32Array(6));
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableStaticFuncSetClass0021
     * @tc.desc       : Test SendableStaticFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0021';
      try {
        const returnValue = SendableStaticFuncSetClass.returnArrayBuffer(new collections.ArrayBuffer(10));
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableStaticFuncSetClass0022
     * @tc.desc       : Test SendableStaticFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0022';
      try {
        const returnValue = SendableStaticFuncSetClass.returnConcatArray(new collections.Array<number>(1, 2, 4));
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableStaticFuncSetClass0023
     * @tc.desc       : Test SendableStaticFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0023';
      try {
        const returnValue = SendableStaticFuncSetClass.returnBitVector(new collections.BitVector(2));
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableStaticFuncSetClass0024
     * @tc.desc       : Test SendableStaticFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0024';
      try {
        const returnValue =
          SendableStaticFuncSetClass.returnASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableStaticFuncSetClass0025
     * @tc.desc       : Test SendableStaticFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0025';
      try {
        const returnValue =
          SendableStaticFuncSetClass.returnAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableStaticFuncSetClass0026
     * @tc.desc       : Test SendableStaticFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticFuncSetClass0026';
      try {
        const returnValue = SendableStaticFuncSetClass.returnSendableUnionArray(1);
        expect(returnValue).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableAsyncFuncSetClass0001
     * @tc.desc       : Test SendableAsyncFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0001';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processString('test string');
        expect(returnValue).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableAsyncFuncSetClass0002
     * @tc.desc       : Test SendableAsyncFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0002';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processNumber(42);
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableAsyncFuncSetClass0003
     * @tc.desc       : Test SendableAsyncFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0003';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processBoolean(true);
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableAsyncFuncSetClass0004
     * @tc.desc       : Test SendableAsyncFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0004';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processBigInt(987654321098765432109876543210987654321n);
        expect(returnValue).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableAsyncFuncSetClass0005
     * @tc.desc       : Test SendableAsyncFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0005';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processUndefined(undefined);
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableAsyncFuncSetClass0006
     * @tc.desc       : Test SendableAsyncFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0006';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processNull(null);
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableAsyncFuncSetClass0007
     * @tc.desc       : Test SendableAsyncFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0007';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processTopLevelClassInstance(new topLevelSendableClass());
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableAsyncFuncSetClass0008
     * @tc.desc       : Test SendableAsyncFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0008';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processTopLevelFunction(TopLevelSendableFunction);
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableAsyncFuncSetClass0009
     * @tc.desc       : Test SendableAsyncFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0009';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        const returnValue = await instance.processEnum(SendableConstEnum.OPTION_1);
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableAsyncFuncSetClass0010
     * @tc.desc       : Test SendableAsyncFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0010';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        const returnValue = await instance.processArray(new collections.Array<number>());
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableAsyncFuncSetClass0011
     * @tc.desc       : Test SendableAsyncFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0011';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        const returnValue = await instance.processMap(new collections.Map<number, number>());
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableAsyncFuncSetClass0012
     * @tc.desc       : Test SendableAsyncFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0012';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        const returnValue = await instance.processSet(new collections.Set<number>());
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableAsyncFuncSetClass0013
     * @tc.desc       : Test SendableAsyncFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0013';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayInt8Array(new collections.Int8Array(6));
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableAsyncFuncSetClass0014
     * @tc.desc       : Test SendableAsyncFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0014';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayUint8Array(new collections.Uint8Array(6));
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableAsyncFuncSetClass0015
     * @tc.desc       : Test SendableAsyncFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0015';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayInt16Array(new collections.Int16Array(6));
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableAsyncFuncSetClass0016
     * @tc.desc       : Test SendableAsyncFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0016';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayUint16Array(new collections.Uint16Array(6));
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableAsyncFuncSetClass0017
     * @tc.desc       : Test SendableAsyncFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0017';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayInt32Array(new collections.Int32Array(6));
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableAsyncFuncSetClass0018
     * @tc.desc       : Test SendableAsyncFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0018';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayUint32Array(new collections.Uint32Array(6));
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableAsyncFuncSetClass0019
     * @tc.desc       : Test SendableAsyncFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0019';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(6));
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableAsyncFuncSetClass0020
     * @tc.desc       : Test SendableAsyncFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0020';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        const returnValue = await instance.processTypedArrayFloat32Array(new collections.Float32Array(6));
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableAsyncFuncSetClass0021
     * @tc.desc       : Test SendableAsyncFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0021';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        const returnValue = await instance.processArrayBuffer(new collections.ArrayBuffer(10));
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableAsyncFuncSetClass0022
     * @tc.desc       : Test SendableAsyncFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0022';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        const returnValue = await instance.processConcatArray(new collections.Array<number>(1, 2, 4));
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableAsyncFuncSetClass0023
     * @tc.desc       : Test SendableAsyncFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0023';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        const returnValue = await instance.processBitVector(new collections.BitVector(2));
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableAsyncFuncSetClass0024
     * @tc.desc       : Test SendableAsyncFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0024';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue =
          await instance.processASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableAsyncFuncSetClass0025
     * @tc.desc       : Test SendableAsyncFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0025';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        const returnValue = await instance.processAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_ASYNC_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableAsyncFuncSetClass0026
     * @tc.desc       : Test SendableAsyncFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableAsyncFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = 'testSendableAsyncFuncSetClass0026';
      try {
        const instance = new SendableAsyncFuncSetClass();
        expect(instance instanceof SendableAsyncFuncSetClass).assertEqual(true);
        const returnValue = await instance.processSendableUnionArray(1);
        expect(returnValue).assertEqual(instance.mySendableUnionArray);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableStaticGetFuncSetClass0001
     * @tc.desc       : Test SendableStaticGetFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0001';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyString();
        expect(returnValue).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableStaticGetFuncSetClass0002
     * @tc.desc       : Test SendableStaticGetFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0002';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyNumber();
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableStaticGetFuncSetClass0003
     * @tc.desc       : Test SendableStaticGetFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0003';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyBoolean();
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableStaticGetFuncSetClass0004
     * @tc.desc       : Test SendableStaticGetFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0004';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyBigInt();
        expect(returnValue).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableStaticGetFuncSetClass0005
     * @tc.desc       : Test SendableStaticGetFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0005';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyUndefined();
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableStaticGetFuncSetClass0006
     * @tc.desc       : Test SendableStaticGetFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0006';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyNull();
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableStaticGetFuncSetClass0007
     * @tc.desc       : Test SendableStaticGetFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0007';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTopLevelClassInstance();
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableStaticGetFuncSetClass0008
     * @tc.desc       : Test SendableStaticGetFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0008';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTopLevelFunction();
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableStaticGetFuncSetClass0009
     * @tc.desc       : Test SendableStaticGetFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0009';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyEnum();
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableStaticGetFuncSetClass0010
     * @tc.desc       : Test SendableStaticGetFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0010';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyArray();
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableStaticGetFuncSetClass0011
     * @tc.desc       : Test SendableStaticGetFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0011';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyMap();
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableStaticGetFuncSetClass0012
     * @tc.desc       : Test SendableStaticGetFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0012';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMySet();
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableStaticGetFuncSetClass0013
     * @tc.desc       : Test SendableStaticGetFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0013';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayInt8Array();
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableStaticGetFuncSetClass0014
     * @tc.desc       : Test SendableStaticGetFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0014';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayUint8Array();
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableStaticGetFuncSetClass0015
     * @tc.desc       : Test SendableStaticGetFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0015';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayInt16Array();
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableStaticGetFuncSetClass0016
     * @tc.desc       : Test SendableStaticGetFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0016';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayUint16Array();
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableStaticGetFuncSetClass0017
     * @tc.desc       : Test SendableStaticGetFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0017';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayInt32Array();
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableStaticGetFuncSetClass0018
     * @tc.desc       : Test SendableStaticGetFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0018';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayUint32Array();
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableStaticGetFuncSetClass0019
     * @tc.desc       : Test SendableStaticGetFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0019';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayUint8ClampedArray();
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableStaticGetFuncSetClass0020
     * @tc.desc       : Test SendableStaticGetFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0020';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyTypedArrayFloat32Array();
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableStaticGetFuncSetClass0021
     * @tc.desc       : Test SendableStaticGetFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0021';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyArrayBuffer();
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableStaticGetFuncSetClass0022
     * @tc.desc       : Test SendableStaticGetFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0022';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyConcatArray();
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableStaticGetFuncSetClass0023
     * @tc.desc       : Test SendableStaticGetFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0023';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyBitVector();
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableStaticGetFuncSetClass0024
     * @tc.desc       : Test SendableStaticGetFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0024';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyASON();
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableStaticGetFuncSetClass0025
     * @tc.desc       : Test SendableStaticGetFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0025';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMyAsyncLock();
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_GET_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableStaticGetFuncSetClass0026
     * @tc.desc       : Test SendableStaticGetFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticGetFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticGetFuncSetClass0026';
      try {
        const returnValue = SendableStaticGetFuncSetClass.getMySendableUnionArray();
        expect(returnValue).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableGetFuncSetClass0001
     * @tc.desc       : Test SendableGetFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0001';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyString();
        expect(returnValue).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableGetFuncSetClass0002
     * @tc.desc       : Test SendableGetFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0002';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyNumber();
        expect(returnValue).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableGetFuncSetClass0003
     * @tc.desc       : Test SendableGetFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0003';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyBoolean();
        expect(returnValue).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableGetFuncSetClass0004
     * @tc.desc       : Test SendableGetFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0004';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyBigInt();
        expect(returnValue).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableGetFuncSetClass0005
     * @tc.desc       : Test SendableGetFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0005';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyUndefined();
        expect(returnValue).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableGetFuncSetClass0006
     * @tc.desc       : Test SendableGetFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0006';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyNull();
        expect(returnValue).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableGetFuncSetClass0007
     * @tc.desc       : Test SendableGetFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0007';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyTopLevelClassInstance();
        expect(returnValue instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableGetFuncSetClass0008
     * @tc.desc       : Test SendableGetFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0008';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyTopLevelFunction();
        expect(returnValue).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableGetFuncSetClass0009
     * @tc.desc       : Test SendableGetFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0009';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        const returnValue = instance.getMyEnum();
        expect(returnValue).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableGetFuncSetClass0010
     * @tc.desc       : Test SendableGetFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0010';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myArray).assertEqual('object');
        const returnValue = instance.getMyArray();
        expect(returnValue instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableGetFuncSetClass0011
     * @tc.desc       : Test SendableGetFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0011';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myMap).assertEqual('object');
        expect(instance.myMap.get(1)).assertEqual(undefined);
        const returnValue = instance.getMyMap();
        expect(returnValue instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableGetFuncSetClass0012
     * @tc.desc       : Test SendableGetFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0012';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.mySet).assertEqual('object');
        expect(instance.mySet.has(123)).assertEqual(false);
        const returnValue = instance.getMySet();
        expect(returnValue instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableGetFuncSetClass0013
     * @tc.desc       : Test SendableGetFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0013';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt8Array).assertEqual('object');
        expect(instance.myTypedArrayInt8Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayInt8Array();
        expect(returnValue instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableGetFuncSetClass0014
     * @tc.desc       : Test SendableGetFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0014';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8Array).assertEqual('object');
        expect(instance.myTypedArrayUint8Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayUint8Array();
        expect(returnValue instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableGetFuncSetClass0015
     * @tc.desc       : Test SendableGetFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0015';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt16Array).assertEqual('object');
        expect(instance.myTypedArrayInt16Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayInt16Array();
        expect(returnValue instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableGetFuncSetClass0016
     * @tc.desc       : Test SendableGetFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0016';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint16Array).assertEqual('object');
        expect(instance.myTypedArrayUint16Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayUint16Array();
        expect(returnValue instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableGetFuncSetClass0017
     * @tc.desc       : Test SendableGetFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0017';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayInt32Array).assertEqual('object');
        expect(instance.myTypedArrayInt32Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayInt32Array();
        expect(returnValue instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableGetFuncSetClass0018
     * @tc.desc       : Test SendableGetFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0018';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint32Array).assertEqual('object');
        expect(instance.myTypedArrayUint32Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayUint32Array();
        expect(returnValue instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableGetFuncSetClass0019
     * @tc.desc       : Test SendableGetFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0019';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayUint8ClampedArray).assertEqual('object');
        expect(instance.myTypedArrayUint8ClampedArray.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayUint8ClampedArray();
        expect(returnValue instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableGetFuncSetClass0020
     * @tc.desc       : Test SendableGetFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0020';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myTypedArrayFloat32Array).assertEqual('object');
        expect(instance.myTypedArrayFloat32Array.includes(2)).assertEqual(false);
        const returnValue = instance.getMyTypedArrayFloat32Array();
        expect(returnValue instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableGetFuncSetClass0021
     * @tc.desc       : Test SendableGetFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0021';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myArrayBuffer).assertEqual('object');
        const returnValue = instance.getMyArrayBuffer();
        expect(returnValue instanceof collections.ArrayBuffer).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableGetFuncSetClass0022
     * @tc.desc       : Test SendableGetFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0022';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myConcatArray).assertEqual('object');
        const returnValue = instance.getMyConcatArray();
        expect(returnValue.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableGetFuncSetClass0023
     * @tc.desc       : Test SendableGetFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0023';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myBitVector).assertEqual('object');
        const returnValue = instance.getMyBitVector();
        expect(returnValue instanceof collections.BitVector).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableGetFuncSetClass0024
     * @tc.desc       : Test SendableGetFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0024';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMyASON();
        expect(typeof returnValue).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableGetFuncSetClass0025
     * @tc.desc       : Test SendableGetFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0025';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        expect(typeof instance.myAsyncLock).assertEqual('object');
        const returnValue = instance.getMyAsyncLock();
        expect(returnValue instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_GET_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableGetFuncSetClass0026
     * @tc.desc       : Test SendableGetFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableGetFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableGetFuncSetClass0026';
      try {
        const instance = new SendableGetFuncSetClass();
        expect(instance instanceof SendableGetFuncSetClass).assertEqual(true);
        const returnValue = instance.getMySendableUnionArray();
        expect(returnValue).assertEqual(instance.mySendableUnionArray);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableStaticSetFuncSetClass0001
     * @tc.desc       : Test SendableStaticSetFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0001';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        SendableStaticSetFuncSetClass.setMyString(instance, 'test string');
        expect(instance.myString).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableStaticSetFuncSetClass0002
     * @tc.desc       : Test SendableStaticSetFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0002';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        SendableStaticSetFuncSetClass.setMyNumber(instance, 123);
        expect(instance.myNumber).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableStaticSetFuncSetClass0003
     * @tc.desc       : Test SendableStaticSetFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0003';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        SendableStaticSetFuncSetClass.setMyBoolean(instance, false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableStaticSetFuncSetClass0004
     * @tc.desc       : Test SendableStaticSetFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0004';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        SendableStaticSetFuncSetClass.setMyBigInt(instance, 987654321098765432109876543210987654321n);
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableStaticSetFuncSetClass0005
     * @tc.desc       : Test SendableStaticSetFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0005';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        SendableStaticSetFuncSetClass.setMyUndefined(instance, 'not undefined at all');
        expect(instance.myUndefined).assertEqual('not undefined at all');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableStaticSetFuncSetClass0006
     * @tc.desc       : Test SendableStaticSetFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0006';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        SendableStaticSetFuncSetClass.setMyNull(instance, 'not null at all');
        expect(instance.myNull).assertEqual('not null at all');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableStaticSetFuncSetClass0007
     * @tc.desc       : Test SendableStaticSetFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0007';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        SendableStaticSetFuncSetClass.setMyTopLevelClassInstance(instance, new topLevelSendableClass());
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableStaticSetFuncSetClass0008
     * @tc.desc       : Test SendableStaticSetFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0008';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        SendableStaticSetFuncSetClass.setMyTopLevelFunction(instance, ModifiedTopLevelSendableFunction);
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableStaticSetFuncSetClass0009
     * @tc.desc       : Test SendableStaticSetFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0009';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        SendableStaticSetFuncSetClass.setMyEnum(instance, SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableStaticSetFuncSetClass0010
     * @tc.desc       : Test SendableStaticSetFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0010';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myArray.toString()).assertEqual('');
        SendableStaticSetFuncSetClass.setMyArray(instance, new collections.Array<number>(4, 5));
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableStaticSetFuncSetClass0011
     * @tc.desc       : Test SendableStaticSetFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0011';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        SendableStaticSetFuncSetClass.setMyMap(instance, new collections.Map<number, number>());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableStaticSetFuncSetClass0012
     * @tc.desc       : Test SendableStaticSetFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0012';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        SendableStaticSetFuncSetClass.setMySet(instance, new collections.Set<number>());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableStaticSetFuncSetClass0013
     * @tc.desc       : Test SendableStaticSetFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0013';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt8Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayInt8Array(instance, new collections.Int8Array(8));
        expect(instance.myTypedArrayInt8Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableStaticSetFuncSetClass0014
     * @tc.desc       : Test SendableStaticSetFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0014';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint8Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayUint8Array(instance, new collections.Uint8Array(8));
        expect(instance.myTypedArrayUint8Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableStaticSetFuncSetClass0015
     * @tc.desc       : Test SendableStaticSetFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0015';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt16Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayInt16Array(instance, new collections.Int16Array(8));
        expect(instance.myTypedArrayInt16Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableStaticSetFuncSetClass0016
     * @tc.desc       : Test SendableStaticSetFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0016';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint16Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayUint16Array(instance, new collections.Uint16Array(8));
        expect(instance.myTypedArrayUint16Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableStaticSetFuncSetClass0017
     * @tc.desc       : Test SendableStaticSetFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0017';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt32Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayInt32Array(instance, new collections.Int32Array(8));
        expect(instance.myTypedArrayInt32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableStaticSetFuncSetClass0018
     * @tc.desc       : Test SendableStaticSetFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0018';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint32Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayUint32Array(instance, new collections.Uint32Array(8));
        expect(instance.myTypedArrayUint32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableStaticSetFuncSetClass0019
     * @tc.desc       : Test SendableStaticSetFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0019';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint8ClampedArray.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayUint8ClampedArray(instance, new collections.Uint8ClampedArray(8));
        expect(instance.myTypedArrayUint8ClampedArray.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableStaticSetFuncSetClass0020
     * @tc.desc       : Test SendableStaticSetFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0020';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayFloat32Array.length).assertEqual(6);
        SendableStaticSetFuncSetClass.setMyTypedArrayFloat32Array(instance, new collections.Float32Array(8));
        expect(instance.myTypedArrayFloat32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableStaticSetFuncSetClass0021
     * @tc.desc       : Test SendableStaticSetFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0021';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        SendableStaticSetFuncSetClass.setMyArrayBuffer(instance, new collections.ArrayBuffer(8));
        expect(instance.myArrayBuffer.byteLength).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableStaticSetFuncSetClass0022
     * @tc.desc       : Test SendableStaticSetFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0022';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myConcatArray.toString()).assertEqual('1,2,4');
        SendableStaticSetFuncSetClass.setMyConcatArray(instance, new collections.Array<number>(1, 3, 9));
        expect(instance.myConcatArray.toString()).assertEqual('1,3,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableStaticSetFuncSetClass0023
     * @tc.desc       : Test SendableStaticSetFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0023';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        SendableStaticSetFuncSetClass.setMyBitVector(instance, new collections.BitVector(2));
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableStaticSetFuncSetClass0024
     * @tc.desc       : Test SendableStaticSetFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0024';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        SendableStaticSetFuncSetClass.setMyASON(instance,
          ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableStaticSetFuncSetClass0025
     * @tc.desc       : Test SendableStaticSetFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0025';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        SendableStaticSetFuncSetClass.setMyAsyncLock(instance, ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_STATIC_SET_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableStaticSetFuncSetClass0026
     * @tc.desc       : Test SendableStaticSetFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableStaticSetFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableStaticSetFuncSetClass0026';
      try {
        const instance = new SendableStaticSetFuncSetClass();
        expect(instance instanceof SendableStaticSetFuncSetClass).assertEqual(true);
        expect(instance.mySendableUnionArray).assertEqual(1);
        SendableStaticSetFuncSetClass.setMySendableUnionArray(instance, 2);
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0100
     * @tc.name       : testSendableSetFuncSetClass0001
     * @tc.desc       : Test SendableSetFuncSetClass string is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0001';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.setMyString('test string');
        expect(instance.myString).assertEqual('test string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0200
     * @tc.name       : testSendableSetFuncSetClass0002
     * @tc.desc       : Test SendableSetFuncSetClass number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0002';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.setMyNumber(123);
        expect(instance.myNumber).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0300
     * @tc.name       : testSendableSetFuncSetClass0003
     * @tc.desc       : Test SendableSetFuncSetClass boolean is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0003';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0400
     * @tc.name       : testSendableSetFuncSetClass0004
     * @tc.desc       : Test SendableSetFuncSetClass BigInt is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0004';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321098765432109876543210987654321n);
        expect(instance.myBigInt).assertEqual(987654321098765432109876543210987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0500
     * @tc.name       : testSendableSetFuncSetClass0005
     * @tc.desc       : Test SendableSetFuncSetClass undefined is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0005';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.setMyUndefined('not undefined at all');
        expect(instance.myUndefined).assertEqual('not undefined at all');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0600
     * @tc.name       : testSendableSetFuncSetClass0006
     * @tc.desc       : Test SendableSetFuncSetClass null is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0006';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.setMyNull('not null at all');
        expect(instance.myNull).assertEqual('not null at all');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0700
     * @tc.name       : testSendableSetFuncSetClass0007
     * @tc.desc       : Test SendableSetFuncSetClass class is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0007';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.topLevelClassInstance.num).assertEqual(1);
        instance.setMyTopLevelClassInstance(new topLevelSendableClass());
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0800
     * @tc.name       : testSendableSetFuncSetClass0008
     * @tc.desc       : Test SendableSetFuncSetClass function is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0008';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.topLevelFunction()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.topLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_0900
     * @tc.name       : testSendableSetFuncSetClass0009
     * @tc.desc       : Test SendableSetFuncSetClass enum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0009';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(typeof instance.myEnum).assertEqual('number');
        expect(instance.myEnum).assertEqual(0);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1000
     * @tc.name       : testSendableSetFuncSetClass0010
     * @tc.desc       : Test SendableSetFuncSetClass Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0010';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myArray.toString()).assertEqual('');
        instance.setMyArray(new collections.Array<number>(4, 5));
        expect(instance.myArray.toString()).assertEqual('4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1100
     * @tc.name       : testSendableSetFuncSetClass0011
     * @tc.desc       : Test SendableSetFuncSetClass Map is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0011';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        instance.setMyMap(new collections.Map<number, number>());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1200
     * @tc.name       : testSendableSetFuncSetClass0012
     * @tc.desc       : Test SendableSetFuncSetClass Set is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0012';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        instance.setMySet(new collections.Set<number>());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1300
     * @tc.name       : testSendableSetFuncSetClass0013
     * @tc.desc       : Test SendableSetFuncSetClass TypedArrayInt8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0013';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt8Array.length).assertEqual(6);
        instance.setMyTypedArrayInt8Array(new collections.Int8Array(8));
        expect(instance.myTypedArrayInt8Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1400
     * @tc.name       : testSendableSetFuncSetClass0014
     * @tc.desc       : Test SendableSetFuncSetClass Uint8Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0014';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint8Array.length).assertEqual(6);
        instance.setMyTypedArrayUint8Array(new collections.Uint8Array(8));
        expect(instance.myTypedArrayUint8Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1500
     * @tc.name       : testSendableSetFuncSetClass0015
     * @tc.desc       : Test SendableSetFuncSetClass Int16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0015';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt16Array.length).assertEqual(6);
        instance.setMyTypedArrayInt16Array(new collections.Int16Array(8));
        expect(instance.myTypedArrayInt16Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1600
     * @tc.name       : testSendableSetFuncSetClass0016
     * @tc.desc       : Test SendableSetFuncSetClass Uint16Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0016';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint16Array.length).assertEqual(6);
        instance.setMyTypedArrayUint16Array(new collections.Uint16Array(8));
        expect(instance.myTypedArrayUint16Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1700
     * @tc.name       : testSendableSetFuncSetClass0017
     * @tc.desc       : Test SendableSetFuncSetClass Int32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0017';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayInt32Array.length).assertEqual(6);
        instance.setMyTypedArrayInt32Array(new collections.Int32Array(8));
        expect(instance.myTypedArrayInt32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1800
     * @tc.name       : testSendableSetFuncSetClass0018
     * @tc.desc       : Test SendableSetFuncSetClass Uint32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0018';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint32Array.length).assertEqual(6);
        instance.setMyTypedArrayUint32Array(new collections.Uint32Array(8));
        expect(instance.myTypedArrayUint32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_1900
     * @tc.name       : testSendableSetFuncSetClass0019
     * @tc.desc       : Test SendableSetFuncSetClass Uint8ClampedArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0019';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayUint8ClampedArray.length).assertEqual(6);
        instance.setMyTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(8));
        expect(instance.myTypedArrayUint8ClampedArray.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2000
     * @tc.name       : testSendableSetFuncSetClass0020
     * @tc.desc       : Test SendableSetFuncSetClass Float32Array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0020';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myTypedArrayFloat32Array.length).assertEqual(6);
        instance.setMyTypedArrayFloat32Array(new collections.Float32Array(8));
        expect(instance.myTypedArrayFloat32Array.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2100
     * @tc.name       : testSendableSetFuncSetClass0021
     * @tc.desc       : Test SendableSetFuncSetClass ArrayBuffer is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0021';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myArrayBuffer.byteLength).assertEqual(10);
        instance.setMyArrayBuffer(new collections.ArrayBuffer(8));
        expect(instance.myArrayBuffer.byteLength).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2200
     * @tc.name       : testSendableSetFuncSetClass0022
     * @tc.desc       : Test SendableSetFuncSetClass ConcatArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0022';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myConcatArray.toString()).assertEqual('1,2,4');
        instance.setMyConcatArray(new collections.Array<number>(1, 3, 9));
        expect(instance.myConcatArray.toString()).assertEqual('1,3,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2300
     * @tc.name       : testSendableSetFuncSetClass0023
     * @tc.desc       : Test SendableSetFuncSetClass BitVector is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0023';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.setMyBitVector(new collections.BitVector(2));
        instance.myBitVector.push(1);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2400
     * @tc.name       : testSendableSetFuncSetClass0024
     * @tc.desc       : Test SendableSetFuncSetClass ASON is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0024';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        instance.setMyASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect((instance.myASON as object)?.["name"]).assertEqual('John');
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2500
     * @tc.name       : testSendableSetFuncSetClass0025
     * @tc.desc       : Test SendableSetFuncSetClass AsyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0025';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        instance.setMyAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(ArkTSUtils.locks.AsyncLock.query('queryTestLock').toString()).assertEqual('[object Object]');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_SET_FUNC_SET_CLASS_2600
     * @tc.name       : testSendableSetFuncSetClass0026
     * @tc.desc       : Test SendableSetFuncSetClass SendableUnionArray is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableSetFuncSetClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableSetFuncSetClass0026';
      try {
        const instance = new SendableSetFuncSetClass();
        expect(instance instanceof SendableSetFuncSetClass).assertEqual(true);
        expect(instance.mySendableUnionArray).assertEqual(1);
        instance.setMySendableUnionArray(2);
        expect(instance.mySendableUnionArray).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0100
     * @tc.name       : testSendableConstructorClass0001
     * @tc.desc       : Test SendableConstructorClass string constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0001';
      try {
        const instance = new SendableConstructorClass('test');
        expect(instance.myString).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0200
     * @tc.name       : testSendableConstructorClass0002
     * @tc.desc       : Test SendableConstructorClass number constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0002';
      try {
        const instance = new SendableConstructorClass(100);
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0300
     * @tc.name       : testSendableConstructorClass0003
     * @tc.desc       : Test SendableConstructorClass boolean constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0003';
      try {
        const instance = new SendableConstructorClass(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0400
     * @tc.name       : testSendableConstructorClass0004
     * @tc.desc       : Test SendableConstructorClass bigint constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0004';
      try {
        const instance = new SendableConstructorClass(987654321987654321987654321n);
        expect(instance.myBigInt).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0500
     * @tc.name       : testSendableConstructorClass0005
     * @tc.desc       : Test SendableConstructorClass undefined constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0005';
      try {
        const instance = new SendableConstructorClass(undefined);
        expect(instance.myUndefined).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0600
     * @tc.name       : testSendableConstructorClass0006
     * @tc.desc       : Test SendableConstructorClass null constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0006';
      try {
        const instance = new SendableConstructorClass(null);
        expect(instance.myNull).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0700
     * @tc.name       : testSendableConstructorClass0007
     * @tc.desc       : Test SendableConstructorClass with topLevelClassInstance constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0007';
      try {
        const instance = new SendableConstructorClass(new topLevelSendableClass());
        expect(instance.topLevelClassInstance instanceof topLevelSendableClass).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0800
     * @tc.name       : testSendableConstructorClass0008
     * @tc.desc       : Test SendableConstructorClass with topLevelFunction constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0008';
      try {
        const instance = new SendableConstructorClass(TopLevelSendableFunction);
        expect(instance.topLevelFunction).assertEqual(TopLevelSendableFunction);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_0900
     * @tc.name       : testSendableConstructorClass0009
     * @tc.desc       : Test SendableConstructorClass with myEnum constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0009';
      try {
        const instance = new SendableConstructorClass(SendableConstEnum.OPTION_1);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1000
     * @tc.name       : testSendableConstructorClass0010
     * @tc.desc       : Test SendableConstructorClass with myArray constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0010';
      try {
        const instance = new SendableConstructorClass(new collections.Array<number>());
        expect(instance.myArray instanceof collections.Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1100
     * @tc.name       : testSendableConstructorClass0011
     * @tc.desc       : Test SendableConstructorClass with myMap constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0011';
      try {
        const instance = new SendableConstructorClass(new collections.Map<number, number>());
        expect(instance.myMap instanceof collections.Map).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1200
     * @tc.name       : testSendableConstructorClass0012
     * @tc.desc       : Test SendableConstructorClass with mySet constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0012';
      try {
        const instance = new SendableConstructorClass(new collections.Set<number>());
        expect(instance.mySet instanceof collections.Set).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1300
     * @tc.name       : testSendableConstructorClass0013
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayInt8Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0013';
      try {
        const instance = new SendableConstructorClass(new collections.Int8Array(6));
        expect(instance.myTypedArrayInt8Array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1400
     * @tc.name       : testSendableConstructorClass0014
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayUint8Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0014';
      try {
        const instance = new SendableConstructorClass(new collections.Uint8Array(6));
        expect(instance.myTypedArrayUint8Array instanceof collections.Uint8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1500
     * @tc.name       : testSendableConstructorClass0015
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayInt16Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0015';
      try {
        const instance = new SendableConstructorClass(new collections.Int16Array(6));
        expect(instance.myTypedArrayInt16Array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1600
     * @tc.name       : testSendableConstructorClass0016
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayUint16Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0016';
      try {
        const instance = new SendableConstructorClass(new collections.Uint16Array(6));
        expect(instance.myTypedArrayUint16Array instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1700
     * @tc.name       : testSendableConstructorClass0017
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayInt32Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0017';
      try {
        const instance = new SendableConstructorClass(new collections.Int32Array(6));
        expect(instance.myTypedArrayInt32Array instanceof collections.Int32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1800
     * @tc.name       : testSendableConstructorClass0018
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayUint32Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0018';
      try {
        const instance = new SendableConstructorClass(new collections.Uint32Array(6));
        expect(instance.myTypedArrayUint32Array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_1900
     * @tc.name       : testSendableConstructorClass0019
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayUint8ClampedArray constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0019';
      try {
        const instance = new SendableConstructorClass(new collections.Uint8ClampedArray(6));
        expect(instance.myTypedArrayUint8ClampedArray instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2000
     * @tc.name       : testSendableConstructorClass0020
     * @tc.desc       : Test SendableConstructorClass with myTypedArrayFloat32Array constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0020';
      try {
        const instance = new SendableConstructorClass(new collections.Float32Array(6));
        expect(instance.myTypedArrayFloat32Array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2100
     * @tc.name       : testSendableConstructorClass0021
     * @tc.desc       : Test SendableConstructorClass with myArrayBuffer constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
     it('testSendableConstructorClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
     const TAG = 'testSendableConstructorClass0021';
       try {
         const instance = new SendableConstructorClass(new collections.ArrayBuffer(10));
         expect(instance.myArrayBuffer instanceof collections.ArrayBuffer).assertEqual(true);
       } catch (err) {
         console.error(`${TAG} failed, error: ${err.message}`);
         expect().assertFail();
       }
     });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2200
     * @tc.name       : testSendableConstructorClass0022
     * @tc.desc       : Test SendableConstructorClass with myConcatArray constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0022';
      try {
        const instance = new SendableConstructorClass(new collections.Array<number>(1, 2, 4));
        expect(instance.myConcatArray.toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2300
     * @tc.name       : testSendableConstructorClass0023
     * @tc.desc       : Test SendableConstructorClass with myBitVector constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0023';
      try {
        const instance = new SendableConstructorClass(new collections.BitVector(2));
        expect(instance.myBitVector.pop()).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2400
     * @tc.name       : testSendableConstructorClass0024
     * @tc.desc       : Test SendableConstructorClass with myASON constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0024';
      try {
        const instance = new SendableConstructorClass(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
        expect(ArkTSUtils.isSendable(instance.myASON)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2500
     * @tc.name       : testSendableConstructorClass0025
     * @tc.desc       : Test SendableConstructorClass with myAsyncLock constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0025';
      try {
        const instance = new SendableConstructorClass(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
        expect(instance.myAsyncLock instanceof ArkTSUtils.locks.AsyncLock).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_CONSTRUCTOR_CLASS_2600
     * @tc.name       : testSendableConstructorClass0026
     * @tc.desc       : Test SendableConstructorClass with mySendableUnionArray constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableConstructorClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableConstructorClass0026';
      try {
        const instance = new SendableConstructorClass(1);
        expect(instance.mySendableUnionArray).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
  })
}