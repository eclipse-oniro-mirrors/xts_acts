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
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0100
     * @tc.name      call_StaticMethodBool_0001
     * @tc.desc      call static method bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('call_StaticMethodBool_0001 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodBoolean();
      expect(result).assertTrue();
      console.log('call_StaticMethodBool_0001 done');
      done();
      console.log('call_StaticMethodBool_0001 end');
    })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0200
     * @tc.name      call_StaticMethodBool_0002
     * @tc.desc      call static method bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_01();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0002 done');
        done();
        console.log('call_StaticMethodBool_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0300
     * @tc.name      call_StaticMethodBool_0003
     * @tc.desc      call static method bool V
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_02();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0003 done');
        done();
        console.log('call_StaticMethodBool_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0400
     * @tc.name      call_StaticMethodBool_0004
     * @tc.desc      call static method bool A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_03();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0004 done');
        done();
        console.log('call_StaticMethodBool_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0500
     * @tc.name      call_StaticMethodBool_0005
     * @tc.desc      call static method bool from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0005 done');
        done();
        console.log('call_StaticMethodBool_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0600
     * @tc.name      call_StaticMethodBool_0006
     * @tc.desc      call static method bool from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0006 done');
        done();
        console.log('call_StaticMethodBool_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0700
     * @tc.name      call_StaticMethodBool_0007
     * @tc.desc      call static method bool from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0007 done');
        done();
        console.log('call_StaticMethodBool_0007 end');
      })

   /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0800
     * @tc.name      call_StaticMethodBool_0008
     * @tc.desc      call static method bool from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0008 done');
        done();
        console.log('call_StaticMethodBool_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_0900
     * @tc.name      call_StaticMethodBool_0009
     * @tc.desc      call static method bool from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0009 done');
        done();
        console.log('call_StaticMethodBool_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1000
     * @tc.name      call_StaticMethodBool_0010
     * @tc.desc      call static method bool from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0010 done');
        done();
        console.log('call_StaticMethodBool_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1100
     * @tc.name      call_StaticMethodBool_0011
     * @tc.desc      call static method bool from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0011 done');
        done();
        console.log('call_StaticMethodBool_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1200
     * @tc.name      call_StaticMethodBool_0012
     * @tc.desc      DISABLED call static method bool overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_11();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0012 done');
        done();
        console.log('call_StaticMethodBool_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1300
     * @tc.name      call_StaticMethodBool_0013
     * @tc.desc      call static method bool combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_12();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0013 done');
        done();
        console.log('call_StaticMethodBool_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1400
     * @tc.name      call_StaticMethodBool_0014
     * @tc.desc      call static method bool combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_13();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0014 done');
        done();
        console.log('call_StaticMethodBool_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1500
     * @tc.name      call_StaticMethodBool_0015
     * @tc.desc      call static method bool combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_14();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0015 done');
        done();
        console.log('call_StaticMethodBool_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1600
     * @tc.name      call_StaticMethodBool_0016
     * @tc.desc      call static method bool null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0016 done');
        done();
        console.log('call_StaticMethodBool_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1700
     * @tc.name      call_StaticMethodBool_0017
     * @tc.desc      call static method bool combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0017 done');
        done();
        console.log('call_StaticMethodBool_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1800
     * @tc.name      call_StaticMethodBool_0018
     * @tc.desc      call static method bool combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0018 done');
        done();
        console.log('call_StaticMethodBool_0018 end');
      })
      
    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_1900
     * @tc.name      call_StaticMethodBool_0019
     * @tc.desc      call static method bool combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodBool_0019 done');
        done();
        console.log('call_StaticMethodBool_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2000
     * @tc.name      call_StaticMethodBool_0020
     * @tc.desc      call static method bool combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_19();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0020 done');
        done();
        console.log('call_StaticMethodBool_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2100
     * @tc.name      call_StaticMethodBool_0021
     * @tc.desc      call static method bool combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_20();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0021 done');
        done();
        console.log('call_StaticMethodBool_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2200
     * @tc.name      call_StaticMethodBool_0022
     * @tc.desc      check initialization bool
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_21();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0022 done');
        done();
        console.log('call_StaticMethodBool_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBOOL_2300
     * @tc.name      call_StaticMethodBool_0023
     * @tc.desc      check initialization bool a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodBool_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodBool_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodBoolean_22();
        expect(result).assertFalse();
        console.log('call_StaticMethodBool_0023 done');
        done();
        console.log('call_StaticMethodBool_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0100
     * @tc.name      call_StaticMethodInt_0001
     * @tc.desc      call static method int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('call_StaticMethodInt_0001 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodInt();
      expect(result).assertTrue();
      console.log('call_StaticMethodInt_0001 done');
      done();
      console.log('call_StaticMethodInt_0001 end');
    })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0200
     * @tc.name      call_StaticMethodInt_0002
     * @tc.desc      call static method int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_01();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0002 done');
        done();
        console.log('call_StaticMethodInt_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0300
     * @tc.name      call_StaticMethodInt_0003
     * @tc.desc      call static method int v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_02();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0003 done');
        done();
        console.log('call_StaticMethodInt_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0400
     * @tc.name      call_StaticMethodInt_0004
     * @tc.desc      call static method int A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_03();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0004 done');
        done();
        console.log('call_StaticMethodInt_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0500
     * @tc.name      call_StaticMethodInt_0005
     * @tc.desc      call static method int invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0005 done');
        done();
        console.log('call_StaticMethodInt_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0600
     * @tc.name      call_StaticMethodInt_0006
     * @tc.desc      call static method int invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0006 done');
        done();
        console.log('call_StaticMethodInt_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0700
     * @tc.name      call_StaticMethodInt_0007
     * @tc.desc      call static method int invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0007 done');
        done();
        console.log('call_StaticMethodInt_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0800
     * @tc.name      call_StaticMethodInt_0008
     * @tc.desc      call static method int v invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0008 done');
        done();
        console.log('call_StaticMethodInt_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_0900
     * @tc.name      call_StaticMethodInt_0009
     * @tc.desc      call static method int v invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0009 done');
        done();
        console.log('call_StaticMethodInt_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1000
     * @tc.name      call_StaticMethodInt_0010
     * @tc.desc      call static method int v invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0010 done');
        done();
        console.log('call_StaticMethodInt_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1100
     * @tc.name      call_StaticMethodInt_0011
     * @tc.desc      call static method int a invalid cls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_10();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0011 done');
        done();
        console.log('call_StaticMethodInt_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1200
     * @tc.name      call_StaticMethodInt_0012
     * @tc.desc      call static method int a invalid method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_11();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0012 done');
        done();
        console.log('call_StaticMethodInt_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1300
     * @tc.name      call_StaticMethodInt_0013
     * @tc.desc      call static method int a invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_12();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0013 done');
        done();
        console.log('call_StaticMethodInt_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1400
     * @tc.name      call_StaticMethodInt_0014
     * @tc.desc      call static method int a invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0014 done');
        done();
        console.log('call_StaticMethodInt_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1500
     * @tc.name      call_StaticMethodInt_0015
     * @tc.desc      call static method int combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_14();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0015 done');
        done();
        console.log('call_StaticMethodInt_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1600
     * @tc.name      call_StaticMethodInt_0016
     * @tc.desc      call static method int combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_15();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0016 done');
        done();
        console.log('call_StaticMethodInt_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1700
     * @tc.name      call_StaticMethodInt_0017
     * @tc.desc      call static method int combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_16();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0017 done');
        done();
        console.log('call_StaticMethodInt_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1800
     * @tc.name      call_StaticMethodInt_0018
     * @tc.desc      call static method int null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_17();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0018 done');
        done();
        console.log('call_StaticMethodInt_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_1900
     * @tc.name      call_StaticMethodInt_0019
     * @tc.desc      call static method int combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_18();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0019 done');
        done();
        console.log('call_StaticMethodInt_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2000
     * @tc.name      call_StaticMethodInt_0020
     * @tc.desc      call static method int combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_19();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0020 done');
        done();
        console.log('call_StaticMethodInt_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2100
     * @tc.name      call_StaticMethodInt_0021
     * @tc.desc      call static method int combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_20();
        expect(result).assertTrue();
        console.log('call_StaticMethodInt_0021 done');
        done();
        console.log('call_StaticMethodInt_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2200
     * @tc.name      call_StaticMethodInt_0022
     * @tc.desc      call static method int combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0022 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_21();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0022 done');
        done();
        console.log('call_StaticMethodInt_0022 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2300
     * @tc.name      call_StaticMethodInt_0023
     * @tc.desc      call static method int combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0023 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_22();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0023 done');
        done();
        console.log('call_StaticMethodInt_0023 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2400
     * @tc.name      call_StaticMethodInt_0024
     * @tc.desc      check initialization int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0024 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_23();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0024 done');
        done();
        console.log('call_StaticMethodInt_0024 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODINT_2500
     * @tc.name      call_StaticMethodInt_0025
     * @tc.desc      check initialization int a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodInt_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodInt_0025 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodInt_24();
        expect(result).assertFalse();
        console.log('call_StaticMethodInt_0025 done');
        done();
        console.log('call_StaticMethodInt_0025 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0100
     * @tc.name      call_StaticMethodShort_0001
     * @tc.desc      call static method short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0001 done');
        done();
        console.log('call_StaticMethodShort_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0200
     * @tc.name      call_StaticMethodShort_0002
     * @tc.desc      call static method short v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_01();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0002 done');
        done();
        console.log('call_StaticMethodShort_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0300
     * @tc.name      call_StaticMethodShort_0003
     * @tc.desc      call static method short A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_02();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0003 done');
        done();
        console.log('call_StaticMethodShort_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0400
     * @tc.name      call_StaticMethodShort_0004
     * @tc.desc      call static method short from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0004 done');
        done();
        console.log('call_StaticMethodShort_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0500
     * @tc.name      call_StaticMethodShort_0005
     * @tc.desc      call static method short from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0005 done');
        done();
        console.log('call_StaticMethodShort_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0600
     * @tc.name      call_StaticMethodShort_0006
     * @tc.desc      call static method short from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0006 done');
        done();
        console.log('call_StaticMethodShort_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0700
     * @tc.name      call_StaticMethodShort_0007
     * @tc.desc      call static method short from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0007 done');
        done();
        console.log('call_StaticMethodShort_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0800
     * @tc.name      call_StaticMethodShort_0008
     * @tc.desc      call static method short from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0008 done');
        done();
        console.log('call_StaticMethodShort_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_0900
     * @tc.name      call_StaticMethodShort_0009
     * @tc.desc      call static method short from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0009 done');
        done();
        console.log('call_StaticMethodShort_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1000
     * @tc.name      call_StaticMethodShort_0010
     * @tc.desc      call static method short from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodShort_0010 done');
        done();
        console.log('call_StaticMethodShort_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1100
     * @tc.name      call_StaticMethodShort_0011
     * @tc.desc      call static method short from combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_10();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0011 done');
        done();
        console.log('call_StaticMethodShort_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1200
     * @tc.name      call_StaticMethodShort_0012
     * @tc.desc      call static method short from combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_11();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0012 done');
        done();
        console.log('call_StaticMethodShort_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1300
     * @tc.name      call_StaticMethodShort_0013
     * @tc.desc      call static method short from combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodShort_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodShort_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_12();
        expect(result).assertFalse();
        console.log('call_StaticMethodShort_0013 done');
        done();
        console.log('call_StaticMethodShort_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1400
     * @tc.name      class_FindStaticMethodShort_0014
     * @tc.desc      call static method short from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_13();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0014 done');
        done();
        console.log('class_FindStaticMethodShort_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1500
     * @tc.name      class_FindStaticMethodShort_0015
     * @tc.desc      call static method short from combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_14();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0015 done');
        done();
        console.log('class_FindStaticMethodShort_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1600
     * @tc.name      class_FindStaticMethodShort_0016
     * @tc.desc      call static method short from combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_15();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0016 done');
        done();
        console.log('class_FindStaticMethodShort_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1700
     * @tc.name      class_FindStaticMethodShort_0017
     * @tc.desc      call static method short from combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_16();
        expect(result).assertTrue();
        console.log('class_FindStaticMethodShort_0017 done');
        done();
        console.log('class_FindStaticMethodShort_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1800
     * @tc.name      class_FindStaticMethodShort_0018
     * @tc.desc      call static method short from combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_17();
        expect(result).assertFalse();
        console.log('class_FindStaticMethodShort_0018 done');
        done();
        console.log('class_FindStaticMethodShort_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_1900
     * @tc.name      class_FindStaticMethodShort_0019
     * @tc.desc      call static method short from combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_18();
        expect(result).assertFalse();
        console.log('class_FindStaticMethodShort_0019 done');
        done();
        console.log('class_FindStaticMethodShort_0019 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_2000
     * @tc.name      class_FindStaticMethodShort_0020
     * @tc.desc      check initialization short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0020 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_19();
        expect(result).assertFalse();
        console.log('class_FindStaticMethodShort_0020 done');
        done();
        console.log('class_FindStaticMethodShort_0020 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODSHORT_2100
     * @tc.name      class_FindStaticMethodShort_0021
     * @tc.desc      check initialization short a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("class_FindStaticMethodShort_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('class_FindStaticMethodShort_0021 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodShort_20();
        expect(result).assertFalse();
        console.log('class_FindStaticMethodShort_0021 done');
        done();
        console.log('class_FindStaticMethodShort_0021 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0100
     * @tc.name      call_StaticMethodByte_0001
     * @tc.desc      call static method byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0001 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0001 done');
        done();
        console.log('call_StaticMethodByte_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0200
     * @tc.name      call_StaticMethodByte_0002
     * @tc.desc      call static method byte v
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0002 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_01();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0002 done');
        done();
        console.log('call_StaticMethodByte_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0300
     * @tc.name      call_StaticMethodByte_0003
     * @tc.desc      call static method byte A
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0003 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_02();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0003 done');
        done();
        console.log('call_StaticMethodByte_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0400
     * @tc.name      call_StaticMethodByte_0004
     * @tc.desc      call static method byte from null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0004 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_03();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0004 done');
        done();
        console.log('call_StaticMethodByte_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0500
     * @tc.name      call_StaticMethodByte_0005
     * @tc.desc      call static method byte from null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0005 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_04();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0005 done');
        done();
        console.log('call_StaticMethodByte_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0600
     * @tc.name      call_StaticMethodByte_0006
     * @tc.desc      call static method byte from null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0006 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_05();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0006 done');
        done();
        console.log('call_StaticMethodByte_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0700
     * @tc.name      call_StaticMethodByte_0007
     * @tc.desc      call static method byte from A null class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0007 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_06();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0007 done');
        done();
        console.log('call_StaticMethodByte_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0800
     * @tc.name      call_StaticMethodByte_0008
     * @tc.desc      call static method byte from A null method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0008 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_07();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0008 done');
        done();
        console.log('call_StaticMethodByte_0008 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_0900
     * @tc.name      call_StaticMethodByte_0009
     * @tc.desc      call static method short from A null result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0009 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_08();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0009 done');
        done();
        console.log('call_StaticMethodByte_0009 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1000
     * @tc.name      call_StaticMethodByte_0010
     * @tc.desc      call static method short from A null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0010 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_09();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0010 done');
        done();
        console.log('call_StaticMethodByte_0010 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1100
     * @tc.name      call_StaticMethodByte_0011
     * @tc.desc      call static method byte from combine scenes 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0011 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_10();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0011 done');
        done();
        console.log('call_StaticMethodByte_0011 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1200
     * @tc.name      call_StaticMethodByte_0012
     * @tc.desc      call static method byte from combine scenes 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0012 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_11();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0012 done');
        done();
        console.log('call_StaticMethodByte_0012 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1300
     * @tc.name      call_StaticMethodByte_0013
     * @tc.desc      call static method byte from combine scenes 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0013 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_12();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0013 done');
        done();
        console.log('call_StaticMethodByte_0013 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1400
     * @tc.name      call_StaticMethodByte_0014
     * @tc.desc      call static method byte from null env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0014 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_13();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0014 done');
        done();
        console.log('call_StaticMethodByte_0014 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1500
     * @tc.name      call_StaticMethodByte_0015
     * @tc.desc      call static method short from combine scenes 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0015 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_14();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0015 done');
        done();
        console.log('call_StaticMethodByte_0015 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1600
     * @tc.name      call_StaticMethodByte_0016
     * @tc.desc      call static method byte from combine scenes 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0016 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_15();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0016 done');
        done();
        console.log('call_StaticMethodByte_0016 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1700
     * @tc.name      call_StaticMethodByte_0017
     * @tc.desc      call static method byte from combine scenes 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0017 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_16();
        expect(result).assertTrue();
        console.log('call_StaticMethodByte_0017 done');
        done();
        console.log('call_StaticMethodByte_0017 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1800
     * @tc.name      call_StaticMethodByte_0018
     * @tc.desc      call static method byte from combine scenes 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0018 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_17();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0018 done');
        done();
        console.log('call_StaticMethodByte_0018 end');
      })

    /**
     * @tc.number    SUB_ANI_CLASS_OPERATIONS_STATICMETHODBYTE_1900
     * @tc.name      call_StaticMethodByte_0019
     * @tc.desc      call static method byte from combine scenes 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("call_StaticMethodByte_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('call_StaticMethodByte_0019 start');
        let cls = new Foo();
        let result = cls.test_Class_FindStaticMethodByte_18();
        expect(result).assertFalse();
        console.log('call_StaticMethodByte_0019 done');
        done();
        console.log('call_StaticMethodByte_0019 end');
      })
  })
}