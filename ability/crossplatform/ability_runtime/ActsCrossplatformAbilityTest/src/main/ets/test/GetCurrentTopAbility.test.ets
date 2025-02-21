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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
} from "@ohos/hypium";
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;

export default function GetCurrentTopAbilityTest() {
  describe("GetCurrentTopAbilityTest", function () {
    beforeAll(function () {
      let want = {
        abilityName: "MainAbility",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number: ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001
     * @tc.name  : actsGetCurrentTopAbilityCallback0001
     * @tc.desc  : Test the api "abilityDelegator.getCurrentTopAbility", return the uiAbility state result.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("ACTS_GET_CURRENT_TOP_ABILITY_CALL_BACK_0001", 0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        abilityName: "Main4Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      setTimeout(() => {
        abilityDelegator.startAbility(want, () => {
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability2: any) => {
              if (ability2 != null) {
                abilityDelegator.printSync(
                  "ACTS_GetCurrentTopAbility_CALLBACK_0001 getCurrentTopAbility2: " +
                    ability2.context.abilityInfo.name
                );
                expect(ability2.context.abilityInfo.name).assertEqual(
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
     * @tc.number: ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002
     * @tc.name  : actsGetCurrentTopAbilityCallback0002
     * @tc.desc  : Test the api "abilityDelegator.getCurrentTopAbility", return the uiAbility state result.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002", 0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        abilityName: "Main3Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      abilityDelegator.printSync(
        "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 getCurrentTopAbility start"
      );
      abilityDelegator.startAbility(want);
      setTimeout(() => {
        abilityDelegator
          .getCurrentTopAbility()
          .then((ability: any) => {
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
          .catch((error) => {
            abilityDelegator.printSync(
              "ACTS_GET_CURRENT_TOP_ABILITY_PROMISE_0002 catch error: " + error
            );
          });
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });
  });
}
