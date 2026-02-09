/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function objectOperationsTest() {

  describe("ActsObjectOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCEOF_0100
     * @tc.name        Object_InstanceOf_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_InstanceOf_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_InstanceOf_0001 start');
        let cls = new Foo();
        let result = cls.test_Object_InstanceOf();
        expect(result).assertTrue();
        console.log('Object_InstanceOf_0001 done');
        done();
        console.log('Object_InstanceOf_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETTYPE_0100
     * @tc.name        Object_GetType_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetType_0001 start');
        let cls = new Foo();
        let result = cls.test_Object_GetType();
        expect(result).assertTrue();
        console.log('Object_GetType_0001 done');
        done();
        console.log('Object_GetType_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_A
     * @tc.name        test_Object_Call_Method_Boolean_A
     * @tc.desc        call method boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_A start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_A();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_A done');
      done();
      console.log('test_Object_Call_Method_Boolean_A end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0100
     * @tc.name        test_Object_Call_Method_Boolean_0001
     * @tc.desc        object call method boolean_v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0001 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0200
     * @tc.name        test_Object_Call_Method_Boolean_0002
     * @tc.desc        object call method boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0002 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0300
     * @tc.name        test_Object_Call_Method_Boolean_0003
     * @tc.desc        object call method boolean v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0003 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0400
     * @tc.name        test_Object_Call_Method_Boolean_0004
     * @tc.desc        call method boolean v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0004 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0500
     * @tc.name        test_Object_Call_Method_Boolean_0005
     * @tc.desc        call method boolean v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0005 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0600
     * @tc.name        test_Object_Call_Method_Boolean_0006
     * @tc.desc        call method boolean v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0006 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0700
     * @tc.name        test_Object_Call_Method_Boolean_0007
     * @tc.desc        call method boolean a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0007 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0800
     * @tc.name        test_Object_Call_Method_Boolean_0008
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0008 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_0900
     * @tc.name        test_Object_Call_Method_Boolean_0009
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0009 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1000
     * @tc.name        test_Object_Call_Method_Boolean_0010
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0010 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1100
     * @tc.name        test_Object_Call_Method_Boolean_0011
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0011 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1200
     * @tc.name        test_Object_Call_Method_Boolean_0012
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0012 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1300
     * @tc.name        test_Object_Call_Method_Boolean_0013
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0013 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1400
     * @tc.name        test_Object_Call_Method_Boolean_0014
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0014 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOLEAN_1500
     * @tc.name        test_Object_Call_Method_Boolean_0015
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_0015 done');
      done();
      console.log('test_Object_Call_Method_Boolean_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0100
     * @tc.name        test_Object_Call_Method_Byte_0001
     * @tc.desc        object call method byte a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0001 done');
      done();
      console.log('test_Object_Call_Method_Byte_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0200
     * @tc.name        test_Object_Call_Method_Byte_0002
     * @tc.desc        object call method byte v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0002 done');
      done();
      console.log('test_Object_Call_Method_Byte_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0300
     * @tc.name        test_Object_Call_Method_Byte_0003
     * @tc.desc        object call method byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0003 done');
      done();
      console.log('test_Object_Call_Method_Byte_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0400
     * @tc.name        test_Object_Call_Method_Byte_0004
     * @tc.desc        call method byte v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0004 done');
      done();
      console.log('test_Object_Call_Method_Byte_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0500
     * @tc.name        test_Object_Call_Method_Byte_0005
     * @tc.desc        call method byte v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0005 done');
      done();
      console.log('test_Object_Call_Method_Byte_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0600
     * @tc.name        test_Object_Call_Method_Byte_0006
     * @tc.desc        call method byte v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0006 done');
      done();
      console.log('test_Object_Call_Method_Byte_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0700
     * @tc.name        test_Object_Call_Method_Byte_0007
     * @tc.desc        call method byte v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0007 done');
      done();
      console.log('test_Object_Call_Method_Byte_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0800
     * @tc.name        test_Object_Call_Method_Byte_0008
     * @tc.desc        call method byte a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0008 done');
      done();
      console.log('test_Object_Call_Method_Byte_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_0900
     * @tc.name        test_Object_Call_Method_Byte_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0009 done');
      done();
      console.log('test_Object_Call_Method_Byte_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1000
     * @tc.name        test_Object_Call_Method_Byte_0010
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0010 done');
      done();
      console.log('test_Object_Call_Method_Byte_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1100
     * @tc.name        test_Object_Call_Method_Byte_0011
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0011 done');
      done();
      console.log('test_Object_Call_Method_Byte_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1200
     * @tc.name        test_Object_Call_Method_Byte_0012
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0012 done');
      done();
      console.log('test_Object_Call_Method_Byte_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1300
     * @tc.name        test_Object_Call_Method_Byte_0013
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0013 done');
      done();
      console.log('test_Object_Call_Method_Byte_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1400
     * @tc.name        test_Object_Call_Method_Byte_0014
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0014 done');
      done();
      console.log('test_Object_Call_Method_Byte_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1500
     * @tc.name        test_Object_Call_Method_Byte_0015
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0015 done');
      done();
      console.log('test_Object_Call_Method_Byte_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_1600
     * @tc.name        test_Object_Call_Method_Byte_0016
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_0016 done');
      done();
      console.log('test_Object_Call_Method_Byte_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0100
     * @tc.name        test_Object_Call_Method_Char_0001
     * @tc.desc        object call method char a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0001 done');
      done();
      console.log('test_Object_Call_Method_Char_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0200
     * @tc.name        test_Object_Call_Method_Char_0002
     * @tc.desc        call method char a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0002 done');
      done();
      console.log('test_Object_Call_Method_Char_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0300
     * @tc.name        test_Object_Call_Method_Char_0003
     * @tc.desc        object call method char v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0003 done');
      done();
      console.log('test_Object_Call_Method_Char_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0400
     * @tc.name        test_Object_Call_Method_Char_0004
     * @tc.desc        object call method char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0004 done');
      done();
      console.log('test_Object_Call_Method_Char_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0500
     * @tc.name        test_Object_Call_Method_Char_0005
     * @tc.desc        call method char v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0005 done');
      done();
      console.log('test_Object_Call_Method_Char_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0600
     * @tc.name        test_Object_Call_Method_Char_0006
     * @tc.desc        call method char v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0006 done');
      done();
      console.log('test_Object_Call_Method_Char_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0700
     * @tc.name        test_Object_Call_Method_Char_0007
     * @tc.desc        call method char v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0007 done');
      done();
      console.log('test_Object_Call_Method_Char_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0800
     * @tc.name        test_Object_Call_Method_Char_0008
     * @tc.desc        call method char v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0008 done');
      done();
      console.log('test_Object_Call_Method_Char_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_0900
     * @tc.name        test_Object_Call_Method_Char_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0009 done');
      done();
      console.log('test_Object_Call_Method_Char_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1000
     * @tc.name        test_Object_Call_Method_Char_0010
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0010 done');
      done();
      console.log('test_Object_Call_Method_Char_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1100
     * @tc.name        test_Object_Call_Method_Char_0011
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0011 done');
      done();
      console.log('test_Object_Call_Method_Char_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1200
     * @tc.name        test_Object_Call_Method_Char_0012
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0012 done');
      done();
      console.log('test_Object_Call_Method_Char_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1300
     * @tc.name        test_Object_Call_Method_Char_0013
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0013 done');
      done();
      console.log('test_Object_Call_Method_Char_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1400
     * @tc.name        test_Object_Call_Method_Char_0014
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0014 done');
      done();
      console.log('test_Object_Call_Method_Char_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1500
     * @tc.name        test_Object_Call_Method_Char_0015
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0015 done');
      done();
      console.log('test_Object_Call_Method_Char_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_1600
     * @tc.name        test_Object_Call_Method_Char_0016
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_0016 done');
      done();
      console.log('test_Object_Call_Method_Char_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0100
     * @tc.name        test_Object_Call_Method_Double_0001
     * @tc.desc        object call method double a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0001 done');
      done();
      console.log('test_Object_Call_Method_Double_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0200
     * @tc.name        test_Object_Call_Method_Double_0002
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0002 done');
      done();
      console.log('test_Object_Call_Method_Double_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0300
     * @tc.name        test_Object_Call_Method_Double_0003
     * @tc.desc        object call method double v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0003 done');
      done();
      console.log('test_Object_Call_Method_Double_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0400
     * @tc.name        test_Object_Call_Method_Double_0004
     * @tc.desc        object call method double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0004 done');
      done();
      console.log('test_Object_Call_Method_Double_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0500
     * @tc.name        test_Object_Call_Method_Double_0005
     * @tc.desc        call method double v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0005 done');
      done();
      console.log('test_Object_Call_Method_Double_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0600
     * @tc.name        test_Object_Call_Method_Double_0006
     * @tc.desc        call method double v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0006 done');
      done();
      console.log('test_Object_Call_Method_Double_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0700
     * @tc.name        test_Object_Call_Method_Double_0007
     * @tc.desc        call method double v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0007 done');
      done();
      console.log('test_Object_Call_Method_Double_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0800
     * @tc.name        test_Object_Call_Method_Double_0008
     * @tc.desc        call method double a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0008 done');
      done();
      console.log('test_Object_Call_Method_Double_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_0900
     * @tc.name        test_Object_Call_Method_Double_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0009 done');
      done();
      console.log('test_Object_Call_Method_Double_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1000
     * @tc.name        test_Object_Call_Method_Double_0010
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0010 done');
      done();
      console.log('test_Object_Call_Method_Double_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1100
     * @tc.name        test_Object_Call_Method_Double_0011
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0011 done');
      done();
      console.log('test_Object_Call_Method_Double_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1200
     * @tc.name        test_Object_Call_Method_Double_0012
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0012 done');
      done();
      console.log('test_Object_Call_Method_Double_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1300
     * @tc.name        test_Object_Call_Method_Double_0013
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0013 done');
      done();
      console.log('test_Object_Call_Method_Double_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1400
     * @tc.name        test_Object_Call_Method_Double_0014
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0014 done');
      done();
      console.log('test_Object_Call_Method_Double_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1500
     * @tc.name        test_Object_Call_Method_Double_0015
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0015 done');
      done();
      console.log('test_Object_Call_Method_Double_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_1600
     * @tc.name        test_Object_Call_Method_Double_0016
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_0016 done');
      done();
      console.log('test_Object_Call_Method_Double_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0100
     * @tc.name        test_Object_Call_Method_Float_0001
     * @tc.desc        object call method float a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0001 done');
      done();
      console.log('test_Object_Call_Method_Float_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0200
     * @tc.name        test_Object_Call_Method_Float_0002
     * @tc.desc        object call method float v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0002 done');
      done();
      console.log('test_Object_Call_Method_Float_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0300
     * @tc.name        test_Object_Call_Method_Float_0003
     * @tc.desc        object call method float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0003 done');
      done();
      console.log('test_Object_Call_Method_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0400
     * @tc.name        test_Object_Call_Method_Float_0004
     * @tc.desc        object call method float v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0004 done');
      done();
      console.log('test_Object_Call_Method_Float_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0500
     * @tc.name        test_Object_Call_Method_Float_0005
     * @tc.desc        call method float v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0005 done');
      done();
      console.log('test_Object_Call_Method_Float_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0600
     * @tc.name        test_Object_Call_Method_Float_0006
     * @tc.desc        call method float v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0006 done');
      done();
      console.log('test_Object_Call_Method_Float_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0700
     * @tc.name        test_Object_Call_Method_Float_0007
     * @tc.desc        call method float v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0007 done');
      done();
      console.log('test_Object_Call_Method_Float_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0800
     * @tc.name        test_Object_Call_Method_Float_0008
     * @tc.desc        call method float a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0008 done');
      done();
      console.log('test_Object_Call_Method_Float_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_0900
     * @tc.name        test_Object_Call_Method_Float_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0009 done');
      done();
      console.log('test_Object_Call_Method_Float_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1000
     * @tc.name        test_Object_Call_Method_Float_0010
     * @tc.desc        object call method float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0003 done');
      done();
      console.log('test_Object_Call_Method_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1100
     * @tc.name        test_Object_Call_Method_Float_0011
     * @tc.desc        ocall parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0011 done');
      done();
      console.log('test_Object_Call_Method_Float_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1200
     * @tc.name        test_Object_Call_Method_Float_0012
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0012 done');
      done();
      console.log('test_Object_Call_Method_Float_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1300
     * @tc.name        test_Object_Call_Method_Float_0013
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0013 done');
      done();
      console.log('test_Object_Call_Method_Float_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1400
     * @tc.name        test_Object_Call_Method_Float_0014
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0014 done');
      done();
      console.log('test_Object_Call_Method_Float_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1500
     * @tc.name        test_Object_Call_Method_Float_0015
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0015 done');
      done();
      console.log('test_Object_Call_Method_Float_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_1600
     * @tc.name        test_Object_Call_Method_Float_0016
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_0016 done');
      done();
      console.log('test_Object_Call_Method_Float_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0100
     * @tc.name        test_Object_Call_Method_Int_0001
     * @tc.desc        object call method int a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0001 done');
      done();
      console.log('test_Object_Call_Method_Int_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0200
     * @tc.name        test_Object_Call_Method_Int_0002
     * @tc.desc        object call method int v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0002 done');
      done();
      console.log('test_Object_Call_Method_Int_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0300
     * @tc.name        test_Object_Call_Method_Int_0003
     * @tc.desc        object call method int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0003 done');
      done();
      console.log('test_Object_Call_Method_Int_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0400
     * @tc.name        test_Object_Call_Method_Int_0004
     * @tc.desc        call method int v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0004 done');
      done();
      console.log('test_Object_Call_Method_Int_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0500
     * @tc.name        test_Object_Call_Method_Int_0005
     * @tc.desc        call method int v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0005 done');
      done();
      console.log('test_Object_Call_Method_Int_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0600
     * @tc.name        test_Object_Call_Method_Int_0006
     * @tc.desc        call method int v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0006 done');
      done();
      console.log('test_Object_Call_Method_Int_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0700
     * @tc.name        test_Object_Call_Method_Int_0007
     * @tc.desc        call method int v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0007 done');
      done();
      console.log('test_Object_Call_Method_Int_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0800
     * @tc.name        test_Object_Call_Method_Int_0008
     * @tc.desc        call method int a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0008 done');
      done();
      console.log('test_Object_Call_Method_Int_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_0900
     * @tc.name        test_Object_Call_Method_Int_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0009 done');
      done();
      console.log('test_Object_Call_Method_Int_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1000
     * @tc.name        test_Object_Call_Method_Int_0010
     * @tc.desc        call method int a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0010 done');
      done();
      console.log('test_Object_Call_Method_Int_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1100
     * @tc.name        test_Object_Call_Method_Int_0011
     * @tc.desc        call method int a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0011 done');
      done();
      console.log('test_Object_Call_Method_Int_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1200
     * @tc.name        test_Object_Call_Method_Int_0012
     * @tc.desc        call method int a invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0012 done');
      done();
      console.log('test_Object_Call_Method_Int_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1300
     * @tc.name        test_Object_Call_Method_Int_0013
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0013 done');
      done();
      console.log('test_Object_Call_Method_Int_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1400
     * @tc.name        test_Object_Call_Method_Int_0014
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0014 done');
      done();
      console.log('test_Object_Call_Method_Int_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1500
     * @tc.name        test_Object_Call_Method_Int_0015
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0015 done');
      done();
      console.log('test_Object_Call_Method_Int_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1600
     * @tc.name        test_Object_Call_Method_Int_0016
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0016 done');
      done();
      console.log('test_Object_Call_Method_Int_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1700
     * @tc.name        test_Object_Call_Method_Int_0017
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0017 done');
      done();
      console.log('test_Object_Call_Method_Int_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1800
     * @tc.name        test_Object_Call_Method_Int_0018
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0018 done');
      done();
      console.log('test_Object_Call_Method_Int_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_1900
     * @tc.name        test_Object_Call_Method_Int_0019
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_0019 done');
      done();
      console.log('test_Object_Call_Method_Int_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0100
     * @tc.name        test_Object_Call_Method_Long_0001
     * @tc.desc        object call method long a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0001 done');
      done();
      console.log('test_Object_Call_Method_Long_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0200
     * @tc.name        test_Object_Call_Method_Long_0002
     * @tc.desc        object call method long v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0002 done');
      done();
      console.log('test_Object_Call_Method_Long_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0300
     * @tc.name        test_Object_Call_Method_Long_0003
     * @tc.desc        call method long v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0003 done');
      done();
      console.log('test_Object_Call_Method_Long_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0400
     * @tc.name        test_Object_Call_Method_Long_0004
     * @tc.desc        call method long v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0004 done');
      done();
      console.log('test_Object_Call_Method_Long_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0500
     * @tc.name        test_Object_Call_Method_Long_0005
     * @tc.desc        call method long v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0005 done');
      done();
      console.log('test_Object_Call_Method_Long_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0600
     * @tc.name        test_Object_Call_Method_Long_0006
     * @tc.desc        call method long v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0006 done');
      done();
      console.log('test_Object_Call_Method_Long_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0700
     * @tc.name        test_Object_Call_Method_Long_0007
     * @tc.desc        call method long a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0007 done');
      done();
      console.log('test_Object_Call_Method_Long_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0800
     * @tc.name        test_Object_Call_Method_Long_0008
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0008 done');
      done();
      console.log('test_Object_Call_Method_Long_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_0900
     * @tc.name        test_Object_Call_Method_Long_0009
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0009 done');
      done();
      console.log('test_Object_Call_Method_Long_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1000
     * @tc.name        test_Object_Call_Method_Long_0010
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0010 done');
      done();
      console.log('test_Object_Call_Method_Long_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1100
     * @tc.name        test_Object_Call_Method_Long_0011
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0011 done');
      done();
      console.log('test_Object_Call_Method_Long_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1200
     * @tc.name        test_Object_Call_Method_Long_0012
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0012 done');
      done();
      console.log('test_Object_Call_Method_Long_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1300
     * @tc.name        test_Object_Call_Method_Long_0013
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0013 done');
      done();
      console.log('test_Object_Call_Method_Long_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1400
     * @tc.name        test_Object_Call_Method_Long_0014
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0014 done');
      done();
      console.log('test_Object_Call_Method_Long_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_1500
     * @tc.name        test_Object_Call_Method_Long_0015
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_0015 done');
      done();
      console.log('test_Object_Call_Method_Long_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0100
     * @tc.name        test_Object_Call_Method_Short_0001
     * @tc.desc        object call method short a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0001 done');
      done();
      console.log('test_Object_Call_Method_Short_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0200
     * @tc.name        test_Object_Call_Method_Short_0002
     * @tc.desc        object call method short v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0002 done');
      done();
      console.log('test_Object_Call_Method_Short_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0300
     * @tc.name        test_Object_Call_Method_Short_0003
     * @tc.desc        object call method short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0003 done');
      done();
      console.log('test_Object_Call_Method_Short_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0400
     * @tc.name        test_Object_Call_Method_Short_0004
     * @tc.desc        call method short v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0004 done');
      done();
      console.log('test_Object_Call_Method_Short_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0500
     * @tc.name        test_Object_Call_Method_Short_0005
     * @tc.desc        call method short v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0005 done');
      done();
      console.log('test_Object_Call_Method_Short_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0600
     * @tc.name        test_Object_Call_Method_Short_0006
     * @tc.desc        call method short v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0006 done');
      done();
      console.log('test_Object_Call_Method_Short_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0700
     * @tc.name        test_Object_Call_Method_Short_0007
     * @tc.desc        call method short v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0007 done');
      done();
      console.log('test_Object_Call_Method_Short_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0800
     * @tc.name        test_Object_Call_Method_Short_0008
     * @tc.desc        call method short a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0008 done');
      done();
      console.log('test_Object_Call_Method_Short_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_0900
     * @tc.name        test_Object_Call_Method_Short_0009
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0009 done');
      done();
      console.log('test_Object_Call_Method_Short_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1000
     * @tc.name        test_Object_Call_Method_Short_0010
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0010 done');
      done();
      console.log('test_Object_Call_Method_Short_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1100
     * @tc.name        test_Object_Call_Method_Short_0011
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0011 done');
      done();
      console.log('test_Object_Call_Method_Short_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1200
     * @tc.name        test_Object_Call_Method_Short_0012
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0012 done');
      done();
      console.log('test_Object_Call_Method_Short_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1300
     * @tc.name        test_Object_Call_Method_Short_0013
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0013 done');
      done();
      console.log('test_Object_Call_Method_Short_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1400
     * @tc.name        test_Object_Call_Method_Short_0014
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0014 done');
      done();
      console.log('test_Object_Call_Method_Short_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1500
     * @tc.name        test_Object_Call_Method_Short_0015
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0015 done');
      done();
      console.log('test_Object_Call_Method_Short_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_1600
     * @tc.name        test_Object_Call_Method_Short_0016
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_0016 done');
      done();
      console.log('test_Object_Call_Method_Short_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0100
     * @tc.name        test_Object_Call_Method_Void_0001
     * @tc.desc        object call method void a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0001 done');
      done();
      console.log('test_Object_Call_Method_Void_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0200
     * @tc.name        test_Object_Call_Method_Void_0002
     * @tc.desc        object call method void v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0002 done');
      done();
      console.log('test_Object_Call_Method_Void_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0300
     * @tc.name        test_Object_Call_Method_Void_0003
     * @tc.desc        object call method void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0003 done');
      done();
      console.log('test_Object_Call_Method_Void_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0400
     * @tc.name        test_Object_Call_Method_Void_0004
     * @tc.desc        call method void v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0004 done');
      done();
      console.log('test_Object_Call_Method_Void_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0500
     * @tc.name        test_Object_Call_Method_Void_0005
     * @tc.desc        call_method void v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0005 done');
      done();
      console.log('test_Object_Call_Method_Void_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0600
     * @tc.name        test_Object_Call_Method_Void_0006
     * @tc.desc        call method void v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0006 done');
      done();
      console.log('test_Object_Call_Method_Void_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0700
     * @tc.name        test_Object_Call_Method_Void_0007
     * @tc.desc        call method void a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0007 done');
      done();
      console.log('test_Object_Call_Method_Void_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0800
     * @tc.name        test_Object_Call_Method_Void_0008
     * @tc.desc        call method void a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0008 done');
      done();
      console.log('test_Object_Call_Method_Void_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_0900
     * @tc.name        test_Object_Call_Method_Void_0009
     * @tc.desc        call method void a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0009 done');
      done();
      console.log('test_Object_Call_Method_Void_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1000
     * @tc.name        test_Object_Call_Method_Void_0010
     * @tc.desc        call method void invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0010 done');
      done();
      console.log('test_Object_Call_Method_Void_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1100
     * @tc.name        test_Object_Call_Method_Void_0011
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0011 done');
      done();
      console.log('test_Object_Call_Method_Void_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1200
     * @tc.name        test_Object_Call_Method_Void_0012
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0012 done');
      done();
      console.log('test_Object_Call_Method_Void_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1300
     * @tc.name        test_Object_Call_Method_Void_0013
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0013 done');
      done();
      console.log('test_Object_Call_Method_Void_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1400
     * @tc.name        test_Object_Call_Method_Void_0014
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0014 done');
      done();
      console.log('test_Object_Call_Method_Void_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1500
     * @tc.name        test_Object_Call_Method_Void_0015
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0015 done');
      done();
      console.log('test_Object_Call_Method_Void_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1600
     * @tc.name        test_Object_Call_Method_Void_0016
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0016 done');
      done();
      console.log('test_Object_Call_Method_Void_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1700
     * @tc.name        test_Object_Call_Method_Void_0017
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0017 done');
      done();
      console.log('test_Object_Call_Method_Void_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_1800
     * @tc.name        test_Object_Call_Method_Void_0018
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_0018 done');
      done();
      console.log('test_Object_Call_Method_Void_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0100
     * @tc.name        test_Object_Call_Method_Ref_0001
     * @tc.desc        call method ref a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0001 done');
      done();
      console.log('test_Object_Call_Method_Ref_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0200
     * @tc.name        test_Object_Call_Method_Ref_0002
     * @tc.desc        call method ref v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0002 done');
      done();
      console.log('test_Object_Call_Method_Ref_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0300
     * @tc.name        test_Object_Call_Method_Ref_0003
     * @tc.desc        call method ref v invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0003 done');
      done();
      console.log('test_Object_Call_Method_Ref_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0400
     * @tc.name        test_Object_Call_Method_Ref_0004
     * @tc.desc        call method ref v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0004 done');
      done();
      console.log('test_Object_Call_Method_Ref_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0500
     * @tc.name        test_Object_Call_Method_Ref_0005
     * @tc.desc        call method ref v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0005 done');
      done();
      console.log('test_Object_Call_Method_Ref_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0600
     * @tc.name        test_Object_Call_Method_Ref_0006
     * @tc.desc        call method ref v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0006 done');
      done();
      console.log('test_Object_Call_Method_Ref_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0700
     * @tc.name        test_Object_Call_Method_Ref_0007
     * @tc.desc        call method ref a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0007 done');
      done();
      console.log('test_Object_Call_Method_Ref_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0800
     * @tc.name        test_Object_Call_Method_Ref_0008
     * @tc.desc        call void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0008 done');
      done();
      console.log('test_Object_Call_Method_Ref_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_0900
     * @tc.name        test_Object_Call_Method_Ref_0009
     * @tc.desc        call multiple param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0009 done');
      done();
      console.log('test_Object_Call_Method_Ref_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1000
     * @tc.name        test_Object_Call_Method_Ref_0010
     * @tc.desc        call parent class void param method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0010 done');
      done();
      console.log('test_Object_Call_Method_Ref_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1100
     * @tc.name        test_Object_Call_Method_Ref_0011
     * @tc.desc        call parent class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0011 done');
      done();
      console.log('test_Object_Call_Method_Ref_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1200
     * @tc.name        test_Object_Call_Method_Ref_0012
     * @tc.desc        call sub class method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0012 done');
      done();
      console.log('test_Object_Call_Method_Ref_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1300
     * @tc.name        test_Object_Call_Method_Ref_0013
     * @tc.desc        multiple call method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0013 done');
      done();
      console.log('test_Object_Call_Method_Ref_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1400
     * @tc.name        test_Object_Call_Method_Ref_0014
     * @tc.desc        call nested method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0014 done');
      done();
      console.log('test_Object_Call_Method_Ref_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_1500
     * @tc.name        test_Object_Call_Method_Ref_0015
     * @tc.desc        call recursion method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_0015 done');
      done();
      console.log('test_Object_Call_Method_Ref_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0001
     * @tc.desc        object call method boolean a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0002
     * @tc.desc        object call method boolean v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0003
     * @tc.desc        object call method boolean v abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0004
     * @tc.desc        object call method boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0005
     * @tc.desc        call method boolean v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0006
     * @tc.desc        call method boolean v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0007
     * @tc.desc        call method_boolean v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0008
     * @tc.desc        call method boolean a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0009
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0010
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0011
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0012
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0013
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0014
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0015
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0016
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0017
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0018
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0019
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0020
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BOOL_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Boolean_By_Name_0021
     * @tc.desc        call method by name boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Boolean_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Boolean_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Boolean_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Boolean_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Boolean_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0001
     * @tc.desc        call method byte a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0002
     * @tc.desc        call method byte v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0003
     * @tc.desc        object call method byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0004
     * @tc.desc        object call method byte v abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0005
     * @tc.desc        call method byte v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0006
     * @tc.desc        object call method byte v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0007
     * @tc.desc        call method byte v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0008
     * @tc.desc        call method byte a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0009
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0010
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0011
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0012
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0013
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0014
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0015
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0016
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0017
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0018
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0019
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0020
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_BYTE_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Byte_By_Name_0021
     * @tc.desc        object call method by name byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Byte_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Byte_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Byte_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Byte_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Byte_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Char_By_Name_0001
     * @tc.desc        call method char a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Char_By_Name_0002
     * @tc.desc        call method char v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Char_By_Name_0003
     * @tc.desc        object call method char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Char_By_Name_0004
     * @tc.desc        object call method char v abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Char_By_Name_0005
     * @tc.desc        call method char v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Char_By_Name_0006
     * @tc.desc        object call method char v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Char_By_Name_0007
     * @tc.desc        call method char v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Char_By_Name_0008
     * @tc.desc        call method char a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Char_By_Name_0009
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Char_By_Name_0010
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Char_By_Name_0011
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Char_By_Name_0012
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Char_By_Name_0013
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Char_By_Name_0014
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Char_By_Name_0015
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Char_By_Name_0016
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Char_By_Name_0017
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Char_By_Name_0018
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Char_By_Name_0019
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Char_By_Name_0020
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_CHAR_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Char_By_Name_0021
     * @tc.desc        object call method by name char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Char_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Char_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Char_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Char_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Char_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Double_By_Name_0001
     * @tc.desc        call method by name double a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Double_By_Name_0002
     * @tc.desc        call method by name double a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Double_By_Name_0003
     * @tc.desc        call method by name double a abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Double_By_Name_0004
     * @tc.desc        call method by name double a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Double_By_Name_0005
     * @tc.desc        call method by name double a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Double_By_Name_0006
     * @tc.desc        call method by name double a invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Double_By_Name_0007
     * @tc.desc        call method by name double a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Double_By_Name_0008
     * @tc.desc        call method by name double normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Double_By_Name_0009
     * @tc.desc        call method by name double normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Double_By_Name_0010
     * @tc.desc        call method by name double abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Double_By_Name_0011
     * @tc.desc        call method by name double invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Double_By_Name_0012
     * @tc.desc        call method by name double invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Double_By_Name_0013
     * @tc.desc        call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Double_By_Name_0014
     * @tc.desc        call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Double_By_Name_0015
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Double_By_Name_0016
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Double_By_Name_0017
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Double_By_Name_0018
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Double_By_Name_0019
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Double_By_Name_0020
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Double_By_Name_0021
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Double_By_Name_0022
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2300
     * @tc.name        test_Object_Call_Method_Double_By_Name_0023
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0023 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_23();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0023 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0023 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2400
     * @tc.name        test_Object_Call_Method_Double_By_Name_0024
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0024 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_24();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0024 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0024 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2500
     * @tc.name        test_Object_Call_Method_Double_By_Name_0025
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0025 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_25();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0025 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0025 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2600
     * @tc.name        test_Object_Call_Method_Double_By_Name_0026
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0026 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_26();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0026 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0026 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_DOUBLE_BY_NAME_2700
     * @tc.name        test_Object_Call_Method_Double_By_Name_0027
     * @tc.desc        object call method by name double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Double_By_Name_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Double_By_Name_0027 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Double_By_Name_27();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Double_By_Name_0027 done');
      done();
      console.log('test_Object_Call_Method_Double_By_Name_0027 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Float_By_Name_0001
     * @tc.desc        call method by name float a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Float_By_Name_0002
     * @tc.desc        call method by name float a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Float_By_Name_0003
     * @tc.desc        call method by name float a abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Float_By_Name_0004
     * @tc.desc        call method by name float a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Float_By_Name_0005
     * @tc.desc        call method by name float a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Float_By_Name_0006
     * @tc.desc        call method by name float a invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Float_By_Name_0007
     * @tc.desc        call method by name float a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Float_By_Name_0008
     * @tc.desc        call method by name float normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Float_By_Name_0009
     * @tc.desc        call method by name float normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Float_By_Name_0010
     * @tc.desc        call method by name float abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Float_By_Name_0011
     * @tc.desc        call method by name float invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Float_By_Name_0012
     * @tc.desc        call method by name float invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Float_By_Name_0013
     * @tc.desc        call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Float_By_Name_0014
     * @tc.desc        call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Float_By_Name_0015
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Float_By_Name_0016
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Float_By_Name_0017
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Float_By_Name_0018
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Float_By_Name_0019
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Float_By_Name_0020
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Float_By_Name_0021
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Float_By_Name_0022
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2300
     * @tc.name        test_Object_Call_Method_Float_By_Name_0023
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0023 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_23();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0023 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0023 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2400
     * @tc.name        test_Object_Call_Method_Float_By_Name_0024
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0024 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_24();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0024 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0024 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2500
     * @tc.name        test_Object_Call_Method_Float_By_Name_0025
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0025 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_25();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0025 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0025 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2600
     * @tc.name        test_Object_Call_Method_Float_By_Name_0026
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0026 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_26();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0026 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0026 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_FLOAT_BY_NAME_2700
     * @tc.name        test_Object_Call_Method_Float_By_Name_0027
     * @tc.desc        object call method by name float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Float_By_Name_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Float_By_Name_0027 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Float_By_Name_27();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Float_By_Name_0027 done');
      done();
      console.log('test_Object_Call_Method_Float_By_Name_0027 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Int_By_Name_0001
     * @tc.desc        object call method int a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Int_By_Name_0002
     * @tc.desc        object call method int v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Int_By_Name_0003
     * @tc.desc        object call method int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Int_By_Name_0004
     * @tc.desc        call method int v abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Int_By_Name_0005
     * @tc.desc        call method int v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Int_By_Name_0006
     * @tc.desc        call method int v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Int_By_Name_0007
     * @tc.desc        call method int v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Int_By_Name_0008
     * @tc.desc        object call method int a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Int_By_Name_0009
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Int_By_Name_0010
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Int_By_Name_0011
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Int_By_Name_0012
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Int_By_Name_0013
     * @tc.desc        call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Int_By_Name_0014
     * @tc.desc        call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Int_By_Name_0015
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Int_By_Name_0016
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Int_By_Name_0017
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Int_By_Name_0018
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Int_By_Name_0019
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Int_By_Name_0020
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Int_By_Name_0021
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_INT_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Int_By_Name_0022
     * @tc.desc        object call method by name int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Int_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Int_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Int_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Int_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Int_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Long_By_Name_0001
     * @tc.desc        call method by name long a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Long_By_Name_0002
     * @tc.desc        call method by name long a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Long_By_Name_0003
     * @tc.desc        call method by name long a abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Long_By_Name_0004
     * @tc.desc        call method by name long a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Long_By_Name_0005
     * @tc.desc        call method by name long a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Long_By_Name_0006
     * @tc.desc        call method by name long a invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Long_By_Name_0007
     * @tc.desc        call method by name long a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Long_By_Name_0008
     * @tc.desc        call method by name long normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Long_By_Name_0009
     * @tc.desc        call method by name long normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Long_By_Name_0010
     * @tc.desc        call method by name long abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Long_By_Name_0011
     * @tc.desc        call method by name long invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Long_By_Name_0012
     * @tc.desc        call method by name long invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Long_By_Name_0013
     * @tc.desc        call method by name long invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Long_By_Name_0014
     * @tc.desc        call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Long_By_Name_0015
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Long_By_Name_0016
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Long_By_Name_0017
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Long_By_Name_0018
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Long_By_Name_0019
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Long_By_Name_0020
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Long_By_Name_0021
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Long_By_Name_0022
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2300
     * @tc.name        test_Object_Call_Method_Long_By_Name_0023
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0023 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_23();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0023 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0023 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2400
     * @tc.name        test_Object_Call_Method_Long_By_Name_0024
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0024 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_24();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0024 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0024 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2500
     * @tc.name        test_Object_Call_Method_Long_By_Name_0025
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0025 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_25();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0025 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0025 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2600
     * @tc.name        test_Object_Call_Method_Long_By_Name_0026
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0026 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_26();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0026 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0026 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_LONG_BY_NAME_2700
     * @tc.name        test_Object_Call_Method_Long_By_Name_0027
     * @tc.desc        object call method by name long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Long_By_Name_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Long_By_Name_0027 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Long_By_Name_27();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Long_By_Name_0027 done');
      done();
      console.log('test_Object_Call_Method_Long_By_Name_0027 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0001
     * @tc.desc        call method by name ref a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0002
     * @tc.desc        call method by name ref a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0003
     * @tc.desc        call method by name ref a abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0004
     * @tc.desc        call method by name ref a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0005
     * @tc.desc        call method by name ref a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0006
     * @tc.desc        call method by name ref a invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0007
     * @tc.desc        call method by name ref normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0008
     * @tc.desc        call method by name ref normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0009
     * @tc.desc        call method by name ref abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0010
     * @tc.desc        call method by name ref invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0011
     * @tc.desc        call method by name ref invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0012
     * @tc.desc        call method by name ref invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0013
     * @tc.desc        call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0014
     * @tc.desc        call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0015
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0016
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0017
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0018
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0019
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0020
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0021
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0022
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2300
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0023
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0023 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_23();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0023 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0023 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2400
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0024
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0024 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_24();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0024 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0024 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_REF_BY_NAME_2500
     * @tc.name        test_Object_Call_Method_Ref_By_Name_0025
     * @tc.desc        object call method by name ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Ref_By_Name_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Ref_By_Name_0025 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Ref_By_Name_25();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Ref_By_Name_0025 done');
      done();
      console.log('test_Object_Call_Method_Ref_By_Name_0025 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Short_By_Name_0001
     * @tc.desc        call method short a
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Short_By_Name_0002
     * @tc.desc        call method short v
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Short_By_Name_0003
     * @tc.desc        object call method short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Short_By_Name_0004
     * @tc.desc        call method short v abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Short_By_Name_0005
     * @tc.desc        call method short v invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Short_By_Name_0006
     * @tc.desc        call method short v invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Short_By_Name_0007
     * @tc.desc        call method short v invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Short_By_Name_0008
     * @tc.desc        call method short a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Short_By_Name_0009
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Short_By_Name_0010
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Short_By_Name_0011
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Short_By_Name_0012
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Short_By_Name_0013
     * @tc.desc        call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Short_By_Name_0014
     * @tc.desc        call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Short_By_Name_0015
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Short_By_Name_0016
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Short_By_Name_0017
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Short_By_Name_0018
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Short_By_Name_0019
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Short_By_Name_0020
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Short_By_Name_0021
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_SHORT_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Short_By_Name_0022
     * @tc.desc        object call method by name short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Short_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Short_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Short_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Short_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Short_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0100
     * @tc.name        test_Object_Call_Method_Void_By_Name_0001
     * @tc.desc        call method by name void a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_01();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0001 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0200
     * @tc.name        test_Object_Call_Method_Void_By_Name_0002
     * @tc.desc        call method by name void a normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_02();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0002 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0300
     * @tc.name        test_Object_Call_Method_Void_By_Name_0003
     * @tc.desc        call method by name void a abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_03();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0003 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0400
     * @tc.name        test_Object_Call_Method_Void_By_Name_0004
     * @tc.desc        call method by name void a invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_04();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0004 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0500
     * @tc.name        test_Object_Call_Method_Void_By_Name_0005
     * @tc.desc        call method by name void a invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_05();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0005 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0600
     * @tc.name        test_Object_Call_Method_Void_By_Name_0006
     * @tc.desc        call method by name void a invalid args
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_06();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0006 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0700
     * @tc.name        test_Object_Call_Method_Void_By_Name_0007
     * @tc.desc        call method by name void normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_07();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0007 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0800
     * @tc.name        test_Object_Call_Method_Void_By_Name_0008
     * @tc.desc        call method by name void normal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_08();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0008 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_0900
     * @tc.name        test_Object_Call_Method_Void_By_Name_0009
     * @tc.desc        call method by name void abnormal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_09();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0009 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1000
     * @tc.name        test_Object_Call_Method_Void_By_Name_0010
     * @tc.desc        call method by name void invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_10();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0010 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1100
     * @tc.name        test_Object_Call_Method_Void_By_Name_0011
     * @tc.desc        call method by name void invalid method
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0011 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_11();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0011 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0011 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1200
     * @tc.name        test_Object_Call_Method_Void_By_Name_0012
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0012 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_12();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0012 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0012 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1300
     * @tc.name        test_Object_Call_Method_Void_By_Name_0013
     * @tc.desc        call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0013 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_13();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0013 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0013 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1400
     * @tc.name        test_Object_Call_Method_Void_By_Name_0014
     * @tc.desc        call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0014 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_14();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0014 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0014 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1500
     * @tc.name        test_Object_Call_Method_Void_By_Name_0015
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0015 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_15();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0015 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0015 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1600
     * @tc.name        test_Object_Call_Method_Void_By_Name_0016
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0016 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_16();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0016 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0016 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1700
     * @tc.name        test_Object_Call_Method_Void_By_Name_0017
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0017 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_17();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0017 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0017 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1800
     * @tc.name        test_Object_Call_Method_Void_By_Name_0018
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0018 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_18();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0018 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0018 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_1900
     * @tc.name        test_Object_Call_Method_Void_By_Name_0019
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0019 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_19();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0019 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0019 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_2000
     * @tc.name        test_Object_Call_Method_Void_By_Name_0020
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0020 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_20();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0020 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0020 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_2100
     * @tc.name        test_Object_Call_Method_Void_By_Name_0021
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0021 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_21();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0021 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0021 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_2200
     * @tc.name        test_Object_Call_Method_Void_By_Name_0022
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0022 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_22();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0022 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0022 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_2300
     * @tc.name        test_Object_Call_Method_Void_By_Name_0023
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0023 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_23();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0023 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0023 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_CALL_METHOD_VOID_BY_NAME_2400
     * @tc.name        test_Object_Call_Method_Void_By_Name_0024
     * @tc.desc        object call method by name void
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Call_Method_Void_By_Name_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Call_Method_Void_By_Name_0024 start');
      let cls = new Foo();
      let result = cls.test_Object_Call_Method_Void_By_Name_24();
      expect(result).assertTrue();
      console.log('test_Object_Call_Method_Void_By_Name_0024 done');
      done();
      console.log('test_Object_Call_Method_Void_By_Name_0024 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0100
     * @tc.name        test_Object_Get_Field_Boolean_0001
     * @tc.desc        get field boolean
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0001 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0200
     * @tc.name        test_Object_Get_Field_Boolean_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0002 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0300
     * @tc.name        test_Object_Get_Field_Boolean_0003
     * @tc.desc        get field boolean invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0003 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0400
     * @tc.name        test_Object_Get_Field_Boolean_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0004 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0500
     * @tc.name        test_Object_Get_Field_Boolean_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0005 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BOOLEAN_0600
     * @tc.name        test_Object_Get_Field_Boolean_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Boolean_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Boolean_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Boolean_0006 done');
      done();
      console.log('test_Object_Get_Field_Boolean_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0100
     * @tc.name        test_Object_Get_Field_Byte_0001
     * @tc.desc        get field byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0001 done');
      done();
      console.log('test_Object_Get_Field_Byte_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0200
     * @tc.name        test_Object_Get_Field_Byte_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0002 done');
      done();
      console.log('test_Object_Get_Field_Byte_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0300
     * @tc.name        test_Object_Get_Field_Byte_0003
     * @tc.desc        get field byte invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0003 done');
      done();
      console.log('test_Object_Get_Field_Byte_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0400
     * @tc.name        test_Object_Get_Field_Byte_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0004 done');
      done();
      console.log('test_Object_Get_Field_Byte_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0500
     * @tc.name        test_Object_Get_Field_Byte_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0005 done');
      done();
      console.log('test_Object_Get_Field_Byte_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BYTE_0600
     * @tc.name        test_Object_Get_Field_Byte_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Byte_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Byte_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Byte_0006 done');
      done();
      console.log('test_Object_Get_Field_Byte_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0100
     * @tc.name        test_Object_Get_Field_Char_0001
     * @tc.desc        get field char
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0001 done');
      done();
      console.log('test_Object_Get_Field_Char_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0200
     * @tc.name        test_Object_Get_Field_Char_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0002 done');
      done();
      console.log('test_Object_Get_Field_Char_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0300
     * @tc.name        test_Object_Get_Field_Char_0003
     * @tc.desc        get field char invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0003 done');
      done();
      console.log('test_Object_Get_Field_Char_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0400
     * @tc.name        test_Object_Get_Field_Char_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0004 done');
      done();
      console.log('test_Object_Get_Field_Char_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0500
     * @tc.name        test_Object_Get_Field_Char_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0005 done');
      done();
      console.log('test_Object_Get_Field_Char_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_CHAR_0600
     * @tc.name        test_Object_Get_Field_Char_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Char_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Char_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Char_0006 done');
      done();
      console.log('test_Object_Get_Field_Char_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0100
     * @tc.name        test_Object_Get_Field_Double_0001
     * @tc.desc        get field double
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0001 done');
      done();
      console.log('test_Object_Get_Field_Double_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0200
     * @tc.name        test_Object_Get_Field_Double_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0002 done');
      done();
      console.log('test_Object_Get_Field_Double_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0300
     * @tc.name        test_Object_Get_Field_Double_0003
     * @tc.desc        get field double invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0003 done');
      done();
      console.log('test_Object_Get_Field_Double_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0400
     * @tc.name        test_Object_Get_Field_Double_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0004 done');
      done();
      console.log('test_Object_Get_Field_Double_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0500
     * @tc.name        test_Object_Get_Field_Double_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0005 done');
      done();
      console.log('test_Object_Get_Field_Double_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_DOUBLE_0600
     * @tc.name        test_Object_Get_Field_Double_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Double_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Double_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Double_0006 done');
      done();
      console.log('test_Object_Get_Field_Double_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0100
     * @tc.name        test_Object_Get_Field_Float_0001
     * @tc.desc        get field float
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0001 done');
      done();
      console.log('test_Object_Get_Field_Float_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0200
     * @tc.name        test_Object_Get_Field_Float_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0002 done');
      done();
      console.log('test_Object_Get_Field_Float_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0300
     * @tc.name        test_Object_Get_Field_Float_0003
     * @tc.desc        get field float invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0003 done');
      done();
      console.log('test_Object_Get_Field_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0400
     * @tc.name        test_Object_Get_Field_Float_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0004 done');
      done();
      console.log('test_Object_Get_Field_Float_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0500
     * @tc.name        test_Object_Get_Field_Float_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0005 done');
      done();
      console.log('test_Object_Get_Field_Float_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_FLOAT_0600
     * @tc.name        test_Object_Get_Field_Float_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Float_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Float_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Float_0006 done');
      done();
      console.log('test_Object_Get_Field_Float_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0100
     * @tc.name        test_Object_Get_Field_Int_0001
     * @tc.desc        get field int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0001 done');
      done();
      console.log('test_Object_Get_Field_Int_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0200
     * @tc.name        test_Object_Get_Field_Int_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0002 done');
      done();
      console.log('test_Object_Get_Field_Int_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0300
     * @tc.name        test_Object_Get_Field_Int_0003
     * @tc.desc        get field int invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0003 done');
      done();
      console.log('test_Object_Get_Field_Int_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0400
     * @tc.name        test_Object_Get_Field_Int_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0004 done');
      done();
      console.log('test_Object_Get_Field_Int_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0500
     * @tc.name        test_Object_Get_Field_Int_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0005 done');
      done();
      console.log('test_Object_Get_Field_Int_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_INT_0600
     * @tc.name        test_Object_Get_Field_Int_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Int_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Int_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Int_0006 done');
      done();
      console.log('test_Object_Get_Field_Int_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0100
     * @tc.name        test_Object_Get_Field_Long_0001
     * @tc.desc        get field long
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0001 done');
      done();
      console.log('test_Object_Get_Field_Long_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0200
     * @tc.name        test_Object_Get_Field_Long_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0002 done');
      done();
      console.log('test_Object_Get_Field_Long_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0300
     * @tc.name        test_Object_Get_Field_Long_0003
     * @tc.desc        get field long invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0003 done');
      done();
      console.log('test_Object_Get_Field_Long_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0400
     * @tc.name        test_Object_Get_Field_Long_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0004 done');
      done();
      console.log('test_Object_Get_Field_Long_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0500
     * @tc.name        test_Object_Get_Field_Long_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0005 done');
      done();
      console.log('test_Object_Get_Field_Long_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_LONG_0600
     * @tc.name        test_Object_Get_Field_Long_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Long_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Long_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Long_0006 done');
      done();
      console.log('test_Object_Get_Field_Long_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0100
     * @tc.name        test_Object_Get_Field_Short_0001
     * @tc.desc        get field short
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0001 done');
      done();
      console.log('test_Object_Get_Field_Short_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0200
     * @tc.name        test_Object_Get_Field_Short_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0002 done');
      done();
      console.log('test_Object_Get_Field_Short_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0300
     * @tc.name        test_Object_Get_Field_Short_0003
     * @tc.desc        get field short invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0003 done');
      done();
      console.log('test_Object_Get_Field_Short_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0400
     * @tc.name        test_Object_Get_Field_Short_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0004 done');
      done();
      console.log('test_Object_Get_Field_Short_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0500
     * @tc.name        test_Object_Get_Field_Short_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0005 done');
      done();
      console.log('test_Object_Get_Field_Short_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_SHORT_0600
     * @tc.name        test_Object_Get_Field_Short_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Short_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Short_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Short_0006 done');
      done();
      console.log('test_Object_Get_Field_Short_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_NEW_0100
     * @tc.name        Object_New_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_New_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('Object_New_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_New();
      expect(result).assertTrue();
      console.log('Object_New_0001 done');
      done();
      console.log('Object_New_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_REFERENCE_ISNULL_0100
     * @tc.name        Reference_IsNull_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_IsNull_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_IsNull_0001 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsNull();
        expect(result).assertTrue();
        console.log('Reference_IsNull_0001 done');
        done();
        console.log('Reference_IsNull_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_REFERENCE_ISUNDEFINED_0100
     * @tc.name        Reference_IsUndefined_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_IsUndefined_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_IsUndefined_0001 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsUndefined();
        expect(result).assertTrue();
        console.log('Reference_IsUndefined_0001 done');
        done();
        console.log('Reference_IsUndefined_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_REFERENCE_ISNULLISHVALUE_0100
     * @tc.name        Reference_IsNullishValue_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_IsNullishValue_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_IsNullishValue_0001 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsNullishValue();
        expect(result).assertTrue();
        console.log('Reference_IsNullishValue_0001 done');
        done();
        console.log('Reference_IsNullishValue_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_REFERENCE_EQUALS_0100
     * @tc.name        Reference_Equals_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Reference_Equals_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Reference_Equals_0001 start');
        let cls = new Foo();
        let result = cls.test_Reference_Equals();
        expect(result).assertTrue();
        console.log('Reference_Equals_0001 done');
        done();
        console.log('Reference_Equals_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ARRAY_NEW_0100
     * @tc.name        Array_New_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Array_New_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Array_New_0001 start');
        let cls = new Foo();
        let result = cls.test_Array_New();
        expect(result).assertTrue();
        console.log('Array_New_0001 done');
        done();
        console.log('Array_New_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_NEW_A_0100
     * @tc.name        Object_New_A_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_New_A_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_New_A_0001 start');
        let cls = new Foo();
        let result = cls.test_Object_New_A();
        expect(result).assertTrue();
        console.log('Object_New_A_0001 done');
        done();
        console.log('Object_New_A_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_NEW_V_0100
     * @tc.name        Object_New_V_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_New_V_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_New_V_0001 start');
        let cls = new Foo();
        let result = cls.test_Object_New_V();
        expect(result).assertTrue();
        console.log('Object_New_V_0001 done');
        done();
        console.log('Object_New_V_0001 end');
      })
  })
}