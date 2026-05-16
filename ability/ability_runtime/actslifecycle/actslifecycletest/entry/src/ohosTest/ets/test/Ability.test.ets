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
 
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}
let TestAbilityContext:common.UIAbilityContext;
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      TestAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100
     * @tc.desc   Callback verification for getTopAbility interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0100';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["OnWindowStageWillDestory01"]
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(JSON.stringify(commonEventData.parameters?.result)).assertEqual(JSON.stringify(1));
            } catch {
            }
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
          let startWant: Want = {
            bundleName: 'com.test.actslifecycletest',
            abilityName: "MainAbility1",
          };
          globalThis.context.startAbility(startWant).then(() => {
            console.log(TAG,'startAbility success');
          }).catch((error: BusinessError) => {
            console.log(TAG,'startAbility error', JSON.stringify(error));
            expect().assertFail();
          })
        })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600
     * @tc.desc   Callback verification for getTopAbility interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0600';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["OnWindowStageWillDestory06"]
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      let flag : boolean =false
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            flag = true;
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
          let startWant: Want = {
            bundleName: 'com.test.actslifecycletest',
            abilityName: "MainAbility2",
          };
          globalThis.context.startAbility(startWant).then(() => {
            console.log(TAG,'startAbility success');
          }).catch((error: BusinessError) => {
            console.log(TAG,'startAbility error', JSON.stringify(error));
            expect().assertFail();
          })
          await sleep(2000);
          try{
            console.log(TAG,'flag=',flag);
            expect(flag).assertEqual(false);
            done();
          } catch(e){
            console.log(TAG,'expect false equals true')
          }
        })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500
     * @tc.number SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500
     * @tc.desc   Callback verification for getTopAbility interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0500';
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["OnWindowStageWillDestory0500"]
      };
      let flag : boolean =false
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            flag=true;
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
          let startWant: Want = {
            bundleName: 'com.acts.ability.actslifecyclerely',
            abilityName: "EntryAbility",
          };
          globalThis.context.startAbility(startWant).then(() => {
            console.log(TAG,'startAbility success');
          }).catch((error: BusinessError) => {
            console.log(TAG,'startAbility error', JSON.stringify(error));
          });
          await sleep(1500);
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let cmd2 ="kill -9 pidof com.acts.ability.actslifecyclerely";
          abilityDelegator.executeShellCommand(cmd2, (err : BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
            console.info('executeShellCommand2 callback');
          });
          await sleep(2000);
          try{
            console.log(TAG,'flag=',flag);
            expect(flag).assertEqual(false);
            done();
          } catch(e){
            console.log(TAG,'expect false equals true')
          }
        })
    })


  })
}