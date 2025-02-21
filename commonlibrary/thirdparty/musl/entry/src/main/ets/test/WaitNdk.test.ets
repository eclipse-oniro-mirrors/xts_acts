/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium'
import waitndk from 'libwaitndk.so'


export default function muslWaitNdkTest() {
  describe('MuslWaitTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAIT_0100
     * @tc.name       : testMuslWaitWait001
     * @tc.desc       : test wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWaitWait001', 0, async (done: Function) => {
      let data: number= waitndk.wait();
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAIT3_0100
     * @tc.name       : testMuslWaitWait3001
     * @tc.desc       : test wait3
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWaitWait3001', 0, async (done: Function) => {
      let data: number = waitndk.wait3();
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAIT4_0100
     * @tc.name       : testMuslWaitWait4001
     * @tc.desc       : test wait4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWaitWait4001', 0, async (done: Function) => {
      let data: number = waitndk.wait4();
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAITID_0100
     * @tc.name       : testMuslWaitWaitid001
     * @tc.desc       : test waitid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWaitWaitid001', 0, async (done: Function) => {
      let data: number = waitndk.waitid();
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAITPID_0100
     * @tc.name       : testMuslWaitWaitpid001
     * @tc.desc       : test waitpid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslWaitWaitpid001', 0, async (done: Function) => {
      let data: number = waitndk.waitpid();
      expect(data).assertEqual(1);
      done()
    });
  })
}
