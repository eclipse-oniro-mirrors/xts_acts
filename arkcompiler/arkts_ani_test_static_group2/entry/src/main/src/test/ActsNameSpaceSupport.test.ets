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

export default function nameSpaceSupportTest() {

  describe("ActsNameSpaceSupportTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0100
     * @tc.name      test_Namespace_Find_Function_0001
     * @tc.desc      find function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0001 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0001 done');
        done();
        console.log('test_Namespace_Find_Function_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0200
     * @tc.name      test_Namespace_Find_Function_0002
     * @tc.desc      find function 01
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0002 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_01();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0002 done');
        done();
        console.log('test_Namespace_Find_Function_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0300
     * @tc.name      test_Namespace_Find_Function_0003
     * @tc.desc      find function 02
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0003 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_02();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0003 done');
        done();
        console.log('test_Namespace_Find_Function_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0400
     * @tc.name      test_Namespace_Find_Function_0004
     * @tc.desc      find function 03
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0004 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_03();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0004 done');
        done();
        console.log('test_Namespace_Find_Function_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0500
     * @tc.name      test_Namespace_Find_Function_0005
     * @tc.desc      find function 04
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0005 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_04();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0005 done');
        done();
        console.log('test_Namespace_Find_Function_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0600
     * @tc.name      test_Namespace_Find_Function_0006
     * @tc.desc      find function 05
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0006 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_05();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0006 done');
        done();
        console.log('test_Namespace_Find_Function_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0700
     * @tc.name      test_Namespace_Find_Function_0007
     * @tc.desc      duplicate no signature
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0007 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_06();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0007 done');
        done();
        console.log('test_Namespace_Find_Function_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDFUNCTION_0800
     * @tc.name      test_Namespace_Find_Function_0008
     * @tc.desc      check initialization
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Function_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Function_0008 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindFunction_07();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Function_0008 done');
        done();
        console.log('test_Namespace_Find_Function_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0100
     * @tc.name      test_Namespace_Find_Variable_0001
     * @tc.desc      get int variable 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0001 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0001 done');
        done();
        console.log('test_Namespace_Find_Variable_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0200
     * @tc.name      test_Namespace_Find_Variable_0002
     * @tc.desc      variable env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0002 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_01();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0002 done');
        done();
        console.log('test_Namespace_Find_Variable_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0300
     * @tc.name      test_Namespace_Find_Variable_0003
     * @tc.desc      get ref variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0003 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_02();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0003 done');
        done();
        console.log('test_Namespace_Find_Variable_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0400
     * @tc.name      test_Namespace_Find_Variable_0004
     * @tc.desc      invalid nev
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0004 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_03();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0004 done');
        done();
        console.log('test_Namespace_Find_Variable_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0500
     * @tc.name      test_Namespace_Find_Variable_0005
     * @tc.desc      invalid namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0005 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_04();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0005 done');
        done();
        console.log('test_Namespace_Find_Variable_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0600
     * @tc.name      test_Namespace_Find_Variable_0006
     * @tc.desc      invalid variable name 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0006 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_05();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0006 done');
        done();
        console.log('test_Namespace_Find_Variable_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0700
     * @tc.name      test_Namespace_Find_Variable_0007
     * @tc.desc      invalid variable name 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0007 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_06();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0007 done');
        done();
        console.log('test_Namespace_Find_Variable_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0800
     * @tc.name      test_Namespace_Find_Variable_0008
     * @tc.desc      invalid variable name 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0008 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_07();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0008 done');
        done();
        console.log('test_Namespace_Find_Variable_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_0900
     * @tc.name      test_Namespace_Find_Variable_0009
     * @tc.desc      invalid variable name 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0009 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_08();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0009 done');
        done();
        console.log('test_Namespace_Find_Variable_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_1000
     * @tc.name      test_Namespace_Find_Variable_0010
     * @tc.desc      invalid args result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0010 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_09();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0010 done');
        done();
        console.log('test_Namespace_Find_Variable_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_FINDVARIABLE_1100
     * @tc.name      test_Namespace_Find_Variable_0011
     * @tc.desc      check initialization
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Find_Variable_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Find_Variable_0011 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable_10();
        expect(result).assertTrue();
        console.log('test_Namespace_Find_Variable_0011 done');
        done();
        console.log('test_Namespace_Find_Variable_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0100
     * @tc.name      test_Namespace_Combinatorial_0001
     * @tc.desc      namespace combinatorial find 01
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0001 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0001 done');
        done();
        console.log('test_Namespace_Combinatorial_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0200
     * @tc.name      test_Namespace_Combinatorial_0002
     * @tc.desc      namespace combinatorial find 02
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0002 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_01();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0002 done');
        done();
        console.log('test_Namespace_Combinatorial_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0300
     * @tc.name      test_Namespace_Combinatorial_0003
     * @tc.desc      namespace combinatorial find 03
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0003 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_02();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0003 done');
        done();
        console.log('test_Namespace_Combinatorial_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0400
     * @tc.name      test_Namespace_Combinatorial_0004
     * @tc.desc      namespace combinatorial find 04
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0004 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_03();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0004 done');
        done();
        console.log('test_Namespace_Combinatorial_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0500
     * @tc.name      test_Namespace_Combinatorial_0005
     * @tc.desc      namespace combinatorial find 05
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0005 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_04();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0005 done');
        done();
        console.log('test_Namespace_Combinatorial_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0600
     * @tc.name      test_Namespace_Combinatorial_0006
     * @tc.desc      namespace combinatorial find 06
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0006 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_05();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0006 done');
        done();
        console.log('test_Namespace_Combinatorial_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0700
     * @tc.name      test_Namespace_Combinatorial_0007
     * @tc.desc      namespace combinatorial find 07
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0007 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_06();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0007 done');
        done();
        console.log('test_Namespace_Combinatorial_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0800
     * @tc.name      test_Namespace_Combinatorial_0008
     * @tc.desc      namespace combinatorial find 08
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0008 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_07();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0008 done');
        done();
        console.log('test_Namespace_Combinatorial_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_0900
     * @tc.name      test_Namespace_Combinatorial_0009
     * @tc.desc      namespace combinatorial find 09
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0009 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_08();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0009 done');
        done();
        console.log('test_Namespace_Combinatorial_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_NAMESPACESUPPORT_NAMESPACE_COMBINATORIAL_1000
     * @tc.name      test_Namespace_Combinatorial_0010
     * @tc.desc      namespace combinatorial find 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Combinatorial_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Namespace_Combinatorial_0010 start');
        let cls = new Foo();
        let result = cls.test_Namespace_Combinatorial_09();
        expect(result).assertTrue();
        console.log('test_Namespace_Combinatorial_0010 done');
        done();
        console.log('test_Namespace_Combinatorial_0010 end');
      })
  })
}