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

export default function accessingFiledsOfObjectsTest() {

  describe("ActsAccessingFiledsOfObjectsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_BOOLEAN_0100
     * @tc.name        Object_SetProperty_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Boolean();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Boolean_0100 done');
        done();
        console.log('Object_SetProperty_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_CHAR_0100
     * @tc.name        Object_SetProperty_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Char();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Char_0100 done');
        done();
        console.log('Object_SetProperty_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_BYTE_0100
     * @tc.name        Object_SetProperty_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Byte();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Byte_0100 done');
        done();
        console.log('Object_SetProperty_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_SHORT_0100
     * @tc.name        Object_SetProperty_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Short();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Short_0100 done');
        done();
        console.log('Object_SetProperty_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_INT_0100
     * @tc.name        Object_SetProperty_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Int();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Int_0100 done');
        done();
        console.log('Object_SetProperty_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_LONG_0100
     * @tc.name        Object_SetProperty_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Long();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Long_0100 done');
        done();
        console.log('Object_SetProperty_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_FLOAT_0100
     * @tc.name        Object_SetProperty_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Float();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Float_0100 done');
        done();
        console.log('Object_SetProperty_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_DOUBLE_0100
     * @tc.name        Object_SetProperty_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Double();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Double_0100 done');
        done();
        console.log('Object_SetProperty_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETPROPERTY_REF_0100
     * @tc.name        Object_SetProperty_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetProperty_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetProperty_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Ref();
        expect(result).assertTrue();
        console.log('Object_SetProperty_Ref_0100 done');
        done();
        console.log('Object_SetProperty_Ref_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_BOOLEAN_0100
     * @tc.name        Object_GetPropertyByName_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Boolean();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Boolean_0100 done');
        done();
        console.log('Object_GetPropertyByName_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_CHAR_0100
     * @tc.name        Object_GetPropertyByName_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Char();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Char_0100 done');
        done();
        console.log('Object_GetPropertyByName_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_BYTE_0100
     * @tc.name        Object_GetPropertyByName_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Byte();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Byte_0100 done');
        done();
        console.log('Object_GetPropertyByName_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_SHORT_0100
     * @tc.name        Object_GetPropertyByName_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Short();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Short_0100 done');
        done();
        console.log('Object_GetPropertyByName_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_INT_0100
     * @tc.name        Object_GetPropertyByName_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Int();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Int_0100 done');
        done();
        console.log('Object_GetPropertyByName_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_LONG_0100
     * @tc.name        Object_GetPropertyByName_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Long();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Long_0100 done');
        done();
        console.log('Object_GetPropertyByName_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_FLOAT_0100
     * @tc.name        Object_GetPropertyByName_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Float();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Float_0100 done');
        done();
        console.log('Object_GetPropertyByName_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_DOUBLE_0100
     * @tc.name        Object_GetPropertyByName_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Double();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Double_0100 done');
        done();
        console.log('Object_GetPropertyByName_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETPROPERTYBYNAME_REF_0100
     * @tc.name        Object_GetPropertyByName_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetPropertyByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetPropertyByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Ref();
        expect(result).assertTrue();
        console.log('Object_GetPropertyByName_Ref_0100 done');
        done();
        console.log('Object_GetPropertyByName_Ref_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDFIELD_0100
     * @tc.name        Class_FindField_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindField_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindField_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField();
        expect(result).assertTrue();
        console.log('Class_FindField_0100 done');
        done();
        console.log('Class_FindField_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDSETTER_0100
     * @tc.name        Class_FindSetter_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindSetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindSetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindSetter();
        expect(result).assertTrue();
        console.log('Class_FindSetter_0100 done');
        done();
        console.log('Class_FindSetter_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDGETTER_0100
     * @tc.name        Class_FindGetter_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindGetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindGetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindGetter();
        expect(result).assertTrue();
        console.log('Class_FindGetter_0100 done');
        done();
        console.log('Class_FindGetter_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDINDEXABLEGETTER_0100
     * @tc.name        Class_FindIndexableGetter_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindIndexableGetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindIndexableGetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIndexableGetter();
        expect(result).assertTrue();
        console.log('Class_FindIndexableGetter_0100 done');
        done();
        console.log('Class_FindIndexableGetter_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDUBDEXABLESETTER_0100
     * @tc.name        Class_FindIndexableSetter_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindIndexableSetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindIndexableSetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIndexableSetter();
        expect(result).assertTrue();
        console.log('Class_FindIndexableSetter_0100 done');
        done();
        console.log('Class_FindIndexableSetter_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_CLASS_FINDINTERATOR_0100
     * @tc.name        Class_FindIterator_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_FindIterator_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_FindIterator_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIterator();
        expect(result).assertTrue();
        console.log('Class_FindIterator_0100 done');
        done();
        console.log('Class_FindIterator_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_BOOLEAN_0100
     * @tc.name        Object_GetField_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Boolean();
        expect(result).assertTrue();
        console.log('Object_GetField_Boolean_0100 done');
        done();
        console.log('Object_GetField_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_CHAR_0100
     * @tc.name        Object_GetField_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Char();
        expect(result).assertTrue();
        console.log('Object_GetField_Char_0100 done');
        done();
        console.log('Object_GetField_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_BYTE_0100
     * @tc.name        Object_GetField_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Byte();
        expect(result).assertTrue();
        console.log('Object_GetField_Byte_0100 done');
        done();
        console.log('Object_GetField_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_SHORT_0100
     * @tc.name        Object_GetField_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Short();
        expect(result).assertTrue();
        console.log('Object_GetField_Short_0100 done');
        done();
        console.log('Object_GetField_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_INT_0100
     * @tc.name        Object_GetField_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Int();
        expect(result).assertTrue();
        console.log('Object_GetField_Int_0100 done');
        done();
        console.log('Object_GetField_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_LONG_0100
     * @tc.name        Object_GetField_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Long();
        expect(result).assertTrue();
        console.log('Object_GetField_Long_0100 done');
        done();
        console.log('Object_GetField_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_FLOAT_0100
     * @tc.name        Object_GetField_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Float();
        expect(result).assertTrue();
        console.log('Object_GetField_Float_0100 done');
        done();
        console.log('Object_GetField_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_DOUBLE_0100
     * @tc.name        Object_GetField_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Double();
        expect(result).assertTrue();
        console.log('Object_GetField_Double_0100 done');
        done();
        console.log('Object_GetField_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELD_REF_0100
     * @tc.name        Object_GetField_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetField_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetField_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Ref();
        expect(result).assertTrue();
        console.log('Object_GetField_Ref_0100 done');
        done();
        console.log('Object_GetField_Ref_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_BOOLEAN_0100
     * @tc.name        Object_SetField_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Boolean();
        expect(result).assertTrue();
        console.log('Object_SetField_Boolean_0100 done');
        done();
        console.log('Object_SetField_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_CHAR_0100
     * @tc.name        Object_SetField_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Char();
        expect(result).assertTrue();
        console.log('Object_SetField_Char_0100 done');
        done();
        console.log('Object_SetField_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_BYTE_0100
     * @tc.name        Object_SetField_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Byte();
        expect(result).assertTrue();
        console.log('Object_SetField_Byte_0100 done');
        done();
        console.log('Object_SetField_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_SHORT_0100
     * @tc.name        Object_SetField_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Short();
        expect(result).assertTrue();
        console.log('Object_SetField_Short_0100 done');
        done();
        console.log('Object_SetField_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_INT_0100
     * @tc.name        Object_SetField_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Int();
        expect(result).assertTrue();
        console.log('Object_SetField_Int_0100 done');
        done();
        console.log('Object_SetField_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_LONG_0100
     * @tc.name        Object_SetField_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Long();
        expect(result).assertTrue();
        console.log('Object_SetField_Long_0100 done');
        done();
        console.log('Object_SetField_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_FLOAT_0100
     * @tc.name        Object_SetField_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Float();
        expect(result).assertTrue();
        console.log('Object_SetField_Float_0100 done');
        done();
        console.log('Object_SetField_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_DOUBLE_0100
     * @tc.name        Object_SetField_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Double();
        expect(result).assertTrue();
        console.log('Object_SetField_Double_0100 done');
        done();
        console.log('Object_SetField_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELD_REF_0100
     * @tc.name        Object_SetField_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetField_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetField_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Ref();
        expect(result).assertTrue();
        console.log('Object_SetField_Ref_0100 done');
        done();
        console.log('Object_SetField_Ref_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_BOOLEAN_0100
     * @tc.name        Object_GetFieldByName_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Boolean();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Boolean_0100 done');
        done();
        console.log('Object_GetFieldByName_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_CHAR_0100
     * @tc.name        Object_GetFieldByName_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Char();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Char_0100 done');
        done();
        console.log('Object_GetFieldByName_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_BYTE_0100
     * @tc.name        Object_GetFieldByName_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Byte();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Byte_0100 done');
        done();
        console.log('Object_GetFieldByName_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_SHORT_0100
     * @tc.name        Object_GetFieldByName_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Short();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Short_0100 done');
        done();
        console.log('Object_GetFieldByName_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_INT_0100
     * @tc.name        Object_GetFieldByName_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Int();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Int_0100 done');
        done();
        console.log('Object_GetFieldByName_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_LONG_0100
     * @tc.name        Object_GetFieldByName_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Long();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Long_0100 done');
        done();
        console.log('Object_GetFieldByName_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_FLOAT_0100
     * @tc.name        Object_GetFieldByName_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Float();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Float_0100 done');
        done();
        console.log('Object_GetFieldByName_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_DOUBLE_0100
     * @tc.name        Object_GetFieldByName_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Double();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Double_0100 done');
        done();
        console.log('Object_GetFieldByName_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_GETFIELDBYNAME_REF_0100
     * @tc.name        Object_GetFieldByName_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_GetFieldByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_GetFieldByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Ref();
        expect(result).assertTrue();
        console.log('Object_GetFieldByName_Ref_0100 done');
        done();
        console.log('Object_GetFieldByName_Ref_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_BOOLEAN_0100
     * @tc.name        Object_SetFieldByName_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Boolean();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Boolean_0100 done');
        done();
        console.log('Object_SetFieldByName_Boolean_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_CHAR_0100
     * @tc.name        Object_SetFieldByName_Char_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Char();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Char_0100 done');
        done();
        console.log('Object_SetFieldByName_Char_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_BYTE_0100
     * @tc.name        Object_SetFieldByName_Byte_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Byte();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Byte_0100 done');
        done();
        console.log('Object_SetFieldByName_Byte_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_SHORT_0100
     * @tc.name        Object_SetFieldByName_Short_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Short();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Short_0100 done');
        done();
        console.log('Object_SetFieldByName_Short_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_INT_0100
     * @tc.name        Object_SetFieldByName_Int_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Int();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Int_0100 done');
        done();
        console.log('Object_SetFieldByName_Int_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_LONG_0100
     * @tc.name        Object_SetFieldByName_Long_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Long();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Long_0100 done');
        done();
        console.log('Object_SetFieldByName_Long_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_FLOAT_0100
     * @tc.name        Object_SetFieldByName_Float_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Float();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Float_0100 done');
        done();
        console.log('Object_SetFieldByName_Float_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_DOUBLE_0100
     * @tc.name        Object_SetFieldByName_Double_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Double();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Double_0100 done');
        done();
        console.log('Object_SetFieldByName_Double_0100 end');
      })

    /**
     * @tc.number      SUB_ANI_OBJECT_SETFIELDBYNAME_REF_0100
     * @tc.name        Object_SetFieldByName_Ref_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Object_SetFieldByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Object_SetFieldByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Ref();
        expect(result).assertTrue();
        console.log('Object_SetFieldByName_Ref_0100 done');
        done();
        console.log('Object_SetFieldByName_Ref_0100 end');
      })
  })
}