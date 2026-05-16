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
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import { BusinessError } from '@ohos.base';

export default class MainAbility11 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] MainAbility11 onCreate")
    globalThis.abilityWant11 = want;
    globalThis.ability11 = this.context;
    let listKey11 = [];
    let AbilityLifecycleCallback: AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onAbilityCreate abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityCreate");
        listKey11.push(abilityname + " onAbilityCreate");
      },
      onWindowStageCreate(ability, windowStage) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onWindowStageCreate abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onWindowStageCreate");
        listKey11.push(abilityname + " onWindowStageCreate");
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
        console.log("[Demo] AbilityLifecycleCallback11 onWindowStageDestroy abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onWindowStageDestroy");
        listKey11.push(abilityname + " onWindowStageDestroy");
      },
      onAbilityDestroy(ability) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onAbilityDestroy abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityDestroy");
        listKey11.push(abilityname + " onAbilityDestroy");
      },
      onAbilityForeground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onAbilityForeground abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityForeground");
        listKey11.push(abilityname + " onAbilityForeground");
      },
      onAbilityBackground(ability) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onAbilityBackground abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityBackground");
        listKey11.push(abilityname + " onAbilityBackground");
      },
      onAbilityContinue(ability) {
        let abilityname = ability.context.abilityInfo.name;
        console.log("[Demo] AbilityLifecycleCallback11 onAbilityContinue abilityname:"
          + JSON.stringify(abilityname));
        console.log("[Demo] " + abilityname + " onAbilityContinue");
        listKey11.push(abilityname + " onAbilityContinue");
      }
    }
    globalThis.applicationContext11 = globalThis.ability11.getApplicationContext();
    let lifecycleid = globalThis.applicationContext11.on('abilityLifecycle', AbilityLifecycleCallback);
    console.log("[Demo] registerAbilityLifecycleCallback11 number: " + JSON.stringify(lifecycleid));
    setTimeout(() => {
      console.log("[Demo] registerAbilityLifecycleCallback11 listKey: " + JSON.stringify(listKey11));
      globalThis.list11 = listKey11;
      globalThis.callbackid11 = lifecycleid;
    }, 2000);
  }

  onDestroy() {
    console.log("[Demo] MainAbility11 onDestroy")
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility11 onWindowStageCreate")

    windowStage.loadContent('TestAbility/pages/index11', (err: BusinessError) => {
      if (err.code) {
        console.log('MainAbility11 loadContent error');
        return;
      }
      console.log('MainAbility11 loadContent success');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility11 onWindowStageDestroy")
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility11 onForeground")
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility onBackground")
  }
};
