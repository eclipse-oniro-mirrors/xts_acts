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

import Ability from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // Ability is creating, initialize resources for this ability
    console.log('[Demo] MainAbility onCreate');
    globalThis.abilityWant = want;
    globalThis.abilityLaunchParam = launchParam;
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log('[Demo] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('[Demo] MainAbility onWindowStageCreate windowStage=' + windowStage);
    globalThis.windowStage = windowStage;
    globalThis.abilityContext = this.context;
    windowStage.loadContent("MainAbility/pages/index/Index", (err, data) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    //Main window is destroyed, release UI related resources
    console.log('[Demo] MainAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('[Demo] MainAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    console.log('[Demo] MainAbility onBackground');
  }
};