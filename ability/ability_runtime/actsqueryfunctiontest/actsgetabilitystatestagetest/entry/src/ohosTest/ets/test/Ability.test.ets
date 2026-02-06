/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import AbilityDelegatorRegistryOld from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from "@ohos.commonEventManager"
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from "@ohos.base";
import { Driver, ON, Component} from '@kit.TestKit';

let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let subscriberInfo_MainAbility: commonEvent.CommonEventSubscribeInfo = {
  events: ["GetCurrentTopAbility"],
};
let driver = Driver.create();

export default function abilityTest() {
  describe('ActsGetAbilityStateStageTest', () => {
    beforeAll(async () => {
      let allowed: Component | undefined;
      try {
        allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      if (allowed) {
        await allowed.click();
      }
    })

    /**
     * @tc.name   ACTS_GetAbilityState_0200
     * @tc.number ACTS_GetAbilityState_0200
     * @tc.desc   Get the status of the Ability in the BACKGROUND state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAbilityState_0200', Level.LEVEL0, async (done: Function) => {
      console.log('====>start ACTS_GetAbilityState_0200====');
      let ability: UIAbility;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let count = 0;
      let subscriber: commonEvent.CommonEventSubscriber;
      let onAbilityForegroundCallback2 = (): void => {
        console.log("====>onAbilityForegroundCallback2====");
        if (deviceSupport === 'false') {
          console.log("====>ACTS_GetAbilityState_0200 end====");
          commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
          return;
        }
        count++;
        if (count == 2) {
          abilityDelegator.getCurrentTopAbility((err, data) => {
            console.log("====>getCurrentTopAbility_0200 err:" + JSON.stringify(err) + " data:" + JSON.stringify(data));
            ability = data;
            abilityDelegator.doAbilityBackground(ability, (err) => {
              console.log("====>doAbilityBackground_0200 data:" + JSON.stringify(err));
            })
          })
        }
      }
      let onAbilityBackgroundCallback2 = (): void => {
        console.log("====>onAbilityBackgroundCallback2====");
        let state = abilityDelegator.getAbilityState(ability);
        console.log("====>ACTS_GetAbilityState_0200 state:" + state);
        expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
        expect(state).assertEqual(AbilityDelegatorRegistryOld.AbilityLifecycleState.BACKGROUND);
        console.log("====>ACTS_GetAbilityState_0200 end====");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.log("ACTS_GetAbilityState_0200====>Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, onAbilityForegroundCallback2);
      })

      let UnSubscribeCallback = (): void => {
        console.log("ACTS_GetAbilityState_0200====>UnSubscribe CallBack====>");
        done();
      }

      abilityDelegator.addAbilityMonitor(
        {
          abilityName: 'MainAbility2',
          onAbilityForeground: onAbilityForegroundCallback2,
          onAbilityBackground: onAbilityBackgroundCallback2
        }
      ).then(() => {
        console.log("====>addAbilityMonitor_0200 finish====");
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.example.actsgetabilitystatestagetest',
            abilityName: 'MainAbility2',
          }, (err: BusinessError) => {
          console.log("====>startAbility_0200 err:" + JSON.stringify(err));
        })
      })
    })

    /**
     * @tc.name   ACTS_GetAbilityState_0300
     * @tc.number ACTS_GetAbilityState_0300
     * @tc.desc   Get the status of the Ability in the FOREGROUND state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAbilityState_0300', Level.LEVEL0, async (done: Function) => {
      console.log('====>start ACTS_GetAbilityState_0300====');
      let ability: UIAbility;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let count = 0;
      let subscriber: commonEvent.CommonEventSubscriber;
      let onAbilityForegroundCallback3 = (): void => {
        console.log("====>onAbilityForegroundCallback3====");
        if (deviceSupport === 'false') {
          console.log("====>ACTS_GetAbilityState_0300 end====");
          commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
          return;
        }
        count++;
        if (count == 2) {
          abilityDelegator.getCurrentTopAbility((err, data) => {
            console.log("====>getCurrentTopAbility_0300 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
            ability = data;
            let state = abilityDelegator.getAbilityState(ability);
            console.log("====>ACTS_GetAbilityState_0300 state:" + state);
            expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
            expect(state).assertEqual(AbilityDelegatorRegistryOld.AbilityLifecycleState.FOREGROUND);
            expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.CREATE).assertTrue();
            expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.DESTROY).assertTrue();
            expect(state != AbilityDelegatorRegistryOld.AbilityLifecycleState.CREATE).assertTrue();
            expect(state != AbilityDelegatorRegistryOld.AbilityLifecycleState.DESTROY).assertTrue();
            expect(AbilityDelegatorRegistry.AbilityLifecycleState.DESTROY).assertEqual(4);
            expect(AbilityDelegatorRegistry.AbilityLifecycleState.CREATE).assertEqual(1);
            expect(AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED).assertEqual(0);
            expect(AbilityDelegatorRegistryOld.AbilityLifecycleState.DESTROY).assertEqual(4);
            expect(AbilityDelegatorRegistryOld.AbilityLifecycleState.CREATE).assertEqual(1);
            expect(AbilityDelegatorRegistryOld.AbilityLifecycleState.UNINITIALIZED).assertEqual(0);
            abilityDelegator.doAbilityBackground(ability, (err) => {
              console.log("====>doAbilityBackground_0300 data:" + JSON.stringify(err));
              console.log("====>ACTS_GetAbilityState_0300 end====");
              commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
            })
          })
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.log("ACTS_GetAbilityState_0300====>Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, onAbilityForegroundCallback3);
      })

      let UnSubscribeCallback = (): void => {
        console.log("ACTS_GetAbilityState_0300====>UnSubscribe CallBack====>");
        done();
      }

      abilityDelegator.addAbilityMonitor(
        {
          abilityName: 'MainAbility3',
          onAbilityForeground: onAbilityForegroundCallback3
        }).then(() => {
        console.log("====>addAbilityMonitor_0300 finish====");
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.example.actsgetabilitystatestagetest',
            abilityName: 'MainAbility3',
          }, (err: BusinessError) => {
          console.log("====>startAbility_0300 err:" + JSON.stringify(err));
        })
      })
    })

    /**
     * @tc.name   ACTS_GetAbilityState_0500
     * @tc.number ACTS_GetAbilityState_0500
     * @tc.desc   Get the status of an inactive or nonexistent Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAbilityState_0500', Level.LEVEL0, async (done: Function) => {
      console.log('====>start ACTS_GetAbilityState_0500====');
      let ability: UIAbility | null = null;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let state = abilityDelegator.getAbilityState(ability);
      console.log("====>ACTS_GetAppState_0500 state:" + state);
      expect(state).assertEqual(undefined);
      console.log("====>ACTS_GetAbilityState_0500 end====");
      done();
    })

    /**
     * @tc.name   ACTS_GetAbilityState_0600
     * @tc.number ACTS_GetAbilityState_0600
     * @tc.desc   Get the status of the Ability in the uninitialized state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAbilityState_0600', Level.LEVEL0, async (done: Function) => {
      console.log('====>start ACTS_GetAbilityState_0600====');
      let ability: UIAbility;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let count = 0;
      let subscriber: commonEvent.CommonEventSubscriber;
      let onAbilityForegroundCallback6 = (): void => {
        console.log("====>onAbilityForegroundCallback6====");
        if (deviceSupport === 'false') {
          console.log("====>ACTS_GetAbilityState_0600 end====");
          commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
          return;
        }
        count++;
        if (count == 2) {
          abilityDelegator.getCurrentTopAbility((err, data) => {
            console.log("====>getCurrentTopAbility_0600 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
            ability = data;
            globalThis.ability4Context.terminateSelf();
          })
        }
      }
      let onAbilityDestroyCallback6 = (): void => {
        console.log("====>onAbilityDestroyCallback6====");
        let state = abilityDelegator.getAbilityState(ability);
        console.log("====>ACTS_GetAbilityState_0600 data:" + state);
        console.log("====>UNINITIALIZED:" + AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
        expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
        console.log("====>ACTS_GetAbilityState_0600 end====");
        commonEvent.unsubscribe(subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.log("ACTS_GetAbilityState_0600====>Create Subscriber====>");
        subscriber = data;
        await commonEvent.subscribe(subscriber, onAbilityForegroundCallback6);
      })

      let UnSubscribeCallback = (): void => {
        console.log("ACTS_GetAbilityState_0600====>UnSubscribe CallBack====>");
        done();
      }

      abilityDelegator.addAbilityMonitor(
        {
          abilityName: 'MainAbility4',
          onAbilityForeground: onAbilityForegroundCallback6,
          onAbilityDestroy: onAbilityDestroyCallback6
        }).then(() => {
        console.log("====>addAbilityMonitor_0600 finish====");
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.example.actsgetabilitystatestagetest',
            abilityName: 'MainAbility4',
          }, (err: BusinessError) => {
          console.log("====>startAbility_0600 err:" + JSON.stringify(err));
        })
      })
    })
  })
}