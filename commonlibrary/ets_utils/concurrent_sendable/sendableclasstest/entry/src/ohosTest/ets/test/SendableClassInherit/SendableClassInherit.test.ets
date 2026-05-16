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
  ModifiedTopLevelSendableFunction,
  SendableConstEnum,
  SendableDefaultFuncInheritClass,
  SendableDefaultGetFuncInheritClass,
  SendableDefaultInheritClass,
  SendableDefaultSetGetFuncInheritClass,
  SendablePrivateFuncInheritClass,
  SendablePrivateGetFuncInheritClass,
  SendablePrivateInheritClass,
  SendablePrivateSetFuncInheritClass,
  SendablePrivateSetGetFuncInheritClass,
  SendablePublicFuncInheritClass,
  SendablePublicGetFuncInheritClass,
  SendablePublicInheritClass,
  SendablePublicSetFuncInheritClass,
  SendablePublicSetGetFuncInheritClass,
  topLevelSendableClass } from './SendableClassInherit';
import { ArkTSUtils, collections } from '@kit.ArkTS';

export default function sendableInheritClassTest() {
  describe('ActsSendableInheritClassTest', () => {
    /**
     * @tc.name   testSendablePrivateInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PRIVATE_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePrivateInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePrivateInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePrivateInheritClass0001';
      try {
        const instance = new SendablePrivateInheritClass('test');
        expect(instance instanceof SendablePrivateInheritClass).assertEqual(true);
        expect(instance.department).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0100
     * @tc.desc   Test SendableDefaultInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0001';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyString()).assertEqual('example string');
        instance.setMyString("myString");
        expect(instance.getMyString()).assertEqual("myString");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0200
     * @tc.desc   Test SendableDefaultInheritClass number properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0002';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyNumber()).assertEqual(42);
        instance.setMyNumber(50);
        expect(instance.getMyNumber()).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0300
     * @tc.desc   Test SendableDefaultInheritClass boolean properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0003';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyBoolean()).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.getMyBoolean()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0400
     * @tc.desc   Test SendableDefaultInheritClass bigint properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0004';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyBigInt()).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.getMyBigInt()).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0500
     * @tc.desc   Test SendableDefaultInheritClass undefined property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0005';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyUndefined()).assertEqual(undefined);
        instance.setMyUndefined(null);
        expect(instance.getMyUndefined()).assertEqual(null);
        instance.setMyUndefined("not undefined");
        expect(instance.getMyUndefined()).assertEqual("not undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0600
     * @tc.desc   Test SendableDefaultInheritClass null property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0006';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyNull()).assertEqual(null);
        instance.setMyNull(undefined);
        expect(instance.getMyNull()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0700
     * @tc.desc   Test SendableDefaultInheritClass with top level class instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0007';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        const newValue = new topLevelSendableClass();
        instance.setMyTopLevelClassInstance(newValue);
        expect(instance.getMyTopLevelClassInstance()).assertEqual(newValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0800
     * @tc.desc   Test SendableDefaultInheritClass with top level function instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0008';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_0900
     * @tc.desc   Test SendableDefaultInheritClass enum property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0009';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1000
     * @tc.desc   Test SendableDefaultInheritClass array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0010';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyArray().length).assertEqual(0);
        instance.setMyArray([1, 2, 3]);
        expect(JSON.stringify(instance.getMyArray())).assertEqual(JSON.stringify(new collections.Array<number>(1, 2, 3)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1100
     * @tc.desc   Test SendableDefaultInheritClass map property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0011';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyMap().size).assertEqual(0);
        instance.setMyMap(1, 10);
        expect(instance.getMyMap().size).assertEqual(1);
        expect(instance.getMyMap().get(1)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1200
     * @tc.desc   Test SendableDefaultInheritClass set property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0012';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMySet().size).assertEqual(0);
        instance.setMySet(100);
        expect(instance.getMySet().size).assertEqual(1);
        expect(instance.getMySet().has(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1300
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0013';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, -1, 0]);
        expect(instance.getMyTypedArrayInt8Array().toString()).assertEqual(new collections.Int8Array([1, -1, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1400
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0014';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([200, 255, 0]);
        expect(instance.getMyTypedArrayUint8Array().toString()).assertEqual(new collections.Uint8Array([200, 255, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1500
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0015';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([300, -300, 0]);
        expect(instance.getMyTypedArrayInt16Array().toString()).assertEqual(new collections.Int16Array([300, -300, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1600
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0016';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([60000, 65535, 0]);
        expect(instance.getMyTypedArrayUint16Array().toString()).assertEqual(new collections.Uint16Array([60000, 65535, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1700
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0017';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([65000, -65000, 0]);
        expect(instance.getMyTypedArrayInt32Array().toString()).assertEqual(new collections.Int32Array([65000, -65000, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1800
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0018';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([4294967295, 0, 123456]);
        expect(instance.getMyTypedArrayUint32Array().toString()).assertEqual(new collections.Uint32Array([4294967295, 0, 123456]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_1900
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0019';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([300, -10, 128]);
        expect(instance.getMyTypedArrayUint8ClampedArray().toString()).assertEqual(new collections.Uint8ClampedArray([255, 0, 128]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2000
     * @tc.desc   Test SendableDefaultInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0020';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, -3.5, 0.0]);
        expect(instance.getMyTypedArrayFloat32Array().toString()).assertEqual(new collections.Float32Array([1.5, -3.5, 0.0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2100
     * @tc.desc   Test SendableDefaultInheritClass array buffer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0021';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.getMyArrayBuffer().byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2200
     * @tc.desc   Test SendableDefaultInheritClass concat array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0022';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyConcatArray([5, 6, 7]);
        expect(JSON.stringify(instance.getMyConcatArray())).assertEqual(JSON.stringify(new collections.Array<number>(5, 6, 7)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2300
     * @tc.desc   Test SendableDefaultInheritClass bit vector property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0023';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        expect(instance.getMyBitVector().pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.getMyBitVector().pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2400
     * @tc.desc   Test SendableDefaultInheritClass ASON property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0024';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.getMyASON())).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2500
     * @tc.desc   Test SendableDefaultInheritClass async lock property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0025';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMyAsyncLock("anotherLock");
        expect(typeof instance.getMyAsyncLock()).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_INHERIT_CLASS_2600
     * @tc.desc   Test SendableDefaultInheritClass sendable union property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultInheritClass0026';
      try {
        const instance = new SendableDefaultInheritClass();
        expect(instance instanceof SendableDefaultInheritClass).assertEqual(true);
        instance.setMySendableUnion("unionValue");
        expect(instance.getMySendableUnionArray()).assertEqual("unionValue");
        instance.setMySendableUnion(99);
        expect(instance.getMySendableUnionArray()).assertEqual(99);
        instance.setMySendableUnion(false);
        expect(instance.getMySendableUnionArray()).assertEqual(false);
        instance.setMySendableUnion(1234567890123456789012345678901234567890n);
        expect(instance.getMySendableUnionArray()).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePublicInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0001';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyString()).assertEqual('example string');
        instance.setMyString("myString");
        expect(instance.getMyString()).assertEqual("myString");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0200
     * @tc.desc   Test SendablePublicInheritClass number properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0002';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyNumber()).assertEqual(42);
        instance.setMyNumber(50);
        expect(instance.getMyNumber()).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0300
     * @tc.desc   Test SendablePublicInheritClass boolean properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0003';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyBoolean()).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.getMyBoolean()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0400
     * @tc.desc   Test SendablePublicInheritClass bigint properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0004';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyBigInt()).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.getMyBigInt()).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0500
     * @tc.desc   Test SendablePublicInheritClass undefined property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0005';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyUndefined()).assertEqual(undefined);
        instance.setMyUndefined(null);
        expect(instance.getMyUndefined()).assertEqual(null);
        instance.setMyUndefined("not undefined");
        expect(instance.getMyUndefined()).assertEqual("not undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0600
     * @tc.desc   Test SendablePublicInheritClass null property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0006';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyNull()).assertEqual(null);
        instance.setMyNull(undefined);
        expect(instance.getMyNull()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0700
     * @tc.desc   Test SendablePublicInheritClass with top level class instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0007';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        const newValue = new topLevelSendableClass();
        instance.setMyTopLevelClassInstance(newValue);
        expect(instance.getMyTopLevelClassInstance()).assertEqual(newValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0800
     * @tc.desc   Test SendablePublicInheritClass with top level function instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0008';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_0900
     * @tc.desc   Test SendablePublicInheritClass enum property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0009';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1000
     * @tc.desc   Test SendablePublicInheritClass array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0010';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyArray().length).assertEqual(0);
        instance.setMyArray([1, 2, 3]);
        expect(JSON.stringify(instance.getMyArray())).assertEqual(JSON.stringify(new collections.Array<number>(1, 2, 3)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1100
     * @tc.desc   Test SendablePublicInheritClass map property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0011';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyMap().size).assertEqual(0);
        instance.setMyMap(1, 10);
        expect(instance.getMyMap().size).assertEqual(1);
        expect(instance.getMyMap().get(1)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1200
     * @tc.desc   Test SendablePublicInheritClass set property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0012';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMySet().size).assertEqual(0);
        instance.setMySet(100);
        expect(instance.getMySet().size).assertEqual(1);
        expect(instance.getMySet().has(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1300
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0013';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, -1, 0]);
        expect(instance.getMyTypedArrayInt8Array().toString()).assertEqual(new collections.Int8Array([1, -1, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1400
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0014';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([200, 255, 0]);
        expect(instance.getMyTypedArrayUint8Array().toString()).assertEqual(new collections.Uint8Array([200, 255, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1500
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0015';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([300, -300, 0]);
        expect(instance.getMyTypedArrayInt16Array().toString()).assertEqual(new collections.Int16Array([300, -300, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1600
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0016';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([60000, 65535, 0]);
        expect(instance.getMyTypedArrayUint16Array().toString()).assertEqual(new collections.Uint16Array([60000, 65535, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1700
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0017';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([65000, -65000, 0]);
        expect(instance.getMyTypedArrayInt32Array().toString()).assertEqual(new collections.Int32Array([65000, -65000, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1800
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0018';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([4294967295, 0, 123456]);
        expect(instance.getMyTypedArrayUint32Array().toString()).assertEqual(new collections.Uint32Array([4294967295, 0, 123456]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_1900
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0019';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([300, -10, 128]);
        expect(instance.getMyTypedArrayUint8ClampedArray().toString()).assertEqual(new collections.Uint8ClampedArray([255, 0, 128]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2000
     * @tc.desc   Test SendablePublicInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0020';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, -3.5, 0.0]);
        expect(instance.getMyTypedArrayFloat32Array().toString()).assertEqual(new collections.Float32Array([1.5, -3.5, 0.0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2100
     * @tc.desc   Test SendablePublicInheritClass array buffer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0021';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.getMyArrayBuffer().byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2200
     * @tc.desc   Test SendablePublicInheritClass concat array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0022';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyConcatArray([5, 6, 7]);
        expect(JSON.stringify(instance.getMyConcatArray())).assertEqual(JSON.stringify(new collections.Array<number>(5, 6, 7)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2300
     * @tc.desc   Test SendablePublicInheritClass bit vector property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0023';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        expect(instance.getMyBitVector().pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.getMyBitVector().pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2400
     * @tc.desc   Test SendablePublicInheritClass ASON property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0024';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.getMyASON())).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2500
     * @tc.desc   Test SendablePublicInheritClass async lock property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0025';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMyAsyncLock("anotherLock");
        expect(typeof instance.getMyAsyncLock()).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_INHERIT_CLASS_2600
     * @tc.desc   Test SendablePublicInheritClass sendable union property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicInheritClass0026';
      try {
        const instance = new SendablePublicInheritClass();
        expect(instance instanceof SendablePublicInheritClass).assertEqual(true);
        instance.setMySendableUnion("unionValue");
        expect(instance.getMySendableUnionArray()).assertEqual("unionValue");
        instance.setMySendableUnion(99);
        expect(instance.getMySendableUnionArray()).assertEqual(99);
        instance.setMySendableUnion(false);
        expect(instance.getMySendableUnionArray()).assertEqual(false);
        instance.setMySendableUnion(1234567890123456789012345678901234567890n);
        expect(instance.getMySendableUnionArray()).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePrivateFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PRIVATE_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePrivateFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePrivateFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePrivateFuncInheritClass0001';
      try {
        const instance = new SendablePrivateFuncInheritClass('test');
        expect(instance instanceof SendablePrivateFuncInheritClass).assertEqual(true);
        expect(instance.department).assertEqual('test');
        expect(instance.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendableDefaultFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0001';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.setMyString('new string');
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendableDefaultFuncInheritClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0002';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.setMyNumber(100);
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendableDefaultFuncInheritClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0003';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendableDefaultFuncInheritClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0004';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.myBigInt).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendableDefaultFuncInheritClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0005';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.setMyUndefined('test');
        expect(instance.myUndefined).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendableDefaultFuncInheritClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0006';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.setMyNull(123);
        expect(instance.myNull).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendableDefaultFuncInheritClass topLevelSendableClass is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0007';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        const topLevelInstance = new topLevelSendableClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTopLevelClassInstance(topLevelInstance);
        expect(instance.myTopLevelClassInstance).assertEqual(topLevelInstance);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendableDefaultFuncInheritClass topLevelFunction is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0008';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myTopLevelFunction()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.myTopLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendableDefaultFuncInheritClass Enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0009';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendableDefaultFuncInheritClass array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0010';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyArray([1, 2, 3]);
        expect(instance.myArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendableDefaultFuncInheritClass map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0011';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyMap(1, 100);
        expect(instance.myMap.get(1)).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendableDefaultFuncInheritClass set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0012';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMySet(5);
        expect(instance.mySet.has(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendableDefaultFuncInheritClass Int8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0013';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayInt8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendableDefaultFuncInheritClass Uint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0014';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayUint8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendableDefaultFuncInheritClass Int16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0015';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([10, 20, 30]);
        expect(Array.from(instance.myTypedArrayInt16Array).toString()).assertEqual('10,20,30');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendableDefaultFuncInheritClass Uint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0016';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([100, 200, 300]);
        expect(Array.from(instance.myTypedArrayUint16Array).toString()).assertEqual('100,200,300');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendableDefaultFuncInheritClass Int32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0017';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([1000, 2000, 3000]);
        expect(Array.from(instance.myTypedArrayInt32Array).toString()).assertEqual('1000,2000,3000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendableDefaultFuncInheritClass Uint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0018';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([10000, 20000, 30000]);
        expect(Array.from(instance.myTypedArrayUint32Array).toString()).assertEqual('10000,20000,30000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendableDefaultFuncInheritClass Uint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0019';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([0, 255, 128]);
        expect(Array.from(instance.myTypedArrayUint8ClampedArray).toString()).assertEqual('0,255,128');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendableDefaultFuncInheritClass Float32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0020';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, 2.5, 3.5]);
        expect(Array.from(instance.myTypedArrayFloat32Array).toString()).assertEqual('1.5,2.5,3.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendableDefaultFuncInheritClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0021';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.myArrayBuffer.byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendableDefaultFuncInheritClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0022';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray(123);
        expect(instance.myConcatArray.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendableDefaultFuncInheritClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0023';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendableDefaultFuncInheritClass ASON is parsed correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0024';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.myASON)).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendableDefaultFuncInheritClass AsyncLock is requested directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0025';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        const lockName = 'testLock';
        instance.setMyAsyncLock(lockName);
        expect(instance.myAsyncLock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendableDefaultFuncInheritClass union type is assigned correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultFuncInheritClass0026';
      try {
        const instance = new SendableDefaultFuncInheritClass();
        expect(instance instanceof SendableDefaultFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("testString");
        expect(instance.mySendableUnionArray).assertEqual("testString");
        instance.setMySendableUnion(2023);
        expect(instance.mySendableUnionArray).assertEqual(2023);
        instance.setMySendableUnion(true);
        expect(instance.mySendableUnionArray).assertEqual(true);
        instance.setMySendableUnion(1234567890123456789n);
        expect(instance.mySendableUnionArray).assertEqual(1234567890123456789n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePublicFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0001';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.setMyString('new string');
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendablePublicFuncInheritClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0002';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.setMyNumber(100);
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendablePublicFuncInheritClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0003';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendablePublicFuncInheritClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0004';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.myBigInt).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendablePublicFuncInheritClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0005';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.setMyUndefined('test');
        expect(instance.myUndefined).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendablePublicFuncInheritClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0006';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.setMyNull(123);
        expect(instance.myNull).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendablePublicFuncInheritClass topLevelSendableClass is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0007';
      try {
        const instance = new SendablePublicFuncInheritClass();
        const topLevelInstance = new topLevelSendableClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTopLevelClassInstance(topLevelInstance);
        expect(instance.myTopLevelClassInstance).assertEqual(topLevelInstance);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendablePublicFuncInheritClass topLevelFunction is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0008';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myTopLevelFunction()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.myTopLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendablePublicFuncInheritClass Enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0009';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendablePublicFuncInheritClass array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0010';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyArray([1, 2, 3]);
        expect(instance.myArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendablePublicFuncInheritClass map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0011';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyMap(1, 100);
        expect(instance.myMap.get(1)).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendablePublicFuncInheritClass set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0012';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMySet(5);
        expect(instance.mySet.has(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendablePublicFuncInheritClass Int8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0013';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayInt8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendablePublicFuncInheritClass Uint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0014';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayUint8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendablePublicFuncInheritClass Int16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0015';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([10, 20, 30]);
        expect(Array.from(instance.myTypedArrayInt16Array).toString()).assertEqual('10,20,30');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendablePublicFuncInheritClass Uint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0016';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([100, 200, 300]);
        expect(Array.from(instance.myTypedArrayUint16Array).toString()).assertEqual('100,200,300');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendablePublicFuncInheritClass Int32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0017';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([1000, 2000, 3000]);
        expect(Array.from(instance.myTypedArrayInt32Array).toString()).assertEqual('1000,2000,3000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendablePublicFuncInheritClass Uint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0018';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([10000, 20000, 30000]);
        expect(Array.from(instance.myTypedArrayUint32Array).toString()).assertEqual('10000,20000,30000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendablePublicFuncInheritClass Uint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0019';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([0, 255, 128]);
        expect(Array.from(instance.myTypedArrayUint8ClampedArray).toString()).assertEqual('0,255,128');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendablePublicFuncInheritClass Float32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0020';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, 2.5, 3.5]);
        expect(Array.from(instance.myTypedArrayFloat32Array).toString()).assertEqual('1.5,2.5,3.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendablePublicFuncInheritClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0021';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.myArrayBuffer.byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendablePublicFuncInheritClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0022';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray(123);
        expect(instance.myConcatArray.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendablePublicFuncInheritClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0023';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendablePublicFuncInheritClass ASON is parsed correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0024';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.myASON)).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendablePublicFuncInheritClass AsyncLock is requested directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0025';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        const lockName = 'testLock';
        instance.setMyAsyncLock(lockName);
        expect(instance.myAsyncLock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendablePublicFuncInheritClass union type is assigned correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicFuncInheritClass0026';
      try {
        const instance = new SendablePublicFuncInheritClass();
        expect(instance instanceof SendablePublicFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("testString");
        expect(instance.mySendableUnionArray).assertEqual("testString");
        instance.setMySendableUnion(2023);
        expect(instance.mySendableUnionArray).assertEqual(2023);
        instance.setMySendableUnion(true);
        expect(instance.mySendableUnionArray).assertEqual(true);
        instance.setMySendableUnion(1234567890123456789n);
        expect(instance.mySendableUnionArray).assertEqual(1234567890123456789n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePrivateGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PRIVATE_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePrivateGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePrivateGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePrivateGetFuncInheritClass0001';
      try {
        const instance = new SendablePrivateGetFuncInheritClass();
        expect(instance instanceof SendablePrivateGetFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendableDefaultGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0001';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyString()).assertEqual('example string');
        instance.setMyString("myString");
        expect(instance.getMyString()).assertEqual("myString");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendableDefaultGetFuncInheritClass number properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0002';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNumber()).assertEqual(42);
        instance.setMyNumber(50);
        expect(instance.getMyNumber()).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendableDefaultGetFuncInheritClass boolean properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0003';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBoolean()).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.getMyBoolean()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendableDefaultGetFuncInheritClass bigint properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0004';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBigInt()).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.getMyBigInt()).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendableDefaultGetFuncInheritClass undefined property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0005';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyUndefined()).assertEqual(undefined);
        instance.setMyUndefined(null);
        expect(instance.getMyUndefined()).assertEqual(null);
        instance.setMyUndefined("not undefined");
        expect(instance.getMyUndefined()).assertEqual("not undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendableDefaultGetFuncInheritClass null property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0006';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNull()).assertEqual(null);
        instance.setMyNull(undefined);
        expect(instance.getMyNull()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendableDefaultGetFuncInheritClass with top level class instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0007';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        const newValue = new topLevelSendableClass();
        instance.setMyTopLevelClassInstance(newValue);
        expect(instance.getMyTopLevelClassInstance()).assertEqual(newValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendableDefaultGetFuncInheritClass with top level function instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0008';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendableDefaultGetFuncInheritClass enum property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0009';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendableDefaultGetFuncInheritClass array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0010';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyArray().length).assertEqual(0);
        instance.setMyArray([1, 2, 3]);
        expect(JSON.stringify(instance.getMyArray())).assertEqual(JSON.stringify(new collections.Array<number>(1, 2, 3)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendableDefaultGetFuncInheritClass map property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0011';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyMap().size).assertEqual(0);
        instance.setMyMap(1, 10);
        expect(instance.getMyMap().size).assertEqual(1);
        expect(instance.getMyMap().get(1)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendableDefaultGetFuncInheritClass set property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0012';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMySet().size).assertEqual(0);
        instance.setMySet(100);
        expect(instance.getMySet().size).assertEqual(1);
        expect(instance.getMySet().has(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0013';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, -1, 0]);
        expect(instance.getMyTypedArrayInt8Array().toString()).assertEqual(new collections.Int8Array([1, -1, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0014';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([200, 255, 0]);
        expect(instance.getMyTypedArrayUint8Array().toString()).assertEqual(new collections.Uint8Array([200, 255, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0015';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([300, -300, 0]);
        expect(instance.getMyTypedArrayInt16Array().toString()).assertEqual(new collections.Int16Array([300, -300, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0016';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([60000, 65535, 0]);
        expect(instance.getMyTypedArrayUint16Array().toString()).assertEqual(new collections.Uint16Array([60000, 65535, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0017';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([65000, -65000, 0]);
        expect(instance.getMyTypedArrayInt32Array().toString()).assertEqual(new collections.Int32Array([65000, -65000, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0018';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([4294967295, 0, 123456]);
        expect(instance.getMyTypedArrayUint32Array().toString()).assertEqual(new collections.Uint32Array([4294967295, 0, 123456]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0019';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([300, -10, 128]);
        expect(instance.getMyTypedArrayUint8ClampedArray().toString()).assertEqual(new collections.Uint8ClampedArray([255, 0, 128]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendableDefaultGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0020';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, -3.5, 0.0]);
        expect(instance.getMyTypedArrayFloat32Array().toString()).assertEqual(new collections.Float32Array([1.5, -3.5, 0.0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendableDefaultGetFuncInheritClass array buffer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0021';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.getMyArrayBuffer().byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendableDefaultGetFuncInheritClass concat array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0022';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray([5, 6, 7]);
        expect(JSON.stringify(instance.getMyConcatArray())).assertEqual(JSON.stringify(new collections.Array<number>(5, 6, 7)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendableDefaultGetFuncInheritClass bit vector property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0023';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBitVector().pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.getMyBitVector().pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendableDefaultGetFuncInheritClass ASON property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0024';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.getMyASON())).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendableDefaultGetFuncInheritClass async lock property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0025';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMyAsyncLock("anotherLock");
        expect(typeof instance.getMyAsyncLock()).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultGetFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_GET_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendableDefaultGetFuncInheritClass sendable union property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultGetFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultGetFuncInheritClass0026';
      try {
        const instance = new SendableDefaultGetFuncInheritClass();
        expect(instance instanceof SendableDefaultGetFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("unionValue");
        expect(instance.getMySendableUnionArray()).assertEqual("unionValue");
        instance.setMySendableUnion(99);
        expect(instance.getMySendableUnionArray()).assertEqual(99);
        instance.setMySendableUnion(false);
        expect(instance.getMySendableUnionArray()).assertEqual(false);
        instance.setMySendableUnion(1234567890123456789012345678901234567890n);
        expect(instance.getMySendableUnionArray()).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePublicGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0001';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyString()).assertEqual('example string');
        instance.setMyString("myString");
        expect(instance.getMyString()).assertEqual("myString");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendablePublicGetFuncInheritClass number properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0002';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNumber()).assertEqual(42);
        instance.setMyNumber(50);
        expect(instance.getMyNumber()).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendablePublicGetFuncInheritClass boolean properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0003';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBoolean()).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.getMyBoolean()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendablePublicGetFuncInheritClass bigint properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0004';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBigInt()).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.getMyBigInt()).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendablePublicGetFuncInheritClass undefined property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0005';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyUndefined()).assertEqual(undefined);
        instance.setMyUndefined(null);
        expect(instance.getMyUndefined()).assertEqual(null);
        instance.setMyUndefined("not undefined");
        expect(instance.getMyUndefined()).assertEqual("not undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendablePublicGetFuncInheritClass null property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0006';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNull()).assertEqual(null);
        instance.setMyNull(undefined);
        expect(instance.getMyNull()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendablePublicGetFuncInheritClass with top level class instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0007';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        const newValue = new topLevelSendableClass();
        instance.setMyTopLevelClassInstance(newValue);
        expect(instance.getMyTopLevelClassInstance()).assertEqual(newValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendablePublicGetFuncInheritClass with top level function instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0008';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendablePublicGetFuncInheritClass enum property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0009';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendablePublicGetFuncInheritClass array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0010';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyArray().length).assertEqual(0);
        instance.setMyArray([1, 2, 3]);
        expect(JSON.stringify(instance.getMyArray())).assertEqual(JSON.stringify(new collections.Array<number>(1, 2, 3)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendablePublicGetFuncInheritClass map property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0011';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyMap().size).assertEqual(0);
        instance.setMyMap(1, 10);
        expect(instance.getMyMap().size).assertEqual(1);
        expect(instance.getMyMap().get(1)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendablePublicGetFuncInheritClass set property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0012';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMySet().size).assertEqual(0);
        instance.setMySet(100);
        expect(instance.getMySet().size).assertEqual(1);
        expect(instance.getMySet().has(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0013';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, -1, 0]);
        expect(instance.getMyTypedArrayInt8Array().toString()).assertEqual(new collections.Int8Array([1, -1, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0014';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([200, 255, 0]);
        expect(instance.getMyTypedArrayUint8Array().toString()).assertEqual(new collections.Uint8Array([200, 255, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0015';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([300, -300, 0]);
        expect(instance.getMyTypedArrayInt16Array().toString()).assertEqual(new collections.Int16Array([300, -300, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0016';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([60000, 65535, 0]);
        expect(instance.getMyTypedArrayUint16Array().toString()).assertEqual(new collections.Uint16Array([60000, 65535, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0017';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([65000, -65000, 0]);
        expect(instance.getMyTypedArrayInt32Array().toString()).assertEqual(new collections.Int32Array([65000, -65000, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0018';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([4294967295, 0, 123456]);
        expect(instance.getMyTypedArrayUint32Array().toString()).assertEqual(new collections.Uint32Array([4294967295, 0, 123456]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0019';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([300, -10, 128]);
        expect(instance.getMyTypedArrayUint8ClampedArray().toString()).assertEqual(new collections.Uint8ClampedArray([255, 0, 128]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendablePublicGetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0020';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, -3.5, 0.0]);
        expect(instance.getMyTypedArrayFloat32Array().toString()).assertEqual(new collections.Float32Array([1.5, -3.5, 0.0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendablePublicGetFuncInheritClass array buffer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0021';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.getMyArrayBuffer().byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendablePublicGetFuncInheritClass concat array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0022';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray([5, 6, 7]);
        expect(JSON.stringify(instance.getMyConcatArray())).assertEqual(JSON.stringify(new collections.Array<number>(5, 6, 7)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendablePublicGetFuncInheritClass bit vector property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0023';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBitVector().pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.getMyBitVector().pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendablePublicGetFuncInheritClass ASON property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0024';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.getMyASON())).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendablePublicGetFuncInheritClass async lock property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0025';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMyAsyncLock("anotherLock");
        expect(typeof instance.getMyAsyncLock()).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicGetFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_GET_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendablePublicGetFuncInheritClass sendable union property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicGetFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicGetFuncInheritClass0026';
      try {
        const instance = new SendablePublicGetFuncInheritClass();
        expect(instance instanceof SendablePublicGetFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("unionValue");
        expect(instance.getMySendableUnionArray()).assertEqual("unionValue");
        instance.setMySendableUnion(99);
        expect(instance.getMySendableUnionArray()).assertEqual(99);
        instance.setMySendableUnion(false);
        expect(instance.getMySendableUnionArray()).assertEqual(false);
        instance.setMySendableUnion(1234567890123456789012345678901234567890n);
        expect(instance.getMySendableUnionArray()).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePrivateSetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PRIVATE_SET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePrivateSetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePrivateSetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePrivateSetFuncInheritClass0001';
      try {
        const instance = new SendablePrivateSetFuncInheritClass();
        expect(instance instanceof SendablePrivateSetFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePublicSetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0001';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyString()).assertEqual('example string');
        instance.setMyString("myString");
        expect(instance.getMyString()).assertEqual("myString");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendablePublicSetFuncInheritClass number properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0002';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNumber()).assertEqual(42);
        instance.setMyNumber(50);
        expect(instance.getMyNumber()).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendablePublicSetFuncInheritClass boolean properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0003';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBoolean()).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.getMyBoolean()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendablePublicSetFuncInheritClass bigint properties and inheritance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0004';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBigInt()).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.getMyBigInt()).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendablePublicSetFuncInheritClass undefined property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0005';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyUndefined()).assertEqual(undefined);
        instance.setMyUndefined(null);
        expect(instance.getMyUndefined()).assertEqual(null);
        instance.setMyUndefined("not undefined");
        expect(instance.getMyUndefined()).assertEqual("not undefined");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendablePublicSetFuncInheritClass null property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0006';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyNull()).assertEqual(null);
        instance.setMyNull(undefined);
        expect(instance.getMyNull()).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendablePublicSetFuncInheritClass with top level class instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0007';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        const newValue = new topLevelSendableClass();
        instance.setMyTopLevelClassInstance(newValue);
        expect(instance.getMyTopLevelClassInstance()).assertEqual(newValue);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendablePublicSetFuncInheritClass with top level function instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0008';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.getMyTopLevelFunction()()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendablePublicSetFuncInheritClass enum property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0009';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.getMyEnum()).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendablePublicSetFuncInheritClass array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0010';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyArray().length).assertEqual(0);
        instance.setMyArray([1, 2, 3]);
        expect(JSON.stringify(instance.getMyArray())).assertEqual(JSON.stringify(new collections.Array<number>(1, 2, 3)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendablePublicSetFuncInheritClass map property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0011';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyMap().size).assertEqual(0);
        instance.setMyMap(1, 10);
        expect(instance.getMyMap().size).assertEqual(1);
        expect(instance.getMyMap().get(1)).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendablePublicSetFuncInheritClass set property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0012';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMySet().size).assertEqual(0);
        instance.setMySet(100);
        expect(instance.getMySet().size).assertEqual(1);
        expect(instance.getMySet().has(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0013';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, -1, 0]);
        expect(instance.getMyTypedArrayInt8Array().toString()).assertEqual(new collections.Int8Array([1, -1, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0014';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([200, 255, 0]);
        expect(instance.getMyTypedArrayUint8Array().toString()).assertEqual(new collections.Uint8Array([200, 255, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0015';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([300, -300, 0]);
        expect(instance.getMyTypedArrayInt16Array().toString()).assertEqual(new collections.Int16Array([300, -300, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0016';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([60000, 65535, 0]);
        expect(instance.getMyTypedArrayUint16Array().toString()).assertEqual(new collections.Uint16Array([60000, 65535, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0017';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([65000, -65000, 0]);
        expect(instance.getMyTypedArrayInt32Array().toString()).assertEqual(new collections.Int32Array([65000, -65000, 0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0018';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([4294967295, 0, 123456]);
        expect(instance.getMyTypedArrayUint32Array().toString()).assertEqual(new collections.Uint32Array([4294967295, 0, 123456]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0019';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([300, -10, 128]);
        expect(instance.getMyTypedArrayUint8ClampedArray().toString()).assertEqual(new collections.Uint8ClampedArray([255, 0, 128]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendablePublicSetFuncInheritClass typed array properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0020';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, -3.5, 0.0]);
        expect(instance.getMyTypedArrayFloat32Array().toString()).assertEqual(new collections.Float32Array([1.5, -3.5, 0.0]).toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendablePublicSetFuncInheritClass array buffer property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0021';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.getMyArrayBuffer().byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendablePublicSetFuncInheritClass concat array property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0022';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray([5, 6, 7]);
        expect(JSON.stringify(instance.getMyConcatArray())).assertEqual(JSON.stringify(new collections.Array<number>(5, 6, 7)));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendablePublicSetFuncInheritClass bit vector property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0023';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        expect(instance.getMyBitVector().pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.getMyBitVector().pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendablePublicSetFuncInheritClass ASON property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0024';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.getMyASON())).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendablePublicSetFuncInheritClass async lock property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0025';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMyAsyncLock("anotherLock");
        expect(typeof instance.getMyAsyncLock()).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendablePublicSetFuncInheritClass sendable union property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetFuncInheritClass0026';
      try {
        const instance = new SendablePublicSetFuncInheritClass();
        expect(instance instanceof SendablePublicSetFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("unionValue");
        expect(instance.getMySendableUnionArray()).assertEqual("unionValue");
        instance.setMySendableUnion(99);
        expect(instance.getMySendableUnionArray()).assertEqual(99);
        instance.setMySendableUnion(false);
        expect(instance.getMySendableUnionArray()).assertEqual(false);
        instance.setMySendableUnion(1234567890123456789012345678901234567890n);
        expect(instance.getMySendableUnionArray()).assertEqual(1234567890123456789012345678901234567890n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePrivateSetGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PRIVATE_SET_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePrivateSetGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePrivateSetGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePrivateSetGetFuncInheritClass0001';
      try {
        const instance = new SendablePrivateSetGetFuncInheritClass();
        expect(instance instanceof SendablePrivateSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0001';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.setMyString('new string');
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0002';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.setMyNumber(100);
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0003';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0004';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.myBigInt).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0005';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.setMyUndefined('test');
        expect(instance.myUndefined).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0006';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.setMyNull(123);
        expect(instance.myNull).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass topLevelSendableClass is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0007';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        const topLevelInstance = new topLevelSendableClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTopLevelClassInstance(topLevelInstance);
        expect(instance.myTopLevelClassInstance).assertEqual(topLevelInstance);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass topLevelFunction is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0008';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myTopLevelFunction()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.myTopLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0009';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0010';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyArray([1, 2, 3]);
        expect(instance.myArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0011';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyMap(1, 100);
        expect(instance.myMap.get(1)).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0012';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMySet(5);
        expect(instance.mySet.has(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Int8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0013';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayInt8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Uint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0014';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayUint8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Int16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0015';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([10, 20, 30]);
        expect(Array.from(instance.myTypedArrayInt16Array).toString()).assertEqual('10,20,30');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Uint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0016';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([100, 200, 300]);
        expect(Array.from(instance.myTypedArrayUint16Array).toString()).assertEqual('100,200,300');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Int32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0017';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([1000, 2000, 3000]);
        expect(Array.from(instance.myTypedArrayInt32Array).toString()).assertEqual('1000,2000,3000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Uint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0018';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([10000, 20000, 30000]);
        expect(Array.from(instance.myTypedArrayUint32Array).toString()).assertEqual('10000,20000,30000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Uint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0019';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([0, 255, 128]);
        expect(Array.from(instance.myTypedArrayUint8ClampedArray).toString()).assertEqual('0,255,128');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass Float32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0020';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, 2.5, 3.5]);
        expect(Array.from(instance.myTypedArrayFloat32Array).toString()).assertEqual('1.5,2.5,3.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0021';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.myArrayBuffer.byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0022';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray(123);
        expect(instance.myConcatArray.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0023';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass ASON is parsed correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0024';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.myASON)).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass AsyncLock is requested directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0025';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        const lockName = 'testLock';
        instance.setMyAsyncLock(lockName);
        expect(instance.myAsyncLock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendableDefaultSetGetFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_DEFAULT_SET_GET_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendableDefaultSetGetFuncInheritClass union type is assigned correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableDefaultSetGetFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendableDefaultSetGetFuncInheritClass0026';
      try {
        const instance = new SendableDefaultSetGetFuncInheritClass();
        expect(instance instanceof SendableDefaultSetGetFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("testString");
        expect(instance.mySendableUnionArray).assertEqual("testString");
        instance.setMySendableUnion(2023);
        expect(instance.mySendableUnionArray).assertEqual(2023);
        instance.setMySendableUnion(true);
        expect(instance.mySendableUnionArray).assertEqual(true);
        instance.setMySendableUnion(1234567890123456789n);
        expect(instance.mySendableUnionArray).assertEqual(1234567890123456789n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0100
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass string is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0001';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myString).assertEqual('example string');
        instance.setMyString('new string');
        expect(instance.myString).assertEqual('new string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0200
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass number is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0002';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myNumber).assertEqual(42);
        instance.setMyNumber(100);
        expect(instance.myNumber).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0300
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass boolean is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0003';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBoolean).assertEqual(true);
        instance.setMyBoolean(false);
        expect(instance.myBoolean).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0400
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass BigInt is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0004';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBigInt).assertEqual(1234567890123456789012345678901234567890n);
        instance.setMyBigInt(987654321987654321987654321n);
        expect(instance.myBigInt).assertEqual(987654321987654321987654321n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0500
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass undefined is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0005';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myUndefined).assertEqual(undefined);
        instance.setMyUndefined('test');
        expect(instance.myUndefined).assertEqual('test');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0600
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass null is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0006';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myNull).assertEqual(null);
        instance.setMyNull(123);
        expect(instance.myNull).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0700
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass topLevelSendableClass is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0007';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        const topLevelInstance = new topLevelSendableClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTopLevelClassInstance(topLevelInstance);
        expect(instance.myTopLevelClassInstance).assertEqual(topLevelInstance);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0800
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass topLevelFunction is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0008';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myTopLevelFunction()).assertEqual('Top level sendable function');
        instance.setMyTopLevelFunction(ModifiedTopLevelSendableFunction);
        expect(instance.myTopLevelFunction()).assertEqual('Modified top level sendable function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_0900
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Enum is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0009';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_1);
        instance.setMyEnum(SendableConstEnum.OPTION_2);
        expect(instance.myEnum).assertEqual(SendableConstEnum.OPTION_2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1000
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0010';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyArray([1, 2, 3]);
        expect(instance.myArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1100
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass map is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0011';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyMap(1, 100);
        expect(instance.myMap.get(1)).assertEqual(100);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1200
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass set is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0012';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMySet(5);
        expect(instance.mySet.has(5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1300
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Int8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0013';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayInt8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1400
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Uint8Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0014';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8Array([1, 2, 3, 4, 5, 6]);
        expect(Array.from(instance.myTypedArrayUint8Array).toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1500
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Int16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0015';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt16Array([10, 20, 30]);
        expect(Array.from(instance.myTypedArrayInt16Array).toString()).assertEqual('10,20,30');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1600
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Uint16Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0016';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint16Array([100, 200, 300]);
        expect(Array.from(instance.myTypedArrayUint16Array).toString()).assertEqual('100,200,300');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1700
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Int32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0017';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayInt32Array([1000, 2000, 3000]);
        expect(Array.from(instance.myTypedArrayInt32Array).toString()).assertEqual('1000,2000,3000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1800
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Uint32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0018';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint32Array([10000, 20000, 30000]);
        expect(Array.from(instance.myTypedArrayUint32Array).toString()).assertEqual('10000,20000,30000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_1900
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Uint8ClampedArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0019';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayUint8ClampedArray([0, 255, 128]);
        expect(Array.from(instance.myTypedArrayUint8ClampedArray).toString()).assertEqual('0,255,128');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2000
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass Float32Array is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0020';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyTypedArrayFloat32Array([1.5, 2.5, 3.5]);
        expect(Array.from(instance.myTypedArrayFloat32Array).toString()).assertEqual('1.5,2.5,3.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2100
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass ArrayBuffer is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0021';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyArrayBuffer(20);
        expect(instance.myArrayBuffer.byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2200
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass ConcatArray is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0022';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMyConcatArray(123);
        expect(instance.myConcatArray.toString()).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2300
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass BitVector is assigned directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0023';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        expect(instance.myBitVector.pop()).assertEqual(0);
        instance.setMyBitVector(3);
        expect(instance.myBitVector.pop()).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2400
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass ASON is parsed correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0024';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        const jsonString = '{"name": "Jane", "age": 25, "city": "Beijing"}';
        instance.setMyASON(jsonString);
        const parsedASON = ArkTSUtils.ASON.parse(jsonString);
        expect(JSON.stringify(instance.myASON)).assertEqual(JSON.stringify(parsedASON));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2500
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass AsyncLock is requested directly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0025';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        const lockName = 'testLock';
        instance.setMyAsyncLock(lockName);
        expect(instance.myAsyncLock.name).assertEqual(lockName);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSendablePublicSetGetFuncInheritClass0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_PUBLIC_SET_GET_FUNC_INHERIT_CLASS_2600
     * @tc.desc   Test SendablePublicSetGetFuncInheritClass union type is assigned correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendablePublicSetGetFuncInheritClass0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSendablePublicSetGetFuncInheritClass0026';
      try {
        const instance = new SendablePublicSetGetFuncInheritClass();
        expect(instance instanceof SendablePublicSetGetFuncInheritClass).assertEqual(true);
        instance.setMySendableUnion("testString");
        expect(instance.mySendableUnionArray).assertEqual("testString");
        instance.setMySendableUnion(2023);
        expect(instance.mySendableUnionArray).assertEqual(2023);
        instance.setMySendableUnion(true);
        expect(instance.mySendableUnionArray).assertEqual(true);
        instance.setMySendableUnion(1234567890123456789n);
        expect(instance.mySendableUnionArray).assertEqual(1234567890123456789n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}