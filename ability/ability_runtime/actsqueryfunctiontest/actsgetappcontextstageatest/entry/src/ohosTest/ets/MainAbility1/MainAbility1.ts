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
import commonEvent from '@ohos.commonEvent';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';

function PublishCallBackOne2() {
  console.debug("====>Publish CallBack ACTS_StartAbility2_CommonEvent====>");
  AppStorage.get<common.UIAbilityContext>("ability2Context")!.terminateSelf();
}

export default class MainAbility1 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("MainAbility1 onCreate");
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("MainAbility1 onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("MainAbility1 onWindowStageCreate");
    windowStage.loadContent("pages/index", null);
    AppStorage.setOrCreate<common.UIAbilityContext>("ability2Context", this.context);
    commonEvent.publish("ACTS_GetAppContext", PublishCallBackOne2);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("MainAbility1 onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("MainAbility1 onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.log("MainAbility1 onBackground");
  }
}