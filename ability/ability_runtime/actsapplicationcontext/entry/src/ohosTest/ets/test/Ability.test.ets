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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { AbilityLifecycleCallback } from '@kit.AbilityKit';
import commonEventManager from '@ohos.commonEventManager';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {

  let TAG = "";
  let Subscriber: commonEventManager.CommonEventSubscriber;
  let lifeCallback:AbilityLifecycleCallback = {
    onAbilityCreate:(ability)=>{
    },
    onAbilityWillCreate:(ability)=>{
    },
    onWindowStageCreate:(ability, window)=>{
    },
    onWindowStageWillCreate:(ability, window)=>{
    },
    onWillNewWant:(ability)=>{
    },
    onNewWant:(ability)=>{
    },
    onWindowStageActive:(ability, window)=>{
    },
    onWindowStageInactive:(ability, window)=>{
    },
    onWindowStageDestroy:(ability, window)=>{
    },
    onWindowStageWillDestroy:(ability, window)=>{
    },
    onAbilityDestroy:(ability)=>{
    },
    onAbilityWillDestroy:(ability)=>{
    },
    onAbilityForeground:(ability)=>{
    },
    onAbilityWillForeground:(ability)=>{
    },
    onAbilityBackground:(ability)=>{
    },
    onAbilityWillBackground:(ability)=>{
    },
    onAbilityContinue:(ability)=>{
    },
    onAbilityWillContinue:(ability)=>{
    },
    onWindowStageWillRestore:(ability, window)=>{
    },
    onWindowStageRestore:(ability, window)=>{
    },
    onAbilityWillSaveState:(ability)=>{
    },
    onAbilitySaveState:(ability)=>{
    }
  }

  describe('ActsChainApplicationContext', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_0100
     * @tc.desc   Verify that the chain call function is functioning properly in delegator getAppContext.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_ApplicationContext_0100 ";
      console.log(TAG + " start");

      let appContext: common.ApplicationContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext().getApplicationContext();
      let id: number = appContext.on('abilityLifecycle', lifeCallback);
      console.log(TAG + "id=" + id);
      await sleep(1000);
      console.log(TAG + " start off");
      appContext.off('abilityLifecycle', id, (error, data)=>{
        if (error) {
          console.log(TAG + " error " + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(TAG + " off success");
          expect(error).assertNull();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContext_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContext_0200
     * @tc.desc   Verify that the chain call function is functioning properly in UIAbilityContext.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContext_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "SUB_Ability_AbilityRuntime_ApplicationContext_0200 ";
      console.log(TAG + " start");

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["AbilityLifecycle_Message"]
      }
      commonEventManager.createSubscriber(subscribeInfo, (err, data) => {
        console.log(TAG + " CreateSubscriberCallback");
        Subscriber = data
        commonEventManager.subscribe(Subscriber, async (err, data) => {
          console.log(TAG + " SubscribeInfoCallback " + JSON.stringify(data));
          expect(data.parameters?.offResult).assertTrue();
          commonEventManager.unsubscribe(Subscriber, () => {
            console.log(TAG + " UnSubscribeInfoCallback");
          })
          await sleep(500);
          done();
        })
        setTimeout(()=>{
          abilityDelegatorRegistry.getAbilityDelegator().startAbility({
            bundleName:'com.example.abilitymonitortest',
            abilityName:'MainAbility2',
          }, (err, data)=>{
            console.log(TAG + " startAbility err " + JSON.stringify(err));
            console.log(TAG + " startAbility data " + JSON.stringify(data));
          });
        }, 500)
      })
    })
    
  })
}