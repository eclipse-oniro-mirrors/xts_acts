/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, Level } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const TEST_SUITE_NAME: string = 'ActsStartUpRuleOptimizeTest'
let TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_LaunchRule_StartUpRuleOptimizeTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function abilityTest(abilityContext:common.UIAbilityContext) {
  describe('ActsStartUpRuleOptimizeTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LaunchRule_StartUpRuleOptimizeTest_0700
     * @tc.number SUB_Ability_AbilityRuntime_LaunchRule_StartUpRuleOptimizeTest_0700
     * @tc.desc   number one:Start test Demo;number two:Test Demo's Ability to call startAbilityForResult to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_StartUpRuleOptimizeTest_0700', Level.LEVEL1, async (done: Function) => {
      try {
        TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchRule_StartUpRuleOptimizeTest_0700';
        let isStartAbility = false
        await testFlow(() => {
          // start ability
          let want: Want = {
            deviceId: '',
            bundleName: bundleName,
            abilityName: 'Assistant1Ability'
          };
          globalThis.globalThis.abilityContext.startAbility(want, () => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} isStartAbility`);
            isStartAbility = true;
            expect(isStartAbility).assertEqual(true);
            done();
          })
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}: ${JSON.stringify(err)}`);
      }
    })

    /**
     * @param call: the callback of function startAbilityForResult is executed
     */
    let testFlow = async (call:Function):Promise<void> => {
      try {
        //1.TestDemo's Ability to call startAbilityForResult to pull up the assistant Demo
        let want: Want = {
          deviceId: '',
          bundleName: bundleName,
          abilityName: 'AssistantAbility'
        };
        abilityContext.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            return;
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}:${JSON.stringify(result)}`);
          call();
        });
        await sleep(2000);
        //3.TestDemo  send "terminateAssistantAbility" event
        let publishCallback = (err:BusinessError):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} start successful`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish  callback`);
          }
        }
        try {
          CommonEventManager.publish("event_100001", publishCallback);
        } catch (error) {
          let err:BusinessError = error;
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish failed, code is ${err.code}, message is ${err.message}`);
        }
        await sleep(2000);
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}: ${JSON.stringify(err)}`);
      }
    }
  })
}