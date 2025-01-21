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
import Ability from '@ohos.app.ability.UIAbility'
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import { BusinessError } from '@ohos.base';

export default class MainAbility9 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility9 onCreate")
    globalThis.abilityWant9 = want;
    globalThis.mainAbility9ListKey = [];
    let abilityName: string = "";
    let AbilityLifecycleCallback: AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onAbilityCreate");
      },
      onWindowStageCreate(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onWindowStageCreate");
      },
      onWindowStageActive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
      },
      onWindowStageInactive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
      },
      onAbilityForeground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onAbilityForeground");
      },
      onAbilityBackground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onAbilityBackground");
      },
      onWindowStageDestroy(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onWindowStageDestroy");
      },
      onAbilityDestroy(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onAbilityDestroy");
      },
      onAbilityContinue(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbility9ListKey.push(abilityName + " onAbilityContinue");
      }
    }
    globalThis.applicationContext9 = this.context.getApplicationContext();
    let callBackId = globalThis.applicationContext9.on('abilityLifecycle', AbilityLifecycleCallback);
    globalThis.MainAbility9onForeground = true;
    globalThis.mainAbility9CallBackId = callBackId
    console.log("callBackId is aaa :" + callBackId);
  }

  onDestroy() {
    console.log("[Demo] MainAbility9 onDestroy")
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility9 onWindowStageCreate")

    windowStage.loadContent('TestAbility/pages/index9', (err: BusinessError) => {
      if (err.code) {
        console.log('MainAbility9 loadContent error');
        return;
      }
      console.log('MainAbility9 loadContent success');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility9 onWindowStageDestroy")
  }

  onForeground() {
    setTimeout(() => {
      globalThis.testEvent.push('MainAbility9onForeground');
    }, 800);
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility9 onBackground")
  }
};
