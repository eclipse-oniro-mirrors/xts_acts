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
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 1000;

export default function GetAbilityStateTest() {
  describe("GetAbilityStateTest", function () {
    beforeAll(function () {
      let want = {
        abilityName: "MainAbility",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number: ACTS_GET_ABILITY_STATE_0001
     * @tc.name  : actsGetAbilityState0001
     * @tc.desc  : Test the api "abilityDelegator.getAbilityState", return the uiAbility state result.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("ACTS_GET_ABILITY_STATE_0001", 0, async function (done) {
      let want = {
        abilityName: "Main4Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      setTimeout(() => {
        abilityDelegator.startAbility(want, () => {
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability2: any) => {
              try {
                var stateNum = abilityDelegator.getAbilityState(ability2);
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0001 getAbilityState: " + stateNum
                );
                expect(stateNum).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0001 getAbilityState Pass. "
                );
                done();
              } catch (error) {
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0001 error: " + error
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
     * @tc.number: ACTS_GET_ABILITY_STATE_0002
     * @tc.name  : actsGetAbilityState0002
     * @tc.desc  : Test the api "abilityDelegator.getAbilityState", return the uiAbility state result.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("ACTS_GET_ABILITY_STATE_0002", 0, async function (done) {
      let want = {
        abilityName: "Main3Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_GET_ABILITY_STATE_0002 getCurrentTopAbility start：" +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility(want, () => {
            abilityDelegator.printSync(
              "ACTS_GET_ABILITY_STATE_0002 startAbility "
            );
            setTimeout(() => {
              try {
                var stateNum = abilityDelegator.getAbilityState(ability1);
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0002 getAbilityState: " + stateNum
                );
                expect(stateNum).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0002 getAbilityState Pass. "
                );
                done();
              } catch (error) {
                abilityDelegator.printSync(
                  "ACTS_GET_ABILITY_STATE_0002 error: " + error
                );
                expect().assertFail();
                done();
              }
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
          });
        });
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });

    /**
     * @tc.number: ACTS_GET_ABILITY_STATE_0003
     * @tc.name  : actsGetAbilityState0003
     * @tc.desc  : Test the api "abilityDelegator.getAbilityState", return the uiAbility state result.
     * @tc.size  : MediumTest
     * @tc.type  : Method
     * @tc.level : Level 2
     */
    it("ACTS_GET_ABILITY_STATE_0003", 0, async function (done) {
      let ability1 = null;
      var stateNum = abilityDelegator.getAbilityState(ability1);
      abilityDelegator.printSync(
        "ACTS_GET_ABILITY_STATE_0003 getAbilityState of ability1: " + stateNum
      );
      expect(stateNum).assertEqual(undefined);
      abilityDelegator.printSync(
        "ACTS_GET_ABILITY_STATE_0003 getAbilityState Pass. "
      );
      done();
    });
  });
}
