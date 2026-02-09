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

import { describe, beforeAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function moveAbilityToBackgroundTestStatic() {
  describe('ActsMoveAbilityToBackgroundTestStatic', () => {
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
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground,expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100`;
      hilog.info(domain, tag, `it begin`);
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        hilog.info(domain, tag, 'getAbilityDelegator success');
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static")
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'start success');
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
        hilog.info(domain, tag, 'getcontext success, context: ' + context);
        context.moveAbilityToBackground().then(async () => {
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          let result = AppStorage.get<string>("onBackground")
          expect(result + '').assertEqual('SUCCESS');
          done();
        }).catch((err): void => {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            if(JSON.stringify(err?.code) == '16000061'){
              done();
            }else{
              expect().assertFail()
              done();
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `moveAbilityToBackground fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground twice, expecting to return 16000065 on the second attempt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        hilog.info(domain, tag, 'getAbilityDelegator success');
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static")
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'start success');
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
        hilog.info(domain, tag, 'getcontext success, context: ' + context);
        context.moveAbilityToBackground().then(() => {
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          let result = AppStorage.get<string>("onBackground")
          expect(result + '').assertEqual('SUCCESS');
        }).catch((err): void => {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            if(JSON.stringify(err?.code) == '16000061'){
              done();
            }else{
              expect().assertFail()
              done();
            }
          }
        });
        await Utils.msSleep(2000);
        context.moveAbilityToBackground().then(() => {
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          expect().assertFail();
          done();
        }).catch((err): void => {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
            expect(err.code).assertEqual(16000065);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `moveAbilityToBackground fail: ` + err);
        expect().assertFail();
        done();
      }
    })
  })
}
