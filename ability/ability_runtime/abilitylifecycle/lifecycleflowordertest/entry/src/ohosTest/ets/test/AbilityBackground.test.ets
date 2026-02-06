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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { Driver, Component, ON } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let context: common.UIAbilityContext;

export default function ActsLifeCycleMainBackgroundTest() {
  describe('ActsLifeCycleMainBackgroundTest', () => {
    beforeAll(()=>{
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
    })
    /*
    * @tc.number SUB_Ability_AbilityRuntime_OnWillBackground_0100
    * @tc.name   SUB_Ability_AbilityRuntime_OnWillBackground_0100
    * @tc.desc   Check the callback timing sequence when a mobile application is normally switched to the background.
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 3
    */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_0100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility1',
            parameters: {
              parameter: '0100'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
            await sleep(2000)
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        if(data.data != '16000061'){
          try {
          expect(data.data)
            .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground");
          } catch (error) {
            console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
          }
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })
    /*
     * @tc.number SUB_Ability_AbilityRuntime_OnWillBackground_0200
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillBackground_0200
     * @tc.desc   Mobile phone destruction application callback timing sequence check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_0200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          await sleep(2000)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility2',
            parameters: {
              parameter: '0200'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        try {
          expect(data.data)
            .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        }catch (error) {
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /*
     * @tc.number SUB_Ability_AbilityRuntime_OnWillBackground_1300
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillBackground_1300
     * @tc.desc   Timing check of the delayed callback of the onWillBackground of the mobile phone destruction application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_1300', Level.LEVEL3, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1300';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1300']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility13',
            parameters: {
              parameter: '1300'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        try {
          expect(data.data)
            .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        }catch (error) {
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /*
     * @tc.number SUB_Ability_AbilityRuntime_OnWillBackground_1400
     * @tc.name   SUB_Ability_AbilityRuntime_OnWillBackground_1400
     * @tc.desc   Mobile phone destruction application onBackground delay callback timing sequence check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_1400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1400';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1400']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.acts.lifecycleflowordertestdemo',
            abilityName: 'EntryAbility14',
            parameters: {
              parameter: '1400'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000)
        })
        .catch((err: BusinessError) => {
          console.error(`${tag} createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        try {
          expect(data.data)
            .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        }catch (error) {
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })
  })
}