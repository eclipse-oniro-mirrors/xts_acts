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
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityManager from "@ohos.app.ability.abilityManager"
import { ShellCmdResult } from "application.shellCmdResult"
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityManagerStaticTest() {
  describe('abilityManagerStaticTest', () => {
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
    })
    
    /**
     * @tc.name   System_API_Test_Ability_Manager_Static_0400
     * @tc.number System_API_Test_Ability_Manager_Static_0400
     * @tc.desc   Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("System_API_Test_Ability_Manager_Static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = 'System_API_Test_Ability_Manager_Static_0400';
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.systemapitest.static");
      await Utils.msSleep(2000);
      abilityManager.getAbilityRunningInfos()
        .then((data: abilityManager.AbilityRunningInfo[]): void => {
          hilog.info(domain, tag, 'data: ' + JSON.stringify(data[0]));
          expect(data.length + '').assertEqual('1');
          expect(data[0].ability.bundleName).assertEqual('com.example.systemapitest.static');
          expect(data[0].pid).assertLargerOrEqual(0);
          expect(data[0].uid).assertLargerOrEqual(0);
          expect(data[0].processName).assertEqual("com.example.systemapitest.static");
          expect(data[0].abilityState).not().assertNull();
          expect(data[0].startTime).assertLarger(0);
          done();
        })
        .catch((err): void => {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, ' err:' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        })
    })

    /**
     * @tc.name   System_API_Test_Ability_Manager_Static_0900
     * @tc.number System_API_Test_Ability_Manager_Static_0900
     * @tc.desc   cover all value of abilityState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("System_API_Test_Ability_Manager_Static_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `System_API_Test_Ability_Manager_Static_0900`;
      hilog.info(domain, tag, 'test begin');
      try {
        expect(abilityManager.AbilityState.INITIAL + '').assertEqual('0');
        expect(abilityManager.AbilityState.FOCUS + '').assertEqual('2');
        expect(abilityManager.AbilityState.FOREGROUND + '').assertEqual('9');
        expect(abilityManager.AbilityState.BACKGROUND + '').assertEqual('10');
        expect(abilityManager.AbilityState.FOREGROUNDING + '').assertEqual('11');
        expect(abilityManager.AbilityState.BACKGROUNDING + '').assertEqual('12');
        hilog.info(domain, tag, 'test end');
        done();
      } catch (error) {
        hilog.info(domain, tag,' failed: ' + JSON.stringify(error));
        expect().assertFail()
      }
    })
  })
}
