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

export default function vmOpsTest() {

  describe("ActsVmOpsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log("loadFailed" + e.message)
    }

    /**
     * @tc.number    SUB_ANI_ATTACH_CURRENT_THREAD_DETACH_CURRENT_THREAD_0100
     * @tc.name      AttachCurrentThreadAndDetachCurrentThread_0001
     * @tc.desc      test attach current thread and detach thread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("AttachCurrentThreadAndDetachCurrentThread_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('AttachCurrentThreadAndDetachCurrentThread_0001 start');
        let cls = new Foo();
        let result = cls.test_AttachCurrentThreadAndDetachCurrentThread();
        expect(result).assertTrue();
        console.log('AttachCurrentThreadAndDetachCurrentThread_0001 done');
        done();
        console.log('AttachCurrentThreadAndDetachCurrentThread_0001 end');
      })
  })
}