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

export default function moduleSupportTest() {

  describe("ActsModuleSupportTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number     SUB_ANI_MODULE_FINDFUNCTION_0100
     * @tc.name       test_Module_FindFunction_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindFunction_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindFunction_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindFunction();
        expect(result).assertTrue();
        console.log('test_Module_FindFunction_0001 done');
        done();
        console.log('test_Module_FindFunction_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDVARABLE_0100
     * @tc.name       test_Module_FindVariable_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindVariable_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindVariable_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindVariable();
        expect(result).assertTrue();
        console.log('test_Module_FindVariable_0001 done');
        done();
        console.log('test_Module_FindVariable_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDCLASS_0100
     * @tc.name       test_Module_FindClass_0001
     * @tc.desc       find class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindClass();
        expect(result).assertTrue();
        console.log('test_Module_FindClass_0001 done');
        done();
        console.log('test_Module_FindClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDINTERFACE_0100
     * @tc.name       test_Module_FindInterface_0001
     * @tc.desc       find interface
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindInterface_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindInterface_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindInterface();
        expect(result).assertTrue();
        console.log('test_Module_FindInterface_0001 done');
        done();
        console.log('test_Module_FindInterface_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDABSTARCTCLASS_0100
     * @tc.name       test_Module_FindAbstractClass_0001
     * @tc.desc       find abstract class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindAbstractClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindAbstractClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindAbstractClass();
        expect(result).assertTrue();
        console.log('test_Module_FindAbstractClass_0001 done');
        done();
        console.log('test_Module_FindAbstractClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDFINALCLASS_0100
     * @tc.name       test_Module_FindFinalClass_0001
     * @tc.desc       find final class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindFinalClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindFinalClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindFinalClass();
        expect(result).assertTrue();
        console.log('test_Module_FindFinalClass_0001 done');
        done();
        console.log('test_Module_FindFinalClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_ARG_DESCRIPTOR_0100
     * @tc.name       test_Module_Invalid_Arg_Descriptor_0001
     * @tc.desc       invalid arg descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Arg_Descriptor_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Arg_Descriptor_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Arg_Descriptor();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Arg_Descriptor_0001 done');
        done();
        console.log('test_Module_Invalid_Arg_Descriptor_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_MANY_DESCRIPTOR_0100
     * @tc.name       test_Module_Many_Descriptor_0001
     * @tc.desc       module many descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Many_Descriptor_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Many_Descriptor_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Many_Descriptor();
        expect(result).assertTrue();
        console.log('test_Module_Many_Descriptor_0001 done');
        done();
        console.log('test_Module_Many_Descriptor_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_ALLTYPE_0100
     * @tc.name       test_Module_AllType_0001
     * @tc.desc       test all type
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_AllType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_AllType_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_AllType();
        expect(result).assertTrue();
        console.log('test_Module_AllType_0001 done');
        done();
        console.log('test_Module_AllType_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_B_IN_NAMESPACE_A_0100
     * @tc.name       test_Module_Find_B_In_Namespace_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_B_In_Namespace_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_B_In_Namespace_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_B_In_Namespace_A();
        expect(result).assertTrue();
        console.log('test_Module_Find_B_In_Namespace_A done');
        done();
        console.log('test_Module_Find_B_In_Namespace_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_B_EXTENDS_A_0100
     * @tc.name       Module_Find_B_Extends_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("Module_Find_B_Extends_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Module_Find_B_Extends_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_B_Extends_A();
        expect(result).assertTrue();
        console.log('Module_Find_B_Extends_A done');
        done();
        console.log('Module_Find_B_Extends_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_C_EXTENDS_B_EXTENDS_A_0100
     * @tc.name       test_Module_Find_C_Extends_B_Extends_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_C_Extends_B_Extends_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_C_Extends_B_Extends_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_C_Extends_B_Extends_A();
        expect(result).assertTrue();
        console.log('test_Module_Find_C_Extends_B_Extends_A done');
        done();
        console.log('test_Module_Find_C_Extends_B_Extends_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_GENERIC_CLASS_0100
     * @tc.name       test_Module_Find_Generic_Class
     * @tc.desc       find generic vlass
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Generic_Class", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Generic_Class start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Generic_Class();
        expect(result).assertTrue();
        console.log('test_Module_Find_Generic_Class done');
        done();
        console.log('test_Module_Find_Generic_Class end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_COMBINATION_0100
     * @tc.name       test_Module_Find_Combination_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Combination_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Combination_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Combination_01();
        expect(result).assertTrue();
        console.log('test_Module_Find_Combination_0001 done');
        done();
        console.log('test_Module_Find_Combination_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_COMBINATION_0200
     * @tc.name       test_Module_Find_Combination_0002
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Combination_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Combination_0002 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Combination_02();
        expect(result).assertTrue();
        console.log('test_Module_Find_Combination_0002 done');
        done();
        console.log('test_Module_Find_Combination_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_0100
     * @tc.name       test_Module_Find_enum_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_enum_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_enum_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_enum();
        expect(result).assertTrue();
        console.log('test_Module_Find_enum_0001 done');
        done();
        console.log('test_Module_Find_enum_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_INVALID_ARGS_0100
     * @tc.name       test_Module_Find_Enum_Invalid_Args
     * @tc.desc       test invalid args
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_Invalid_Args", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_Invalid_Args start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_Invalid_Args();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_Invalid_Args done');
        done();
        console.log('test_Module_Find_Enum_Invalid_Args end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_MANY_DESCRIPTOR_0100
     * @tc.name       test_Module_Find_Enum_Many_Descriptor
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_Many_Descriptor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_Many_Descriptor start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_Many_Descriptor();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_Many_Descriptor done');
        done();
        console.log('test_Module_Find_Enum_Many_Descriptor end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_B_IN_NAMESPACE_A_0100
     * @tc.name       test_Module_Find_Enum_B_In_Namespace_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_B_In_Namespace_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_B_In_Namespace_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_B_In_Namespace_A();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_B_In_Namespace_A done');
        done();
        console.log('test_Module_Find_Enum_B_In_Namespace_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_COMBINE_SCENCES_0100
     * @tc.name       test_Module_Find_Enum_Combine_Scenes_0001
     * @tc.desc       find enum combine scenes
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_Combine_Scenes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_Combine_Scenes_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_Combine_Scenes_01();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_Combine_Scenes_0001 done');
        done();
        console.log('test_Module_Find_Enum_Combine_Scenes_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_COMBINE_SCENCES_0200
     * @tc.name       test_Module_Find_Enum_Combine_Scenes_0002
     * @tc.desc       find enum combine scenes
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_Combine_Scenes_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_Combine_Scenes_0002 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_Combine_Scenes_02();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_Combine_Scenes_0002 done');
        done();
        console.log('test_Module_Find_Enum_Combine_Scenes_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_ENUM_COMBINE_SCENCES_0300
     * @tc.name       test_Module_Find_Enum_Combine_Scenes_0003
     * @tc.desc       find enum combine scenes
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Enum_Combine_Scenes_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Enum_Combine_Scenes_0003 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Enum_Combine_Scenes_03();
        expect(result).assertTrue();
        console.log('test_Module_Find_Enum_Combine_Scenes_0003 done');
        done();
        console.log('test_Module_Find_Enum_Combine_Scenes_0003 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_INVALID_0100
     * @tc.name       test_Module_Find_Function_Invalid_Arg_ModuleName
     * @tc.desc       test invalid arg module name
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_Invalid_Arg_ModuleName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_Invalid_Arg_ModuleName start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_Invalid_Arg_ModuleName();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_Invalid_Arg_ModuleName done');
        done();
        console.log('test_Module_Find_Function_Invalid_Arg_ModuleName end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_INVALID_ARG_SIGNATURE_0100
     * @tc.name       test_Module_Find_Function_Invalid_Arg_Signature
     * @tc.desc       invalid arg signature
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_Invalid_Arg_Signature", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_Invalid_Arg_Signature start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_Invalid_Arg_Signature();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_Invalid_Arg_Signature done');
        done();
        console.log('test_Module_Find_Function_Invalid_Arg_Signature end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUN_INVALID_MODULE_0100
     * @tc.name       test_Module_Find_Function_Invalid_Arg_Module
     * @tc.desc       invalid module
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_Invalid_Arg_Module", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_Invalid_Arg_Module start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_Invalid_Arg_Module();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_Invalid_Arg_Module done');
        done();
        console.log('test_Module_Find_Function_Invalid_Arg_Module end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUN_INVALID_ARG_NAME_0100
     * @tc.name       test_Module_Find_Function_Invalid_Arg_Name
     * @tc.desc       fun invalid arg name
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_Invalid_Arg_Name", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_Invalid_Arg_Name start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_Invalid_Arg_Name();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_Invalid_Arg_Name done');
        done();
        console.log('test_Module_Find_Function_Invalid_Arg_Name end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_AARG_NAMR_IN_NAMESPACE_0100
     * @tc.name       test_Module_Invalid_Arg_Name_In_Namespace
     * @tc.desc       invalid arg name in namespace
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Arg_Name_In_Namespace", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Arg_Name_In_Namespace start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Arg_Name_In_Namespace();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Arg_Name_In_Namespace done');
        done();
        console.log('test_Module_Invalid_Arg_Name_In_Namespace end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0100
     * @tc.name       test_Module_Find_Function_0001
     * @tc.desc       invalid arg result
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_01();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0001 done');
        done();
        console.log('test_Module_Find_Function_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0200
     * @tc.name       test_Module_Find_Function_0002
     * @tc.desc       invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0002 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_02();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0002 done');
        done();
        console.log('test_Module_Find_Function_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0300
     * @tc.name       test_Module_Find_Function_0003
     * @tc.desc       duplicate no signature
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0003 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_03();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0003 done');
        done();
        console.log('test_Module_Find_Function_0003 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0400
     * @tc.name       test_Module_Find_Function_0004
     * @tc.desc       find function
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0004 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_04();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0004 done');
        done();
        console.log('test_Module_Find_Function_0004 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0500
     * @tc.name       test_Module_Find_Function_0005
     * @tc.desc       case many descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0005 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_05();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0005 done');
        done();
        console.log('test_Module_Find_Function_0005 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0600
     * @tc.name       test_Module_Find_Function_0006
     * @tc.desc       find func all type
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0006 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_06();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0006 done');
        done();
        console.log('test_Module_Find_Function_0006 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_FUNCTION_0700
     * @tc.name       test_Module_Find_Function_0007
     * @tc.desc       MediumTest
     * @tc.size       find func B in namespace A
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Function_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Function_0007 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Function_07();
        expect(result).assertTrue();
        console.log('test_Module_Find_Function_0007 done');
        done();
        console.log('test_Module_Find_Function_0007 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0100
     * @tc.name       test_Module_Find_Variable_0001
     * @tc.desc       get int variable
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_01();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0001 done');
        done();
        console.log('test_Module_Find_Variable_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0200
     * @tc.name       test_Module_Find_Variable_0002
     * @tc.desc       get ref variable
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0002 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_02();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0002 done');
        done();
        console.log('test_Module_Find_Variable_0002 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0300
     * @tc.name       test_Module_Find_Variable_0003
     * @tc.desc       get invalid variable name
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0003 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_03();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0003 done');
        done();
        console.log('test_Module_Find_Variable_0003 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0400
     * @tc.name       test_Module_Find_Variable_0004
     * @tc.desc       invalid args result
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0004 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_04();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0004 done');
        done();
        console.log('test_Module_Find_Variable_0004 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0500
     * @tc.name       test_Module_Find_Variable_0005
     * @tc.desc       invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0005 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_05();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0005 done');
        done();
        console.log('test_Module_Find_Variable_0005 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0600
     * @tc.name       test_Module_Find_Variable_0006
     * @tc.desc       invalid module
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0006 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_06();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0006 done');
        done();
        console.log('test_Module_Find_Variable_0006 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0700
     * @tc.name       test_Module_Find_Variable_0007
     * @tc.desc       find int variable
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0007 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_07();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0007 done');
        done();
        console.log('test_Module_Find_Variable_0007 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0800
     * @tc.name       test_Module_Find_Variable_0008
     * @tc.desc       many descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0008 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_08();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0008 done');
        done();
        console.log('test_Module_Find_Variable_0008 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_0900
     * @tc.name       test_Module_Find_Variable_0009
     * @tc.desc       find variable B in namespace A
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0009 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_09();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0009 done');
        done();
        console.log('test_Module_Find_Variable_0009 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1000
     * @tc.name       test_Module_Find_Variable_0010
     * @tc.desc       find const variable
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0010 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_10();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0010 done');
        done();
        console.log('test_Module_Find_Variable_0010 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1100
     * @tc.name       test_Module_Find_Variable_0011
     * @tc.desc       combine test boolean
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0011 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_11();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0011 done');
        done();
        console.log('test_Module_Find_Variable_0011 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1200
     * @tc.name       test_Module_Find_Variable_0012
     * @tc.desc       combine test char
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0012 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_12();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0012 done');
        done();
        console.log('test_Module_Find_Variable_0012 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1300
     * @tc.name       test_Module_Find_Variable_0013
     * @tc.desc       combine test byte
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0013 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_13();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0013 done');
        done();
        console.log('test_Module_Find_Variable_0013 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1400
     * @tc.name       test_Module_Find_Variable_0014
     * @tc.desc       combine test short
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0014 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_14();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0014 done');
        done();
        console.log('test_Module_Find_Variable_0014 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1500
     * @tc.name       test_Module_Find_Variable_0015
     * @tc.desc       combine test long
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0015 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_15();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0015 done');
        done();
        console.log('test_Module_Find_Variable_0015 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1600
     * @tc.name       test_Module_Find_Variable_0016
     * @tc.desc       combine test float
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0016 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_16();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0016 done');
        done();
        console.log('test_Module_Find_Variable_0016 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1700
     * @tc.name       test_Module_Find_Variable_0017
     * @tc.desc       combine test double
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0017 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_17();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0017 done');
        done();
        console.log('test_Module_Find_Variable_0017 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1800
     * @tc.name       test_Module_Find_Variable_0018
     * @tc.desc       combine test int
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0018 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_18();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0018 done');
        done();
        console.log('test_Module_Find_Variable_0018 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_VARIABLE_1900
     * @tc.name       test_Module_Find_Variable_0019
     * @tc.desc       combine test ref
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Variable_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Variable_0019 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Variable_19();
        expect(result).assertTrue();
        console.log('test_Module_Find_Variable_0019 done');
        done();
        console.log('test_Module_Find_Variable_0019 end');
      })
  })
}