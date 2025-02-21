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
import stropts from 'libstroptsndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function muslStroptsNdkTest() {
  describe('MuslStroptsTest', () => {
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_STROPTS_IOCTL_0100
     * @tc.name     : testMuslStroptsIoctl001
     * @tc.desc     : test ioctl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslStroptsIoctl001', 0, async (done: Function) => {
      let result: number = stropts.ioctl();
      expect(result).assertEqual(0)
      done()
    });
  })
}