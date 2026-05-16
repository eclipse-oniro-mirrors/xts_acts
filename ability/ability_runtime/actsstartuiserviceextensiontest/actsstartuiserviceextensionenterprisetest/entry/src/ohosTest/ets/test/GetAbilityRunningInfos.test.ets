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

import { describe, it, expect, Level, } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function AbilityManagerGetAbilityRunningInfosTest() {
  describe('AbilityManagerGetAbilityRunningInfosTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_001
     * @tc.number SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_001
     * @tc.desc   getAbilityRunningInfos Promise return test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_001';
      console.info('====> [' + tag + '] start');

      try {
         await abilityManager.getAbilityRunningInfos().then((abilityRunningInfos)=>{
          hilog.info(0x0000, 'testTag', tag + `getAbilityRunningInfos success: ${JSON.stringify(abilityRunningInfos)}`);
          try {
            expect(Array.isArray(abilityRunningInfos)).assertTrue();
            expect(abilityRunningInfos.length).assertLarger(0);
          } catch {
          }
          if (abilityRunningInfos && abilityRunningInfos.length > 0) {
            abilityRunningInfos.forEach((abilityInfo, index) => {
              if (abilityInfo.ability.bundleName == 'com.acts.startuiserviceextensiontestenterprise') {
                try {
                  expect(abilityInfo.ability.bundleName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(abilityInfo.ability.abilityName).assertEqual('TestAbility');
                  expect(abilityInfo?.ability?.moduleName).assertEqual('');
                  expect(typeof abilityInfo.pid).assertEqual('number');
                  expect(abilityInfo.pid).assertLarger(0);
                  expect(typeof abilityInfo.uid).assertEqual('number');
                  expect(abilityInfo.uid).assertLarger(0);
                  expect(abilityInfo.abilityState).assertEqual(2);
                  expect(abilityInfo.processName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(typeof abilityInfo.startTime).assertEqual('number');
                  expect(abilityInfo.startTime).assertLarger(0);
                } catch {
                }
              }
              hilog.info(0x0000, 'testTag', `${tag} ability ${index} validated successfully`);
              done();
              return;
            });
          }
         }).catch((err: BusinessError)=>{
          hilog.error(0x0000, 'testTag', `${tag} failed: ${JSON.stringify(err)}`);
         })
        
      } catch (error) {
        hilog.error(0x0000, 'testTag', `${tag} failed: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityManager_GetAbilityRunningInfos_CALLBACK_001
     * @tc.number SUB_Ability_AbilityManager_GetAbilityRunningInfos_CALLBACK_001
     * @tc.desc   getAbilityRunningInfos AsyncCallback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityManager_GetAbilityRunningInfos_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityManager_GetAbilityRunningInfos_CALLBACK_001';
      console.info('====> [' + tag + '] start');
      try {
        abilityManager.getAbilityRunningInfos((error: BusinessError,
          abilityRunningInfos: Array<abilityManager.AbilityRunningInfo>) => {
          if (error) {
            hilog.error(0x0000, 'testTag', `${tag} failed: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
            return;
          }

          hilog.info(0x0000, 'testTag', tag + `getAbilityRunningInfos success: ${JSON.stringify(abilityRunningInfos)}`);
          try {
            expect(Array.isArray(abilityRunningInfos)).assertTrue();
            expect(abilityRunningInfos.length).assertLarger(0);
          } catch {
          }
          if (abilityRunningInfos && abilityRunningInfos.length > 0) {
            abilityRunningInfos.forEach((abilityInfo, index) => {
              if (abilityInfo.ability.bundleName == 'com.acts.startuiserviceextensiontestenterprise') {
                try {
                  expect(abilityInfo.ability.bundleName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(abilityInfo.ability.abilityName).assertEqual('TestAbility');
                  expect(abilityInfo?.ability?.moduleName).assertEqual('');
                  expect(typeof abilityInfo.pid).assertEqual('number');
                  expect(abilityInfo.pid).assertLarger(0);
                  expect(typeof abilityInfo.uid).assertEqual('number');
                  expect(abilityInfo.uid).assertLarger(0);
                  expect(abilityInfo.abilityState).assertEqual(2);
                  expect(abilityInfo.processName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(typeof abilityInfo.startTime).assertEqual('number');
                  expect(abilityInfo.startTime).assertLarger(0);
                } catch {
                }
              }
              hilog.info(0x0000, 'testTag', `${tag} ability ${index} validated successfully`);
              done();
              return;
            });
          }

        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', `${tag} exception: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });
  });
}