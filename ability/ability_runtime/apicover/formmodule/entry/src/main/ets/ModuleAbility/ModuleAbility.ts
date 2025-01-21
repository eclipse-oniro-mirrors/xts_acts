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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

export default class ModuleAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility onCreate");
  }

  onDestroy() {
    console.log("[Demo] MainAbility onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility onWindowStageCreate");

    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility onWindowStageDestroy");
  }

  onWindowStageRestore(windowStage) {
    console.log("[Demo] MainAbility onWindowStageRestore");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility onBackground");
  }

  onContinue(wantParam) {
    console.log("[Demo] MainAbility onContinue");
    return AbilityConstant.OnContinueResult.AGREE;
  }

  onConfigurationUpdate(configuration) {
    console.log('[Demo] MainAbility onConfigurationUpdate: ' + JSON.stringify(configuration));
  }

  onDump(param) {
    console.log("[Demo] MainAbility onDump: " + JSON.stringify(param));
    return ["MainAbility"];
  }
}
