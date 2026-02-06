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

export default function callingStaticMethodsTest() {

  describe("ActsClassCallingStaticMethodsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
    * @tc.number      Class_CallStaticMethodByName_Boolean_0100
    * @tc.name        Class_CallStaticMethodByName_Boolean_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Boolean();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Boolean_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Boolean_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Boolean_A_0100
    * @tc.name        Class_CallStaticMethodByName_Boolean_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Boolean_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Boolean_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Boolean_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Boolean_V_0100
    * @tc.name        Class_CallStaticMethodByName_Boolean_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Boolean_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Boolean_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Boolean_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Char_0100
    * @tc.name        Class_CallStaticMethodByName_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Char();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Char_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Char_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Char_A_0100
    * @tc.name        Class_CallStaticMethodByName_Char_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Char_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Char_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Char_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Char_V_0100
    * @tc.name        Class_CallStaticMethodByName_Char_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Char_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Char_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Char_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Byte_0100
    * @tc.name        Class_CallStaticMethodByName_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Byte();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Byte_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Byte_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Byte_A_0100
    * @tc.name        Class_CallStaticMethodByName_Byte_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Byte_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Byte_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Byte_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Byte_V_0100
    * @tc.name        Class_CallStaticMethodByName_Byte_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Byte_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Byte_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Byte_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Short_0100
    * @tc.name        Class_CallStaticMethodByName_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Short();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Short_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Short_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Short_A_0100
    * @tc.name        Class_CallStaticMethodByName_Short_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Short_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Short_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Short_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Short_V_0100
    * @tc.name        Class_CallStaticMethodByName_Short_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Short_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Short_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Short_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Int_0100
    * @tc.name        Class_CallStaticMethodByName_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Int();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Int_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Int_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Int_A_0100
    * @tc.name        Class_CallStaticMethodByName_Int_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Int_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Int_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Int_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Int_V_0100
    * @tc.name        Class_CallStaticMethodByName_Int_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Int_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Int_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Int_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Long_0100
    * @tc.name        Class_CallStaticMethodByName_Long_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Long();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Long_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Long_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Long_A_0100
    * @tc.name        Class_CallStaticMethodByName_Long_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Long_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Long_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Long_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Long_V_0100
    * @tc.name        Class_CallStaticMethodByName_Long_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Long_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Long_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Long_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Float_0100
    * @tc.name        Class_CallStaticMethodByName_Float_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Float();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Float_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Float_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Float_A_0100
    * @tc.name        Class_CallStaticMethodByName_Float_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Float_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Float_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Float_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Float_V_0100
    * @tc.name        Class_CallStaticMethodByName_Float_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Float_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Float_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Float_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Double_0100
    * @tc.name        Class_CallStaticMethodByName_Double_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Double();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Double_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Double_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Double_A_0100
    * @tc.name        Class_CallStaticMethodByName_Double_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Double_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Double_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Double_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Double_V_0100
    * @tc.name        Class_CallStaticMethodByName_Double_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Double_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Double_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Double_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Ref_0100
    * @tc.name        Class_CallStaticMethodByName_Ref_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Ref();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Ref_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Ref_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Ref_A_0100
    * @tc.name        Class_CallStaticMethodByName_Ref_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Ref_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Ref_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Ref_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Ref_V_0100
    * @tc.name        Class_CallStaticMethodByName_Ref_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Ref_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Ref_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Ref_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Void_0100
    * @tc.name        Class_CallStaticMethodByName_Void_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Void();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Void_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Void_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Void_A_0100
    * @tc.name        Class_CallStaticMethodByName_Void_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Void_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Void_A_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Void_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethodByName_Void_V_0100
    * @tc.name        Class_CallStaticMethodByName_Void_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethodByName_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethodByName_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethodByName_Void_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethodByName_Void_V_0100 done');
        done();
        console.log('Class_CallStaticMethodByName_Void_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Short_0100
    * @tc.name        Class_CallStaticMethod_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Short();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Short_0100 done');
        done();
        console.log('Class_CallStaticMethod_Short_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Short_A_0100
    * @tc.name        Class_CallStaticMethod_Short_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Short_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Short_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Short_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Short_V_0100
    * @tc.name        Class_CallStaticMethod_Short_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Short_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Short_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Short_V_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Int_0100
    * @tc.name        Class_CallStaticMethod_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Int();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Int_0100 done');
        done();
        console.log('Class_CallStaticMethod_Int_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Int_A_0100
    * @tc.name        Class_CallStaticMethod_Int_A_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Int_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Int_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Int_A_0100 end');
      })

    /**
    * @tc.number      Class_CallStaticMethod_Int_V_0100
    * @tc.name        Class_CallStaticMethod_Int_V_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_CallStaticMethod_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Int_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Int_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Int_V_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Double_0100
     * @tc.name        Class_CallStaticMethod_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Double();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Double_0100 done');
        done();
        console.log('Class_CallStaticMethod_Double_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Double_A_0100
     * @tc.name        Class_CallStaticMethod_Double_A_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Double_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Double_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Double_A_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Double_V_0100
     * @tc.name        Class_CallStaticMethod_Double_V_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Double_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Double_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Double_V_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Void_0100
     * @tc.name        Class_CallStaticMethod_Void_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Void();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Void_0100 done');
        done();
        console.log('Class_CallStaticMethod_Void_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Void_A_0100
     * @tc.name        Class_CallStaticMethod_Void_A_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Void_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Void_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Void_A_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Void_V_0100
     * @tc.name        Class_CallStaticMethod_Void_V_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Void_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Void_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Void_V_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Long_0100
     * @tc.name        Class_CallStaticMethod_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Long();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Long_0100 done');
        done();
        console.log('Class_CallStaticMethod_Long_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Float_0100
     * @tc.name        Class_CallStaticMethod_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Float();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Float_0100 done');
        done();
        console.log('Class_CallStaticMethod_Float_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Ref_0100
     * @tc.name        Class_CallStaticMethod_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Ref();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Ref_0100 done');
        done();
        console.log('Class_CallStaticMethod_Ref_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Ref_V_0100
     * @tc.name        Class_CallStaticMethod_Ref_V_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Ref_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Ref_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Ref_V_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Ref_A_0100
     * @tc.name        Class_CallStaticMethod_Ref_A_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Ref_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Ref_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Ref_A_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Boolean_0100
     * @tc.name        Class_CallStaticMethod_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Boolean();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Boolean_0100 done');
        done();
        console.log('Class_CallStaticMethod_Boolean_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Boolean_A_0100
     * @tc.name        Class_CallStaticMethod_Boolean_A_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Boolean_A();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Boolean_A_0100 done');
        done();
        console.log('Class_CallStaticMethod_Boolean_A_0100 end');
      })

    /**
     * @tc.number      Class_CallStaticMethod_Boolean_V_0100
     * @tc.name        Class_CallStaticMethod_Boolean_V_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_CallStaticMethod_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_CallStaticMethod_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Boolean_V();
        expect(result).assertTrue();
        console.log('Class_CallStaticMethod_Boolean_V_0100 done');
        done();
        console.log('Class_CallStaticMethod_Boolean_V_0100 end');
      })
  })
}