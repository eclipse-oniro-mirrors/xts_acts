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

export default function variableOperationsTest() {

  describe("ActsVariableOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0100
    * @tc.name      test_Variable_SetValue_Long_0001
    * @tc.desc      set long value normal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0001 done');
        done();
        console.log('test_Variable_SetValue_Long_0001 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0200
    * @tc.name      test_Variable_SetValue_Long_0002
    * @tc.desc      invalid env, return normal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0002 done');
        done();
        console.log('test_Variable_SetValue_Long_0002 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0300
    * @tc.name      test_Variable_SetValue_Long_0003
    * @tc.desc      find variable float, return invalid type
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0003 done');
        done();
        console.log('test_Variable_SetValue_Long_0003 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0400
    * @tc.name      test_Variable_SetValue_Long_0004
    * @tc.desc      find variable nullptr, return invalid args
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0004 done');
        done();
        console.log('test_Variable_SetValue_Long_0004 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0500
    * @tc.name      test_Variable_SetValue_Long_0005
    * @tc.desc      find variable double type, get value false
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0005 done');
        done();
        console.log('test_Variable_SetValue_Long_0005 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0700
    * @tc.name      test_Variable_SetValue_Long_0007
    * @tc.desc      find variable bool, set(3L, 0, -9) and get value composite test
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0007 done');
        done();
        console.log('test_Variable_SetValue_Long_0007 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_LONG_0900
    * @tc.name      test_Variable_SetValue_Long_0009
    * @tc.desc      find variable long, set long and testval and get value composite test
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Long_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Long_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Long_0009 done');
        done();
        console.log('test_Variable_SetValue_Long_0009 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0100
    * @tc.name      test_Variable_SetValue_Int_0001
    * @tc.desc      set int value normal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0001 done');
        done();
        console.log('test_Variable_SetValue_Int_0001 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0200
    * @tc.name      test_Variable_SetValue_Int_0002
    * @tc.desc      invalid env, return normal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0002 done');
        done();
        console.log('test_Variable_SetValue_Int_0002 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0300
    * @tc.name      test_Variable_SetValue_Int_0003
    * @tc.desc      find variable float, return invalid type
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0003 done');
        done();
        console.log('test_Variable_SetValue_Int_0003 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0400
    * @tc.name      test_Variable_SetValue_Int_0004
    * @tc.desc      find variable nullptr, return invalid args
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0004 done');
        done();
        console.log('test_Variable_SetValue_Int_0004 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0500
    * @tc.name      test_Variable_SetValue_Int_0005
    * @tc.desc      find variable long type, get value false
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0005 done');
        done();
        console.log('test_Variable_SetValue_Int_0005 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0700
    * @tc.name      test_Variable_SetValue_Int_0007
    * @tc.desc      find variable bool, set(3U, 0, -9) and get value composite test
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0007 done');
        done();
        console.log('test_Variable_SetValue_Int_0007 end');
      });

    /**
    * @tc.number    VARIABLE_SETVALUE_INT_0900
    * @tc.name      test_Variable_SetValue_Int_0009
    * @tc.desc      find variable int, set int and testval and get value composite test
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 0
    */
    it("test_Variable_SetValue_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Int_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Int_0009 done');
        done();
        console.log('test_Variable_SetValue_Int_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0100
     * @tc.name      test_Variable_SetValue_Double_0001
     * @tc.desc      set double value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0001 done');
        done();
        console.log('test_Variable_SetValue_Double_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0200
     * @tc.name      test_Variable_SetValue_Double_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0002 done');
        done();
        console.log('test_Variable_SetValue_Double_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0300
     * @tc.name      test_Variable_SetValue_Double_0003
     * @tc.desc      find variable int, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0003 done');
        done();
        console.log('test_Variable_SetValue_Double_0003 end');
      });

     /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0400
     * @tc.name      test_Variable_SetValue_Double_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0004 done');
        done();
        console.log('test_Variable_SetValue_Double_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0500
     * @tc.name      test_Variable_SetValue_Double_0005
     * @tc.desc      find variable bool type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0005 done');
        done();
        console.log('test_Variable_SetValue_Double_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0700
     * @tc.name      test_Variable_SetValue_Double_0007
     * @tc.desc      find variable bool, set(3.14F, 0, -9.42F) and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0007 done');
        done();
        console.log('test_Variable_SetValue_Double_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_DOUBLE_0900
     * @tc.name      test_Variable_SetValue_Double_0009
     * @tc.desc      find variable double, set double and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Double_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Double_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Double_0009 done');
        done();
        console.log('test_Variable_SetValue_Double_0009 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_REF_0100
     * @tc.name      test_Variable_GetValue_Ref_0001
     * @tc.desc      find variable string, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Ref_0001 done');
        done();
        console.log('test_Variable_GetValue_Ref_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_REF_0200
     * @tc.name      test_Variable_GetValue_Ref_0002
     * @tc.desc      find variable string, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Ref_0002 done');
        done();
        console.log('test_Variable_GetValue_Ref_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_REF_0300
     * @tc.name      test_Variable_GetValue_Ref_0003
     * @tc.desc      find variable bool, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Ref_0003 done');
        done();
        console.log('test_Variable_GetValue_Ref_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_REF_0400
     * @tc.name      test_Variable_GetValue_Ref_0004
     * @tc.desc      find variable {}, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Ref_0004 done');
        done();
        console.log('test_Variable_GetValue_Ref_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_REF_0500
     * @tc.name      test_Variable_GetValue_Ref_0005
     * @tc.desc      find variable string, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Ref_0005 done');
        done();
        console.log('test_Variable_GetValue_Ref_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_DOUBLE_0100
     * @tc.name      test_Variable_GetValue_Double_0001
     * @tc.desc      find variable double, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Double_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Double_0001 done');
        done();
        console.log('test_Variable_GetValue_Double_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_DOUBLE_0200
     * @tc.name      test_Variable_GetValue_Double_0002
     * @tc.desc      find variable double, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Double_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Double_0002 done');
        done();
        console.log('test_Variable_GetValue_Double_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_DOUBLE_0300
     * @tc.name      test_Variable_GetValue_Double_0003
     * @tc.desc      find variable bool, get value invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Double_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Double_0003 done');
        done();
        console.log('test_Variable_GetValue_Double_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_DOUBLE_0400
     * @tc.name      test_Variable_GetValue_Double_0004
     * @tc.desc      find variable nullptr, invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Double_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Double_0004 done');
        done();
        console.log('test_Variable_GetValue_Double_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_DOUBLE_0500
     * @tc.name      test_Variable_GetValue_Double_0005
     * @tc.desc      find variable double, result is nullptr, invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Double_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Double_0005 done');
        done();
        console.log('test_Variable_GetValue_Double_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BOOLEAN_0100
     * @tc.name      test_Variable_GetValue_Boolean_0001
     * @tc.desc      find variable for bool, get value is bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Boolean_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Boolean_0001 done');
        done();
        console.log('test_Variable_GetValue_Boolean_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BOOLEAN_0200
     * @tc.name      test_Variable_GetValue_Boolean_0002
     * @tc.desc      variable is nullptr, get value is invalid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Boolean_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Boolean_0002 done');
        done();
        console.log('test_Variable_GetValue_Boolean_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BOOLEAN_0300
     * @tc.name      test_Variable_GetValue_Boolean_0003
     * @tc.desc      variable is string, get value is invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Boolean_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Boolean_0003 done');
        done();
        console.log('test_Variable_GetValue_Boolean_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BOOLEAN_0400
     * @tc.name      test_Variable_GetValue_Boolean_0004
     * @tc.desc      variable is nullptr, get value is invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Boolean_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Boolean_0004 done');
        done();
        console.log('test_Variable_GetValue_Boolean_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BOOLEAN_0500
     * @tc.name      test_Variable_GetValue_Boolean_0005
     * @tc.desc      result is nullptr, get value is invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Boolean_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Boolean_0005 done');
        done();
        console.log('test_Variable_GetValue_Boolean_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_INT_0100
     * @tc.name      test_Variable_GetValue_Int_0001
     * @tc.desc      find variable int, get value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Int_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Int_0001 done');
        done();
        console.log('test_Variable_GetValue_Int_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_INT_0200
     * @tc.name      test_Variable_GetValue_Int_0002
     * @tc.desc      find variable int, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Int_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Int_0002 done');
        done();
        console.log('test_Variable_GetValue_Int_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_INT_0300
     * @tc.name      test_Variable_GetValue_Int_0003
     * @tc.desc      find variable bool, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Int_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Int_0003 done');
        done();
        console.log('test_Variable_GetValue_Int_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_INT_0400
     * @tc.name      test_Variable_GetValue_Int_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Int_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Int_0004 done');
        done();
        console.log('test_Variable_GetValue_Int_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_INT_0500
     * @tc.name      test_Variable_GetValue_Int_0005
     * @tc.desc      find variable int, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Int_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Int_0005 done');
        done();
        console.log('test_Variable_GetValue_Int_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_LONG_0100
     * @tc.name      test_Variable_GetValue_Long_0001
     * @tc.desc      find variable long, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Long_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Long_0001 done');
        done();
        console.log('test_Variable_GetValue_Long_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_LONG_0200
     * @tc.name      test_Variable_GetValue_Long_0002
     * @tc.desc      find variable long, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Long_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Long_0002 done');
        done();
        console.log('test_Variable_GetValue_Long_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_LONG_0300
     * @tc.name      test_Variable_GetValue_Long_0003
     * @tc.desc      find variable bool, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Long_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Long_0003 done');
        done();
        console.log('test_Variable_GetValue_Long_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_LONG_0400
     * @tc.name      test_Variable_GetValue_Long_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Long_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Long_0004 done');
        done();
        console.log('test_Variable_GetValue_Long_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_LONG_0500
     * @tc.name      test_Variable_GetValue_Long_0005
     * @tc.desc      find variable long, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Long_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Long_0005 done');
        done();
        console.log('test_Variable_GetValue_Long_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0100
     * @tc.name      test_Variable_SetValue_Boolean_0001
     * @tc.desc      set boolean value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0001 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0200
     * @tc.name      test_Variable_SetValue_Boolean_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0002 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0300
     * @tc.name      test_Variable_SetValue_Boolean_0003
     * @tc.desc      find variable byte, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0003 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0400
     * @tc.name      test_Variable_SetValue_Boolean_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0004 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0500
     * @tc.name      test_Variable_SetValue_Boolean_0005
     * @tc.desc      find variable int type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0005 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0700
     * @tc.name      test_Variable_SetValue_Boolean_0007
     * @tc.desc      find variable bool, set(true,false,true) and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0007 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BOOLEAN_0900
     * @tc.name      test_Variable_SetValue_Boolean_0009
     * @tc.desc      find variable bool, set bool and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Boolean_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Boolean_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Boolean_0009 done');
        done();
        console.log('test_Variable_SetValue_Boolean_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0100
     * @tc.name      test_Variable_SetValue_Char_0001
     * @tc.desc      set char value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0001 done');
        done();
        console.log('test_Variable_SetValue_Char_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0200
     * @tc.name      test_Variable_SetValue_Char_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0002 done');
        done();
        console.log('test_Variable_SetValue_Char_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0300
     * @tc.name      test_Variable_SetValue_Char_0003
     * @tc.desc      find variable double, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0003 done');
        done();
        console.log('test_Variable_SetValue_Char_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0400
     * @tc.name      test_Variable_SetValue_Char_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0004 done');
        done();
        console.log('test_Variable_SetValue_Char_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0500
     * @tc.name      test_Variable_SetValue_Char_0005
     * @tc.desc      find variable double type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0005 done');
        done();
        console.log('test_Variable_SetValue_Char_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0700
     * @tc.name      test_Variable_SetValue_Char_0007
     * @tc.desc      find variable bool, set('X', 'Y', 'Z') and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0007 done');
        done();
        console.log('test_Variable_SetValue_Char_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_CHAR_0900
     * @tc.name      test_Variable_SetValue_Char_0009
     * @tc.desc      ind variable bool, set char and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Char_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Char_0009 done');
        done();
        console.log('test_Variable_SetValue_Char_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0100
     * @tc.name      test_Variable_SetValue_Byte_0001
     * @tc.desc      set byte value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0001 done');
        done();
        console.log('test_Variable_SetValue_Byte_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0200
     * @tc.name      test_Variable_SetValue_Byte_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0002 done');
        done();
        console.log('test_Variable_SetValue_Byte_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0300
     * @tc.name      test_Variable_SetValue_Byte_0003
     * @tc.desc      find variable double, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0003 done');
        done();
        console.log('test_Variable_SetValue_Byte_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0400
     * @tc.name      test_Variable_SetValue_Byte_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0004 done');
        done();
        console.log('test_Variable_SetValue_Byte_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0500
     * @tc.name      test_Variable_SetValue_Byte_0005
     * @tc.desc      find variable short type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0005 done');
        done();
        console.log('test_Variable_SetValue_Byte_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0700
     * @tc.name      test_Variable_SetValue_Byte_0007
     * @tc.desc      find variable bool, set(40U, 0, -10) and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0007 done');
        done();
        console.log('test_Variable_SetValue_Byte_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_BYTE_0900
     * @tc.name      test_Variable_SetValue_Byte_0009
     * @tc.desc      find variable byte, set byte and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Byte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Byte_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Byte_0009 done');
        done();
        console.log('test_Variable_SetValue_Byte_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0100
     * @tc.name      test_Variable_SetValue_Short_0001
     * @tc.desc      set short value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0001 done');
        done();
        console.log('test_Variable_SetValue_Short_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0200
     * @tc.name      test_Variable_SetValue_Short_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0002 done');
        done();
        console.log('test_Variable_SetValue_Short_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0300
     * @tc.name      test_Variable_SetValue_Short_0003
     * @tc.desc      find variable byte, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0003 done');
        done();
        console.log('test_Variable_SetValue_Short_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0400
     * @tc.name      test_Variable_SetValue_Short_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0004 done');
        done();
        console.log('test_Variable_SetValue_Short_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0500
     * @tc.name      test_Variable_SetValue_Short_0005
     * @tc.desc      find variable long type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0005 done');
        done();
        console.log('test_Variable_SetValue_Short_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0700
     * @tc.name      test_Variable_SetValue_Short_0007
     * @tc.desc      find variable bool, set(3U, 0, -9) and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0007 done');
        done();
        console.log('test_Variable_SetValue_Short_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_SHORT_0900
     * @tc.name      test_Variable_SetValue_Short_0009
     * @tc.desc      find variable short, set short and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Short_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Short_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Short_0009 done');
        done();
        console.log('test_Variable_SetValue_Short_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0100
     * @tc.name      test_Variable_SetValue_Float_0001
     * @tc.desc      set float value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0001 done');
        done();
        console.log('test_Variable_SetValue_Float_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0200
     * @tc.name      test_Variable_SetValue_Float_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0002 done');
        done();
        console.log('test_Variable_SetValue_Float_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0300
     * @tc.name      test_Variable_SetValue_Float_0003
     * @tc.desc      find variable int, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0003 done');
        done();
        console.log('test_Variable_SetValue_Float_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0400
     * @tc.name      test_Variable_SetValue_Float_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0004 done');
        done();
        console.log('test_Variable_SetValue_Float_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0500
     * @tc.name      test_Variable_SetValue_Float_0005
     * @tc.desc      find variable double type, get value false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0005 done');
        done();
        console.log('test_Variable_SetValue_Float_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0700
     * @tc.name      test_Variable_SetValue_Float_0007
     * @tc.desc      find variable bool, set(3.14F, 0, -9.42F) and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0007 done');
        done();
        console.log('test_Variable_SetValue_Float_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_FLOAT_0900
     * @tc.name      test_Variable_SetValue_Float_0009
     * @tc.desc      find variable float, set float and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Float_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Float_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Float_0009 done');
        done();
        console.log('test_Variable_SetValue_Float_0009 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0100
     * @tc.name      test_Variable_SetValue_Ref_0001
     * @tc.desc      set ref value normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0001 done');
        done();
        console.log('test_Variable_SetValue_Ref_0001 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0200
     * @tc.name      test_Variable_SetValue_Ref_0002
     * @tc.desc      invalid env, return normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_02();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0002 done');
        done();
        console.log('test_Variable_SetValue_Ref_0002 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0300
     * @tc.name      test_Variable_SetValue_Ref_0003
     * @tc.desc      find variable short, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_03();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0003 done');
        done();
        console.log('test_Variable_SetValue_Ref_0003 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0400
     * @tc.name      test_Variable_SetValue_Ref_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_04();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0004 done');
        done();
        console.log('test_Variable_SetValue_Ref_0004 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0500
     * @tc.name      test_Variable_SetValue_Ref_0005
     * @tc.desc      find variable string type, result is nullptr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_05();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0005 done');
        done();
        console.log('test_Variable_SetValue_Ref_0005 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0700
     * @tc.name      test_Variable_SetValue_Ref_0007
     * @tc.desc      find variable bool, set("abcdefg","xxxx","hello world") and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0007 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_07();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0007 done');
        done();
        console.log('test_Variable_SetValue_Ref_0007 end');
      });

    /**
     * @tc.number    VARIABLE_SETVALUE_REF_0900
     * @tc.name      test_Variable_SetValue_Ref_0009
     * @tc.desc      find variable string, set string and testval and get value composite test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_SetValue_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_SetValue_Ref_0009 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref_09();
        expect(result).assertTrue();
        console.log('test_Variable_SetValue_Ref_0009 done');
        done();
        console.log('test_Variable_SetValue_Ref_0009 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_CHAR_0100
     * @tc.name      test_Variable_GetValue_Char_0001
     * @tc.desc      find variable char, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Char_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Char_0001 done');
        done();
        console.log('test_Variable_GetValue_Char_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_CHAR_0200
     * @tc.name      test_Variable_GetValue_Char_0002
     * @tc.desc      find variable char, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Char_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Char_0002 done');
        done();
        console.log('test_Variable_GetValue_Char_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_CHAR_0300
     * @tc.name      test_Variable_GetValue_Char_0003
     * @tc.desc      find variable bool, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Char_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Char_0003 done');
        done();
        console.log('test_Variable_GetValue_Char_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_CHAR_0400
     * @tc.name      test_Variable_GetValue_Char_0004
     * @tc.desc      variable is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Char_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Char_0004 done');
        done();
        console.log('test_Variable_GetValue_Char_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_CHAR_0500
     * @tc.name      test_Variable_GetValue_Char_0005
     * @tc.desc      variable is char, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Char_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Char_0005 done');
        done();
        console.log('test_Variable_GetValue_Char_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BYTE_0100
     * @tc.name      test_Variable_GetValue_Byte_0001
     * @tc.desc      find variable byte, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Byte_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Byte_0001 done');
        done();
        console.log('test_Variable_GetValue_Byte_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BYTE_0200
     * @tc.name      test_Variable_GetValue_Byte_0002
     * @tc.desc      find variable byte, variable is nullptr, invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Byte_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Byte_0002 done');
        done();
        console.log('test_Variable_GetValue_Byte_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BYTE_0300
     * @tc.name      test_Variable_GetValue_Byte_0003
     * @tc.desc      find variable bool, invalid type args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Byte_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Byte_0003 done');
        done();
        console.log('test_Variable_GetValue_Byte_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BYTE_0400
     * @tc.name      test_Variable_GetValue_Byte_0004
     * @tc.desc      variable is nullptr, invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Byte_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Byte_0004 done');
        done();
        console.log('test_Variable_GetValue_Byte_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_BYTE_0500
     * @tc.name      test_Variable_GetValue_Byte_0005
     * @tc.desc      find variable byte, result is nullptr, invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Byte_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Byte_0005 done');
        done();
        console.log('test_Variable_GetValue_Byte_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_SHORT_0100
     * @tc.name      test_Variable_GetValue_Short_0001
     * @tc.desc      find variable short, get value is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Short_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Short_0001 done');
        done();
        console.log('test_Variable_GetValue_Short_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_SHORT_0200
     * @tc.name      test_Variable_GetValue_Short_0002
     * @tc.desc      find variable short, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Short_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Short_0002 done');
        done();
        console.log('test_Variable_GetValue_Short_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_SHORT_0300
     * @tc.name      test_Variable_GetValue_Short_0003
     * @tc.desc      find variable bool, return invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Short_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Short_0003 done');
        done();
        console.log('test_Variable_GetValue_Short_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_SHORT_0400
     * @tc.name      test_Variable_GetValue_Short_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Short_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Short_0004 done');
        done();
        console.log('test_Variable_GetValue_Short_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_SHORT_0500
     * @tc.name      test_Variable_GetValue_Short_0005
     * @tc.desc      find variable short, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Short_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Short_0005 done');
        done();
        console.log('test_Variable_GetValue_Short_0005 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_FLOAT_0100
     * @tc.name      test_Variable_GetValue_Float_0001
     * @tc.desc      find variable float, get value ok
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Float_0001 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Float_0001 done');
        done();
        console.log('test_Variable_GetValue_Float_0001 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_FLOAT_0200
     * @tc.name      test_Variable_GetValue_Float_0002
     * @tc.desc      find variable float, three args, first is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Float_0002 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float_02();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Float_0002 done');
        done();
        console.log('test_Variable_GetValue_Float_0002 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_FLOAT_0300
     * @tc.name      test_Variable_GetValue_Float_0003
     * @tc.desc      find variable bool, return invalid type args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Float_0003 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float_03();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Float_0003 done');
        done();
        console.log('test_Variable_GetValue_Float_0003 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_FLOAT_0400
     * @tc.name      test_Variable_GetValue_Float_0004
     * @tc.desc      find variable nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Float_0004 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float_04();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Float_0004 done');
        done();
        console.log('test_Variable_GetValue_Float_0004 end');
      });

    /**
     * @tc.number    VARIABLE_GETVALUE_FLOAT_0500
     * @tc.name      test_Variable_GetValue_Float_0005
     * @tc.desc      find variable float, result is nullptr, return invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Variable_GetValue_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Variable_GetValue_Float_0005 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float_05();
        expect(result).assertTrue();
        console.log('test_Variable_GetValue_Float_0005 done');
        done();
        console.log('test_Variable_GetValue_Float_0005 end');
      });
  })
}