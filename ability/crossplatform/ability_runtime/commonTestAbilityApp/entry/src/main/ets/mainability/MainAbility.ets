/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    globalThis.commonList1 = [];
    console.log('testTag', '%{public}s', 'Ability onCreate');
    globalThis.commonList1.push('common MainAbility onCreate');
  }

  onDestroy() {
    console.log('testTag', '%{public}s', 'Ability onDestroy');
    globalThis.commonList1.push('common MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');
    globalThis.commonList1.push('common MainAbility onWindowStageCreate');
    globalThis.commonAbilityContext = this.context;

    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        console.log('testTag', '%{public}s', 'Ability onWindowStageCreate');
        return;
      }
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('testTag', '%{public}s', 'Ability onWindowStageDestroy');
    globalThis.commonList1.push('common MainAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('testTag', '%{public}s', 'Ability onForeground');
    globalThis.commonList1.push('common MainAbility onForeground');
    setTimeout(() => {
      console.log("[Demo] MainAbility onForeground after 1500ms")
      globalThis.commonAbilityContext.terminateSelf()
        .then((data: ESObject) => {
          console.info('[Demo] MainAbility terminateself succeeded: ' + data);
        }).catch((error: BusinessError) => {
        console.error('[Demo] MainAbility terminateself failed. Cause: ' + error);
      })
    }, 1500);
  }

  onBackground() {
    // Ability has back to background
    console.log('testTag', '%{public}s', 'Ability onBackground');
    globalThis.commonList1.push('common MainAbility onBackground');
  }
}
