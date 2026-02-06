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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { Want } from '@kit.AbilityKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let bundleName: string = 'com.acts.ability.asynclifecycletest';
let event1: string = 'com.acts.ability.asynclifecycletest.event1';
let event2: string = 'com.acts.ability.asynclifecycletest.event2';
let event3: string = 'com.acts.ability.asynclifecycletest.event3';
let event4: string = 'com.acts.ability.asynclifecycletest.event4';
let event5: string = 'com.acts.ability.asynclifecycletest.event5';
let event6: string = 'com.acts.ability.asynclifecycletest.event6';
let event7: string = 'com.acts.ability.asynclifecycletest.event7';
let event8: string = 'com.acts.ability.asynclifecycletest.event8';
let event9: string = 'com.acts.ability.asynclifecycletest.event9';
let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

const DOMAIN: number = 0x0000;

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function AsyncLifecycleTest() {

  describe('AsyncLifecycleTest', () => {
    afterEach(async () => {
      await sleep(800);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AsynchronousCallback_0100
     * @tc.number SUB_Ability_AbilityRuntime_AsynchronousCallback_0100
     * @tc.desc   Test onAcceptWant triggered when start a specified UIAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AsynchronousCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AsynchronousCallback_0100';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event4]
      };
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} subscribeCallBack success. data:${JSON.stringify(data)}`);
        expect(data.data).assertEqual("onAcceptWant");
        let want: Want = JSON.parse(data.parameters?.want);
        expect(want.bundleName).assertEqual('com.acts.ability.asynclifecycletest');
        commonEventManager.unsubscribe(subscriber);
        done();
      };
      await commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack);
          await abilityDelegator.startAbility({
            bundleName: bundleName,
            moduleName: 'entry',
            abilityName: 'SpecifiedAbility',
            parameters: {
              keyForString: 'str',
            },
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber failed:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AsynchronousCallback_0200
     * @tc.number SUB_Ability_AbilityRuntime_AsynchronousCallback_0200
     * @tc.desc   Test onAcceptWantAsync triggered when start a specified UIAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AsynchronousCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AsynchronousCallback_0200';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event6]
      };
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} subscribeCallBack success. data:${data.data}`);
        expect(data.data).assertEqual("module1.onAcceptWantAsync");
        commonEventManager.unsubscribe(subscriber);
        done();
      };
      await commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack);
          await abilityDelegator.startAbility({
            bundleName: bundleName,
            moduleName: 'module1',
            abilityName: 'SpecifiedAbility',
            parameters: {
              keyForString: 'str',
            },
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber failed:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AsynchronousCallback_0300
     * @tc.number SUB_Ability_AbilityRuntime_AsynchronousCallback_0300
     * @tc.desc   Test onAcceptWantAsync only triggered when start a specified UIAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AsynchronousCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AsynchronousCallback_0300';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event1]
      };
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} subscribeCallBack success. data:${data.data}`);
        expect(data.data).assertEqual("onAcceptWantAsync");
        commonEventManager.unsubscribe(subscriber);
        done();
      };
      await commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack);
          await abilityDelegator.startAbility({
            bundleName: bundleName,
            moduleName: 'entry_test',
            abilityName: 'SpecifiedAbility',
            parameters: {
              keyForString: 'str',
            },
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber failed:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AsynchronousCallback_1400
     * @tc.number SUB_Ability_AbilityRuntime_AsynchronousCallback_1400
     * @tc.desc   Test onAcceptWantAsync only triggered when start a specified UIAbility in another module.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AsynchronousCallback_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AsynchronousCallback_1400';
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} begin`);
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event8]
      };
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} subscribeCallBack success. data:${data.data}`);
        expect(data.data).assertEqual("module2.onAcceptWantAsync");
        commonEventManager.unsubscribe(subscriber);
        done();
      };
      await commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack);
          await abilityDelegator.startAbility({
            bundleName: bundleName,
            moduleName: 'module2',
            abilityName: 'SpecifiedAbility',
            parameters: {
              keyForString: 'str',
            },
          }, (err: BusinessError) => {
            hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} startAbility err:${JSON.stringify(err)}`);
            if (err) {
              expect().assertFail();
              done();
            }
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} createSubscriber failed:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      hilog.info(DOMAIN, 'testTag', '%{public}s', `${tag} end`);
    })

  })
}