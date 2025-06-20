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
let testAbilityContext: common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function shareAcquireShareDataTest() {
  describe('shareAcquireShareDataTest', () => {
    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })
    beforeEach(() => {

    })
    afterEach(async () => {
      await sleep(2000);
      hilog.info(0x0000, TAG, "[%{public}s] case end.", TAG);
    })
    afterAll(() => {

    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300
     * @tc.name    SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300
     * @tc.desc    Third-party application clears itself (via Promise invocation)
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['button_onClick_event']
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, '[%{public}s] createSubscriber succeed', TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, '[%{public}s] subscribe callback. Gained commonEventData: %{public}s', TAG, JSON.stringify(commonEventData));
            try {
              expect(JSON.stringify(commonEventData.parameters?.result)).assertEqual(JSON.stringify('clearUpResult. code: 202, message: The application is not system-app, can not use system-api.'));
            } catch {
            }
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, '[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s', TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
          let want: Want = {
            bundleName: 'com.test.actsshareacquiresharedatarely',
            abilityName: 'ShareAcquireShareDataAbility',
          };
          testAbilityContext.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              hilog.info(0x0000, TAG, '[%{public}s] startAbility failed, err: %{public}s', TAG, JSON.stringify(err));
            } else {
              hilog.info(0x0000, TAG, '[%{public}s] startAbility succeed', TAG);
            }
          })
          const driver = Driver.create();
          await driver.delayMs(1000);
          let button: Component = await driver.findComponent(ON.id(TAG));
          await button.click();
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
     * @tc.number  SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100
     * @tc.name    SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100
     * @tc.desc    Calling acquireShareData without required permissions
     * @tc.level   0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100';
      hilog.info(0x0000, TAG, "[%{public}s] case start.", TAG);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['button_onClick_event']
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          hilog.info(0x0000, TAG, '[%{public}s] createSubscriber succeed', TAG);
          commonEventManager.subscribe(subscriber, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            hilog.info(0x0000, TAG, '[%{public}s] subscribe callback. Gained commonEventData: %{public}s', TAG, JSON.stringify(commonEventData));
            try {
              expect(JSON.stringify(commonEventData.parameters?.result)).assertEqual(JSON.stringify('acquireShareResult. code: 202, message: The application is not system-app, can not use system-api.'));
            } catch {
            }
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, '[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s', TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
          let want: Want = {
            bundleName: 'com.test.actsshareacquiresharedatarely',
            abilityName: 'ShareAcquireShareDataAbility',
          };
          testAbilityContext.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              hilog.info(0x0000, TAG, '[%{public}s] startAbility failed, err: %{public}s', TAG, JSON.stringify(err));
            } else {
              hilog.info(0x0000, TAG, '[%{public}s] startAbility succeed', TAG);
            }
          })
          const driver = Driver.create();
          await driver.delayMs(1000);
          let button: Component = await driver.findComponent(ON.id(TAG));
          await button.click();
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