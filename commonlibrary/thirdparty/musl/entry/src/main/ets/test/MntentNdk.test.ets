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
import mntent from 'libmntentndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function mntentNdkTest() {
  describe('MuslMntentTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MNTENT_SETMNTENT_0100
     * @tc.name       : testMuslMntentSetmntent001
     * @tc.desc       : test setmntent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMntentSetmntent001', 0, async (done: Function) => {
      let a = mntent.setmntent();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MNTENT_HASMNTOPT_0100
     * @tc.name     : testMuslMntentHasmntopt001
     * @tc.desc     : test hasmntopt
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMntentHasmntopt001', 0, async (done: Function) => {
      let result = mntent.hasmntopt();
      expect(result).assertEqual(0)
      done()
    });
  })
}