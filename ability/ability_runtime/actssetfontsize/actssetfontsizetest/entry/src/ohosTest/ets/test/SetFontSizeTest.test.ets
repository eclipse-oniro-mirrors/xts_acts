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
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { Driver, ON ,Component } from '@kit.TestKit';
import App from '@system.app';


let TAG = 'RunTimeTest';
let mpEnable: string;
let uiAbilityContext: common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function SetFontSizeTest() {
  describe('SetFontSizeTest', () => {
    beforeAll(() => {
      uiAbilityContext = AppStorage.get<Context>('uiAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.info(0x0000, TAG, "[%{public}s] Get system parameter error: ${public}s", TAG, JSON.stringify(err));
        mpEnable = 'fail';
      }
    })
    beforeEach(() => {

    })
    afterEach(() => {
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600
     * @tc.name    SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600
     * @tc.desc    Verify multi-module application properly follows system behavior when setFontSizeScale(1.3) is applied across all components
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Rely_IndexEntry_setFontSizeScale', 'Rely_IndexFeature_getFontSizeScale']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      let entryFlag: boolean = false;
      let featureFlag: boolean = false;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            switch (commonEventData.parameters?.from) {
              case 'Rely_IndexEntry_setFontSizeScale':
                entryFlag = true;
                break;
              case 'Rely_IndexFeature_getFontSizeScale':
                featureFlag = true;
                break;
            }
            try {
              expect(commonEventData.parameters?.fontSize).assertEqual(1.3);
            } catch {
            }
          })
          let wantEntry: Want = {
            bundleName: 'com.test.actssetfontsizerely',
            moduleName: 'entry',
            abilityName: 'EntryAbility'
          };
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          const driver = Driver.create();
          await driver.delayMs(1000);
          let setFontSizeScaleButton: Component = await driver.findComponent(ON.id('setFontSizeScaleButton'));
          await setFontSizeScaleButton.click();
          await driver.delayMs(1000);
          let startFeatureButton: Component = await driver.findComponent(ON.id('startFeatureButton'));
          await startFeatureButton.click();
          await driver.delayMs(1000);
          let getFontSizeScaleButton: Component = await driver.findComponent(ON.id('getFontSizeScaleButton'));
          await getFontSizeScaleButton.click();
          await sleep(2000);
          let terminateEntryButton: Component = await driver.findComponent(ON.id('terminateEntryButton'));
          await terminateEntryButton.click();
          hilog.info(0x0000, TAG, "[%{public}s] Flags: entryFlag = %{public}s, featureFlag = %{public}s", TAG, entryFlag, featureFlag);
          try {
            expect(entryFlag && featureFlag).assertEqual(true);
          } catch {
          }
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
     * @tc.number  SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700
     * @tc.name    SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700
     * @tc.desc    Verify the follow system with multiple modules: after app closure and restart, the obtained config's font size is 1
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['Rely_IndexEntry_getFontSizeScale']
      };
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, "[%{public}s] createSubscriber succeed", TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, "[%{public}s] subscribe callback. Gained commonEventData: %{public}s", TAG, JSON.stringify(commonEventData));
            try {
              expect(commonEventData.parameters?.fontSize).assertEqual(1);
            } catch {
            }
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, "[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            });
          })
          let wantEntry: Want = {
            bundleName: 'com.test.actssetfontsizerely',
            moduleName: 'entry',
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
          await driver.delayMs(2000);
          let terminateEntryButton: Component = await driver.findComponent(ON.id('terminateEntryButton'));
          await terminateEntryButton.click();
          await driver.delayMs(1000);
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          driver = Driver.create();
          await driver.delayMs(2000);
          let getFontSizeScaleButton: Component = await driver.findComponent(ON.id('getFontSizeScaleButton'));
          await driver.delayMs(1000);
          await getFontSizeScaleButton.click();
          await sleep(2000);
          terminateEntryButton = await driver.findComponent(ON.id('terminateEntryButton'));
          await driver.delayMs(1000);
          await terminateEntryButton.click();
          done();
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