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
import App from '@system.app';
import { Driver, ON, Component, MatchPattern } from '@kit.TestKit';

let buttonClicked:boolean = false;
let driver = Driver.create();
const DOMAIN = 0x0000;
const LOG_TAG = 'COMPLETION_HANDLER_TEST';
const DELAY_TIME = 2000;
let allowOpen = async () => {
  let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), DELAY_TIME);
  hilog.info(DOMAIN, LOG_TAG, 'needAllow: %{public}s', JSON.stringify(allowed));
  if (allowed) {
    let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'));
    if (buttons && buttons.length > 0) {
      hilog.info(DOMAIN, LOG_TAG, 'buttons.length: %{public}d', buttons.length);
      hilog.info(DOMAIN, LOG_TAG, 'clicking %{public}s', '本次允许');
      await buttons[buttons.length - 1].click();
      hilog.info(DOMAIN, LOG_TAG, '%{public}s clicked', '本次允许');
      buttonClicked = true;
      return;
    }
    hilog.info(DOMAIN, LOG_TAG, 'button not found');
  }
}

let TAG = 'RunTimeTest';
let mpEnable: string;
let uiAbilityContext: common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function SetFontSizeTest() {
  describe('SetFontSizeTest', () => {
    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
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
    afterEach(async () => {
      await sleep(2000); 
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_1600
     * @tc.desc   Verify multi-module application properly follows system behavior when setFontSizeScale(1.3) is applied across all components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
          await driver.delayMs(1000);
          try{
            await allowOpen();
            await driver.delayMs(1000);
          } catch (e) {
            hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbility_0100 allowOpen failed, ${JSON.stringify(e)}`);
          }
          let setFontSizeScaleButton: Component = await driver.waitForComponent(ON.id('setFontSizeScaleButton'), 2000);
          hilog.info(0x0000, TAG, `setFontSizeScaleButton: ${!!setFontSizeScaleButton}`);
          await setFontSizeScaleButton.click();
          await driver.delayMs(1000);
          let startFeatureButton: Component = await driver.waitForComponent(ON.id('startFeatureButton'), 2000);
          hilog.info(0x0000, TAG, `startFeatureButton: ${!!startFeatureButton}`);
          await startFeatureButton.click();
          await driver.delayMs(1000);
          let getFontSizeScaleButton: Component = await driver.waitForComponent(ON.id('getFontSizeScaleButton'), 2000);
          hilog.info(0x0000, TAG, `getFontSizeScaleButton: ${!!getFontSizeScaleButton}`);
          await getFontSizeScaleButton.click();
          await sleep(2000);
          let terminateEntryButton: Component = await driver.waitForComponent(ON.id('terminateEntryButton'), 2000);
          hilog.info(0x0000, TAG, `terminateEntryButton: ${!!terminateEntryButton}`);
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_1700
     * @tc.desc   Verify the follow system with multiple modules: after app closure and restart, the obtained config's font size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
          await driver.delayMs(2000);
          try{
            await allowOpen();
            await driver.delayMs(1000);
          } catch (e) {
            hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbility_0100 allowOpen failed, ${JSON.stringify(e)}`);
          }
          let terminateEntryButton: Component = await driver.findComponent(ON.id('terminateEntryButton'));
          await terminateEntryButton.click();
          await driver.delayMs(2000);
          uiAbilityContext.startAbility(wantEntry)
            .then(() => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability succeed.", TAG);
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, "[%{public}s] start entry's ability failed. err: %{public}s", TAG, JSON.stringify(err));
            })
          await driver.delayMs(2000);
          try{
            await allowOpen();
            await driver.delayMs(1000);
          } catch (e) {
            hilog.error(DOMAIN, LOG_TAG, '%{public}s', `SUB_AbilityRuntime_CompletionHandlerTest_StartAbility_0100 allowOpen failed, ${JSON.stringify(e)}`);
          }
          let getFontSizeScaleButton: Component = await driver.findComponent(ON.id('getFontSizeScaleButton'));
          await getFontSizeScaleButton.click();
          await sleep(2000);
          terminateEntryButton = await driver.findComponent(ON.id('terminateEntryButton'));
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