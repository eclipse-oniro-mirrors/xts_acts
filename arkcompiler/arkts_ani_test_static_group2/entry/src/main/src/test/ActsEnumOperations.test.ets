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

export default function enumOperationsTest() {

  describe("ActsEnumOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYNAME_0100
     * @tc.name        test_Enum_GetEnumItemByName0001
     * @tc.desc        get enumItem by name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByName0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByName0001 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByName();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByName0001 done');
        done();
        console.log('test_Enum_GetEnumItemByName0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0100
     * @tc.name        test_Enum_GetEnumItemByIndex
     * @tc.desc        get enumitem by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex done');
        done();
        console.log('test_Enum_GetEnumItemByIndex end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0200
     * @tc.name        test_Enum_GetEnumItemByIndex_0001
     * @tc.desc        get enumitem by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0001 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_01();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0001 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0300
     * @tc.name        test_Enum_GetEnumItemByIndex_0002
     * @tc.desc        invalid arg enum
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0002 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_02();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0002 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0002 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0400
     * @tc.name        test_Enum_GetEnumItemByIndex_0003
     * @tc.desc        enum get item by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0003 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_03();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0003 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0003 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0500
     * @tc.name        test_Enum_GetEnumItemByIndex_0004
     * @tc.desc        enum get item by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0004 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_04();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0004 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0004 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0600
     * @tc.name        test_Enum_GetEnumItemByIndex_0005
     * @tc.desc        enum get item by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0005 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_05();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0005 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0005 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0700
     * @tc.name        Enum_GetEnumItemByIndex_0700
     * @tc.desc        enum get item by index one item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("Enum_GetEnumItemByIndex_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Enum_GetEnumItemByIndex_0700 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_06();
        expect(result).assertTrue();
        console.log('Enum_GetEnumItemByIndex_0700 done');
        done();
        console.log('Enum_GetEnumItemByIndex_0700 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0800
     * @tc.name        test_Enum_GetEnumItemByIndex_0007
     * @tc.desc        enum get index test one item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0007 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_07();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0007 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0007 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_0900
     * @tc.name        test_Enum_GetEnumItemByIndex_0008
     * @tc.desc        enum get item by index combine scenes
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0008 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_08();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0008 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0008 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUM_GETENUMITEMBYINDEX_1000
     * @tc.name        test_Enum_GetEnumItemByIndex_0009
     * @tc.desc        check initialization
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Enum_GetEnumItemByIndex_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Enum_GetEnumItemByIndex_0009 start');
        let cls = new Foo();
        let result = cls.test_Enum_GetEnumItemByIndex_09();
        expect(result).assertTrue();
        console.log('test_Enum_GetEnumItemByIndex_0009 done');
        done();
        console.log('test_Enum_GetEnumItemByIndex_0009 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0100
     * @tc.name        test_EnumItem_GetEnum
     * @tc.desc        get enum from item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum done');
        done();
        console.log('test_EnumItem_GetEnum end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0200
     * @tc.name        test_EnumItem_GetEnum_0002
     * @tc.desc        get enum from item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0002 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_02();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0002 done');
        done();
        console.log('test_EnumItem_GetEnum_0002 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0300
     * @tc.name        test_EnumItem_GetEnum_0003
     * @tc.desc        invalid arg enum
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0003 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_03();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0003 done');
        done();
        console.log('test_EnumItem_GetEnum_0003 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0400
     * @tc.name        test_EnumItem_GetEnum_0004
     * @tc.desc        enum get value test one item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0004 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_04();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0004 done');
        done();
        console.log('test_EnumItem_GetEnum_0004 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0500
     * @tc.name        test_EnumItem_GetEnum_0005
     * @tc.desc        enum item combination test
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0005 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_05();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0005 done');
        done();
        console.log('test_EnumItem_GetEnum_0005 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0600
     * @tc.name        test_EnumItem_GetEnum_0006
     * @tc.desc        get enum from object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0006 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_06();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0006 done');
        done();
        console.log('test_EnumItem_GetEnum_0006 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0700
     * @tc.name        test_EnumItem_GetEnum_0007
     * @tc.desc        get enum item by name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0007 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_07();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0007 done');
        done();
        console.log('test_EnumItem_GetEnum_0007 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0800
     * @tc.name        test_EnumItem_GetEnum_0008
     * @tc.desc        get wrong enum item by name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0008 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_08();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0008 done');
        done();
        console.log('test_EnumItem_GetEnum_0008 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_0900
     * @tc.name        test_EnumItem_GetEnum_0009
     * @tc.desc        get enum item by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0009 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_09();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0009 done');
        done();
        console.log('test_EnumItem_GetEnum_0009 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_1000
     * @tc.name        test_EnumItem_GetEnum_0010
     * @tc.desc        get wrong enum item by index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0010 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_10();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0010 done');
        done();
        console.log('test_EnumItem_GetEnum_0010 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_1100
     * @tc.name        test_EnumItem_GetEnum_0011
     * @tc.desc        get item name index equal
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0011 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_11();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0011 done');
        done();
        console.log('test_EnumItem_GetEnum_0011 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETENUM_1200
     * @tc.name        test_EnumItem_GetEnum_0012
     * @tc.desc        invalid arg enum
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_0012 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_12();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_0012 done');
        done();
        console.log('test_EnumItem_GetEnum_0012 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETVALUE_INT_0100
     * @tc.name        test_EnumItem_GetValue_Int
     * @tc.desc        enum get value 1nt
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetValue_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetValue_Int start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetValue_Int();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetValue_Int done');
        done();
        console.log('test_EnumItem_GetValue_Int end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETVALUE_STR_0100
     * @tc.name        test_EnumItem_GetValue_String_0001
     * @tc.desc        enum get value str
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetValue_String_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetValue_String_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetValue_String();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetValue_String_0001 done');
        done();
        console.log('test_EnumItem_GetValue_String_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETNAME_0100
     * @tc.name        test_EnumItem_GetName_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetName_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetName();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetName_0001 done');
        done();
        console.log('test_EnumItem_GetName_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETITEM_NAME_0100
     * @tc.name        test_EnumItem_GetEnum_Item_Name_0001
     * @tc.desc        get enum item name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_Item_Name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_Item_Name_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_Item_Name_01();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_Item_Name_0001 done');
        done();
        console.log('test_EnumItem_GetEnum_Item_Name_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETITEM_NAME_0200
     * @tc.name        test_EnumItem_GetEnum_Item_Name_0002
     * @tc.desc        get enum item name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetEnum_Item_Name_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetEnum_Item_Name_0002 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetEnum_Item_Name_02();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetEnum_Item_Name_0002 done');
        done();
        console.log('test_EnumItem_GetEnum_Item_Name_0002 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_INVALID_ARG_ENUM_0100
     * @tc.name        test_EnumItem_Invalid_Arg_Enum_0001
     * @tc.desc        MediumTest
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Invalid_Arg_Enum_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Invalid_Arg_Enum_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Invalid_Arg_Enum();
        expect(result).assertTrue();
        console.log('test_EnumItem_Invalid_Arg_Enum_0001 done');
        done();
        console.log('test_EnumItem_Invalid_Arg_Enum_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_NAME_COMBINE_SCENES_0100
     * @tc.name        test_EnumItem_Name_Combine_Scenes_0001
     * @tc.desc        enumItem name combine scenes
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Name_Combine_Scenes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Name_Combine_Scenes_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Name_Combine_Scenes();
        expect(result).assertTrue();
        console.log('test_EnumItem_Name_Combine_Scenes_0001 done');
        done();
        console.log('test_EnumItem_Name_Combine_Scenes_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_NAME_TEST_ONE_ITEM_0100
     * @tc.name        test_EnumItem_Name_Test_One_Item_0001
     * @tc.desc        test one item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Name_Test_One_Item_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Name_Test_One_Item_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Name_Test_One_Item();
        expect(result).assertTrue();
        console.log('test_EnumItem_Name_Test_One_Item_0001 done');
        done();
        console.log('test_EnumItem_Name_Test_One_Item_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_NAME_GET_VALUE_INT_0100
     * @tc.name        test_EnumItem_Name_Get_Value_Int_0001
     * @tc.desc        get value int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Name_Get_Value_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Name_Get_Value_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Name_Get_Value_Int();
        expect(result).assertTrue();
        console.log('test_EnumItem_Name_Get_Value_Int_0001 done');
        done();
        console.log('test_EnumItem_Name_Get_Value_Int_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_NAME_GET_WRONG_VALUE_INT_0100
     * @tc.name        test_EnumItem_Get_Wrong_Value_Int_0001
     * @tc.desc        get wrong value int
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Get_Wrong_Value_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Get_Wrong_Value_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Get_Wrong_Value_Int();
        expect(result).assertTrue();
        console.log('test_EnumItem_Get_Wrong_Value_Int_0001 done');
        done();
        console.log('test_EnumItem_Get_Wrong_Value_Int_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GET_STRING_0100
     * @tc.name        test_EnumItem_Get_Value_String_0001
     * @tc.desc        get value string
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Get_Value_String_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Get_Value_String_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Get_Value_String_1();
        expect(result).assertTrue();
        console.log('test_EnumItem_Get_Value_String_0001 done');
        done();
        console.log('test_EnumItem_Get_Value_String_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GET_STRING_0200
     * @tc.name        test_EnumItem_Get_Value_String_0002
     * @tc.desc        get value string
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Get_Value_String_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Get_Value_String_0002 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Get_Value_String_2();
        expect(result).assertTrue();
        console.log('test_EnumItem_Get_Value_String_0002 done');
        done();
        console.log('test_EnumItem_Get_Value_String_0002 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GET_INVALID_ARG_ENUM_0100
     * @tc.name        test_EnumItem_Get_Invalid_Arg_Enum_0001
     * @tc.desc        get invalid arg enum
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Get_Invalid_Arg_Enum_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Get_Invalid_Arg_Enum_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Get_Invalid_Arg_Enum();
        expect(result).assertTrue();
        console.log('test_EnumItem_Get_Invalid_Arg_Enum_0001 done');
        done();
        console.log('test_EnumItem_Get_Invalid_Arg_Enum_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GET_VALUE_ONE_ITEM_0100
     * @tc.name        test_EnumItem_Get_Value_One_Item_0001
     * @tc.desc        get value one item
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_Get_Value_One_Item_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_Get_Value_One_Item_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_Get_Value_One_Item();
        expect(result).assertTrue();
        console.log('test_EnumItem_Get_Value_One_Item_0001 done');
        done();
        console.log('test_EnumItem_Get_Value_One_Item_0001 end');
      })

    /**
     * @tc.number      SUB_ANI_ENUMITEM_GETINDEX_0100
     * @tc.name        test_EnumItem_GetIndex_0001
     * @tc.desc        get enum index
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_EnumItem_GetIndex_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_EnumItem_GetIndex_0001 start');
        let cls = new Foo();
        let result = cls.test_EnumItem_GetIndex();
        expect(result).assertTrue();
        console.log('test_EnumItem_GetIndex_0001 done');
        done();
        console.log('test_EnumItem_GetIndex_0001 end');
      })
  })
}