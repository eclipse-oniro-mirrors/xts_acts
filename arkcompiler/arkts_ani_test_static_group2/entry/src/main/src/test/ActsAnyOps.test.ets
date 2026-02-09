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

export default function anyOpsTest() {

  describe("ActsAnyOpsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_ANY_OPS_CALL_0100
     * @tc.name      test_Any_Call_0001
     * @tc.desc      any call invalid func
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_Call_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_Call_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_Call();
        expect(result).assertTrue();
        console.log('test_Any_Call_0001 done');
        done();
        console.log('test_Any_Call_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_CALL_METHOD_0100
     * @tc.name      test_Any_CallMethod_0001
     * @tc.desc      any call from method null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_CallMethod_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_CallMethod_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_CallMethod();
        expect(result).assertTrue();
        console.log('test_Any_CallMethod_0001 done');
        done();
        console.log('test_Any_CallMethod_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_CALL_METHOD_0200
     * @tc.name      test_Any_CallMethod_0002
     * @tc.desc      any call from method null args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_CallMethod_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_CallMethod_0002 start');
        let cls = new Foo();
        let result = cls.test_Any_CallMethod_01();
        expect(result).assertFalse();
        console.log('test_Any_CallMethod_0002 done');
        done();
        console.log('test_Any_CallMethod_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_GET_PROPERTY_0100
     * @tc.name      test_Any_GetProperty_0001
     * @tc.desc      any get property valid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_GetProperty_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_GetProperty_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty();
        expect(result).assertTrue();
        console.log('test_Any_GetProperty_0001 done');
        done();
        console.log('test_Any_GetProperty_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_GET_PROPERTY_0400
     * @tc.name      Any_GetProperty_0004
     * @tc.desc      any get by value valid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("Any_GetProperty_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_GetProperty_0004 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty_03();
        expect(result).assertFalse();
        console.log('Any_GetProperty_0004 done');
        done();
        console.log('Any_GetProperty_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_GET_PROPERTY_0500
     * @tc.name      test_Any_GetProperty_0005
     * @tc.desc      any get property invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_GetProperty_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_GetProperty_0005 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty_04();
        expect(result).assertFalse();
        console.log('test_Any_GetProperty_0005 done');
        done();
        console.log('test_Any_GetProperty_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_GET_PROPERTY_0600
     * @tc.name      test_Any_GetProperty_0006
     * @tc.desc      any get by value invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_GetProperty_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_GetProperty_0006 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty_05();
        expect(result).assertFalse();
        console.log('test_Any_GetProperty_0006 done');
        done();
        console.log('test_Any_GetProperty_0006 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_GET_PROPERTY_0700
     * @tc.name      test_Any_GetProperty_0007
     * @tc.desc      any get by value invalid key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_GetProperty_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_GetProperty_0007 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty_06();
        expect(result).assertFalse();
        console.log('test_Any_GetProperty_0007 done');
        done();
        console.log('test_Any_GetProperty_0007 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_INSTANCEOF_0100
     * @tc.name      test_Any_InstanceOf_0001
     * @tc.desc      any instance of invalid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_InstanceOf_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_InstanceOf_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_InstanceOf();
        expect(result).assertTrue();
        console.log('test_Any_InstanceOf_0001 done');
        done();
        console.log('test_Any_InstanceOf_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_INSTANCEOF_0200
     * @tc.name      test_Any_InstanceOf_0002
     * @tc.desc      any instance of invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_InstanceOf_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_InstanceOf_0002 start');
        let cls = new Foo();
        let result = cls.test_Any_InstanceOf_01();
        expect(result).assertTrue();
        console.log('test_Any_InstanceOf_0002 done');
        done();
        console.log('test_Any_InstanceOf_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_NEW_0100
     * @tc.name      test_Any_New_0001
     * @tc.desc      any new invalid type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_New_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_New_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_New();
        expect(result).assertTrue();
        console.log('test_Any_New_0001 done');
        done();
        console.log('test_Any_New_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_NEW_0200
     * @tc.name      test_Any_New_0002
     * @tc.desc      any new invalid params
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_New_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_New_0002 start');
        let cls = new Foo();
        let result = cls.test_Any_New_01();
        expect(result).assertTrue();
        console.log('test_Any_New_0002 done');
        done();
        console.log('test_Any_New_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0100
     * @tc.name      test_Any_SetProperty_0001
     * @tc.desc      any set property valid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0001 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty();
        expect(result).assertTrue();
        console.log('test_Any_SetProperty_0001 done');
        done();
        console.log('test_Any_SetProperty_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0200
     * @tc.name      test_Any_SetProperty_0002
     * @tc.desc      any set by index valid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0002 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty_01();
        expect(result).assertFalse();
        console.log('test_Any_SetProperty_0002 done');
        done();
        console.log('test_Any_SetProperty_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0300
     * @tc.name      test_Any_SetProperty_0003
     * @tc.desc      any set by value valid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0003 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty_02();
        expect(result).assertFalse();
        console.log('test_Any_SetProperty_0003 done');
        done();
        console.log('test_Any_SetProperty_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0400
     * @tc.name      test_Any_SetProperty_0004
     * @tc.desc      any set property invalid args
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0004 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty_03();
        expect(result).assertTrue();
        console.log('test_Any_SetProperty_0004 done');
        done();
        console.log('test_Any_SetProperty_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0500
     * @tc.name      test_Any_SetProperty_0005
     * @tc.desc      any set by index invalid
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0005 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty_04();
        expect(result).assertFalse();
        console.log('test_Any_SetProperty_0005 done');
        done();
        console.log('test_Any_SetProperty_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_ANY_OPS_SET_PROPERTY_0600
     * @tc.name      test_Any_SetProperty_0006
     * @tc.desc      any set by value invalid key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_Any_SetProperty_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_Any_SetProperty_0006 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty_05();
        expect(result).assertFalse();
        console.log('test_Any_SetProperty_0006 done');
        done();
        console.log('test_Any_SetProperty_0006 end');
      })
  })
}