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

export default function classOperationsTest() {

  describe("ActsClassOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0100
     * @tc.name      test_Class_Get_Static_Field_Long_0001
     * @tc.desc      get long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_01();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0001 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0200
     * @tc.name      test_Class_Get_Static_Field_Long_0002
     * @tc.desc      get long c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_02();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0002 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0300
     * @tc.name      test_Class_Get_Static_Field_Long_0003
     * @tc.desc      get static field long invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_03();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0003 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0400
     * @tc.name      test_Class_Get_Static_Field_Long_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_04();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0004 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0500
     * @tc.name      test_Class_Get_Static_Field_Long_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_05();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0005 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0600
     * @tc.name      test_Class_Get_Static_Field_Long_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_06();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0006 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0700
     * @tc.name      test_Class_Get_Static_Field_Long_0007
     * @tc.desc      invalid argument4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_07();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0007 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0800
     * @tc.name      test_Class_Get_Static_Field_Long_0008
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_08();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0008 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_0900
     * @tc.name      test_Class_Get_Static_Field_Long_0009
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_09();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0009 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_1000
     * @tc.name      test_Class_Get_Static_Field_Long_0010
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_10();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0010 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_1100
     * @tc.name      test_Class_Get_Static_Field_Long_0011
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_11();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0011 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_LONG_1200
     * @tc.name      test_Class_Get_Static_Field_Long_0012
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Long_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Long_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Long_12();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Long_0012 done');
        done();
        console.log('test_Class_Get_Static_Field_Long_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0100
     * @tc.name      test_Class_Get_Static_Field_Ref_0001
     * @tc.desc      get ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_01();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0001 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0200
     * @tc.name      test_Class_Get_Static_Field_Ref_0002
     * @tc.desc      get ref c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_02();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0002 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0300
     * @tc.name      test_Class_Get_Static_Field_Ref_0003
     * @tc.desc      get static field ref invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_03();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0003 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0400
     * @tc.name      test_Class_Get_Static_Field_Ref_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_04();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0004 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0500
     * @tc.name      test_Class_Get_Static_Field_Ref_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_05();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0005 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0600
     * @tc.name      test_Class_Get_Static_Field_Ref_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_06();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0006 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0700
     * @tc.name      test_Class_Get_Static_Field_Ref_0007
     * @tc.desc      invalid argument4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_07();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0007 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0800
     * @tc.name      test_Class_Get_Static_Field_Ref_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_08();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0008 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_0900
     * @tc.name      test_Class_Get_Static_Field_Ref_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_09();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0009 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_1000
     * @tc.name      test_Class_Get_Static_Field_Ref_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_10();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0010 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_REF_1100
     * @tc.name      test_Class_Get_Static_Field_Ref_0011
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Ref_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Ref_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Ref_11();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Ref_0011 done');
        done();
        console.log('test_Class_Get_Static_Field_Ref_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0100
     * @tc.name      test_Class_Get_Static_Field_Short_0001
     * @tc.desc      get short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_01();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0001 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0200
     * @tc.name      test_Class_Get_Static_Field_Short_0002
     * @tc.desc      get short c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_02();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0002 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0300
     * @tc.name      test_Class_Get_Static_Field_Short_0003
     * @tc.desc      get static field short invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_03();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0003 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0400
     * @tc.name      test_Class_Get_Static_Field_Short_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_04();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0004 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0500
     * @tc.name      test_Class_Get_Static_Field_Short_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_05();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0005 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0600
     * @tc.name      test_Class_Get_Static_Field_Short_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_06();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0006 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0700
     * @tc.name      test_Class_Get_Static_Field_Short_0007
     * @tc.desc      invalid argument4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_07();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0007 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0800
     * @tc.name      test_Class_Get_Static_Field_Short_0008
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_08();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0008 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_0900
     * @tc.name      test_Class_Get_Static_Field_Short_0009
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_09();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0009 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_1000
     * @tc.name      test_Class_Get_Static_Field_Short_0010
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_10();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0010 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_1100
     * @tc.name      test_Class_Get_Static_Field_Short_0011
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_11();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0011 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_SHORT_1200
     * @tc.name      test_Class_Get_Static_Field_Short_0012
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Short_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Short_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Short_12();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Short_0012 done');
        done();
        console.log('test_Class_Get_Static_Field_Short_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0100
     * @tc.name      test_Class_Get_Static_Field_Bool_0001
     * @tc.desc      get bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_01();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0001 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0300
     * @tc.name      test_Class_Get_Static_Field_Bool_0003
     * @tc.desc      get static field bool invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_03();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0003 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0400
     * @tc.name      test_Class_Get_Static_Field_Bool_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_04();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0004 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0500
     * @tc.name      test_Class_Get_Static_Field_Bool_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_05();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0005 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0600
     * @tc.name      test_Class_Get_Static_Field_Bool_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_06();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0006 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0700
     * @tc.name      test_Class_Get_Static_Field_Bool_0007
     * @tc.desc      invalid argument4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_07();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0007 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0800
     * @tc.name      test_Class_Get_Static_Field_Bool_0008
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_08();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0008 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_0900
     * @tc.name      test_Class_Get_Static_Field_Bool_0009
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_09();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0009 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_1000
     * @tc.name      test_Class_Get_Static_Field_Bool_0010
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_10();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0010 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_1100
     * @tc.name      test_Class_Get_Static_Field_Bool_0011
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_11();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0011 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_GET_STATIC_FIELD_BOOL_1200
     * @tc.name      test_Class_Get_Static_Field_Bool_0012
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Get_Static_Field_Bool_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Get_Static_Field_Bool_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Get_Static_Field_Bool_12();
        expect(result).assertTrue();
        console.log('test_Class_Get_Static_Field_Bool_0012 done');
        done();
        console.log('test_Class_Get_Static_Field_Bool_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0100
     * @tc.name      test_Class_Find_Field_0001
     * @tc.desc      get point field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0001 done');
        done();
        console.log('test_Class_Find_Field_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0200
     * @tc.name      test_Class_Find_Field_0002
     * @tc.desc      point field not found
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_02();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0002 done');
        done();
        console.log('test_Class_Find_Field_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0300
     * @tc.name      test_Class_Find_Field_0003
     * @tc.desc      get extended point field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_03();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0003 done');
        done();
        console.log('test_Class_Find_Field_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0400
     * @tc.name      test_Class_Find_Field_0004
     * @tc.desc      get vector field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_04();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0004 done');
        done();
        console.log('test_Class_Find_Field_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0500
     * @tc.name      test_Class_Find_Field_0005
     * @tc.desc      get circle field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_05();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0005 done');
        done();
        console.log('test_Class_Find_Field_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0600
     * @tc.name      test_Class_Find_Field_0006
     * @tc.desc      get sphere field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_06();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0006 done');
        done();
        console.log('test_Class_Find_Field_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0700
     * @tc.name      test_Class_Find_Field_0007
     * @tc.desc      get space field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_07();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0007 done');
        done();
        console.log('test_Class_Find_Field_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0800
     * @tc.name      test_Class_Find_Field_0008
     * @tc.desc      get partial field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_08();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0008 done');
        done();
        console.log('test_Class_Find_Field_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_0900
     * @tc.name      test_Class_Find_Field_0009
     * @tc.desc      get required field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_09();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0009 done');
        done();
        console.log('test_Class_Find_Field_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_1000
     * @tc.name      test_Class_Find_Field_0010
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_10();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0010 done');
        done();
        console.log('test_Class_Find_Field_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_1100
     * @tc.name      test_Class_Find_Field_0011
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_11();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0011 done');
        done();
        console.log('test_Class_Find_Field_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_FIELD_1200
     * @tc.name      test_Class_Find_Field_0012
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Field_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Field_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Field_12();
        expect(result).assertTrue();
        console.log('test_Class_Find_Field_0012 done');
        done();
        console.log('test_Class_Find_Field_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1100
     * @tc.name      test_Class_Find_Method_0011
     * @tc.desc      find overloaded constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_11();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0011 done');
        done();
        console.log('test_Class_Find_Method_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1400
     * @tc.name      test_Class_Find_Method_0014
     * @tc.desc      invalid argument name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_14();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0014 done');
        done();
        console.log('test_Class_Find_Method_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1500
     * @tc.name      test_Class_Find_Method_0015
     * @tc.desc      invalid argument cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_15();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0015 done');
        done();
        console.log('test_Class_Find_Method_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1600
     * @tc.name      test_Class_Find_Method_0016
     * @tc.desc      invalid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_16();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0016 done');
        done();
        console.log('test_Class_Find_Method_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1700
     * @tc.name      test_Class_Find_Method_0017
     * @tc.desc      has static method_1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_17();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0017 done');
        done();
        console.log('test_Class_Find_Method_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1800
     * @tc.name      test_Class_Find_Method_0018
     * @tc.desc      has static method_2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_18();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0018 done');
        done();
        console.log('test_Class_Find_Method_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_1900
     * @tc.name      test_Class_Find_Method_0019
     * @tc.desc      static method not found_1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_19();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0019 done');
        done();
        console.log('test_Class_Find_Method_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2100
     * @tc.name      test_Class_Find_Method_0021
     * @tc.desc      static method invalid argument name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_21();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0021 done');
        done();
        console.log('test_Class_Find_Method_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2200
     * @tc.name      test_Class_Find_Method_0022
     * @tc.desc      static method invalid argument cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_22();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0022 done');
        done();
        console.log('test_Class_Find_Method_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2300
     * @tc.name      test_Class_Find_Method_0023
     * @tc.desc      static method invalid arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_23();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0023 done');
        done();
        console.log('test_Class_Find_Method_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2400
     * @tc.name      test_Class_Find_Method_0024
     * @tc.desc      static method find static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0024 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_24();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0024 done');
        done();
        console.log('test_Class_Find_Method_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2500
     * @tc.name      test_Class_Find_Method_0025
     * @tc.desc      static method find static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0025 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_25();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0025 done');
        done();
        console.log('test_Class_Find_Method_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2600
     * @tc.name      test_Class_Find_Method_0026
     * @tc.desc      static method find static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0026 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_26();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0026 done');
        done();
        console.log('test_Class_Find_Method_0026 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2700
     * @tc.name      test_Class_Find_Method_0027
     * @tc.desc      static method find static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0027 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_27();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0027 done');
        done();
        console.log('test_Class_Find_Method_0027 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2800
     * @tc.name      test_Class_Find_Method_0028
     * @tc.desc      static method find static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0028 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_28();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0028 done');
        done();
        console.log('test_Class_Find_Method_0028 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_2900
     * @tc.name      test_Class_Find_Method_0029
     * @tc.desc      static method find static method 006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0029 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_29();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0029 done');
        done();
        console.log('test_Class_Find_Method_0029 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3100
     * @tc.name      test_Class_Find_Method_0031
     * @tc.desc      find method combine scenes 003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0031 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_31();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0031 done');
        done();
        console.log('test_Class_Find_Method_0031 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3200
     * @tc.name      test_Class_Find_Method_0032
     * @tc.desc      find method combine scenes 004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0032 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_32();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0032 done');
        done();
        console.log('test_Class_Find_Method_0032 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3300
     * @tc.name      test_Class_Find_Method_0033
     * @tc.desc      find method combine scenes 005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0033 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_33();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0033 done');
        done();
        console.log('test_Class_Find_Method_0033 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3400
     * @tc.name      test_Class_Find_Method_0034
     * @tc.desc      find method combine scenes 006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0034 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_34();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0034 done');
        done();
        console.log('test_Class_Find_Method_0034 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3500
     * @tc.name      test_Class_Find_Method_0035
     * @tc.desc      find method combine scenes 007
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0035 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_35();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0035 done');
        done();
        console.log('test_Class_Find_Method_0035 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3600
     * @tc.name      test_Class_Find_Method_0036
     * @tc.desc      find method combine scenes 008
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0036 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_36();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0036 done');
        done();
        console.log('test_Class_Find_Method_0036 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3700
     * @tc.name      test_Class_Find_Method_0037
     * @tc.desc      find func abstract
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0037 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_37();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0037 done');
        done();
        console.log('test_Class_Find_Method_0037 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3800
     * @tc.name      test_Class_Find_Method_0038
     * @tc.desc      find func final
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0038 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_38();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0038 done');
        done();
        console.log('test_Class_Find_Method_0038 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_3900
     * @tc.name      test_Class_Find_Method_0039
     * @tc.desc      find func in class c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0039 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_39();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0039 done');
        done();
        console.log('test_Class_Find_Method_0039 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4000
     * @tc.name      test_Class_Find_Method_0040
     * @tc.desc      find func in namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0040 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_40();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0040 done');
        done();
        console.log('test_Class_Find_Method_0040 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4100
     * @tc.name      test_Class_Find_Method_0041
     * @tc.desc      duplicate no signature
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0041 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_41();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0041 done');
        done();
        console.log('test_Class_Find_Method_0041 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4200
     * @tc.name      test_Class_Find_Method_0042
     * @tc.desc      static duplicate no signature
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0042 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_42();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0042 done');
        done();
        console.log('test_Class_Find_Method_0042 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4300
     * @tc.name      test_Class_Find_Method_0043
     * @tc.desc      same name static virtual function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0043 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_43();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0043 done');
        done();
        console.log('test_Class_Find_Method_0043 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4400
     * @tc.name      test_Class_Find_Method_0044
     * @tc.desc      no static virtual function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0044 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_44();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0044 done');
        done();
        console.log('test_Class_Find_Method_0044 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_FIND_METHOD_4500
     * @tc.name      test_Class_Find_Method_0045
     * @tc.desc      static no duplicate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_0045 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_45();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_0045 done');
        done();
        console.log('test_Class_Find_Method_0045 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_INDEXABLE_GETTER_0100
     * @tc.name      test_Class_Find_Indexable_Getter_0001
     * @tc.desc      get method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Indexable_Getter_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Indexable_Getter_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Indexable_Getter_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Indexable_Getter_0001 done');
        done();
        console.log('test_Class_Find_Indexable_Getter_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_INDEXABLE_GETTER_0200
     * @tc.name      test_Class_Find_Indexable_Getter_0002
     * @tc.desc      set method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Indexable_Getter_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Indexable_Getter_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Indexable_Getter_02();
        expect(result).assertTrue();
        console.log('test_Class_Find_Indexable_Getter_0002 done');
        done();
        console.log('test_Class_Find_Indexable_Getter_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_INDEXABLE_GETTER_0300
     * @tc.name      test_Class_Find_Indexable_Getter_0003
     * @tc.desc      invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Indexable_Getter_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Indexable_Getter_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Indexable_Getter_03();
        expect(result).assertTrue();
        console.log('test_Class_Find_Indexable_Getter_0003 done');
        done();
        console.log('test_Class_Find_Indexable_Getter_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_ITERATOR_0100
     * @tc.name      test_Class_Find_Iterator_0001
     * @tc.desc      find iterator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Iterator_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Iterator_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Iterator_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Iterator_0001 done');
        done();
        console.log('test_Class_Find_Iterator_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_ITERATOR_0200
     * @tc.name      test_Class_Find_Iterator_0002
     * @tc.desc      find iterator in namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Iterator_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Iterator_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Iterator_02();
        expect(result).assertTrue();
        console.log('test_Class_Find_Iterator_0002 done');
        done();
        console.log('test_Class_Find_Iterator_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_ITERATOR_0300
     * @tc.name      test_Class_Find_Iterator_0003
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Iterator_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Iterator_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Iterator_03();
        expect(result).assertTrue();
        console.log('test_Class_Find_Iterator_0003 done');
        done();
        console.log('test_Class_Find_Iterator_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_METHOD_IN_MODYLE_0100
     * @tc.name      test_Class_Find_Method_In_Module_0001
     * @tc.desc      find func in module
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Method_In_Module_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Method_In_Module_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Method_In_Module_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Method_In_Module_0001 done');
        done();
        console.log('test_Class_Find_Method_In_Module_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_SETTER_0100
     * @tc.name      test_Class_Find_Setter_0001
     * @tc.desc      has set methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Setter_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Setter_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Setter_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Setter_0001 done');
        done();
        console.log('test_Class_Find_Setter_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_SETTER_0200
     * @tc.name      test_Class_Find_Setter_0002
     * @tc.desc      has get method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Setter_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Setter_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Setter_02();
        expect(result).assertTrue();
        console.log('test_Class_Find_Setter_0002 done');
        done();
        console.log('test_Class_Find_Setter_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_SETTER_0300
     * @tc.name      test_Class_Find_Setter_0003
     * @tc.desc      no set method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Setter_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Setter_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Setter_03();
        expect(result).assertTrue();
        console.log('test_Class_Find_Setter_0003 done');
        done();
        console.log('test_Class_Find_Setter_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_SETTER_0400
     * @tc.name      test_Class_Find_Setter_0004
     * @tc.desc      no get method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Setter_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Setter_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Setter_04();
        expect(result).assertTrue();
        console.log('test_Class_Find_Setter_0004 done');
        done();
        console.log('test_Class_Find_Setter_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_SETTER_0500
     * @tc.name      test_Class_Find_Setter_0005
     * @tc.desc      invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Setter_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Setter_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Setter_05();
        expect(result).assertTrue();
        console.log('test_Class_Find_Setter_0005 done');
        done();
        console.log('test_Class_Find_Setter_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_STATIC_FIELD_0100
     * @tc.name      test_Class_Find_Static_Field_0001
     * @tc.desc      get field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Static_Field_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Static_Field_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Static_Field_01();
        expect(result).assertTrue();
        console.log('test_Class_Find_Static_Field_0001 done');
        done();
        console.log('test_Class_Find_Static_Field_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_STATIC_FIELD_0200
     * @tc.name      test_Class_Find_Static_Field_0002
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Static_Field_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Static_Field_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Static_Field_02();
        expect(result).assertTrue();
        console.log('test_Class_Find_Static_Field_0002 done');
        done();
        console.log('test_Class_Find_Static_Field_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_STATIC_FIELD_0300
     * @tc.name      test_Class_Find_Static_Field_0003
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Static_Field_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Static_Field_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Static_Field_03();
        expect(result).assertTrue();
        console.log('test_Class_Find_Static_Field_0003 done');
        done();
        console.log('test_Class_Find_Static_Field_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_FIND_STATIC_FIELD_0400
     * @tc.name      test_Class_Find_Static_Field_0004
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Find_Static_Field_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Find_Static_Field_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Find_Static_Field_04();
        expect(result).assertTrue();
        console.log('test_Class_Find_Static_Field_0004 done');
        done();
        console.log('test_Class_Find_Static_Field_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0100
     * @tc.name      test_Class_Set_Static_Field_Bool_0001
     * @tc.desc      set bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0200
     * @tc.name      test_Class_Set_Static_Field_Bool_0002
     * @tc.desc      set bool c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0300
     * @tc.name      test_Class_Set_Static_Field_Bool_0003
     * @tc.desc      set static field bool invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0400
     * @tc.name      test_Class_Set_Static_Field_Bool_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0500
     * @tc.name      test_Class_Set_Static_Field_Bool_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0600
     * @tc.name      test_Class_Set_Static_Field_Bool_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0700
     * @tc.name      test_Class_Set_Static_Field_Bool_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0800
     * @tc.name      test_Class_Set_Static_Field_Bool_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_0900
     * @tc.name      test_Class_Set_Static_Field_Bool_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_1000
     * @tc.name      test_Class_Set_Static_Field_Bool_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BOOL_1100
     * @tc.name      test_Class_Set_Static_Field_Bool_0011
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Bool_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Bool_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Bool_11();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Bool_0011 done');
        done();
        console.log('test_Class_Set_Static_Field_Bool_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0100
     * @tc.name      test_Class_Set_Static_Field_Byte_0001
     * @tc.desc      set byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0200
     * @tc.name      test_Class_Set_Static_Field_Byte_0002
     * @tc.desc      set byte c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0300
     * @tc.name      test_Class_Set_Static_Field_Byte_0003
     * @tc.desc      set static field byte invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0400
     * @tc.name      test_Class_Set_Static_Field_Byte_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0500
     * @tc.name      test_Class_Set_Static_Field_Byte_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0600
     * @tc.name      test_Class_Set_Static_Field_Byte_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0700
     * @tc.name      test_Class_Set_Static_Field_Byte_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0800
     * @tc.name      test_Class_Set_Static_Field_Byte_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_0900
     * @tc.name      test_Class_Set_Static_Field_Byte_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_1000
     * @tc.name      test_Class_Set_Static_Field_Byte_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BYTE_1100
     * @tc.name      test_Class_Set_Static_Field_Byte_0011
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Byte_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Byte_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Byte_11();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Byte_0011 done');
        done();
        console.log('test_Class_Set_Static_Field_Byte_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0100
     * @tc.name      test_Class_Set_Static_Field_Char_0001
     * @tc.desc      set char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0200
     * @tc.name      test_Class_Set_Static_Field_Char_0002
     * @tc.desc      set char c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0300
     * @tc.name      test_Class_Set_Static_Field_Char_0003
     * @tc.desc      set static field char invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0400
     * @tc.name      test_Class_Set_Static_Field_Char_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0500
     * @tc.name      test_Class_Set_Static_Field_Char_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0600
     * @tc.name      test_Class_Set_Static_Field_Char_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0700
     * @tc.name      test_Class_Set_Static_Field_Char_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0800
     * @tc.name      test_Class_Set_Static_Field_Char_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_0900
     * @tc.name      test_Class_Set_Static_Field_Char_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_1000
     * @tc.name      test_Class_Set_Static_Field_Char_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_CHAR_1100
     * @tc.name      test_Class_Set_Static_Field_Char_0011
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Char_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Char_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Char_11();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Char_0011 done');
        done();
        console.log('test_Class_Set_Static_Field_Char_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0100
     * @tc.name      test_Class_Set_Static_Field_Double_0001
     * @tc.desc      set double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0200
     * @tc.name      test_Class_Set_Static_Field_Double_0002
     * @tc.desc      set double c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0300
     * @tc.name      test_Class_Set_Static_Field_Double_0003
     * @tc.desc      set static field double invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0400
     * @tc.name      test_Class_Set_Static_Field_Double_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0500
     * @tc.name      test_Class_Set_Static_Field_Double_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0600
     * @tc.name      test_Class_Set_Static_Field_Double_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0700
     * @tc.name      test_Class_Set_Static_Field_Double_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0800
     * @tc.name      test_Class_Set_Static_Field_Double_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_0900
     * @tc.name      test_Class_Set_Static_Field_Double_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_DOUBLE_1000
     * @tc.name      test_Class_Set_Static_Field_Double_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Double_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Double_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Double_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Double_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Double_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0100
     * @tc.name      test_Class_Set_Static_Field_Float_0001
     * @tc.desc      set float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0200
     * @tc.name      test_Class_Set_Static_Field_Float_0002
     * @tc.desc      set float c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0300
     * @tc.name      test_Class_Set_Static_Field_Float_0003
     * @tc.desc      set static field float invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0400
     * @tc.name      test_Class_Set_Static_Field_Float_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0500
     * @tc.name      test_Class_Set_Static_Field_Float_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0600
     * @tc.name      test_Class_Set_Static_Field_Float_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0700
     * @tc.name      test_Class_Set_Static_Field_Float_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0800
     * @tc.name      test_Class_Set_Static_Field_Float_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_0900
     * @tc.name      test_Class_Set_Static_Field_Float_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_FLOAT_1000
     * @tc.name      test_Class_Set_Static_Field_Float_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Float_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Float_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Float_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Float_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Float_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0100
     * @tc.name      test_Class_Set_Static_Field_Int_0001
     * @tc.desc      set int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0200
     * @tc.name      test_Class_Set_Static_Field_Int_0002
     * @tc.desc      set int c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0300
     * @tc.name      test_Class_Set_Static_Field_Int_0003
     * @tc.desc      set static field int invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0400
     * @tc.name      test_Class_Set_Static_Field_Int_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0500
     * @tc.name      test_Class_Set_Static_Field_Int_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0600
     * @tc.name      test_Class_Set_Static_Field_Int_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0700
     * @tc.name      test_Class_Set_Static_Field_Int_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0800
     * @tc.name      test_Class_Set_Static_Field_Int_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_0900
     * @tc.name      test_Class_Set_Static_Field_Int_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_INT_1000
     * @tc.name      test_Class_Set_Static_Field_Int_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Int_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Int_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Int_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Int_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Int_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0100
     * @tc.name      test_Class_Set_Static_Field_Long_0001
     * @tc.desc      set long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0200
     * @tc.name      test_Class_Set_Static_Field_Long_0002
     * @tc.desc      set long c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0300
     * @tc.name      test_Class_Set_Static_Field_Long_0003
     * @tc.desc      set static field long invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0400
     * @tc.name      test_Class_Set_Static_Field_Long_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0500
     * @tc.name      test_Class_Set_Static_Field_Long_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0600
     * @tc.name      test_Class_Set_Static_Field_Long_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0700
     * @tc.name      test_Class_Set_Static_Field_Long_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0800
     * @tc.name      test_Class_Set_Static_Field_Long_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_0900
     * @tc.name      test_Class_Set_Static_Field_Long_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_LONG_1000
     * @tc.name      test_Class_Set_Static_Field_Long_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Long_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Long_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Long_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Long_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Long_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0100
     * @tc.name      test_Class_Set_Static_Field_Ref_0001
     * @tc.desc      set ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0200
     * @tc.name      test_Class_Set_Static_Field_Ref_0002
     * @tc.desc      set ref c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0300
     * @tc.name      test_Class_Set_Static_Field_Ref_0003
     * @tc.desc      set invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0400
     * @tc.name      test_Class_Set_Static_Field_Ref_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0500
     * @tc.name      test_Class_Set_Static_Field_Ref_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0600
     * @tc.name      test_Class_Set_Static_Field_Ref_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0700
     * @tc.name      test_Class_Set_Static_Field_Ref_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0800
     * @tc.name      test_Class_Set_Static_Field_Ref_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_REF_0900
     * @tc.name      test_Class_Set_Static_Field_Ref_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Ref_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Ref_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Ref_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Ref_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0100
     * @tc.name      test_Class_Set_Static_Field_Short_0001
     * @tc.desc      set short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0001 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0200
     * @tc.name      test_Class_Set_Static_Field_Short_0002
     * @tc.desc      set short c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0002 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0300
     * @tc.name      test_Class_Set_Static_Field_Short_0003
     * @tc.desc      set static field short invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0003 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0400
     * @tc.name      test_Class_Set_Static_Field_Short_0004
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0004 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0500
     * @tc.name      test_Class_Set_Static_Field_Short_0005
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0005 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0600
     * @tc.name      test_Class_Set_Static_Field_Short_0006
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0006 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0700
     * @tc.name      test_Class_Set_Static_Field_Short_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0007 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0800
     * @tc.name      test_Class_Set_Static_Field_Short_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0008 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_0900
     * @tc.name      test_Class_Set_Static_Field_Short_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0009 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_1000
     * @tc.name      test_Class_Set_Static_Field_Short_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0010 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_SHORT_1100
     * @tc.name      test_Class_Set_Static_Field_Short_0011
     * @tc.desc      combination test4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Static_Field_Short_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Static_Field_Short_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Static_Field_Short_11();
        expect(result).assertTrue();
        console.log('test_Class_Set_Static_Field_Short_0011 done');
        done();
        console.log('test_Class_Set_Static_Field_Short_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0100
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0001
     * @tc.desc      set bool c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0200
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0002
     * @tc.desc      set bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0300
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0400
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0500
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0600
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0700
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0800
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_0900
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BOOL_1000
     * @tc.name      test_Class_Set_Field_By_Name_Bool_0010
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Bool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Bool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Bool_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Bool_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Bool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0100
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0001
     * @tc.desc      set byte c api
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0200
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0002
     * @tc.desc      set byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0300
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0400
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0500
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0600
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0700
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0800
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_0900
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_BYTE_1000
     * @tc.name      test_Class_Set_Field_By_Name_Byte_0010
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Byte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Byte_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Byte_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Byte_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Byte_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0100
     * @tc.name      test_Class_Set_Field_By_Name_Char_0001
     * @tc.desc      set static field by name char capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0200
     * @tc.name      test_Class_Set_Field_By_Name_Char_0002
     * @tc.desc      set static field by name char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0300
     * @tc.name      test_Class_Set_Field_By_Name_Char_0003
     * @tc.desc      not_found
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0400
     * @tc.name      test_Class_Set_Field_By_Name_Char_0004
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0500
     * @tc.name      test_Class_Set_Field_By_Name_Char_0005
     * @tc.desc     invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0600
     * @tc.name      test_Class_Set_Field_By_Name_Char_0006
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0700
     * @tc.name      test_Class_Set_Field_By_Name_Char_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0800
     * @tc.name      test_Class_Set_Field_By_Name_Char_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_0900
     * @tc.name      test_Class_Set_Field_By_Name_Char_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_1000
     * @tc.name      test_Class_Set_Field_By_Name_Char_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_CHAR_1100
     * @tc.name      test_Class_Set_Field_By_Name_Char_0011
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Char_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Char_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Char_11();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Char_0011 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Char_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0100
     * @tc.name      test_Class_Set_Field_By_Name_Double_0001
     * @tc.desc      set static field by name double capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0200
     * @tc.name      test_Class_Set_Field_By_Name_Double_0002
     * @tc.desc      set double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0300
     * @tc.name      test_Class_Set_Field_By_Name_Double_0003
     * @tc.desc      invalid argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0400
     * @tc.name      test_Class_Set_Field_By_Name_Double_0004
     * @tc.desc      invalid argument2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0500
     * @tc.name      test_Class_Set_Field_By_Name_Double_0005
     * @tc.desc      invalid argument3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0600
     * @tc.name      test_Class_Set_Field_By_Name_Double_0006
     * @tc.desc      invalid argument4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0700
     * @tc.name      test_Class_Set_Field_By_Name_Double_0007
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0800
     * @tc.name      test_Class_Set_Field_By_Name_Double_0008
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_0900
     * @tc.name      test_Class_Set_Field_By_Name_Double_0009
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_DOUBLE_1000
     * @tc.name      test_Class_Set_Field_By_Name_Double_0010
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Double_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Double_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Double_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Double_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Double_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0100
     * @tc.name      test_Class_Set_Field_By_Name_Float_0001
     * @tc.desc      set static field by name float capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0200
     * @tc.name      test_Class_Set_Field_By_Name_Float_0002
     * @tc.desc      set float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0300
     * @tc.name      test_Class_Set_Field_By_Name_Float_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0400
     * @tc.name      test_Class_Set_Field_By_Name_Float_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0500
     * @tc.name      test_Class_Set_Field_By_Name_Float_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0600
     * @tc.name      test_Class_Set_Field_By_Name_Float_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0700
     * @tc.name      test_Class_Set_Field_By_Name_Float_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0800
     * @tc.name      test_Class_Set_Field_By_Name_Float_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_0900
     * @tc.name      test_Class_Set_Field_By_Name_Float_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_FLOAT_1000
     * @tc.name      test_Class_Set_Field_By_Name_Float_0010
     * @tc.desc      invalid_argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Float_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Float_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Float_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Float_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Float_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0100
     * @tc.name      test_Class_Set_Field_By_Name_Int_0001
     * @tc.desc      set static field by name int capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0200
     * @tc.name      test_Class_Set_Field_By_Name_Int_0002
     * @tc.desc      set int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0300
     * @tc.name      test_Class_Set_Field_By_Name_Int_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0400
     * @tc.name      test_Class_Set_Field_By_Name_Int_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0500
     * @tc.name      test_Class_Set_Field_By_Name_Int_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0600
     * @tc.name      test_Class_Set_Field_By_Name_Int_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0700
     * @tc.name      test_Class_Set_Field_By_Name_Int_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0800
     * @tc.name      test_Class_Set_Field_By_Name_Int_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_0900
     * @tc.name      test_Class_Set_Field_By_Name_Int_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_INT_1000
     * @tc.name      test_Class_Set_Field_By_Name_Int_0010
     * @tc.desc      invalid_argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Int_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Int_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Int_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Int_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Int_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0100
     * @tc.name      test_Class_Set_Field_By_Name_Long_0001
     * @tc.desc      set static field by name long capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0200
     * @tc.name      test_Class_Set_Field_By_Name_Long_0002
     * @tc.desc      set long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0300
     * @tc.name      test_Class_Set_Field_By_Name_Long_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0400
     * @tc.name      test_Class_Set_Field_By_Name_Long_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0500
     * @tc.name      test_Class_Set_Field_By_Name_Long_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0600
     * @tc.name      test_Class_Set_Field_By_Name_Long_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0700
     * @tc.name      test_Class_Set_Field_By_Name_Long_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0800
     * @tc.name      test_Class_Set_Field_By_Name_Long_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_0900
     * @tc.name      test_Class_Set_Field_By_Name_Long_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_LONG_1000
     * @tc.name      test_Class_Set_Field_By_Name_Long_0010
     * @tc.desc      invalid_argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Long_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Long_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Long_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Long_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Long_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0100
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0001
     * @tc.desc      set static field by name ref capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0200
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0002
     * @tc.desc      set ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0300
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0400
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0500
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0600
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0006
     * @tc.desc      invalid args value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0700
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0800
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_0900
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_REF_1000
     * @tc.name      test_Class_Set_Field_By_Name_Ref_0010
     * @tc.desc      invalid_argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Ref_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Ref_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Ref_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Ref_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Ref_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0100
     * @tc.name      test_Class_Set_Field_By_Name_Short_0001
     * @tc.desc      set static field by name long capi
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_01();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0001 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0200
     * @tc.name      test_Class_Set_Field_By_Name_Short_0002
     * @tc.desc      set long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_02();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0002 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0300
     * @tc.name      test_Class_Set_Field_By_Name_Short_0003
     * @tc.desc      invalid field type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_03();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0003 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0400
     * @tc.name      test_Class_Set_Field_By_Name_Short_0004
     * @tc.desc      invalid args object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_04();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0004 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0500
     * @tc.name      test_Class_Set_Field_By_Name_Short_0005
     * @tc.desc      invalid args field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_05();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0005 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0600
     * @tc.name      test_Class_Set_Field_By_Name_Short_0006
     * @tc.desc      special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_06();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0006 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0700
     * @tc.name      test_Class_Set_Field_By_Name_Short_0007
     * @tc.desc      combination test1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_07();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0007 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0800
     * @tc.name      test_Class_Set_Field_By_Name_Short_0008
     * @tc.desc      combination test2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_08();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0008 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_0900
     * @tc.name      test_Class_Set_Field_By_Name_Short_0009
     * @tc.desc      combination test3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_09();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0009 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_SET_STATIC_FIELD_BY_NAME_SHORT_1000
     * @tc.name      test_Class_Set_Field_By_Name_Short_0010
     * @tc.desc      invalid_argument1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_Set_Field_By_Name_Short_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Class_Set_Field_By_Name_Short_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_Set_Field_By_Name_Short_10();
        expect(result).assertTrue();
        console.log('test_Class_Set_Field_By_Name_Short_0010 done');
        done();
        console.log('test_Class_Set_Field_By_Name_Short_0010 end');
      })
  })
}