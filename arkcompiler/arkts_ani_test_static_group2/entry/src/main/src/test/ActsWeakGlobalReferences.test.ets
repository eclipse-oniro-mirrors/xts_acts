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

export default function weakGlobalReferencesTest() {

  describe("ActsWeakGlobalReferencesTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log("loadFailed" + e.message)
    }

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0100
     * @tc.name      test_WeakReference_Delete_0001
     * @tc.desc      weakreference delete from null ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0001 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Delete();
        expect(result).assertTrue();
        console.log('test_WeakReference_Delete_0001 done');
        done();
        console.log('test_WeakReference_Delete_0001 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0200
     * @tc.name      test_WeakReference_Delete_0002
     * @tc.desc      weakreference delete from undefined ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0002 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Delete_02();
        expect(result).assertTrue();
        console.log('test_WeakReference_Delete_0002 done');
        done();
        console.log('test_WeakReference_Delete_0002 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0300
     * @tc.name      test_WeakReference_Delete_0003
     * @tc.desc      weakreference delete from object ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0003 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Delete_03();
        expect(result).assertTrue();
        console.log('test_WeakReference_Delete_0003 done');
        done();
        console.log('test_WeakReference_Delete_0003 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0400
     * @tc.name      test_WeakReference_Delete_0004
     * @tc.desc      weakreference delete from object gref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0004 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Delete_04();
        expect(result).assertTrue();
        console.log('test_WeakReference_Delete_0004 done');
        done();
        console.log('test_WeakReference_Delete_0004 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_DELETE_0500
     * @tc.name      test_WeakReference_Delete_0005
     * @tc.desc      weakreference delete invalid env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Delete_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Delete_0005 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Delete_05();
        expect(result).assertTrue();
        console.log('test_WeakReference_Delete_0005 done');
        done();
        console.log('test_WeakReference_Delete_0005 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0100
     * @tc.name      test_WeakReference_Create_0001
     * @tc.desc      create weakreference from undefined ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0001 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0001 done');
        done();
        console.log('test_WeakReference_Create_0001 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0200
     * @tc.name      test_WeakReference_Create_0002
     * @tc.desc      create weakreference from undefined ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0002 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_02();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0002 done');
        done();
        console.log('test_WeakReference_Create_0002 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0300
     * @tc.name      test_WeakReference_Create_0003
     * @tc.desc      create weakreference from object ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0003 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_03();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0003 done');
        done();
        console.log('test_WeakReference_Create_0003 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0400
     * @tc.name      test_WeakReference_Create_0004
     * @tc.desc      create weakreference from object gref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0004 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_04();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0004 done');
        done();
        console.log('test_WeakReference_Create_0004 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0500
     * @tc.name      test_WeakReference_Create_0005
     * @tc.desc      create weakreference invalid result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0005 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_05();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0005 done');
        done();
        console.log('test_WeakReference_Create_0005 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0600
     * @tc.name      test_WeakReference_Create_0006
     * @tc.desc      create undefined weakreference is normal
     * @tc.size      MediumTest
     * @tc.type      Function test
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0006 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_06();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0006 done');
        done();
        console.log('test_WeakReference_Create_0006 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0700
     * @tc.name      test_WeakReference_Create_0007
     * @tc.desc      create a/b/c/d/e weakreference and get reference is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0007 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_07();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0007 done');
        done();
        console.log('test_WeakReference_Create_0007 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0800
     * @tc.name      test_WeakReference_Create_0008
     * @tc.desc      create one weakreference and get reference is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0008 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_08();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0008 done');
        done();
        console.log('test_WeakReference_Create_0008 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_0900
     * @tc.name      test_WeakReference_Create_0009
     * @tc.desc      create A/B weakreference and get A/B reference is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0009 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_09();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0009 done');
        done();
        console.log('test_WeakReference_Create_0009 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_1000
     * @tc.name      test_WeakReference_Create_0010
     * @tc.desc      create two weakreference and get reference is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0010 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_10();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0010 done');
        done();
        console.log('test_WeakReference_Create_0010 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_1100
     * @tc.name      test_WeakReference_Create_0011
     * @tc.desc      create weakreference and get reference is normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0011 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_11();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0011 done');
        done();
        console.log('test_WeakReference_Create_0011 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_CREATE_1200
     * @tc.name      test_WeakReference_Create_0012
     * @tc.desc      create weakreference invalid env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_Create_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_Create_0012 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_Create_12();
        expect(result).assertTrue();
        console.log('test_WeakReference_Create_0012 done');
        done();
        console.log('test_WeakReference_Create_0012 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0100
     * @tc.name      test_WeakReference_GetReference_0001
     * @tc.desc      get reference from null ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0001 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0001 done');
        done();
        console.log('test_WeakReference_GetReference_0001 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0200
     * @tc.name      test_WeakReference_GetReference_0002
     * @tc.desc      get reference from undefined ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0002 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_02();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0002 done');
        done();
        console.log('test_WeakReference_GetReference_0002 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0300
     * @tc.name      test_WeakReference_GetReference_0003
     * @tc.desc      get reference from object ref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0003 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_03();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0003 done');
        done();
        console.log('test_WeakReference_GetReference_0003 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0400
     * @tc.name      test_WeakReference_GetReference_0004
     * @tc.desc      get reference freed wref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0004 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_04();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0004 done');
        done();
        console.log('test_WeakReference_GetReference_0004 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0500
     * @tc.name      test_WeakReference_GetReference_0005
     * @tc.desc      get reference from object gref
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0005 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_05();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0005 done');
        done();
        console.log('test_WeakReference_GetReference_0005 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0600
     * @tc.name      test_WeakReference_GetReference_0006
     * @tc.desc      get reference invalid was reslease result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0006 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_06();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0006 done');
        done();
        console.log('test_WeakReference_GetReference_0006 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0700
     * @tc.name      test_WeakReference_GetReference_0007
     * @tc.desc      get reference invalid ref result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0007 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_07();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0007 done');
        done();
        console.log('test_WeakReference_GetReference_0007 end');
      });

    /**
     * @tc.number    SUB_ANI_WEAKREFERENCE_GETREFERENCE_0800
     * @tc.name      test_WeakReference_GetReference_0008
     * @tc.desc      get reference invalid ref env
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakReference_GetReference_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_WeakReference_GetReference_0008 start');
        let cls = new Foo();
        let result = cls.test_WeakReference_GetReference_08();
        expect(result).assertTrue();
        console.log('test_WeakReference_GetReference_0008 done');
        done();
        console.log('test_WeakReference_GetReference_0008 end');
      });
  })
}