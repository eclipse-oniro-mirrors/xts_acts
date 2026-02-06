/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function verificationStaticTest() {
  describe('verificationStaticTest', () => {

    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility2 -b com.example.apicoverhaptest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_AbilityConstant_Static_0200
     * @tc.name    SUB_AA_OpenHarmony_AbilityConstant_Static_0200
     * @tc.desc    The startAbility interface starts the ability, not the start of call or continue.
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_AbilityConstant_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      tag = 'SUB_AA_OpenHarmony_AbilityConstant_Static_0200 ==>';
      await Utils.msSleep(2000);
      let launchWant: Want = AppStorage.get<Want>("launchWant") as Want;
      let lastRequestWant: Want = AppStorage.get<Want>("lastRequestWant") as Want;
      let windowStage: window.WindowStage = AppStorage.get<window.WindowStage>("windowStage") as window.WindowStage;
      expect(launchWant.bundleName).assertEqual("com.example.apicoverhaptest.static");
      expect(lastRequestWant.bundleName).assertEqual("com.example.apicoverhaptest.static");
      expect(windowStage).not().assertNull();
      done();
    })
  })
}