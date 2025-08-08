/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import commonEvent from "@ohos.commonEvent";
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

function PublishCallBackOne() {
  console.debug("====>Publish CallBack AACommand_Debugapp====>");
  console.debug("====>close this context====>====>");
}

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // Ability is creating, initialize resources for this ability
    console.log("MainAbility2 onCreate");
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("MainAbility2 onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("MainAbility2 onWindowStageCreate");
    AppStorage.setOrCreate<common.UIAbilityContext>("ability2Context", this.context);
    windowStage.loadContent("pages/index2", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("MainAbility2 onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("MainAbility2 onForeground");
    commonEvent.publish("AACommand_Debugapp", PublishCallBackOne);
  }

  onBackground() {
    // Ability has back to background
    console.log("MainAbility2 onBackground");
  }
}
