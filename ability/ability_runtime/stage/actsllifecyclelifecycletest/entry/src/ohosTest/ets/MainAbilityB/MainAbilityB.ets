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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import base from '@ohos.base';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

const TEST_TAG = "TAG_MainAbilityB"

export default class MainAbilityB extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'MainAbilityB Ability onCreate' + JSON.stringify(want));

    let listKey: string[] = [];
    let abilityName = "";
    let AbilityLifecycleCallback: AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onAbilityCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityCreate`);
      },
      onWindowStageCreate(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onWindowStageCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageCreate`);
      },
      onWindowStageActive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageActive`);
      },
      onWindowStageInactive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageInactive`);
      },
      onAbilityForeground(ability) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onAbilityForeground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityForeground`);
      },
      onAbilityBackground(ability) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onAbilityBackground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityBackground`);
      },
      onWindowStageDestroy(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onWindowStageDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageDestroy`);
      },
      onAbilityDestroy(ability) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onAbilityDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityDestroy`);
      },
      onAbilityContinue(ability) {
        abilityName = ability.context.abilityInfo.name;
        listKey.push(abilityName + " onAbilityContinue");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityContinue`);
      }
    }

    globalThis.ApplicationContextB = this.context.getApplicationContext();
    let callBackId:number = globalThis.ApplicationContextB.registerAbilityLifecycleCallback(AbilityLifecycleCallback);

    globalThis.mainAbilityBListKey = listKey
    globalThis.mainAbilityBCallBackId = callBackId
    hilog.info(0x0000, TEST_TAG, `callBackId :${callBackId}`);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    globalThis.ApplicationContextB
      .unregisterAbilityLifecycleCallback(globalThis.mainAbilityBCallBackId,
        (error: base.BusinessError, data: ESObject) => {
          hilog.info(0x0000, TEST_TAG, 'unregisterAbilityLifecycleCallback err: %{public}s', JSON.stringify(error) ?? '');
        });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    globalThis.abilityBContext = this.context;
    windowStage.loadContent('MainAbilityB/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
