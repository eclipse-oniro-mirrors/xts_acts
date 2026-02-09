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
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { Driver, Component, ON } from '@kit.TestKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}
let context: common.UIAbilityContext;

export default function ActsLifeCycleFlowOrderTest() {
  describe('ActsLifeCycleFlowOrderTest', () => {
    beforeAll(()=>{
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillForeground_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnWillForeground_0100
     * @tc.desc   Check the timing sequence of the callback when the mobile app enters the foreground during cold start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0100'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);

        await sleep(3000);
        done()
      };
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillForeground_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnWillForeground_0200
     * @tc.desc   Check the timing sequence of the callback when the mobile app enters the foreground after a hot start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility3',
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000);
          setTimeout(async () => {
            try {
              console.info('setTimeout')
              context.startAbility({
                bundleName: 'com.acts.lifecycleflowordertestdemo',
                abilityName: 'EntryAbility3',
                parameters: {
                  parameter: '0200'
                }
              }, (err: BusinessError) => {
                console.info(`${tag}-startAbility err1:` + JSON.stringify(err));
              });
              

            } catch (e) {
              console.error(`${tag}-pressHome error`, e)
            }
          }, 2000)
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        if(data.data != '16000061'){
          expect(data.data).assertEqual("onWillForeground,onForeground,show event,onDidForeground");
        }
        commonEventManager.unsubscribe(subscriber);
        await sleep(3000);
        done()
      };
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillForeground_0900
     * @tc.number SUB_Ability_AbilityRuntime_OnWillForeground_0900
     * @tc.desc   The delay in the onWillForeground interface when a mobile app is launched and enters the foreground
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0900', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0900';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0900']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0900'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        await sleep(3000);
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillForeground_1000
     * @tc.number SUB_Ability_AbilityRuntime_OnWillForeground_1000
     * @tc.desc   Mobile app launches and enters the foreground onDidForeground: interface delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_1000', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_1000';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1000']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '1000'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        await sleep(3000);
        done()
      };
    })
  })
}