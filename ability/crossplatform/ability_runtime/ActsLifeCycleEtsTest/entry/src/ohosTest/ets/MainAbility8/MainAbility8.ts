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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';

export default class MainAbility8 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility8 onCreate")
    globalThis.abilityWant8 = want;
  }

  onDestroy() {
    console.log("[Demo] MainAbility8 onDestroy")
    setTimeout(function () {
      globalThis.testEvent.push('MainAbility8onDestroy');
    }, 800);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility8 onWindowStageCreate")
    globalThis.ability8 = this.context;

    windowStage.loadContent('TestAbility/pages/index8', (err: BusinessError) => {
      if (err.code) {
        console.log('MainAbility8 loadContent error');
        return;
      }
      console.log('MainAbility8 loadContent success');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility8 onWindowStageDestroy")
  }

  onForeground() {
    console.log("[Demo] MainAbility8 onForeground")
    let listKey8 = [];
    let AbilityLifecycleCallback: AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onAbilityCreate");
      },
      onWindowStageCreate(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onWindowStageCreate");
      },
      onWindowStageActive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
      },
      onWindowStageInactive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
      },
      onWindowStageDestroy(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onWindowStageDestroy");
      },
      onAbilityDestroy(ability) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onAbilityDestroy");
      },
      onAbilityForeground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onAbilityForeground");
      },
      onAbilityBackground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onAbilityBackground");
      },
      onAbilityContinue(ability) {
        let abilityname = ability.context.abilityInfo.name;
        listKey8.push(abilityname + " onAbilityContinue");
      }
    }
    globalThis.applicationContext8 = this.context.getApplicationContext();
    globalThis.MainAbility8onForeground = true;
    let lifecycleid = globalThis.applicationContext8.on('abilityLifecycle', AbilityLifecycleCallback);
    globalThis.callbackid8 = lifecycleid;
    console.log("[Demo] AbilityLifecycleCallback8 number: " + JSON.stringify(lifecycleid));
    setTimeout(() => {
      globalThis.testEvent.push('MainAbility8onForeground');
    }, 800);
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility8 onBackground")
  }
};
