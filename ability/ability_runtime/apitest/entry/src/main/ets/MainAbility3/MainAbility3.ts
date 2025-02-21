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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';

function PublishCallBackOne() {
  console.debug("====>Publish CallBack ACTS_DoAbilityForeground_0300_Event====>");
  AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility3")!.terminateSelf()
    .then(() => {
      console.debug("====>MainAbility3 terminateSelf====>");
    });
}

export default class MainAbility3 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility3 onCreate");
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContextMainAbility3", this.context);
  }

  onDestroy() {
    console.log("[Demo] MainAbility3 onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility3 onWindowStageCreate");

    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility3 onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility3 onForeground");
    setTimeout(() => {
      AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
        .then((data: UIAbility) => {
          AppStorage.setOrCreate<UIAbility>("ability3", data);
          console.debug("====>MainAbility getCurrentTopAbility:====>" + JSON.stringify(AppStorage.get<UIAbility>("ability3")!));
          commonEvent.publish("ACTS_DoAbility_Event", PublishCallBackOne);
        })
    }, 1000);
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility3 onBackground");
  }
}
