/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import { common } from '@kit.AbilityKit';
import { Driver, ON ,Component } from '@kit.TestKit';


let TAG = 'RunTimeTest';
let uiAbilityContext: common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function StartManagerTest() {
  describe('StartManagerTest', () => {
    beforeAll(() => {
      uiAbilityContext = AppStorage.get<Context>('uiAbilityContext') as common.UIAbilityContext;
    })
    beforeEach(() => {

    })
    afterEach(() => {
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_LaunchRule_startManage_0700
     * @tc.name    SUB_Ability_AbilityRuntime_LaunchRule_startManage_0700
     * @tc.desc    Non-system apps are not allowed to set/cancel the auto-start (callback) of other app components
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_startManage_0700', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_0700';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['catchErrorEvent']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.errCode).assertEqual(202);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.autostartupmanageone',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          let driver = Driver.create();
          await driver.delayMs(1000);
          let setCallbackButton: Component = await driver.findComponent(ON.id('setCallbackButton'));
          let cancelCallbackButton: Component = await driver.findComponent(ON.id('cancelCallbackButton'));
          let terminateButton: Component = await driver.findComponent(ON.id('terminateButton'));
          await setCallbackButton.click();
          await sleep(500);
          await cancelCallbackButton.click();
          await sleep(500);
          await terminateButton.click();
          await sleep(2000);
          commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
            hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            done();
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, "[%{public}s] Failed to create subscriber. err: %{public}s", TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_LaunchRule_startManage_0800
     * @tc.name    SUB_Ability_AbilityRuntime_LaunchRule_startManage_0800
     * @tc.desc    Non-system apps are not allowed to set/cancel the auto-start (promise) of other app components
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_startManage_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_0800';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['catchErrorEvent']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.errCode).assertEqual(202);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.autostartupmanageone',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          let driver = Driver.create();
          await driver.delayMs(1000);
          let setPromiseButton: Component = await driver.findComponent(ON.id('setPromiseButton'));
          let cancelPromiseButton: Component = await driver.findComponent(ON.id('cancelPromiseButton'));
          let terminateButton: Component = await driver.findComponent(ON.id('terminateButton'));
          await setPromiseButton.click();
          await sleep(500);
          await cancelPromiseButton.click();
          await sleep(500);
          await terminateButton.click();
          await sleep(2000);
          commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
            hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            done();
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, "[%{public}s] Failed to create subscriber. err: %{public}s", TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_LaunchRule_startManage_0900
     * @tc.name    SUB_Ability_AbilityRuntime_LaunchRule_startManage_0900
     * @tc.desc    Non-system apps are not permitted to query the auto-start status (callback) of other apps
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_startManage_0900', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_0900';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['catchErrorEvent']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.errCode).assertEqual(202);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.autostartupmanageone',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          let driver = Driver.create();
          await driver.delayMs(1000);
          let queryCallbackButton: Component = await driver.findComponent(ON.id('queryCallbackButton'));
          let terminateButton: Component = await driver.findComponent(ON.id('terminateButton'));
          await queryCallbackButton.click();
          await sleep(500);
          await terminateButton.click();
          await sleep(2000);
          commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
            hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            done();
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, "[%{public}s] Failed to create subscriber. err: %{public}s", TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_LaunchRule_startManage_1000
     * @tc.name    SUB_Ability_AbilityRuntime_LaunchRule_startManage_1000
     * @tc.desc    Non-system apps are not permitted to query the auto-start status (promise) of other apps
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_startManage_1000', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_1000';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['catchErrorEvent']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.errCode).assertEqual(202);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.autostartupmanageone',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          let driver = Driver.create();
          await driver.delayMs(1000);
          let queryPromiseButton: Component = await driver.findComponent(ON.id('queryPromiseButton'));
          let terminateButton: Component = await driver.findComponent(ON.id('terminateButton'));
          await queryPromiseButton.click();
          await sleep(500);
          await terminateButton.click();
          await sleep(2000);
          commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
            hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            done();
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, "[%{public}s] Failed to create subscriber. err: %{public}s", TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_LaunchRule_startManage_1100
     * @tc.name    SUB_Ability_AbilityRuntime_LaunchRule_startManage_1100
     * @tc.desc    Non-system apps are not allowed to register/unregister listeners for app auto-start status changes
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_LaunchRule_startManage_1100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_LaunchRule_startManage_1100';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['catchErrorEvent']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.errCode).assertEqual(202);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.autostartupmanageone',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          let driver = Driver.create();
          await driver.delayMs(1000);
          let onButton: Component = await driver.findComponent(ON.id('onButton'));
          let offButton: Component = await driver.findComponent(ON.id('offButton'));
          let terminateButton: Component = await driver.findComponent(ON.id('terminateButton'));
          await onButton.click();
          await sleep(500);
          await offButton.click();
          await sleep(500);
          await terminateButton.click();
          await sleep(2000);
          commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
            hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            done();
          });
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, TAG, "[%{public}s] Failed to create subscriber. err: %{public}s", TAG, JSON.stringify(err));
          try {
            expect().assertFail();
          } catch {
          }
          done();
        })
    })

  })
}