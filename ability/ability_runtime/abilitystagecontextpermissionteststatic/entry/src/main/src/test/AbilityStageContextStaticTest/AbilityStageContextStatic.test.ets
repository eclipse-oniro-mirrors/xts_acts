/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import AbilityStage from "@ohos.app.ability.AbilityStage"

let domain: int = 0x0000;
let tag: string = 'testTag';
let addMonitor = false;
let removeMonitor = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let AbilityStageContext: common.AbilityStageContext

export default function AbilityStageContextStatic() {
  describe('AbilityStageContextStatic', () => {

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stagecontextpermissiontest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Permission_Static_0100
     * @tc.number SUB_AA_AbilityStageMonitor_Permission_Static_0100
     * @tc.desc   Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AA_AbilityStageMonitor_Permission_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const itName = 'waitAbilityStageMonitor_callback';
        hilog.info(domain, tag, `${itName} waitAbilityStageMonitor start`);
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './ets/myabilitystage/MyAbilityStage.ets',
        }, (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor err ${err?.code}`);
          expect(err?.code).assertEqual(16000100);
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor end`);
          done()
        })
      })
  })
}
