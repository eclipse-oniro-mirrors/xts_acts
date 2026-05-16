/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import window from '@ohos.window';
import commonEvent from '@ohos.commonEvent'
import CommonEventManager from '@ohos.commonEventManager';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';

const TAG = "launchRule:AssistantTag"

export default class AssistantAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log(TAG, 'AssistantAbility onCreate');
    console.log(TAG, 'want param:' + JSON.stringify(want) ?? '');
    console.log(TAG, 'launchParam:' + JSON.stringify(launchParam) ?? '');
    globalThis.context = this.context;
    let subscriber:CommonEventManager.CommonEventSubscriber;
    let subscribeInfo:CommonEventManager.CommonEventSubscribeInfo = {
      events: ["event_100001"]
    };
    CommonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber:CommonEventManager.CommonEventSubscriber) => {
      console.log(TAG, "createSubscriber");
      subscriber = commonEventSubscriber;
      CommonEventManager.subscribe(subscriber, (err, data) => {
        if (err) {
          console.error(TAG, `subscribe failed, code is ${err.code}, message is ${err.message}`);
        } else {
          let want: Want = {
            bundleName: 'com.example.launchrule',
            abilityName: 'AssistantAbility'
          };
          let resultCode = 100;
          let abilityResult: common.AbilityResult = {
            want,
            resultCode
          };
          //2.Assistant Ability registered "terminateAssistantAbility" event, call terminateAbilityWithResult received after the event
          globalThis.context.terminateSelfWithResult(abilityResult, (err:BusinessError) => {
            CommonEventManager.unsubscribe(subscriber, () => {
              console.log(TAG, "====>UnSubscribe CallBack====>");
            });
            console.log(TAG, 'terminateSelfWithResult succeed');
          });
        }
      });
    }).catch((err:BusinessError) => {
      console.error(TAG, ` createSubscriber failed, code is ${err.code}, message is ${err.message}`);
    });
  }

  onDestroy() {
    console.log(TAG, 'AssistantAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log(TAG, 'AssistantAbility onWindowStageCreate');
    windowStage.loadContent('AssistantAbility/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    console.log(TAG, 'AssistantAbility onWindowStageDestroy');
  }

  onForeground() {
    console.log(TAG, 'AssistantAbility onForeground');
  }

  onBackground() {
    console.log(TAG, 'AssistantAbility onBackground');
  }
}