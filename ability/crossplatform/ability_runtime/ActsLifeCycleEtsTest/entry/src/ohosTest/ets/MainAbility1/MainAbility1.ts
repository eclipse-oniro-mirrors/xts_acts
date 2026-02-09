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

export default class MainAbility1 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility1 onCreate")
    globalThis.abilityWant1 = want;
    console.log("[Demo] MainAbility1 context: " + JSON.stringify(this.context));
    globalThis.list1 = [];
    let AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onAbilityCreate");
      },
      onWindowStageCreate(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onWindowStageCreate");
      },
      onWindowStageActive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        console.log(abilityname + " onWindowStageActive")
      },
      onWindowStageInactive(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        console.log(abilityname + " onWindowStageInactive")
      },
      onWindowStageDestroy(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onWindowStageDestroy");
      },
      onAbilityDestroy(ability) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onAbilityDestroy");
      },
      onAbilityForeground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onAbilityForeground");
      },
      onAbilityBackground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onAbilityBackground");
      },
      onAbilityContinue(ability) {
        let abilityname = ability.context.abilityInfo.name;
        globalThis.list1.push(abilityname + " onAbilityContinue");
      }
    }
    globalThis.applicationContext1 = this.context.getApplicationContext();
    let lifecycleid = globalThis.applicationContext1.on('abilityLifecycle', AbilityLifecycleCallback);
    globalThis.callbackid1 = lifecycleid;
    console.log("[Demo] registerAbilityLifecycleCallback1 number: " + JSON.stringify(lifecycleid));
    globalThis.applicationContext1onAbilityLifecycle = true;
  }

  onDestroy() {
    console.log("[Demo] MainAbility1 onDestroy")
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility1 onWindowStageCreate")
    globalThis.ability1context = this.context;

    windowStage.loadContent('TestAbility/pages/index1', (err, data) => {
      if (err.code) {
        console.log('MainAbility1 loadContent error');
        return;
      }
      console.log('MainAbility1 loadContent success');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility1 onWindowStageDestroy")
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility1 onForeground")
    globalThis.MainAbility1onForeground = true;
    setTimeout(() => {
      globalThis.testEvent.push('MainAbility1onForeground');
    }, 800);
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility1 onBackground")
  }
};
