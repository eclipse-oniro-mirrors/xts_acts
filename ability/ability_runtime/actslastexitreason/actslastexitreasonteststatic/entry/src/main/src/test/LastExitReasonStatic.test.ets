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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function lastExitReasonStaticTest() {
  describe('ActsLastExitReasonStaticTest', () => {

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.lastexitreasontest.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 start EntryAbility');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_FaultManagement_Static_7900
     * @tc.number SUB_Ability_AbilityRuntime_FaultManagement_Static_7900
     * @tc.desc   Kill process by shell and restart app, check ability LaunchParam last exit reason and message,Expect: lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_Static_7900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_FaultManagement_Static_7900`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 begin');
      try {
        let launchParam = AppStorage.get<AbilityConstant.LaunchParam>("launchParam");
        hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 launchParam: ' + JSON.stringify(launchParam));
        if (launchParam) {
          let launchReason = launchParam.launchReason as number
          hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 launchReason: ' + launchReason);
          expect(launchReason + '').assertEqual('1');
          let lastExitReason = launchParam.lastExitReason as number
          hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 lastExitReason: ' + lastExitReason);
          expect(lastExitReason + '').assertEqual(AbilityConstant.LastExitReason.NORMAL + '');
          let lastExitMessage = launchParam.lastExitMessage as string
          hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 lastExitDetlastExitMessageailInfo: ' + lastExitMessage);
          expect(lastExitMessage?.length == 0).assertTrue();
          done()
        } else {
          hilog.info(domain, tag, `launchParam is empty`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_FaultManagement_Static_7901
     * @tc.number SUB_Ability_AbilityRuntime_FaultManagement_Static_7901
     * @tc.desc   Kill process by shell and restart app, check ability LaunchParam last exit reason and message,Expect: lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_Static_7901', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_FaultManagement_Static_7901`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7901 begin');
      try {
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.lastexitreasontest.static")
        await Utils.msSleep(2000)
        hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7901 start EntryAbility');
        let launchParam = AppStorage.get<AbilityConstant.LaunchParam>("launchParam");
        let lastExitDetailInfo = AppStorage.get<AbilityConstant.LastExitDetailInfo>("lastExitDetailInfo");
        hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7901 lastExitDetailInfo: ' + JSON.stringify(lastExitDetailInfo));
        expect(lastExitDetailInfo?.exitMsg).assertEqual("");
        expect(lastExitDetailInfo?.exitSubReason).assertEqual(-1);
        expect(lastExitDetailInfo?.pid).assertEqual(-1);
        expect(lastExitDetailInfo?.processName).assertEqual("");
        expect(lastExitDetailInfo?.pss).assertEqual(0);
        expect(lastExitDetailInfo?.rss).assertEqual(0);
        expect(lastExitDetailInfo?.timestamp).assertEqual(0);
        expect(lastExitDetailInfo?.uid).assertEqual(-1);
        let processState = lastExitDetailInfo?.processState
        if(processState != undefined && processState != null) {
          hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7901 lastExitDetailInfo.processState: ' + processState);
          expect(processState > -1).assertTrue();
        }
        let launchReasonMessage = launchParam?.launchReasonMessage as string
        hilog.info(domain, tag, 'SUB_Ability_AbilityRuntime_FaultManagement_Static_7900 launchReasonMessage: ' + launchReasonMessage);
        expect(launchReasonMessage).assertEqual("");
        done();
      } catch (err) {
        hilog.info(domain, tag, `error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });
  })
}
