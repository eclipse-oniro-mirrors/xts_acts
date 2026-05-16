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

export default function callingInstanceMethodsTest() {

  describe("ActsCallingInstanceMethodsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_DOUBLE_0100
    * @tc.name        test_Object_CallMethod_Double_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Double_0100 done');
        done();
        console.log('test_Object_CallMethod_Double_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_DOUBLE_A_0100
    * @tc.name        test_Object_CallMethod_Double_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Double_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Double_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_DOUBLE_V_0100
    * @tc.name        test_Object_CallMethod_Double_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Double_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Double_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_INT_0100
    * @tc.name        test_Object_CallMethod_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Int_0100 done');
        done();
        console.log('test_Object_CallMethod_Int_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_INT_A_0100
    * @tc.name        test_Object_CallMethod_Int_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Int_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Int_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_INT_V_0100
    * @tc.name        test_Object_CallMethod_Int_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Int_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Int_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BOOLEAN_0100
    * @tc.name        test_Object_CallMethod_Boolean_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Boolean_0100 done');
        done();
        console.log('test_Object_CallMethod_Boolean_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BOOLEAN_A_0100
    * @tc.name        test_Object_CallMethod_Boolean_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Boolean_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Boolean_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BOOLEAN_V_0100
    * @tc.name        test_Object_CallMethod_Boolean_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Boolean_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Boolean_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_VOID_0100
    * @tc.name        test_Object_CallMethod_Void_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Void_0100 done');
        done();
        console.log('test_Object_CallMethod_Void_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_VOID_A_0100
    * @tc.name        test_Object_CallMethod_Void_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Void_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Void_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_VOID_V_0100
    * @tc.name        test_Object_CallMethod_Void_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Void_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Void_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_LONG_0100
    * @tc.name        test_Object_CallMethod_Long_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Long_0100 done');
        done();
        console.log('test_Object_CallMethod_Long_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_LONG_A_0100
    * @tc.name        test_Object_CallMethod_Long_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Long_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Long_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_LONG_V_0100
    * @tc.name        test_Object_CallMethod_Long_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Long_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Long_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_CHAR_0100
    * @tc.name        test_Object_CallMethod_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Char_0100 done');
        done();
        console.log('test_Object_CallMethod_Char_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_CHAR_A_0100
    * @tc.name        test_Object_CallMethod_Char_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Char_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Char_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_CHAR_V_0100
    * @tc.name        test_Object_CallMethod_Char_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Char_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Char_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BYTE_0100
    * @tc.name        test_Object_CallMethod_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Byte_0100 done');
        done();
        console.log('test_Object_CallMethod_Byte_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BYTE_A_0100
    * @tc.name        test_Object_CallMethod_Byte_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Byte_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Byte_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_BYTE_V_0100
    * @tc.name        test_Object_CallMethod_Byte_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Byte_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Byte_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_SHORT_0100
    * @tc.name        test_Object_CallMethod_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Short_0100 done');
        done();
        console.log('test_Object_CallMethod_Short_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_SHORT_A_0100
    * @tc.name        test_Object_CallMethod_Short_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Short_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Short_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_SHORT_V_0100
    * @tc.name        test_Object_CallMethod_Short_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Short_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Short_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_FLOAT_0100
    * @tc.name        test_Object_CallMethod_Float_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Float_0100 done');
        done();
        console.log('test_Object_CallMethod_Float_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_FLOAT_A_0100
    * @tc.name        test_Object_CallMethod_Float_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Float_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Float_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_FLOAT_V_0100
    * @tc.name        test_Object_CallMethod_Float_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Float_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Float_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_REF_0100
    * @tc.name        test_Object_CallMethod_Ref_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Ref_0100 done');
        done();
        console.log('test_Object_CallMethod_Ref_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_REF_A_0100
    * @tc.name        test_Object_CallMethod_Ref_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Ref_A_0100 done');
        done();
        console.log('test_Object_CallMethod_Ref_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHOD_REF_V_0100
    * @tc.name        test_Object_CallMethod_Ref_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethod_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethod_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethod_Ref_V_0100 done');
        done();
        console.log('test_Object_CallMethod_Ref_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BOOLEAN_0100
    * @tc.name        test_Object_CallMethodByName_Boolean_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Boolean_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Boolean_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BOOLEAN_A_0100
    * @tc.name        test_Object_CallMethodByName_Boolean_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Boolean_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Boolean_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BOOLEAN_V_0100
    * @tc.name        test_Object_CallMethodByName_Boolean_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Boolean_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Boolean_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_CHAR_0100
    * @tc.name        test_Object_CallMethodByName_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Char_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Char_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_CHAR_A_0100
    * @tc.name        test_Object_CallMethodByName_Char_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Char_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Char_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_CHAR_V_0100
    * @tc.name        test_Object_CallMethodByName_Char_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Char_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Char_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BYTE_0100
    * @tc.name        test_Object_CallMethodByName_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Byte_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Byte_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BYTE_A_0100
    * @tc.name        test_Object_CallMethodByName_Byte_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Byte_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Byte_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_BYTE_V_0100
    * @tc.name        test_Object_CallMethodByName_Byte_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Byte_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Byte_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_SHORT_0100
    * @tc.name        test_Object_CallMethodByName_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Short_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Short_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_SHORT_A_0100
    * @tc.name        test_Object_CallMethodByName_Short_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Short_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Short_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_SHORT_V_0100
    * @tc.name        test_Object_CallMethodByName_Short_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Short_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Short_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_INT_0100
    * @tc.name        test_Object_CallMethodByName_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Int_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Int_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_INT_A_0100
    * @tc.name        test_Object_CallMethodByName_Int_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Int_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Int_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_INT_V_0100
    * @tc.name        test_Object_CallMethodByName_Int_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Int_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Int_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_LONG_0100
    * @tc.name        test_Object_CallMethodByName_Long_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Long_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Long_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_LONG_A_0100
    * @tc.name        test_Object_CallMethodByName_Long_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Long_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Long_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_LONG_V_0100
    * @tc.name        test_Object_CallMethodByName_Long_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Long_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Long_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_FLOAT_0100
    * @tc.name        test_Object_CallMethodByName_Float_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Float_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Float_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_FLOAT_A_0100
    * @tc.name        test_Object_CallMethodByName_Float_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Float_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Float_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_FLOAT_V_0100
    * @tc.name        test_Object_CallMethodByName_Float_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Float_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Float_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_DOUBLE_0100
    * @tc.name        test_Object_CallMethodByName_Double_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Double_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Double_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_DOUBLE_A_0100
    * @tc.name        test_Object_CallMethodByName_Double_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Double_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Double_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_DOUBLE_V_0100
    * @tc.name        test_Object_CallMethodByName_Double_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Double_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Double_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_REF_0100
    * @tc.name        test_Object_CallMethodByName_Ref_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Ref_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Ref_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_REF_A_0100
    * @tc.name        test_Object_CallMethodByName_Ref_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Ref_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Ref_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_REF_V_0100
    * @tc.name        test_Object_CallMethodByName_Ref_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Ref_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Ref_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_VOID_0100
    * @tc.name        test_Object_CallMethodByName_Void_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Void_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Void_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_VOID_A_0100
    * @tc.name        test_Object_CallMethodByName_Void_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void_A();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Void_A_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Void_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_OBJECT_CALLMETHODBYNAME_VOID_V_0100
    * @tc.name        test_Object_CallMethodByName_Void_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Object_CallMethodByName_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Object_CallMethodByName_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void_V();
        expect(result).assertTrue();
        console.log('test_Object_CallMethodByName_Void_V_0100 done');
        done();
        console.log('test_Object_CallMethodByName_Void_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BOOLEAN_0100
    * @tc.name        test_Function_Call_Boolean_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean();
        expect(result).assertTrue();
        console.log('test_Function_Call_Boolean_0100 done');
        done();
        console.log('test_Function_Call_Boolean_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BOOLEAN_A_0100
    * @tc.name        test_Function_Call_Boolean_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Boolean_A_0100 done');
        done();
        console.log('test_Function_Call_Boolean_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BOOLEAN_V_0100
    * @tc.name        test_Function_Call_Boolean_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Boolean_V_0100 done');
        done();
        console.log('test_Function_Call_Boolean_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_CHAR_0100
    * @tc.name        test_Function_Call_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char();
        expect(result).assertTrue();
        console.log('test_Function_Call_Char_0100 done');
        done();
        console.log('test_Function_Call_Char_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_CHAR_A_0100
    * @tc.name        test_Function_Call_Char_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Char_A_0100 done');
        done();
        console.log('test_Function_Call_Char_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_CHAR_V_0100
    * @tc.name        test_Function_Call_Char_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Char_V_0100 done');
        done();
        console.log('test_Function_Call_Char_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BYTE_0100
    * @tc.name        test_Function_Call_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte();
        expect(result).assertTrue();
        console.log('test_Function_Call_Byte_0100 done');
        done();
        console.log('test_Function_Call_Byte_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BYTE_A_0100
    * @tc.name        test_Function_Call_Byte_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Byte_A_0100 done');
        done();
        console.log('test_Function_Call_Byte_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_BYTE_V_0100
    * @tc.name        test_Function_Call_Byte_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Byte_V_0100 done');
        done();
        console.log('test_Function_Call_Byte_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_SHORT_0100
    * @tc.name        test_Function_Call_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short();
        expect(result).assertTrue();
        console.log('test_Function_Call_Short_0100 done');
        done();
        console.log('test_Function_Call_Short_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_SHORT_A_0100
    * @tc.name        test_Function_Call_Short_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Short_A_0100 done');
        done();
        console.log('test_Function_Call_Short_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_SHORT_V_0100
    * @tc.name        test_Function_Call_Short_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Short_V_0100 done');
        done();
        console.log('test_Function_Call_Short_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_INT_0100
    * @tc.name        test_Function_Call_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int();
        expect(result).assertTrue();
        console.log('test_Function_Call_Int_0100 done');
        done();
        console.log('test_Function_Call_Int_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_INT_A_0100
    * @tc.name        test_Function_Call_Int_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Int_A_0100 done');
        done();
        console.log('test_Function_Call_Int_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_INT_V_0100
    * @tc.name        test_Function_Call_Int_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Int_V_0100 done');
        done();
        console.log('test_Function_Call_Int_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_LONG_0100
    * @tc.name        test_Function_Call_Long_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long();
        expect(result).assertTrue();
        console.log('test_Function_Call_Long_0100 done');
        done();
        console.log('test_Function_Call_Long_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_LONG_A_0100
    * @tc.name        test_Function_Call_Long_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Long_A_0100 done');
        done();
        console.log('test_Function_Call_Long_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_LONG_V_0100
    * @tc.name        test_Function_Call_Long_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Long_V_0100 done');
        done();
        console.log('test_Function_Call_Long_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_FLOAT_0100
    * @tc.name        test_Function_Call_Float_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float();
        expect(result).assertTrue();
        console.log('test_Function_Call_Float_0100 done');
        done();
        console.log('test_Function_Call_Float_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_FLOAT_A_0100
    * @tc.name        test_Function_Call_Float_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Float_A_0100 done');
        done();
        console.log('test_Function_Call_Float_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_FLOAT_V_0100
    * @tc.name        test_Function_Call_Float_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Float_V_0100 done');
        done();
        console.log('test_Function_Call_Float_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_DOUBLE_0100
    * @tc.name        test_Function_Call_Double_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double();
        expect(result).assertTrue();
        console.log('test_Function_Call_Double_0100 done');
        done();
        console.log('test_Function_Call_Double_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_DOUBLE_A_0100
    * @tc.name        test_Function_Call_Double_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Double_A_0100 done');
        done();
        console.log('test_Function_Call_Double_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_DOUBLE_V_0100
    * @tc.name        test_Function_Call_Double_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Double_V_0100 done');
        done();
        console.log('test_Function_Call_Double_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_REF_0100
    * @tc.name        test_Function_Call_Ref_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref();
        expect(result).assertTrue();
        console.log('test_Function_Call_Ref_0100 done');
        done();
        console.log('test_Function_Call_Ref_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_REF_A_0100
    * @tc.name        test_Function_Call_Ref_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Ref_A_0100 done');
        done();
        console.log('test_Function_Call_Ref_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_REF_V_0100
    * @tc.name        test_Function_Call_Ref_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Ref_V_0100 done');
        done();
        console.log('test_Function_Call_Ref_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_VOID_0100
    * @tc.name        test_Function_Call_Void_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void();
        expect(result).assertTrue();
        console.log('test_Function_Call_Void_0100 done');
        done();
        console.log('test_Function_Call_Void_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_VOID_A_0100
    * @tc.name        test_Function_Call_Void_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void_A();
        expect(result).assertTrue();
        console.log('test_Function_Call_Void_A_0100 done');
        done();
        console.log('test_Function_Call_Void_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTION_CALL_VOID_V_0100
    * @tc.name        test_Function_Call_Void_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Function_Call_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Function_Call_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void_V();
        expect(result).assertTrue();
        console.log('test_Function_Call_Void_V_0100 done');
        done();
        console.log('test_Function_Call_Void_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_FUNCTIONOBJECT_CALL_0100
    * @tc.name        test_FunctionalObject_Call_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_FunctionalObject_Call_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_FunctionalObject_Call_0100 start');
        let cls = new Foo();
        let result = cls.test_FunctionalObject_Call();
        expect(result).assertTrue();
        console.log('test_FunctionalObject_Call_0100 done');
        done();
        console.log('test_FunctionalObject_Call_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_MODULE_BINDNATIVEFUNCTIONS_0100
    * @tc.name        test_Module_BindNativeFunctions_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Module_BindNativeFunctions_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_BindNativeFunctions_0100 start');
        let cls = new Foo();
        let result = cls.test_Module_BindNativeFunctions();
        expect(result).assertTrue();
        console.log('test_Module_BindNativeFunctions_0100 done');
        done();
        console.log('test_Module_BindNativeFunctions_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_NAMESPACE_BINDNATIVEFUNCTIONS_0100
    * @tc.name        test_Namespace_BindNativeFunctions_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Namespace_BindNativeFunctions_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_BindNativeFunctions_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_BindNativeFunctions();
        expect(result).assertTrue();
        console.log('test_Namespace_BindNativeFunctions_0100 done');
        done();
        console.log('test_Namespace_BindNativeFunctions_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_CHAR_0100
    * @tc.name        test_Class_CallStaticMethod_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Char_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Char_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_CHAR_A_0100
    * @tc.name        test_Class_CallStaticMethod_Char_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char_A();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Char_A_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Char_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_CHAR_V_0100
    * @tc.name        test_Class_CallStaticMethod_Char_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char_V();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Char_V_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Char_V_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_BYTE_0100
    * @tc.name        test_Class_CallStaticMethod_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Byte_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Byte_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_BYTE_A_0100
    * @tc.name        test_Class_CallStaticMethod_Byte_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte_A();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Byte_A_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Byte_A_0100 end');
      })

    /**
    * @tc.number      SUB_ANI_CLASS_CALLSTATICMETHOD_BYTE_V_0100
    * @tc.name        test_Class_CallStaticMethod_Byte_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("test_Class_CallStaticMethod_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_CallStaticMethod_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte_V();
        expect(result).assertTrue();
        console.log('test_Class_CallStaticMethod_Byte_V_0100 done');
        done();
        console.log('test_Class_CallStaticMethod_Byte_V_0100 end');
      })

  })
}