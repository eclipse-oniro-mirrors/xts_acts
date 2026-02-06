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

export default function promiseTest() {

  describe("ActsPromiseTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_PROMISE_NEW_0100
     * @tc.name      test_Promise_New_0001
     * @tc.desc      resolve promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_New_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Promise_New_0001 start');
        let cls = new Foo();
        let result = cls.test_Promise_New();
        expect(result).assertTrue();
        console.log('test_Promise_New_0001 done');
        done();
        console.log('test_Promise_New_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISE_NEW_0200
     * @tc.name      test_Promise_New_0002
     * @tc.desc      invalid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_New_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Promise_New_0002 start');
        let cls = new Foo();
        let result = cls.test_Promise_New_01();
        expect(result).assertTrue();
        console.log('test_Promise_New_0002 done');
        done();
        console.log('test_Promise_New_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISE_NEW_0300
     * @tc.name      test_Promise_New_0003
     * @tc.desc      invalid argument 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_New_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Promise_New_0003 start');
        let cls = new Foo();
        let result = cls.test_Promise_New_02();
        expect(result).assertTrue();
        console.log('test_Promise_New_0003 done');
        done();
        console.log('test_Promise_New_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISE_NEW_0400
     * @tc.name      test_Promise_New_0004
     * @tc.desc      invalid argument 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_New_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Promise_New_0004 start');
        let cls = new Foo();
        let result = cls.test_Promise_New_03();
        expect(result).assertTrue();
        console.log('test_Promise_New_0004 done');
        done();
        console.log('test_Promise_New_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISE_NEW_0500
     * @tc.name      test_Promise_New_0005
     * @tc.desc      continuous calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_New_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Promise_New_0005 start');
        let cls = new Foo();
        let result = cls.test_Promise_New_04();
        expect(result).assertTrue();
        console.log('test_Promise_New_0005 done');
        done();
        console.log('test_Promise_New_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_REJECT_0100
     * @tc.name      test_PromiseResolver_Reject_0001
     * @tc.desc      resolve promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Reject_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Reject_0001 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Reject();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Reject_0001 done');
        done();
        console.log('test_PromiseResolver_Reject_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_REJECT_0200
     * @tc.name      test_PromiseResolver_Reject_0002
     * @tc.desc      invalid argument 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Reject_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Reject_0002 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Reject_01();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Reject_0002 done');
        done();
        console.log('test_PromiseResolver_Reject_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_REJECT_0300
     * @tc.name      test_PromiseResolver_Reject_0003
     * @tc.desc      invalid argument 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Reject_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Reject_0003 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Reject_02();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Reject_0003 done');
        done();
        console.log('test_PromiseResolver_Reject_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_RESOLVE_0100
     * @tc.name      test_PromiseResolver_Resolve_0001
     * @tc.desc      resolve promise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Resolve_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Resolve_0001 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Resolve();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Resolve_0001 done');
        done();
        console.log('test_PromiseResolver_Resolve_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_RESOLVE_0200
     * @tc.name      test_PromiseResolver_Resolve_0002
     * @tc.desc      invalid argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Resolve_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Resolve_0002 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Resolve_01();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Resolve_0002 done');
        done();
        console.log('test_PromiseResolver_Resolve_0002 end');
    })

    /**
     * @tc.number    SUB_ANI_PROMISERESOLVER_RESOLVE_0300
     * @tc.name      test_PromiseResolver_Resolve_0003
     * @tc.desc      invalid argument 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PromiseResolver_Resolve_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_PromiseResolver_Resolve_0003 start');
        let cls = new Foo();
        let result = cls.test_PromiseResolver_Resolve_02();
        expect(result).assertTrue();
        console.log('test_PromiseResolver_Resolve_0003 done');
        done();
        console.log('test_PromiseResolver_Resolve_0003 end');
      })
})
}