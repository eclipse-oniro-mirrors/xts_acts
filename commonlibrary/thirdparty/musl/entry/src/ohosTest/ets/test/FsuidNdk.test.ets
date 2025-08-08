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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import fsuid from 'libfsuidndk.so'

export default function fsuidNdkTest() {
  describe('MuslFsuidTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FSUID_SETFSGID_0100
     * @tc.name       : testMuslFsuidSetfsgid001
     * @tc.desc       : test setfsgid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslFsuidSetfsgid001', 0, async (done: Function) => {
      let a: number = fsuid.setfsgid();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FSUID_SETFSUID_0100
     * @tc.name       : testMuslFsuidSetfsuid001
     * @tc.desc       : test setfsuid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslFsuidSetfsuid001', 0, async (done: Function) => {
      let a: number = fsuid.setfsuid();
      expect(a).assertEqual(0);
      done()
    });
  })
}