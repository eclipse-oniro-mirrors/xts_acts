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

export default function accessingStaticFieldsTest() {

  describe("ActsAccessingStaticFieldsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      Class_GetStaticField_Boolean_0100
     * @tc.name        Class_GetStaticField_Boolean_0100
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Class_GetStaticField_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Boolean();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Boolean_0100 done');
        done();
        console.log('Class_GetStaticField_Boolean_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Char_0100
    * @tc.name        Class_GetStaticField_Char_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Char();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Char_0100 done');
        done();
        console.log('Class_GetStaticField_Char_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Byte_0100
    * @tc.name        Class_GetStaticField_Byte_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Byte();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Byte_0100 done');
        done();
        console.log('Class_GetStaticField_Byte_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Short_0100
    * @tc.name        Class_GetStaticField_Short_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Short();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Short_0100 done');
        done();
        console.log('Class_GetStaticField_Short_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Int_0100
    * @tc.name        Class_GetStaticField_Int_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Int();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Int_0100 done');
        done();
        console.log('Class_GetStaticField_Int_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Long_0100
    * @tc.name        Class_GetStaticField_Long_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Long();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Long_0100 done');
        done();
        console.log('Class_GetStaticField_Long end');
      })

    /**
    * @tc.number      Class_GetStaticField_Float_0100
    * @tc.name        Class_GetStaticField_Float_0100
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Float();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Float_0100 done');
        done();
        console.log('Class_GetStaticField_Float_0100 end');
      })

    /**
    * @tc.number      Class_GetStaticField_Double
    * @tc.name        Class_GetStaticField_Double
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Double", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Double start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Double();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Double done');
        done();
        console.log('Class_GetStaticField_Double end');
      })

    /**
    * @tc.number      Class_GetStaticField_Ref
    * @tc.name        Class_GetStaticField_Ref
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticField_Ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticField_Ref start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticField_Ref();
        expect(result).assertTrue();
        console.log('Class_GetStaticField_Ref done');
        done();
        console.log('Class_GetStaticField_Ref end');
      })

    /**
    * @tc.number      Class_SetStaticField_Boolean
    * @tc.name        Class_SetStaticField_Boolean
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Boolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Boolean start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Boolean();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Boolean done');
        done();
        console.log('Class_SetStaticField_Boolean end');
      })

    /**
    * @tc.number      Class_SetStaticField_Char
    * @tc.name        Class_SetStaticField_Char
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Char", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Char start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Char();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Char done');
        done();
        console.log('Class_SetStaticField_Char end');
      })

    /**
    * @tc.number      Class_SetStaticField_Byte
    * @tc.name        Class_SetStaticField_Byte
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Byte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Byte start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Byte();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Byte done');
        done();
        console.log('Class_SetStaticField_Byte end');
      })

    /**
    * @tc.number      Class_SetStaticField_Short
    * @tc.name        Class_SetStaticField_Short
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Short", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Short start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Short();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Short done');
        done();
        console.log('Class_SetStaticField_Short end');
      })

    /**
    * @tc.number      Class_SetStaticField_Int
    * @tc.name        Class_SetStaticField_Int
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Int start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Int();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Int done');
        done();
        console.log('Class_SetStaticField_Int end');
      })

    /**
    * @tc.number      Class_SetStaticField_Long
    * @tc.name        Class_SetStaticField_Long
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Long", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Long start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Long();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Long done');
        done();
        console.log('Class_SetStaticField_Long end');
      })

    /**
    * @tc.number      Class_SetStaticField_Float
    * @tc.name        Class_SetStaticField_Float
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Float start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Float();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Float done');
        done();
        console.log('Class_SetStaticField_Float end');
      })

    /**
    * @tc.number      Class_SetStaticField_Double
    * @tc.name        Class_SetStaticField_Double
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Double", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Double start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Double();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Double done');
        done();
        console.log('Class_SetStaticField_Double end');
      })

    /**
    * @tc.number      Class_SetStaticField_Ref
    * @tc.name        Class_SetStaticField_Ref
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticField_Ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticField_Ref start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticField_Ref();
        expect(result).assertTrue();
        console.log('Class_SetStaticField_Ref done');
        done();
        console.log('Class_SetStaticField_Ref end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Boolean
    * @tc.name        Class_GetStaticFieldByName_Boolean
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Boolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Boolean start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Boolean();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Boolean done');
        done();
        console.log('Class_GetStaticFieldByName_Boolean end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Char
    * @tc.name        Class_GetStaticFieldByName_Char
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Char", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Char start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Char();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Char done');
        done();
        console.log('Class_GetStaticFieldByName_Char end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Byte
    * @tc.name        Class_GetStaticFieldByName_Byte
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Byte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Byte start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Byte();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Byte done');
        done();
        console.log('Class_GetStaticFieldByName_Byte end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Short
    * @tc.name        Class_GetStaticFieldByName_Short
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Short", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Short start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Short();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Short done');
        done();
        console.log('Class_GetStaticFieldByName_Short end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Int
    * @tc.name        Class_GetStaticFieldByName_Int
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Int start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Int();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Int done');
        done();
        console.log('Class_GetStaticFieldByName_Int end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Long
    * @tc.name        Class_GetStaticFieldByName_Long
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Long", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Long start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Long();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Long done');
        done();
        console.log('Class_GetStaticFieldByName_Long end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Float
    * @tc.name        Class_GetStaticFieldByName_Float
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Float start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Float();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Float done');
        done();
        console.log('Class_GetStaticFieldByName_Float end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Double
    * @tc.name        Class_GetStaticFieldByName_Double
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Double", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Double start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Double();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Double done');
        done();
        console.log('Class_GetStaticFieldByName_Double end');
      })

    /**
    * @tc.number      Class_GetStaticFieldByName_Ref
    * @tc.name        Class_GetStaticFieldByName_Ref
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_GetStaticFieldByName_Ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_GetStaticFieldByName_Ref start');
        let cls = new Foo();
        let result = cls.test_Class_GetStaticFieldByName_Ref();
        expect(result).assertTrue();
        console.log('Class_GetStaticFieldByName_Ref done');
        done();
        console.log('Class_GetStaticFieldByName_Ref end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Boolean
    * @tc.name        Class_SetStaticFieldByName_Boolean
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Boolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Boolean start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Boolean();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Boolean done');
        done();
        console.log('Class_SetStaticFieldByName_Boolean end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Char
    * @tc.name        Class_SetStaticFieldByName_Char
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Char", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Char start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Char();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Char done');
        done();
        console.log('Class_SetStaticFieldByName_Char end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Byte
    * @tc.name        Class_SetStaticFieldByName_Byte
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Byte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Byte start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Byte();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Byte done');
        done();
        console.log('Class_SetStaticFieldByName_Byte end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Short
    * @tc.name        Class_SetStaticFieldByName_Short
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Short", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Short start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Short();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Short done');
        done();
        console.log('Class_SetStaticFieldByName_Short end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Int
    * @tc.name        Class_SetStaticFieldByName_Int
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Int start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Int();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Int done');
        done();
        console.log('Class_SetStaticFieldByName_Int end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Long
    * @tc.name        Class_SetStaticFieldByName_Long
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Long", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Long start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Long();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Long done');
        done();
        console.log('Class_SetStaticFieldByName_Long end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Float
    * @tc.name        Class_SetStaticFieldByName_Float
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Float start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Float();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Float done');
        done();
        console.log('Class_SetStaticFieldByName_Float end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Double
    * @tc.name        Class_SetStaticFieldByName_Double
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Double", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Double start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Double();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Double done');
        done();
        console.log('Class_SetStaticFieldByName_Double end');
      })

    /**
    * @tc.number      Class_SetStaticFieldByName_Ref
    * @tc.name        Class_SetStaticFieldByName_Ref
    * @tc.desc        MediumTest
    * @tc.size        Function
    * @tc.type        Function test
    * @tc.level       Level 0
    */
    it("Class_SetStaticFieldByName_Ref", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Class_SetStaticFieldByName_Ref start');
        let cls = new Foo();
        let result = cls.test_Class_SetStaticFieldByName_Ref();
        expect(result).assertTrue();
        console.log('Class_SetStaticFieldByName_Ref done');
        done();
        console.log('Class_SetStaticFieldByName_Ref end');
      })
  })
}