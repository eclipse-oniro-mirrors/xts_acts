/**
 ** Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import commonEvent from '@ohos.commonEvent';
import commonEventManager from '@ohos.commonEventManager';
const event = 'terminateSelf1000'

export default class AssistantAbilityOne extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onDestroy');
    commonEventManager.publish('AbilityDelegator_Destory', (err, data) => {
      hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'publish success');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('assistantabilityone/pages/AssistantOneIndex', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag AssistantAbilityOne', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      setTimeout(() => {
        this.context.terminateSelf();
      }, 500)
      hilog.info(0x0000, 'testTag AssistantAbilityOne', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    })
  }


  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onForeground');
    setTimeout(() => {
      hilog.info(0x0000, 'testTag AssistantAbilityOne', 'assistantabilityone terminateSelf start.');
      this.context.terminateSelf();
    }, 500);
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag AssistantAbilityOne', '%{public}s', 'Ability onBackground');
  }
}