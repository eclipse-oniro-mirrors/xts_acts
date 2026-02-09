/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;

export default function GetCurrentTopAbilityTest() {
  describe("GetCurrentTopAbilityTest", () => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.delegatortest.static");
      await Utils.msSleep(2000);
    });

    /**
     * @tc.name   ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001
     * @tc.number ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001
     * @tc.desc   Test the api "abilityDelegator.getCurrentTopAbility", return the uiAbility state result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001", Level.LEVEL2, async (done: () => void): Promise<void> =>{
      console.log("ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001 :start");
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      setTimeout(() => {
        abilityDelegator.startAbility({
          abilityName: "Main4Ability",
          bundleName: "com.example.delegatortest.static",
          moduleName: "entry",
        }, () => {
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: BusinessError | null, ability2: UIAbility | undefined) => {
              if (ability2 != null) {
                abilityDelegator.printSync(
                  "ACTS_GetCurrentTopAbility_CALLBACK_0001 getCurrentTopAbility2: " +
                  ability2?.context?.abilityInfo.name
                );
                expect(ability2?.context?.abilityInfo.name).assertEqual(
                  "Main4Ability"
                );
                done();
              } else {
                abilityDelegator.printSync(
                  "ACTS_GetCurrentTopAbility_CALLBACK_0001 getCurrentTopAbility2 not found."
                );
                expect().assertFail();
                done();
              }
            });
          }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
        });
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });

    /**
     * @tc.name   ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002
     * @tc.number ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002
     * @tc.desc   Test the api "abilityDelegator.getCurrentTopAbility", return the uiAbility state result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002", Level.LEVEL2, async (done: () => void): Promise<void> =>{
      console.log("ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 :start");
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.printSync(
        "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 getCurrentTopAbility start"
      );
      abilityDelegator.startAbility({
        abilityName: "Main3Ability",
        bundleName: "com.example.delegatortest.static",
        moduleName: "entry",
      });
      setTimeout(() => {
        abilityDelegator
          .getCurrentTopAbility()
          .then((ability: UIAbility):void  => {
            if (ability != null) {
              abilityDelegator.printSync(
                "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 getCurrentTopAbility1: " +
                ability.context.abilityInfo.name
              );
              expect(ability.context.abilityInfo.name).assertEqual(
                "Main3Ability"
              );
              done();
            } else {
              abilityDelegator.printSync(
                "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 getCurrentTopAbility1 not found ability1."
              );
              expect().assertFail();
              done();
            }
          })
          .catch((error: Error):void => {
            abilityDelegator.printSync(
              "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 catch error: " + error
            );
          });
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });
  });
}
